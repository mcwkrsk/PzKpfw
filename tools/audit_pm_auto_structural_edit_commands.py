#!/usr/bin/env python3
"""SHA-pinned static audit for PM_auto structural-edit commands.

This verifies the supplied x86 build's callsite fingerprints with GNU objdump.
It is not a decompiler and does not validate runtime behavior.
"""
from __future__ import annotations
import argparse
import hashlib
import json
import shutil
import subprocess
from pathlib import Path

PM_SHA256 = "c3cbde9cb83a7c10774a0faa4541622005856d09b79ce94dec3d8bd90d083018"
CORE_SHA256 = "80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525"

FUNCTIONS = {
    "new_alternative": (0x1000BB60, 0x1000C160),
    "new_iteration": (0x1000C3A0, 0x1000C870),
    "new_sequence": (0x1000C870, 0x1000CE70),
    "insert_after": (0x1000C160, 0x1000C280),
    "insert_before": (0x1000C280, 0x1000C3A0),
    "delete_selected": (0x1000A4E0, 0x1000A59E),
    "delete_core_path": (0x1000DB60, 0x1000DCA0),
    "to_elementary": (0x10011470, 0x100117AA),
}

REQUIRED = {
    "new_alternative": ["0x100220ec", "0x100220bc", "0x10022068", "0x2", "0x100220cc"],
    "new_iteration": ["0x100220e8", "0x100220b8", "0x10022124", "0x10022128"],
    "new_sequence": ["0x100220f0", "0x100220b8", "0x10022124", "0x10022128"],
    "insert_after": ["0x100220e0", "0x10022118", "0x100220b8", "0x10022120"],
    "insert_before": ["0x100220e0", "0x1002211c", "0x10022118", "0x100220b8"],
    "delete_selected": ["0x1000db60", "0x10022124", "0x10015990", "0x10014280"],
    "delete_core_path": ["0x100220f4", "0x100220b8", "0x1000a360"],
    "to_elementary": ["0x100220e4", "0x100220bc", "0x10022068", "0x10014280"],
}

CORE_IMPORTS = [
    "?makeAlternative@AFStructure@@QAEXPAVAFElement@@H@Z",
    "?makeElementary@AFStructure@@QAEXPAVAFElement@@@Z",
    "?makeIteration@AFStructure@@QAEXPAVAFElement@@@Z",
    "?makeSequanse@AFStructure@@QAEXPAVAFElement@@H@Z",
    "?pasteNewAFElement@AFStructure@@QAEXPAVAFElement@@0@Z",
    "?removeAFElement@AFStructure@@QAEXPAVAFElement@@@Z",
    "?getDynamicStructure@AbstractModel@@QAEPAVAFStructure@@H@Z",
]


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def disassemble(objdump: str, binary: Path, start: int, stop: int) -> str:
    p = subprocess.run(
        [objdump, "-d", "-Mintel", f"--start-address={start:#x}", f"--stop-address={stop:#x}", str(binary)],
        check=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
    )
    return p.stdout.lower()


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("pm_auto", type=Path)
    ap.add_argument("maiwmodels", type=Path)
    ap.add_argument("--out", type=Path, default=Path("analysis/pm_auto/structural_edit_audit.json"))
    ap.add_argument("--asm-out", type=Path, default=Path("analysis/disassembly/pm_auto_structural_edit_commands.asm"))
    args = ap.parse_args()
    objdump = shutil.which("objdump")
    if not objdump:
        raise SystemExit("objdump not found")
    hashes = {"PM_auto.dll": sha256(args.pm_auto), "MAIWmodels.dll": sha256(args.maiwmodels)}
    if hashes["PM_auto.dll"] != PM_SHA256:
        raise SystemExit(f"PM_auto.dll SHA-256 mismatch: {hashes['PM_auto.dll']}")
    if hashes["MAIWmodels.dll"] != CORE_SHA256:
        raise SystemExit(f"MAIWmodels.dll SHA-256 mismatch: {hashes['MAIWmodels.dll']}")

    outputs: dict[str, str] = {}
    records = {}
    for name, (start, stop) in FUNCTIONS.items():
        text = disassemble(objdump, args.pm_auto, start, stop)
        outputs[name] = text
        missing = [needle for needle in REQUIRED[name] if needle not in text]
        records[name] = {
            "start_va": f"0x{start:08x}",
            "stop_va_exclusive": f"0x{stop:08x}",
            "required_fingerprints": REQUIRED[name],
            "missing_fingerprints": missing,
            "status": "passed" if not missing else "failed",
        }
    # Audit the two core routines from MAIWmodels.dll independently; their VA ranges
    # are not in the PM_auto image and must not be searched in its disassembly.
    CORE_FUNCTIONS = {
        "core_paste_new_element": (0x1000C160, 0x1000C228),
        "core_remove_element": (0x1000C230, 0x1000C3A0),
        "core_make_alternative": (0x1000B760, 0x1000BB60),
        "core_make_elementary": (0x1000BB60, 0x1000BB98),
        "core_make_iteration": (0x1000BBA0, 0x1000BC14),
        "core_make_sequence": (0x1000BC20, 0x1000C015),
    }
    CORE_REQUIRED = {
        "core_paste_new_element": ["0x1000aeb0", "0x1000add0", "0x1000b100", "0x100096b0"],
        "core_remove_element": ["0x1000ab80", "0x1000b100", "0x10003320", "0x100032f0"],
        "core_make_alternative": ["0x1000aeb0", "0x1000add0", "0x1000b100", "0x2"],
        "core_make_elementary": ["0x1000c3b0", "0x10009eb0", "0x10009d60", "0x10009d40", "0x1000b100"],
        "core_make_iteration": ["0x10002a60", "0x1000aeb0", "0x1000add0", "0x1000b100"],
        "core_make_sequence": ["0x1000aeb0", "0x1000add0", "0x1000b100", "0x2"],
    }
    core_records = {}
    for name, (start, stop) in CORE_FUNCTIONS.items():
        text = disassemble(objdump, args.maiwmodels, start, stop)
        outputs[name] = text
        missing = [needle for needle in CORE_REQUIRED[name] if needle not in text]
        core_records[name] = {
            "start_va": f"0x{start:08x}",
            "stop_va_exclusive": f"0x{stop:08x}",
            "required_fingerprints": CORE_REQUIRED[name],
            "missing_fingerprints": missing,
            "status": "passed" if not missing else "failed",
        }

    imports = subprocess.run([objdump, "-p", str(args.pm_auto)], check=True, text=True, stdout=subprocess.PIPE).stdout
    import_checks = {symbol: symbol in imports for symbol in CORE_IMPORTS}
    payload = {
        "schema": "is2.pm_auto.structural_edit_audit.v1",
        "status": "passed" if all(r["status"] == "passed" for r in records.values()) and all(r["status"] == "passed" for r in core_records.values()) and all(import_checks.values()) else "failed",
        "hashes": hashes,
        "functions": records,
        "core_implementations": core_records,
        "required_core_imports": import_checks,
        "limitations": [
            "Static disassembly only; no original Windows runtime execution.",
            "No claim is made that the source-level function names are original symbols; slot names come from recovered Qt MOC metadata.",
            "The meaning of UI context discriminator values at widget offset +0x2c is not fully decoded.",
            "The semantic meaning of AFElement type/status/formalization enum values is not inferred beyond setter arguments and the separately recovered enum map.",
            "The nested-diagram branches of newSeq/newAlt/newLoop contain additional UI/model paths that are not fully decompiled here."
        ]
    }
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(payload, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    args.asm_out.parent.mkdir(parents=True, exist_ok=True)
    args.asm_out.write_text("\n\n".join(f"; ===== {name} =====\n{text}" for name, text in outputs.items()), encoding="utf-8")
    print(json.dumps(payload, indent=2, ensure_ascii=False))
    return 0 if payload["status"] == "passed" else 1

if __name__ == "__main__":
    raise SystemExit(main())
