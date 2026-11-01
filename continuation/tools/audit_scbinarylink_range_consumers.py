#!/usr/bin/env python3
"""Scan exact host/plugin PE files for named getRange/setRange symbol occurrences."""
from __future__ import annotations
import argparse, hashlib, json, subprocess, sys
from pathlib import Path
EXPECTED = {
  "IS.exe": "ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2",
  "PM_auto.dll": "c3cbde9cb83a7c10774a0faa4541622005856d09b79ce94dec3d8bd90d083018",
  "PM_params.dll": "22c867d11fcc724b79fbff420f514d7adccd7a8eb7565e9b4b43e60b267ea781",
  "PM_matrix_web.dll": "55d25ef0f07a069d80226abae1583928be92cf023fb66ffddbdd32b4f1a66f22",
  "PM_spec_WEB.dll": "ef0365f6fd3f69648ccf28c5eb564312f70faa9bbd892543a933ec4ae7fa6d68",
  "Model_Visualiser.dll": "1187c7a59ae2dbb8eb91bebbbe89850d9724a62ff186865733930f1488bce880",
}
SYMBOLS = ["?getRange@AIEBinaryLink@@QAEHXZ", "?setRange@AIEBinaryLink@@QAEXH@Z"]
def main() -> int:
    ap=argparse.ArgumentParser(); ap.add_argument("--binary-dir", type=Path, required=True); ap.add_argument("--out",type=Path)
    a=ap.parse_args(); rows={}
    for name, expected in EXPECTED.items():
        path=a.binary_dir/name if name=="IS.exe" else a.binary_dir/"modules"/name
        if not path.is_file(): print(f"missing binary: {path}",file=sys.stderr); return 2
        digest=hashlib.sha256(path.read_bytes()).hexdigest()
        proc=subprocess.run(["objdump","-p",str(path)],capture_output=True,text=True)
        if proc.returncode: print(proc.stderr,file=sys.stderr); return proc.returncode
        counts={sym:proc.stdout.count(sym) for sym in SYMBOLS}
        rows[name]={"sha256":digest,"expected_sha256":expected,"sha_matches":digest==expected,"named_range_symbol_occurrences_in_objdump":counts,"no_named_range_symbol_occurrences":all(v==0 for v in counts.values())}
    result={"scan":"scbinarylink-range-import-consumers","scope":"IS.exe plus five supplied plugin DLLs","symbols_checked":SYMBOLS,"tool":"GNU objdump -p output; search for exact decorated symbol names","results":rows,"passed":sum(r["sha_matches"] and r["no_named_range_symbol_occurrences"] for r in rows.values()),"total":len(rows),"limitations":["bounded string-presence scan of objdump -p output, not a full import-thunk disassembler","does not rule out dynamic symbol resolution","does not rule out ordinal imports","does not inspect binaries outside the supplied host and five plugin DLLs"]}
    result["status"]="PASS" if result["passed"]==result["total"] else "FAIL"
    payload=json.dumps(result,indent=2)+"\n"
    if a.out: a.out.parent.mkdir(parents=True,exist_ok=True); a.out.write_text(payload)
    print(payload,end=""); return 0 if result["status"]=="PASS" else 1
if __name__=="__main__": raise SystemExit(main())
