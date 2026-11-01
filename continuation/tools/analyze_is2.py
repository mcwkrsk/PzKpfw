#!/usr/bin/env python3
"""Print JSON summary and validation results for one or more IS-2 XML files."""
from __future__ import annotations
import argparse, json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))
from is2_re import load_project, ProjectFormatError

def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("files", nargs="+", help=".is2 or XML project paths")
    args = parser.parse_args()
    failed = False
    for name in args.files:
        try:
            project = load_project(name)
            print(json.dumps(project.summary(), ensure_ascii=False, indent=2))
            if project.warnings:
                failed = True
        except (OSError, ProjectFormatError) as exc:
            print(json.dumps({"file": name, "error": str(exc)}, ensure_ascii=False), file=sys.stderr)
            failed = True
    return 1 if failed else 0
if __name__ == "__main__":
    raise SystemExit(main())
