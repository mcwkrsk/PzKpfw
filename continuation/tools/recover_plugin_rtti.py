#!/usr/bin/env python3
"""Recover MSVC x86 RTTI, class bases and vtable candidates from IS-2 plugin DLLs.

This is a static PE32 parser. It does not execute the DLL or perform full C++
source decompilation. Requires only Python 3 standard library.
"""
from __future__ import annotations
import argparse
import hashlib
import json
import re
import struct
from pathlib import Path


def parse_pe(path: Path) -> dict:
    data = path.read_bytes()
    def u16(off: int) -> int:
        if off < 0 or off + 2 > len(data): raise ValueError(f"u16 out of range: {off:#x}")
        return struct.unpack_from("<H", data, off)[0]
    def u32(off: int) -> int:
        if off < 0 or off + 4 > len(data): raise ValueError(f"u32 out of range: {off:#x}")
        return struct.unpack_from("<I", data, off)[0]

    peoff = u32(0x3C)
    if data[peoff:peoff + 4] != b"PE\0\0": raise ValueError("Invalid PE signature")
    coff = peoff + 4
    nsec = u16(coff + 2)
    opt_size = u16(coff + 16)
    opt = coff + 20
    if u16(opt) != 0x10B: raise ValueError("Only PE32 (x86) is supported")
    image_base = u32(opt + 28)
    sec_start = opt + opt_size
    sections = []
    for i in range(nsec):
        off = sec_start + i * 40
        name = data[off:off + 8].split(b"\0", 1)[0].decode("ascii", "replace")
        vsize, rva, raw_size, raw_off = struct.unpack_from("<IIII", data, off + 8)
        sections.append({"name": name, "rva": rva, "span": max(vsize, raw_size),
                         "raw_offset": raw_off, "raw_size": raw_size})

    def rva_to_offset(rva: int) -> int | None:
        for sec in sections:
            if sec["rva"] <= rva < sec["rva"] + sec["span"]:
                out = sec["raw_offset"] + (rva - sec["rva"])
                return out if out < len(data) else None
        return None
    def va_to_offset(va: int) -> int | None:
        return rva_to_offset(va - image_base)
    def section_for_va(va: int) -> str | None:
        rva = va - image_base
        for sec in sections:
            if sec["rva"] <= rva < sec["rva"] + sec["span"]:
                return sec["name"]
        return None
    def va_for_file_offset(off: int) -> int | None:
        for sec in sections:
            if sec["raw_offset"] <= off < sec["raw_offset"] + sec["raw_size"]:
                return image_base + sec["rva"] + (off - sec["raw_offset"])
        return None

    # MSVC TypeDescriptor is two pointer-sized fields followed by a decorated name.
    type_names: dict[int, str] = {}
    type_pattern = re.compile(rb"\.\?A[UVW][^\x00]{1,400}?@@\x00")
    for match in type_pattern.finditer(data):
        name_va = va_for_file_offset(match.start())
        if name_va is None or name_va < image_base + 8:
            continue
        type_names[name_va - 8] = match.group()[:-1].decode("latin1", "replace")

    cols = []
    # CompleteObjectLocator (x86): signature, offset, cdOffset, pTypeDescriptor, pClassDescriptor.
    rdata_offsets = [(s["raw_offset"], s["raw_offset"] + s["raw_size"])
                     for s in sections if s["name"] == ".rdata"]
    for start, end in rdata_offsets:
        for off in range((start + 3) & ~3, max(start, end - 20), 4):
            sig, obj_off, cd_off, td_va, chd_va = struct.unpack_from("<IIIII", data, off)
            if sig != 0 or td_va not in type_names:
                continue
            chd_off = va_to_offset(chd_va)
            if chd_off is None or chd_off + 16 > len(data):
                continue
            sig2, attrs, nbase, bca_va = struct.unpack_from("<IIII", data, chd_off)
            if sig2 != 0 or not (1 <= nbase <= 128):
                continue
            bca_off = va_to_offset(bca_va)
            if bca_off is None or bca_off + 4 * nbase > len(data):
                continue
            bases = []
            valid = True
            for idx in range(nbase):
                bcd_va = u32(bca_off + idx * 4)
                bcd_off = va_to_offset(bcd_va)
                if bcd_off is None or bcd_off + 24 > len(data):
                    valid = False; break
                td_base, num_contained, mdisp, pdisp, vdisp, battrs = struct.unpack_from("<IIIIII", data, bcd_off)
                if td_base not in type_names:
                    valid = False; break
                def signed32(x: int) -> int: return struct.unpack("<i", struct.pack("<I", x))[0]
                bases.append({"type": type_names[td_base], "mdisp": signed32(mdisp),
                              "pdisp": signed32(pdisp), "vdisp": signed32(vdisp),
                              "num_contained_bases": num_contained, "attributes": battrs})
            col_va = va_for_file_offset(off)
            if valid and col_va is not None:
                cols.append({"va": col_va, "type": type_names[td_va], "object_offset": obj_off,
                             "constructor_displacement": cd_off, "attributes": attrs, "bases": bases})

    # Locate vftables by references to COL records in .rdata. The table begins
    # immediately after the COL pointer in the x86 MSVC layout.
    vtables = []
    seen = set()
    for col in cols:
        col_ptr = struct.pack("<I", col["va"])
        for sec_start, sec_end in rdata_offsets:
            pos = (sec_start + 3) & ~3
            while True:
                pos = data.find(col_ptr, pos, sec_end)
                if pos < 0: break
                if pos % 4 == 0 and pos + 8 < sec_end:
                    vft_va = va_for_file_offset(pos + 4)
                    key = (col["va"], vft_va)
                    if vft_va and key not in seen:
                        slots = []
                        for idx in range(64):
                            slot_off = pos + 4 + 4 * idx
                            if slot_off + 4 > len(data): break
                            target = u32(slot_off)
                            if section_for_va(target) != ".text": break
                            slots.append(target)
                        if slots:
                            seen.add(key)
                            vtables.append({"type": col["type"], "col_va": col["va"],
                                            "vftable_va": vft_va, "slots": slots})
                pos += 4

    # Deduplicate class hierarchy variants while preserving all COL records separately.
    hierarchy = []
    hseen = set()
    for col in cols:
        bases = [x["type"] for x in col["bases"]]
        key = (col["type"], tuple(bases))
        if key not in hseen:
            hseen.add(key); hierarchy.append({"type": col["type"], "bases": bases})

    return {
        "file": path.name,
        "sha256": hashlib.sha256(data).hexdigest(),
        "image_base": image_base,
        "sections": sections,
        "type_descriptor_count": len(type_names),
        "complete_object_locator_count": len(cols),
        "vtable_candidate_count": len(vtables),
        "hierarchy": hierarchy,
        "complete_object_locators": cols,
        "vtable_candidates": vtables,
    }


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("binary_dir", type=Path, help="Original IS-2 root containing modules/")
    ap.add_argument("--out", type=Path, required=True)
    ap.add_argument("--plugins", nargs="*", default=["PM_auto.dll", "PM_params.dll", "PM_spec_WEB.dll",
                                                         "PM_matrix_web.dll", "Model_Visualiser.dll"])
    args = ap.parse_args()
    args.out.mkdir(parents=True, exist_ok=True)
    results = []
    for filename in args.plugins:
        path = args.binary_dir / "modules" / filename
        if not path.exists():
            print(f"WARNING: missing {path}"); continue
        results.append(parse_pe(path))
    (args.out / "plugin_rtti.json").write_text(json.dumps(results, indent=2), encoding="utf-8")
    with (args.out / "plugin_hierarchy.tsv").open("w", encoding="utf-8") as f:
        f.write("binary\ttype\tbases\n")
        for result in results:
            for cls in result["hierarchy"]:
                f.write(f"{result['file']}\t{cls['type']}\t{' > '.join(cls['bases'])}\n")
    with (args.out / "plugin_vtables.tsv").open("w", encoding="utf-8") as f:
        f.write("binary\ttype\tcol_va\tvftable_va\tslot_index\ttarget_va\n")
        for result in results:
            for table in result["vtable_candidates"]:
                for idx, target in enumerate(table["slots"]):
                    f.write(f"{result['file']}\t{table['type']}\t0x{table['col_va']:08x}\t"
                            f"0x{table['vftable_va']:08x}\t{idx}\t0x{target:08x}\n")
    for result in results:
        print(f"{result['file']}: TD={result['type_descriptor_count']} "
              f"COL={result['complete_object_locator_count']} "
              f"vtable_candidates={result['vtable_candidate_count']} sha256={result['sha256']}")

if __name__ == "__main__":
    main()
