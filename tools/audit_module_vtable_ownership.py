#!/usr/bin/env python3
"""Audit the observed IsModule base vtable and per-plugin WorkWidget QList append paths.

Static evidence only. Requires Python 3 and GNU objdump. Every input image is SHA-pinned.
"""
from __future__ import annotations
import argparse, csv, hashlib, json, re, subprocess
from pathlib import Path

MAIN_SHA256 = "ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2"
MODULES = {
    "PM_auto.dll": {"sha256":"c3cbde9cb83a7c10774a0faa4541622005856d09b79ce94dec3d8bd90d083018", "append":"0x100095b0"},
    "PM_params.dll": {"sha256":"22c867d11fcc724b79fbff420f514d7adccd7a8eb7565e9b4b43e60b267ea781", "append":"0x100070f0"},
    "PM_spec_WEB.dll": {"sha256":"ef0365f6fd3f69648ccf28c5eb564312f70faa9bbd892543a933ec4ae7fa6d68", "append":"0x100023e0"},
    "PM_matrix_web.dll": {"sha256":"55d25ef0f07a069d80226abae1583928be92cf023fb66ffddbdd32b4f1a66f22", "append":"0x10001a10"},
    "Model_Visualiser.dll": {"sha256":"1187c7a59ae2dbb8eb91bebbbe89850d9724a62ff186865733930f1488bce880", "append":"0x10007f30"},
}

def objdump(*args: str) -> str:
    return subprocess.run(["objdump", *args], check=True, capture_output=True,
                          text=True, errors="replace").stdout

def parse_iat(path: Path, base: int) -> dict[int, tuple[str, str]]:
    text = objdump("-p", str(path))
    dll = ""
    result: dict[int, tuple[str,str]] = {}
    for line in text.splitlines():
        m = re.search(r"DLL Name:\s*(\S+)", line)
        if m:
            dll = m.group(1)
            continue
        m = re.match(r"\s*([0-9a-fA-F]{8})\s+<none>\s+[0-9a-fA-F]{4}\s+(.+?)\s*$", line)
        if m and dll:
            result[base + int(m.group(1), 16)] = (dll, m.group(2))
    return result

def dis(path: Path, start: int, size: int = 0x80) -> str:
    return objdump("-d", "-Mintel", f"--start-address={start:#x}",
                   f"--stop-address={start+size:#x}", str(path))

def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("binary_root", type=Path, help="Extracted IS2_PMauto_beta directory")
    ap.add_argument("--vtables", type=Path, default=Path("analysis/plugins/plugin_vtables.tsv"))
    ap.add_argument("--abi-json", type=Path, default=Path("analysis/plugins/is_module_abi.json"))
    ap.add_argument("--out", type=Path, default=Path("analysis/plugins/module_ownership_audit.json"))
    ap.add_argument("--asm-out", type=Path, default=Path("analysis/disassembly/module_ownership_audit.asm"))
    args = ap.parse_args()

    exe = args.binary_root / "IS.exe"
    exe_sha = hashlib.sha256(exe.read_bytes()).hexdigest()
    if exe_sha != MAIN_SHA256:
        raise SystemExit(f"REFUSING IS.exe: SHA-256 mismatch ({exe_sha})")

    with args.vtables.open(encoding="utf-8", newline="") as f:
        rows = list(csv.DictReader(f, delimiter="\t"))
    abi = json.loads(args.abi_json.read_text(encoding="utf-8"))
    if abi.get("binary_count") != 5:
        raise SystemExit("ABI JSON does not contain exactly five modules")

    output = {"static_only": True, "main_exe_sha256": exe_sha,
              "base_interface": {}, "plugins": [],
              "host_module_registry_cleanup": {},
              "limitations": [
                  "No Windows runtime execution was performed.",
                  "Absence of a statically located destroy path is not proof that no indirect path exists.",
                  "QListData::dispose call sites are not attributed to IsModule unless receiver/data flow is proven."
              ]}
    asm = ["; Stage 1.8: IsModule abstract base vtable and widget-list ownership audit\n",
           "; Static analysis only; SHA-pinned PE32 images; GNU objdump.\n"]

    for mod in MODULES:
        path = args.binary_root / "modules" / mod
        sha = hashlib.sha256(path.read_bytes()).hexdigest()
        if sha != MODULES[mod]["sha256"]:
            raise SystemExit(f"REFUSING {mod}: SHA-256 mismatch ({sha})")
        iat = parse_iat(path, 0x10000000)
        mod_rows = [r for r in rows if r["binary"] == mod]
        base_rows = sorted((r for r in mod_rows if r["type"] == ".?AVIsModule@@"), key=lambda r:int(r["slot_index"]))
        if [int(r["slot_index"]) for r in base_rows] != [0,1,2]:
            raise SystemExit(f"{mod}: expected exactly three IsModule base slots")
        targets = [int(r["target_va"],16) for r in base_rows]
        if targets[0] != targets[1]:
            raise SystemExit(f"{mod}: base slots 0 and 1 no longer share the same target")
        if path.read_bytes()[0:2] != b"MZ":
            raise SystemExit(f"{mod}: invalid DOS signature")
        target0_dis = dis(path, targets[0], 1)
        if not re.search(r"\bret\b", target0_dis):
            raise SystemExit(f"{mod}: IsModule base slot0 is not a RET stub")
        pure_dis = dis(path, targets[2], 6)
        m = re.search(r"jmp\s+DWORD PTR ds:0x([0-9a-fA-F]+)", pure_dis)
        if not m:
            raise SystemExit(f"{mod}: base slot2 is not an IAT jump thunk")
        pure_iat = int(m.group(1),16)
        pure_symbol = iat.get(pure_iat, ("?", "?"))[1]
        if pure_symbol != "_purecall":
            raise SystemExit(f"{mod}: base slot2 resolves to {pure_symbol}, not _purecall")

        rec = next(x for x in abi["binaries"] if x["binary"] == mod)
        derived_va = int(rec["is_module_vtable_va"],16)
        derived_rows = sorted((r for r in mod_rows if int(r["vftable_va"],16) == derived_va and r["type"] != ".?AVIsModule@@"), key=lambda r:int(r["slot_index"]))
        if len(derived_rows) != 3:
            raise SystemExit(f"{mod}: concrete vtable does not have three slots")
        derived_targets = [int(r["target_va"],16) for r in derived_rows]
        if derived_targets[0] != targets[0]:
            raise SystemExit(f"{mod}: derived slot0 does not inherit base no-op")

        create_va = derived_targets[1]
        create_dis = dis(path, create_va, 0x100)
        append_va = int(MODULES[mod]["append"],16)
        if not re.search(r"lea\s+ecx,\s*\[e(?:si|di|bx|ax)\+0xc\]", create_dis):
            raise SystemExit(f"{mod}: create slot has no observed this+0x0c receiver")
        if f"0x{append_va:x}" not in create_dis.lower():
            raise SystemExit(f"{mod}: expected QList append helper is not called")

        helper_dis = dis(path, append_va, 0x180)
        append_imports = []
        for call in re.finditer(r"call\s+DWORD PTR ds:0x([0-9a-fA-F]+)", helper_dis):
            va = int(call.group(1),16)
            if va in iat and iat[va][1] == "?append@QListData@@QAEPAPAXXZ":
                append_imports.append(va)
        if not append_imports:
            raise SystemExit(f"{mod}: append helper does not call imported QListData::append")

        output["plugins"].append({
            "module": mod, "sha256": sha,
            "base_vtable": {
                "va": base_rows[0]["vftable_va"],
                "slot0_va": hex(targets[0]), "slot1_va": hex(targets[1]),
                "slot2_va": hex(targets[2]), "slot2_iat_va": hex(pure_iat),
                "slot2_iat_symbol": pure_symbol,
                "interpretation": "abstract base: slots 0/1 have default RET bodies; slot 2 is pure virtual"
            },
            "derived_vtable": {"va": hex(derived_va), "slot_targets": [hex(x) for x in derived_targets]},
            "widget_list": {
                "member_offset": "0x0c", "append_helper_va": hex(append_va),
                "qlistdata_append_iat_va": [hex(x) for x in append_imports],
                "stored_value": "raw WorkWidget* copied into QListData storage",
                "qt_ownership": "Qt implicit sharing applies to the list backing store, not to the pointed-to widgets",
                "removal_or_disposal_of_this_member": "not established by this audit"
            }
        })
        asm += [f"\n; {mod}: base vtable slot2 -> _purecall; slot1 -> QListData append\n",
                pure_dis, create_dis, helper_dis]

    # The host's global module registry cleanup at 0x418740 is bounded and pinned.
    host_iat = parse_iat(exe, 0x400000)
    cleanup_dis = dis(exe, 0x418740, 0x40)
    if "0x4696b8" not in cleanup_dis.lower() or "0x4192e0" not in cleanup_dis.lower():
        raise SystemExit("IS.exe: expected module-registry cleanup shape changed")
    cleanup_iat = host_iat.get(0x4192e0, ("?", "?"))[1]
    if cleanup_iat != "?deallocate@QArrayData@@SAXPAU1@II@Z":
        raise SystemExit(f"IS.exe: 0x4192e0 now resolves to {cleanup_iat}")
    output["base_interface"] = {
        "slots": ["default RET body", "default RET body", "pure virtual (_purecall)"],
        "virtual_destructor_observed": False,
        "interpretation": "the recovered three-slot IsModule base interface exposes no virtual destructor"
    }
    output["host_module_registry_cleanup"] = {
        "function_va": "0x00418740", "registry_global_va": "0x004696B8",
        "cleanup_import_va": "0x004192E0", "cleanup_import": cleanup_iat,
        "observed_behavior": "release of Qt container backing allocation with element size/alignment 4",
        "pointer_iteration_or_module_delete_observed": False,
        "scope": "bounded cleanup routine only; other indirect destruction paths are not excluded"
    }
    asm += ["\n; IS.exe: module-registry cleanup function 0x00418740\n", cleanup_dis]

    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(output, indent=2), encoding="utf-8")
    args.asm_out.parent.mkdir(parents=True, exist_ok=True)
    args.asm_out.write_text("\n".join(asm), encoding="utf-8")
    print(f"audited_modules={len(output['plugins'])} base_purecall=5/5 widget_list_append=5/5 host_cleanup=1 SHA256=PASS")

if __name__ == "__main__":
    main()
