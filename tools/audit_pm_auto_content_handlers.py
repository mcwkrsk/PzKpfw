#!/usr/bin/env python3
"""SHA-pinned static audit for PM_auto content/name editing handlers.

This tool checks disassembly fingerprints only. It does not emulate Qt or the
original Windows application and cannot prove runtime signal delivery.
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
    "remove_content_link": (0x10005890, 0x10005990),
    "edit_element_name": (0x100059C0, 0x10005AF0),
    "add_content_link_plus": (0x10005F00, 0x10006120),
    "select_star_content_link": (0x10006BF0, 0x10006D90),
    "add_content_link_dot": (0x10006DC0, 0x10006E90),
}

REQUIRED = {
    "remove_content_link": [
        "0x10022958", "0x100223b8", "0x1002210c", "0x10022108", "0x10016f70"
    ],
    "edit_element_name": [
        "0x10022808", "0x1002239c", "0x10022434", "0x10022384", "0x1002208c", "0x100220c0", "0x10014280"
    ],
    "add_content_link_plus": [
        "0x100220bc", "0x100228f8", "0x100223c4", "0x10022064", "0x10016f70", "0x2b"
    ],
    "select_star_content_link": [
        "0x100220bc", "0x10022068", "0x100220f8", "0x1002205c", "0x10022064", "0x2a", "0x101", "0x10014280"
    ],
    "add_content_link_dot": [
        "0x100220bc", "0x100228f8", "0x100223c4", "0x10022064", "0x10016f70", "0x2e"
    ],
}


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
    ap.add_argument("--out", type=Path, default=Path("analysis/pm_auto/content_handlers_audit.json"))
    ap.add_argument("--asm-out", type=Path, default=Path("analysis/disassembly/pm_auto_content_handlers.asm"))
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
    combined = "\n".join(outputs.values())
    # Verify the imported core symbols from the exact MAIWmodels build.
    exp = subprocess.run([objdump, "-p", str(args.pm_auto)], check=True, text=True, stdout=subprocess.PIPE).stdout
    import_names = [
        "?addContentLink@AContentStructure@@QAEPAVAEContentLink@@PAVAIElement@@PAVAFElement@@D_N@Z",
        "?removeContentLink@AContentStructure@@QAEXPAVAIElement@@PAVAFElement@@D_N@Z",
        "?getAFElementContentLinks@AContentStructure@@QAE?AVALElementList@@PAVAFElement@@@Z",
        "?setName@AElement@@QAEXVMString@@@Z",
    ]
    imports_ok = {s: s in exp for s in import_names}
    payload = {
        "schema": "is2.pm_auto.content_handlers_audit.v1",
        "status": "passed" if all(r["status"] == "passed" for r in records.values()) and all(imports_ok.values()) else "failed",
        "hashes": hashes,
        "functions": records,
        "required_core_imports": imports_ok,
        "limitations": [
            "Static disassembly only; no Windows runtime execution.",
            "The semantic meaning of marker bytes '+', '.', '*' and boolean flags is not inferred.",
            "The selected 32-bit QVariant values are treated as pointer payloads only where the receiving core signature and subsequent thiscall usage support that interpretation.",
            "UI labels for the three controls remain unidentified.",
        ],
    }
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(payload, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    args.asm_out.parent.mkdir(parents=True, exist_ok=True)
    args.asm_out.write_text("\n\n".join(outputs.values()), encoding="utf-8")
    print(json.dumps(payload, ensure_ascii=False, indent=2))
    return 0 if payload["status"] == "passed" else 1

if __name__ == "__main__":
    raise SystemExit(main())
