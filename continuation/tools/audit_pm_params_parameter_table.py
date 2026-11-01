#!/usr/bin/env python3
"""SHA-pinned static audit of PM_params parameter-table synchronization.

The audit validates disassembly/import fingerprints only. It does not execute
IS-2 or prove Qt runtime/editor behavior.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
from pathlib import Path

EXPECTED = {
    "PM_params.dll": "22c867d11fcc724b79fbff420f514d7adccd7a8eb7565e9b4b43e60b267ea781",
    "MAIWmodels.dll": "80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525",
}

IMPORTS = {
    "0x1000A060": "?setName@AIElement@@QAEXVMString@@@Z",
    "0x1000A06C": "?setCodingType@AIElement@@QAEXW4CodingType@@@Z",
    "0x1000A070": "?deleteParameter@ParametersList@@QAEXPAVParameter@@@Z",
    "0x1000A078": "?setNumber@Parameter@@QAEXH@Z",
    "0x1000A084": "?setSign@Parameter@@QAEXVMString@@@Z",
    "0x1000A088": "?addParameter@ParametersList@@QAEPAVParameter@@XZ",
    "0x1000A090": "?removeFromList@AEBinaryLink@@QAEXXZ",
    "0x1000A094": "?getType@AEBinaryLink@@QAE?AW4LinkType@@XZ",
    "0x1000A098": "?unlink@AEBinaryLink@@QAEX_N@Z",
    "0x1000A0C0": "?setObject@Parameter@@QAEXPAVObject@@@Z",
    "0x1000A0E0": "?setGroup@Parameter@@QAEXH@Z",
}


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for block in iter(lambda: f.read(1024 * 1024), b""):
            h.update(block)
    return h.hexdigest()


def run_objdump(args: list[str]) -> str:
    proc = subprocess.run(args, check=True, text=True, capture_output=True)
    return proc.stdout


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("pm_params", type=Path)
    ap.add_argument("maiwmodels", type=Path)
    ap.add_argument("--out", type=Path)
    ns = ap.parse_args()

    binaries = {"PM_params.dll": ns.pm_params, "MAIWmodels.dll": ns.maiwmodels}
    hashes = {name: sha256(path) for name, path in binaries.items()}
    for name, digest in hashes.items():
        if digest != EXPECTED[name]:
            raise SystemExit(f"SHA-256 mismatch for {name}: {digest}")

    pm = ns.pm_params
    dis_data = run_objdump([
        "objdump", "-d", "-Mintel", "--start-address=0x10003940",
        "--stop-address=0x10004140", str(pm)
    ])
    dis_slots = run_objdump([
        "objdump", "-d", "-Mintel", "--start-address=0x10005650",
        "--stop-address=0x10005b40", str(pm)
    ])
    dis_connect = run_objdump([
        "objdump", "-d", "-Mintel", "--start-address=0x10002fd0",
        "--stop-address=0x10003045", str(pm)
    ])
    dis_signal_site = run_objdump([
        "objdump", "-d", "-Mintel", "--start-address=0x10003720",
        "--stop-address=0x100037a0", str(pm)
    ])
    imports_text = run_objdump(["objdump", "-p", str(pm)])

    checks: dict[str, bool] = {}
    checks["data_changed_handler_entry"] = "10003940:" in dis_data and "ret    0xc" in dis_data
    checks["metacall_adapter_routes_to_handler"] = "10005542:" in run_objdump([
        "objdump", "-d", "-Mintel", "--start-address=0x10005520",
        "--stop-address=0x10005560", str(pm)
    ]) and "call   0x10003940" in run_objdump([
        "objdump", "-d", "-Mintel", "--start-address=0x10005520",
        "--stop-address=0x10005560", str(pm)
    ])
    checks["connect_impl_uses_qabstractitemmodel_metaobject"] = (
        "0x1000a138" in dis_connect and "0x1000a114" in dis_connect
    )
    checks["connection_site_uses_data_changed_signal"] = (
        "0x1000a130" in dis_signal_site and "call   0x10003050" in dis_signal_site
    )
    for column in range(6):
        checks[f"column_{column}_branch"] = ("10003979" in dis_data and "test   eax,eax" in dis_data[:dis_data.find("1000399e:")] if column == 0 else bool(re.search(rf"cmp\s+eax,0x{column:x}", dis_data)))
    checks["set_object_branch"] = "DWORD PTR ds:0x1000a0c0" in dis_data
    checks["set_name_branch"] = "DWORD PTR ds:0x1000a060" in dis_data
    checks["set_coding_type_branch"] = "DWORD PTR ds:0x1000a06c" in dis_data
    checks["set_number_branch"] = "DWORD PTR ds:0x1000a078" in dis_data
    checks["set_sign_branch"] = "DWORD PTR ds:0x1000a084" in dis_data
    checks["set_group_branch"] = "DWORD PTR ds:0x1000a0e0" in dis_data
    checks["add_parameter_call"] = "DWORD PTR ds:0x1000a088" in dis_slots
    checks["parameter_delete_calls_delete_parameter"] = "DWORD PTR ds:0x1000a070" in dis_slots
    checks["parameter_delete_filters_link_type_4"] = bool(re.search(r"cmp\s+eax,0x4", dis_slots))
    checks["parameter_delete_unlinks_links"] = "DWORD PTR ds:0x1000a098" in dis_slots
    checks["parameter_delete_removes_link_from_list"] = "DWORD PTR ds:0x1000a090" in dis_slots

    import_map: dict[str, str] = {}
    for address, symbol in IMPORTS.items():
        needle = f"{int(address, 16) - 0x10000000:08x}"
        address_line = re.compile(rf"\b{needle}\s+<none>\s+\w+\s+({re.escape(symbol)})")
        matched = address_line.search(imports_text)
        checks[f"import_{address}"] = bool(matched)
        if matched:
            import_map[address] = matched.group(1)

    report = {
        "stage": "1.17",
        "topic": "PM_params parameter table synchronization and deletion cleanup",
        "static_only": True,
        "sha256": hashes,
        "checks_passed": sum(checks.values()),
        "checks_total": len(checks),
        "checks": checks,
        "column_setter_map": {
            "0": "Parameter::setGroup",
            "1": "AIElement::setCodingType",
            "2": "Parameter::setNumber",
            "3": "Parameter::setObject",
            "4": "Parameter::setSign",
            "5": "AIElement::setName",
        },
        "imports": import_map,
        "limitations": [
            "No Windows runtime execution was performed.",
            "The original C++ symbol name of 0x10003940 is not recovered.",
            "LinkType value 4 is only identified as the deletion filter in this handler.",
            "Post-erase ownership of removed Parameter/Object instances remains unresolved.",
        ],
    }
    if not all(checks.values()):
        failed = [name for name, ok in checks.items() if not ok]
        raise SystemExit("Audit checks failed: " + ", ".join(failed))
    payload = json.dumps(report, ensure_ascii=False, indent=2) + "\n"
    if ns.out:
        ns.out.parent.mkdir(parents=True, exist_ok=True)
        ns.out.write_text(payload, encoding="utf-8")
    print(payload, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
