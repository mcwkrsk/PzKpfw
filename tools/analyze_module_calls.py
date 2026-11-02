#!/usr/bin/env python3
"""Static PE import/call-xref inventory for the IS-2 x86 module family.

Requires GNU objdump. This tool reports direct IAT calls and calls through
linker-generated import thunks; it does not claim to recover full functions
or indirect C++ virtual call targets.
"""
from __future__ import annotations
import argparse, csv, json, re, subprocess, hashlib
from collections import defaultdict
from pathlib import Path


def run(args: list[str]) -> str:
    return subprocess.run(args, check=True, text=True, stdout=subprocess.PIPE,
                          stderr=subprocess.PIPE, errors="replace").stdout


def parse_image_base(pe_text: str) -> int:
    m = re.search(r"^ImageBase\s+([0-9a-fA-F]+)", pe_text, re.M)
    if not m:
        raise ValueError("ImageBase not found in objdump -p output")
    return int(m.group(1), 16)


def parse_imports(pe_text: str, image_base: int) -> dict[int, tuple[str, str]]:
    imports: dict[int, tuple[str, str]] = {}
    dll = ""
    for line in pe_text.splitlines():
        m = re.search(r"DLL Name:\s*(\S+)", line)
        if m:
            dll = m.group(1)
            continue
        m = re.match(r"\s*([0-9a-fA-F]{8})\s+<none>\s+[0-9a-fA-F]{4}\s+(.+?)\s*$", line)
        if m and dll:
            iat_va = image_base + int(m.group(1), 16)
            imports[iat_va] = (dll, m.group(2))
    return imports


def analyze_one(path: Path, core_name: str) -> dict:
    pe = run(["objdump", "-p", str(path)])
    base = parse_image_base(pe)
    imports = parse_imports(pe, base)
    dis = run(["objdump", "-d", "-C", "-Mintel", str(path)])

    # Linker import thunks are tiny jump stubs whose only action is JMP [IAT].
    thunk_to_import: dict[int, tuple[str, str]] = {}
    for line in dis.splitlines():
        m = re.match(r"\s*([0-9a-fA-F]+):.*\bjmp\s+DWORD PTR ds:(0x[0-9a-fA-F]+)", line)
        if m:
            stub = int(m.group(1), 16)
            iat = int(m.group(2), 16)
            if iat in imports:
                thunk_to_import[stub] = imports[iat]

    callsites: dict[tuple[str, str], list[dict]] = defaultdict(list)
    virtual_calls: list[dict] = []
    for line in dis.splitlines():
        # direct import call: CALL DWORD PTR ds:IAT
        m = re.match(r"\s*([0-9a-fA-F]+):.*\bcall\s+DWORD PTR ds:(0x[0-9a-fA-F]+)", line)
        if m:
            at, iat = int(m.group(1), 16), int(m.group(2), 16)
            if iat in imports:
                dll, name = imports[iat]
                callsites[(dll, name)].append({"site": f"0x{at:08x}", "kind": "direct-IAT"})
            continue
        # CALL rel32 to the thunk stub which jumps to IAT.
        m = re.match(r"\s*([0-9a-fA-F]+):.*\bcall\s+(0x[0-9a-fA-F]+)\s*$", line)
        if m:
            at, target = int(m.group(1), 16), int(m.group(2), 16)
            if target in thunk_to_import:
                dll, name = thunk_to_import[target]
                callsites[(dll, name)].append({"site": f"0x{at:08x}", "kind": "import-thunk"})
            continue
        # Preserve virtual call shapes independently; target depends on runtime vptr.
        m = re.match(r"\s*([0-9a-fA-F]+):.*\bcall\s+DWORD PTR \[([a-z0-9]+)(?:\+([0-9xa-f]+))?\]", line)
        if m:
            virtual_calls.append({"site": f"0x{int(m.group(1),16):08x}",
                                  "base_register": m.group(2),
                                  "offset": m.group(3) or "0"})

    core = []
    for (dll, name), sites in sorted(callsites.items()):
        if dll.lower() == core_name.lower():
            core.append({"symbol": name, "calls": len(sites), "sites": sites})
    digest = hashlib.sha256(path.read_bytes()).hexdigest()
    return {
        "binary": path.name, "sha256": digest, "image_base": f"0x{base:08x}",
        "imports_total": len(imports),
        "imports_by_dll": dict(sorted(__import__('collections').Counter(d for d, _ in imports.values()).items())),
        "core_imports": core,
        "virtual_calls_indirect": virtual_calls,
        "import_thunks_resolved": len(thunk_to_import),
    }


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("binary_dir", type=Path, help="directory containing IS.exe and modules/*.dll")
    ap.add_argument("--out", type=Path, required=True)
    args = ap.parse_args()
    paths = [args.binary_dir / "IS.exe"] + sorted((args.binary_dir / "modules").glob("*.dll"))
    results = [analyze_one(p, "MAIWmodels.dll") for p in paths if p.exists()]
    args.out.mkdir(parents=True, exist_ok=True)
    (args.out / "module_call_xrefs.json").write_text(json.dumps(results, indent=2), encoding="utf-8")
    with (args.out / "core_api_usage.tsv").open("w", newline="", encoding="utf-8") as f:
        w = csv.writer(f, delimiter="\t")
        w.writerow(["binary", "symbol", "call_count", "call_sites", "sha256"])
        for r in results:
            for imp in r["core_imports"]:
                w.writerow([r["binary"], imp["symbol"], imp["calls"], ",".join(x["site"] for x in imp["sites"]), r["sha256"]])
    print(f"Analyzed {len(results)} binaries; output: {args.out}")

if __name__ == "__main__":
    main()
