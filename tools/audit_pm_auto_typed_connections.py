#!/usr/bin/env python3
"""Static audit of PM_auto.dll Qt typed connections (PE32 x86).

The tool is deliberately narrow and SHA-256 pinned. It counts direct IAT calls
through the known QObject::connectImpl slot and checks a set of callback targets
identified in the supplied build. It does not emulate Qt or prove runtime signal
delivery.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import shutil
import subprocess
import sys
from pathlib import Path
from typing import Iterable

EXPECTED_SHA256 = "c3cbde9cb83a7c10774a0faa4541622005856d09b79ce94dec3d8bd90d083018"
EXPECTED_CONNECT_CALLS = 17
CONNECT_IAT = "0x10022368"
EXPECTED_TARGETS = (
    "0x100064f0", "0x1000dad0", "0x10006bf0", "0x10006dc0",
    "0x100063b0", "0x10005f00", "0x10005890", "0x100059c0",
    "0x10005b10", "0x10006eb0", "0x10002750", "0x100017e0",
)
EXPECTED_IMPORT_SYMBOLS = (
    "connectImpl@QObject",
    "clicked@QAbstractButton",
    "pressed@QAbstractButton",
    "currentIndexChanged@QComboBox",
    "dataChanged@QAbstractItemModel",
    "textChanged@QTextEdit",
    "setFormalization@AFElement",
    "setCurrentWidget@QTabWidget",
)
_REPO_ROOT = Path(__file__).resolve().parents[1]
_DEFAULT_CANDIDATES = (
    _REPO_ROOT.parent / "original" / "modules" / "PM_auto.dll",
    Path("/mnt/data/is2_work/rar_extracted/IS2_PMauto_beta/modules/PM_auto.dll"),
)
DEFAULT_BINARY = next((p for p in _DEFAULT_CANDIDATES if p.is_file()), _DEFAULT_CANDIDATES[0])


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def connect_impl_calls(disassembly: str) -> list[str]:
    """Return image VAs of exact `call [0x10022368]` instructions."""
    found: list[str] = []
    pattern = re.compile(
        r"^\s*([0-9a-fA-F]+):\s+(?:[0-9a-fA-F]{2}\s+)+"
        r"call\s+DWORD PTR ds:0x10022368\s*$",
        re.IGNORECASE,
    )
    for line in disassembly.splitlines():
        match = pattern.match(line)
        if match:
            found.append(f"0x{int(match.group(1), 16):08x}")
    return found


def normalise_symbol_text(imports: str) -> str:
    return imports.replace("?", "?").lower()


def run_objdump(binary: Path, mode: str) -> str:
    objdump = shutil.which("objdump")
    if not objdump:
        raise RuntimeError("GNU objdump was not found on PATH")
    args = [objdump, "-d", "-Mintel", str(binary)] if mode == "disasm" else [objdump, "-p", str(binary)]
    proc = subprocess.run(args, check=False, capture_output=True, text=True)
    if proc.returncode != 0:
        raise RuntimeError(f"objdump {mode} failed: {proc.stderr.strip()}")
    return proc.stdout


def audit(binary: Path) -> dict:
    if not binary.is_file():
        raise FileNotFoundError(binary)
    actual_sha = sha256_file(binary)
    if actual_sha != EXPECTED_SHA256:
        raise ValueError(
            "SHA-256 mismatch; refusing to analyse an unrecognised PM_auto.dll "
            f"(expected {EXPECTED_SHA256}, got {actual_sha})"
        )

    disasm = run_objdump(binary, "disasm")
    imports = run_objdump(binary, "imports")
    calls = connect_impl_calls(disasm)
    if len(calls) != EXPECTED_CONNECT_CALLS:
        raise ValueError(
            f"QObject::connectImpl callsite count mismatch: "
            f"expected {EXPECTED_CONNECT_CALLS}, got {len(calls)}"
        )

    import_lower = normalise_symbol_text(imports)
    missing_imports = [name for name in EXPECTED_IMPORT_SYMBOLS if name.lower() not in import_lower]
    if missing_imports:
        raise ValueError(f"Required import symbols missing: {missing_imports}")

    disasm_lower = disasm.lower()
    missing_targets = [target for target in EXPECTED_TARGETS if target not in disasm_lower]
    if missing_targets:
        raise ValueError(f"Expected callback targets missing from disassembly: {missing_targets}")

    return {
        "binary": binary.name,
        "path": str(binary),
        "sha256": actual_sha,
        "architecture": "PE32 x86 (static analysis)",
        "connect_impl_iat": CONNECT_IAT,
        "connect_impl_direct_callsite_count": len(calls),
        "connect_impl_call_sites": calls,
        "required_import_symbols_verified": list(EXPECTED_IMPORT_SYMBOLS),
        "callback_targets_verified": list(EXPECTED_TARGETS),
        "static_only": True,
        "runtime_signal_delivery_tested": False,
        "notes": [
            "Callsite count is the number of static call instructions to the imported QObject::connectImpl IAT entry, not the number of live connections at runtime.",
            "Several logical signal/slot connections reuse the same wrapper callsite; constructor callsites may invoke those wrappers repeatedly.",
            "Callback target addresses are raw machine-code targets. No source-level names are invented for anonymous helper functions.",
        ],
    }


def main(argv: Iterable[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("binary", nargs="?", type=Path, default=DEFAULT_BINARY)
    parser.add_argument("--output", type=Path, help="write JSON result to this path")
    args = parser.parse_args(argv)
    try:
        result = audit(args.binary)
    except (OSError, RuntimeError, ValueError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 2
    rendered = json.dumps(result, ensure_ascii=False, indent=2) + "\n"
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
