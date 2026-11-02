#!/usr/bin/env python3
"""Run the conservative native-format compatibility audit on all supplied samples."""
from __future__ import annotations

import argparse
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))
from is2_re import ProjectDocument, audit_document  # noqa: E402

SAMPLE_NAMES = (
    "schaefer.is2",
    "untitled.is2",
    "kaka2.xml",
    "kursach.is2",
    "kursach_user_supplied_42_actions.is2",
    "synthetic_relationships_0.7.3.is2",
)


def run(samples_dir: Path) -> dict:
    files = []
    for name in SAMPLE_NAMES:
        path = samples_dir / name
        doc = ProjectDocument.load(path)
        report = audit_document(doc)
        report["file"] = name
        report["actions"] = len(doc.actions)
        report["primary_links"] = len(doc.links)
        files.append(report)
    structural_pass = sum(
        row["native_envelope"] == "PASS"
        and row["structural_validation"] == "PASS"
        and row["writer_semantic_roundtrip"] == "PASS"
        and row["writer_idempotent_roundtrip"] == "PASS"
        and row["writer_reopened_validation"] == "PASS"
        and row["relationship_graph_summary"]["dangling_endpoint_count"] == 0
        for row in files
    )
    return {
        "suite": "PzKpfw 0.7.9 native XML writer, graph and relationship audit",
        "sample_count": len(files),
        "structural_roundtrip_passed": structural_pass,
        "structural_roundtrip_failed": len(files) - structural_pass,
        "original_is2_runtime_acceptance": "NOT_TESTED",
        "runtime_note": "Requires a Windows load-save-reopen test with the original IS.exe.",
        "files": files,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--samples", type=Path, default=ROOT / "samples")
    parser.add_argument("--out", type=Path, default=ROOT / "analysis" / "compatibility_0.7.9.json")
    args = parser.parse_args()
    report = run(args.samples)
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({key: report[key] for key in (
        "suite", "sample_count", "structural_roundtrip_passed",
        "structural_roundtrip_failed", "original_is2_runtime_acceptance",
    )}, ensure_ascii=False, indent=2))
    return 0 if report["structural_roundtrip_failed"] == 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())
