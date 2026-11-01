#!/usr/bin/env python3
"""Recover the observed IsModule object and descriptor ABI from five pinned PE32 DLLs.

This is a static evidence extractor, not a full decompiler and not a runtime SDK.
Requires Python 3 and GNU objdump.
"""
from __future__ import annotations

import argparse
import csv
import hashlib
import math
import json
import re
import struct
import subprocess
from pathlib import Path

EXPECTED = {
    "PM_auto.dll": {
        "sha256": "c3cbde9cb83a7c10774a0faa4541622005856d09b79ce94dec3d8bd90d083018",
        "class": ".?AVPM_auto_module@@", "widget_size": 0x174,
        "create_widget_ctor": "0x10001560", "append_helper": "0x100095b0",
    },
    "PM_params.dll": {
        "sha256": "22c867d11fcc724b79fbff420f514d7adccd7a8eb7565e9b4b43e60b267ea781",
        "class": ".?AVPM_params_module@@", "widget_size": 0x4C,
        "create_widget_ctor": "0x10003460", "append_helper": "0x100070f0",
    },
    "PM_spec_WEB.dll": {
        "sha256": "ef0365f6fd3f69648ccf28c5eb564312f70faa9bbd892543a933ec4ae7fa6d68",
        "class": ".?AVPM_spec_Module@@", "widget_size": 0x64,
        "create_widget_ctor": "0x10001b20", "append_helper": "0x100023e0",
    },
    "PM_matrix_web.dll": {
        "sha256": "55d25ef0f07a069d80226abae1583928be92cf023fb66ffddbdd32b4f1a66f22",
        "class": ".?AVPM_matrix_Module@@", "widget_size": 0x60,
        "create_widget_ctor": "0x10003890", "append_helper": "0x10001a10", "zeroes_tail": True,
    },
    "Model_Visualiser.dll": {
        "sha256": "1187c7a59ae2dbb8eb91bebbbe89850d9724a62ff186865733930f1488bce880",
        "class": ".?AVModelVisualizerModule@@", "widget_size": 0x64,
        "create_widget_ctor": "0x100092d0", "append_helper": "0x10007f30",
    },
}

QMAP_SYMBOL = "?shared_null@QMapDataBase@@2U1@B"
QLIST_SYMBOL = "?shared_null@QListData@@2UData@1@B"


def run(args: list[str]) -> str:
    p = subprocess.run(args, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                       text=True, errors="replace")
    return p.stdout


def parse_pe(path: Path) -> tuple[bytes, int, list[dict]]:
    data = path.read_bytes()
    peoff = struct.unpack_from("<I", data, 0x3C)[0]
    if data[peoff:peoff + 4] != b"PE\0\0":
        raise ValueError(f"{path}: invalid PE signature")
    coff = peoff + 4
    nsec = struct.unpack_from("<H", data, coff + 2)[0]
    opt_size = struct.unpack_from("<H", data, coff + 16)[0]
    opt = coff + 20
    if struct.unpack_from("<H", data, opt)[0] != 0x10B:
        raise ValueError(f"{path}: not PE32/x86")
    image_base = struct.unpack_from("<I", data, opt + 28)[0]
    sec0 = opt + opt_size
    sections = []
    for i in range(nsec):
        off = sec0 + 40 * i
        name = data[off:off + 8].split(b"\0", 1)[0].decode("ascii", "replace")
        vsize, rva, raw_size, raw_off = struct.unpack_from("<IIII", data, off + 8)
        sections.append({"name": name, "rva": rva, "span": max(vsize, raw_size),
                         "raw_size": raw_size, "raw_offset": raw_off})
    return data, image_base, sections


def va_to_offset(va: int, image_base: int, sections: list[dict]) -> int:
    rva = va - image_base
    for sec in sections:
        if sec["rva"] <= rva < sec["rva"] + sec["span"]:
            off = sec["raw_offset"] + (rva - sec["rva"])
            if off < sec["raw_offset"] + sec["raw_size"]:
                return off
    raise ValueError(f"VA {va:#x} is not backed by file data")


def read_c_string(va: int, data: bytes, image_base: int, sections: list[dict]) -> str:
    off = va_to_offset(va, image_base, sections)
    end = data.find(b"\0", off, min(len(data), off + 512))
    if end < 0:
        raise ValueError(f"unterminated string at {va:#x}")
    return data[off:end].decode("utf-8", "replace")


def parse_imports(text: str, image_base: int) -> dict[int, tuple[str, str]]:
    imports: dict[int, tuple[str, str]] = {}
    dll = ""
    for line in text.splitlines():
        m = re.search(r"DLL Name:\s*(\S+)", line)
        if m:
            dll = m.group(1)
            continue
        m = re.match(r"\s*([0-9a-fA-F]{8})\s+<none>\s+[0-9a-fA-F]{4}\s+(.+?)\s*$", line)
        if m and dll:
            imports[image_base + int(m.group(1), 16)] = (dll, m.group(2))
    return imports


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("binary_root", type=Path, help="Extracted IS2_PMauto_beta root")
    ap.add_argument("--vtables", type=Path, default=Path("analysis/plugins/plugin_vtables.tsv"))
    ap.add_argument("--out", type=Path, default=Path("analysis/plugins"))
    ap.add_argument("--asm-out", type=Path, default=Path("analysis/disassembly/is_module_abi_stage17.asm"))
    args = ap.parse_args()

    vtable_rows: dict[tuple[str, str, int], dict] = {}
    with args.vtables.open(encoding="utf-8", newline="") as f:
        for row in csv.DictReader(f, delimiter="\t"):
            vftable_va = int(row["vftable_va"], 16)
            key = (row["binary"], row["type"], vftable_va)
            entry = vtable_rows.setdefault(key, {"vftable_va": vftable_va, "slots": {}})
            entry["slots"][int(row["slot_index"])] = int(row["target_va"], 16)

    results = []
    asm_chunks = ["; Stage 1.7: IsModule descriptor/factory/widget virtual implementations\n",
                  "; Extracted from SHA-pinned PE32 images; GNU objdump; static evidence only.\n"]

    for filename, expected in EXPECTED.items():
        path = args.binary_root / "modules" / filename
        data, image_base, sections = parse_pe(path)
        digest = hashlib.sha256(data).hexdigest()
        if digest != expected["sha256"]:
            raise SystemExit(f"REFUSING {filename}: SHA-256 mismatch ({digest})")

        pe_text = run(["objdump", "-p", str(path)])
        imports = parse_imports(pe_text, image_base)
        qmap = [(va, dll, name) for va, (dll, name) in imports.items() if name == QMAP_SYMBOL]
        qlist = [(va, dll, name) for va, (dll, name) in imports.items() if name == QLIST_SYMBOL]
        if len(qmap) != 1 or len(qlist) != 1:
            raise ValueError(f"{filename}: expected one Qt QMap/QList shared_null import; got {qmap}, {qlist}")
        if qmap[0][1].lower() != "qt5core.dll" or qlist[0][1].lower() != "qt5core.dll":
            raise ValueError(f"{filename}: shared_null imports do not come from Qt5Core.dll")

        matches = [entry for (binary, cls, _), entry in vtable_rows.items()
                   if binary == filename and cls == expected["class"] and sorted(entry["slots"]) == [0, 1, 2]]
        if len(matches) != 1:
            raise ValueError(f"{filename}: expected one three-slot concrete module vtable, found {len(matches)}")
        table = matches[0]
        slots = table["slots"]
        module_vtable_va = table["vftable_va"]
        no_op_va, create_va, descriptor_va = (slots[i] for i in range(3))
        if data[va_to_offset(no_op_va, image_base, sections)] != 0xC3:
            raise ValueError(f"{filename}: first module slot is not a one-byte RET stub")

        desc_dis = run(["objdump", "-d", "-Mintel", f"--start-address={descriptor_va:#x}",
                        f"--stop-address={descriptor_va + 0x30:#x}", str(path)])
        ptr0_m = re.search(r"mov\s+DWORD PTR \[eax\],0x([0-9a-fA-F]+)", desc_dis)
        scalar_m = re.search(r"mov\s+DWORD PTR \[eax\+0x4\],0x([0-9a-fA-F]+)", desc_dis)
        ptr8_m = re.search(r"mov\s+DWORD PTR \[eax\+0x8\],0x([0-9a-fA-F]+)", desc_dis)
        alloc_m = re.search(r"push\s+0xc\s*$", desc_dis, re.M)
        if not all((ptr0_m, scalar_m, ptr8_m, alloc_m)):
            raise ValueError(f"{filename}: descriptor function does not match 12-byte record pattern")
        ptr0, scalar_bits, ptr8 = (int(x.group(1), 16) for x in (ptr0_m, scalar_m, ptr8_m))
        scalar = struct.unpack("<f", struct.pack("<I", scalar_bits))[0]
        if not math.isclose(scalar, 0.1, rel_tol=0.0, abs_tol=1e-8):
            raise ValueError(f"{filename}: unexpected descriptor scalar {scalar}")
        s0 = read_c_string(ptr0, data, image_base, sections)
        s8 = read_c_string(ptr8, data, image_base, sections)

        create_dis = run(["objdump", "-d", "-Mintel", f"--start-address={create_va:#x}",
                          f"--stop-address={create_va + 0x180:#x}", str(path)])
        # Detect address calculation from this+0x0c. The register is compiler-specific.
        append_m = re.search(r"lea\s+ecx,\[e(?:si|di|bx|ax)\+0xc\]", create_dis)
        if not append_m:
            raise ValueError(f"{filename}: no observed this+0x0c QListData append receiver")
        if f"0x{int(expected['append_helper'],16):x}" not in create_dis.lower():
            raise ValueError(f"{filename}: expected append helper not referenced by widget slot")
        size_values = [int(x, 16) for x in re.findall(r"push\s+0x([0-9a-fA-F]+)", create_dis)]
        alloc_size = expected["widget_size"] if expected["widget_size"] in size_values else None
        if alloc_size != expected["widget_size"]:
            raise ValueError(f"{filename}: widget allocation size mismatch: {alloc_size}")

        # Read only the exported loadModule address from the export table.
        exp_m = re.search(r"\[\s*0\].*?([0-9a-fA-F]{8}) Export RVA", pe_text)
        if not exp_m or "loadModule" not in pe_text:
            raise ValueError(f"{filename}: loadModule export not found")
        factory_va = image_base + int(exp_m.group(1), 16)
        factory_dis = run(["objdump", "-d", "-Mintel", f"--start-address={factory_va:#x}",
                           f"--stop-address={factory_va + 0x50:#x}", str(path)])
        alloc_module = re.search(r"push\s+0x1c\s*$", factory_dis, re.M)
        if not alloc_module:
            raise ValueError(f"{filename}: loadModule does not show 0x1c allocation")
        # Verify the factory really copies both imported Qt shared-null values
        # into the object; IAT presence alone would not prove member initialization.
        qmap_load = re.search(rf"mov\s+ecx,DWORD PTR ds:0x{qmap[0][0]:x}", factory_dis)
        qlist_load = re.search(rf"mov\s+ecx,DWORD PTR ds:0x{qlist[0][0]:x}", factory_dis)
        qmap_store = re.search(r"mov\s+DWORD PTR \[eax\+0x8\],ecx", factory_dis)
        qlist_store = re.search(r"mov\s+DWORD PTR \[eax\+0xc\],ecx", factory_dis)
        derived_vftable_store = re.search(rf"mov\s+DWORD PTR \[eax\],0x{module_vtable_va:x}", factory_dis)
        if not all((qmap_load, qlist_load, qmap_store, qlist_store, derived_vftable_store)):
            raise ValueError(f"{filename}: loadModule does not show expected vftable/QMap/QList member initialization")
        tail_zeroed = bool(re.search(r"movups\s+XMMWORD PTR \[eax\],xmm0", factory_dis)
                           and re.search(r"movq\s+QWORD PTR \[eax\+0x10\],xmm0", factory_dis)
                           and re.search(r"mov\s+DWORD PTR \[eax\+0x18\],0x0", factory_dis))
        if tail_zeroed != bool(expected.get("zeroes_tail", False)):
            raise ValueError(f"{filename}: module tail initialization pattern differs from pinned snapshot")

        # Preserve relevant disassembly as primary evidence.
        asm_chunks.append(f"\n; ===== {filename} =====\n")
        asm_chunks.append(f"; loadModule {factory_va:#010x}\n{factory_dis}")
        asm_chunks.append(f"; IsModule slot[0] no-op {no_op_va:#010x}\n")
        asm_chunks.append(run(["objdump", "-d", "-Mintel", f"--start-address={no_op_va:#x}",
                              f"--stop-address={no_op_va + 0x10:#x}", str(path)]))
        asm_chunks.append(f"; IsModule slot[1] create-widget {create_va:#010x}\n{create_dis}")
        asm_chunks.append(f"; IsModule slot[2] descriptor {descriptor_va:#010x}\n{desc_dis}")

        results.append({
            "binary": filename,
            "sha256": digest,
            "concrete_rtti_type": expected["class"],
            "loadModule_va": f"0x{factory_va:08x}",
            "module_object_size": 0x1C,
            "is_module_vtable_va": f"0x{module_vtable_va:08x}",
            "factory_zeroes_full_module_block": tail_zeroed,
            "factory_initialization": {
                "writes_derived_vftable_at_0x00": True,
                "loads_qmap_shared_null_from_iat": f"0x{qmap[0][0]:08x}",
                "stores_qmap_pointer_at_0x08": True,
                "loads_qlist_shared_null_from_iat": f"0x{qlist[0][0]:08x}",
                "stores_qlist_pointer_at_0x0c": True,
                "zeroes_all_0x1c_bytes": tail_zeroed,
                "descriptor_pointer_0x04_written_by_host_later": True,
            },
            "slots": [
                {"index": 0, "byte_offset": 0, "target_va": f"0x{no_op_va:08x}",
                 "observed": "single-byte RET stub; not identified as deleting destructor"},
                {"index": 1, "byte_offset": 4, "target_va": f"0x{create_va:08x}",
                 "observed": "constructs plugin widget and appends raw pointer through module+0x0c QListData"},
                {"index": 2, "byte_offset": 8, "target_va": f"0x{descriptor_va:08x}",
                 "observed": "allocates and returns a 12-byte descriptor-like record"},
            ],
            "module_fields": {
                "0x00": "vftable pointer",
                "0x04": "descriptor record pointer; IS.exe stores slot[2] return value here",
                "0x08": {"type": "QMapDataBase* (32-bit pointer)", "initial_value_source": QMAP_SYMBOL,
                         "iat_va": f"0x{qmap[0][0]:08x}", "dll": qmap[0][1], "usage": "no map operation yet established in module registration path"},
                "0x0c": {"type": "QListData::Data* (32-bit pointer)", "initial_value_source": QLIST_SYMBOL,
                         "iat_va": f"0x{qlist[0][0]:08x}", "dll": qlist[0][1], "usage": "widget pointer collection; create-widget slot appends through this+0x0c"},
                "0x10-0x1b": {"description": "opaque; no field semantics assigned",
                                "zeroed_by_factory": tail_zeroed},
            },
            "descriptor": {
                "size_bytes": 12,
                "field_0": {"observed_type": "32-bit pointer to static NUL-terminated string", "va": f"0x{ptr0:08x}", "text": s0},
                "field_4": {"observed_type": "float32", "bits": f"0x{scalar_bits:08x}", "value": scalar},
                "field_8": {"observed_type": "32-bit pointer to static NUL-terminated string", "va": f"0x{ptr8:08x}", "text": s8},
                "semantic_labels": "unknown; field names intentionally not inferred",
            },
            "widget": {
                "allocation_size_bytes": alloc_size,
                "constructor_va": expected["create_widget_ctor"],
                "list_append_helper_va": expected["append_helper"],
                "list_receiver_expression": append_m.group(0),
                "pointer_ownership": "raw pointer append observed; ownership/deletion remains a separate lifecycle question",
            },
        })

    args.out.mkdir(parents=True, exist_ok=True)
    (args.out / "is_module_abi.json").write_text(json.dumps({"static_only": True,
        "binary_count": len(results), "binaries": results}, indent=2), encoding="utf-8")
    with (args.out / "is_module_abi.tsv").open("w", encoding="utf-8", newline="") as f:
        w = csv.writer(f, delimiter="\t")
        w.writerow(["binary", "sha256", "loadModule_va", "concrete_rtti_type", "slot0", "slot1", "slot2",
                    "QMap_shared_null_IAT", "QList_shared_null_IAT", "descriptor_field0", "descriptor_float", "descriptor_field8",
                    "widget_size", "append_helper"])
        for r in results:
            w.writerow([r["binary"], r["sha256"], r["loadModule_va"], r["concrete_rtti_type"],
                        r["slots"][0]["target_va"], r["slots"][1]["target_va"], r["slots"][2]["target_va"],
                        r["module_fields"]["0x08"]["iat_va"], r["module_fields"]["0x0c"]["iat_va"],
                        r["descriptor"]["field_0"]["text"], r["descriptor"]["field_4"]["value"],
                        r["descriptor"]["field_8"]["text"], r["widget"]["allocation_size_bytes"],
                        r["widget"]["list_append_helper_va"]])
    args.asm_out.parent.mkdir(parents=True, exist_ok=True)
    args.asm_out.write_text("\n".join(asm_chunks), encoding="utf-8")
    print(f"Recovered IsModule ABI for {len(results)} SHA-pinned modules")
    for r in results:
        print(f"{r['binary']}: loadModule={r['loadModule_va']} widget={r['widget']['allocation_size_bytes']:#x} "
              f"descriptor=({r['descriptor']['field_0']['text']!r}, 0.1, {r['descriptor']['field_8']['text']!r})")

if __name__ == "__main__":
    main()
