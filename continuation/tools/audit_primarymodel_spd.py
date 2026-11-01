#!/usr/bin/env python3
"""SHA-pinned static audit for IS.exe primaryModel/spd reader and writer."""
from __future__ import annotations
import argparse, hashlib, json, pathlib, subprocess, sys

EXPECTED = "ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2"

def sha(path):
    h = hashlib.sha256()
    with path.open("rb") as f:
        for block in iter(lambda: f.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest()

def disasm(path, start, stop):
    return subprocess.run(
        ["objdump", "-d", "-Mintel", f"--start-address=0x{start:x}",
         f"--stop-address=0x{stop:x}", str(path)],
        check=True, capture_output=True, text=True
    ).stdout.lower()

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("binary", type=pathlib.Path)
    ap.add_argument("--out", type=pathlib.Path)
    ns = ap.parse_args()
    digest = sha(ns.binary)
    if digest != EXPECTED:
        print(f"SHA mismatch: expected {EXPECTED}, got {digest}", file=sys.stderr)
        return 2
    w = disasm(ns.binary, 0x40acd0, 0x40b9c3)
    r = disasm(ns.binary, 0x4071c0, 0x408bb6)
    wc = disasm(ns.binary, 0x40bb90, 0x40bc10)
    rc = disasm(ns.binary, 0x408f80, 0x409030)
    imports = subprocess.run(["objdump", "-p", str(ns.binary)], check=True,
                             capture_output=True, text=True).stdout.lower()
    checks = {
        "top_writer_calls_primary_writer": "call   0x40acd0" in wc,
        "top_reader_calls_primary_reader": "call   0x4071c0" in rc,
        "writer_creates_spd": "0x457b14" in w,
        "writer_creates_actions": "0x457b1c" in w,
        "writer_creates_pd": "0x457b30" in w,
        "writer_creates_links": "0x457b6c" in w,
        "writer_uses_actions_lastid": "0x457b28" in w and "[eax+0x24]" in w,
        "writer_uses_sos_count_and_index_getters": all(x in w for x in ("0x419150", "0x419148")),
        "writer_uses_link_count_and_index_getters": all(x in w for x in ("0x419158", "0x419154")),
        "writer_uses_three_endpoint_getters_and_type": all(x in w for x in ("0x4190c8", "0x4190cc", "0x4190d0", "0x4190d4")),
        "reader_reads_actions_lastid": "0x457b28" in r and "[esi+0x24]" in r,
        "reader_reads_links_and_endpoints": all(x in r for x in ("0x457b6c", "0x457b7c", "0x457b84", "0x457b8c")),
        "reader_branches_on_type_2_and_3": "sub    esi,0x2" in r and "sub    esi,0x1" in r,
        "reader_calls_arrangement_link_for_type3": "0x419134" in r,
        "reader_calls_composition_link_for_type2": "0x419138" in r,
        "iat_getafe1": "000190c8" in imports and "?getafe1@afebinarylink" in imports,
        "iat_getafe2": "000190cc" in imports and "?getaie2@afebinarylink" in imports,
        "iat_getafe3": "000190d0" in imports and "?getaie3@afebinarylink" in imports,
        "iat_gettype": "000190d4" in imports and "?gettype@afebinarylink" in imports,
        "iat_add_arragment": "00019134" in imports and "?addarragmentlink@afstructure" in imports,
        "iat_add_composition": "00019138" in imports and "?addcompositionlink@afstructure" in imports,
    }
    result = {
        "audit": "primarymodel-spd-reader-writer",
        "static_only": True,
        "binary": ns.binary.name,
        "sha256": digest,
        "writer_va": "0x0040ACD0",
        "reader_va": "0x004071C0",
        "checks": checks,
        "passed": sum(checks.values()),
        "total": len(checks),
        "status": "PASS" if all(checks.values()) else "FAIL",
        "type_mapping": {
            "2": "AFStructure::addCompositionLink(afe1, afe2)",
            "3": "AFStructure::addArragmentLink(afe1, afe2, afe3)"
        },
        "last_id": {
            "xml_attribute": "actions.lastID",
            "private_field": "SubjectOperationsStructure+0x24",
            "reader_writer_symmetry": "static"
        },
        "limitations": [
            "No original Windows runtime save/reopen was executed.",
            "The meaning of the third endpoint as next sibling is corroborated by four XML samples; the original API exposes it as the third AFElement endpoint.",
            "This audit covers primaryModel/spd only, not the complete project format."
        ]
    }
    payload = json.dumps(result, ensure_ascii=False, indent=2) + "\n"
    if ns.out:
        ns.out.parent.mkdir(parents=True, exist_ok=True)
        ns.out.write_text(payload, encoding="utf-8")
    print(payload, end="")
    return 0 if result["status"] == "PASS" else 1

if __name__ == "__main__":
    raise SystemExit(main())
