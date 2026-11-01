#!/usr/bin/env python3
"""Reproducibly validate and semantically round-trip the five distinct Stage 1 samples."""
from __future__ import annotations
import argparse
import hashlib
import json
from pathlib import Path
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))
from is2_re import ProjectDocument  # noqa: E402

SAMPLE_NAMES = (
    "schaefer.is2",
    "untitled.is2",
    "kaka2.xml",
    "kursach.is2",
    "kursach_user_supplied_42_actions.is2",
)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def validate(samples_dir: Path) -> dict:
    results = []
    for name in SAMPLE_NAMES:
        source = samples_dir / name
        doc = ProjectDocument.load(source)
        issues = doc.validate(deep=True)
        with tempfile.TemporaryDirectory(prefix="is2-stage2-") as tmp:
            output = Path(tmp) / name
            doc.save(output)
            reopened = ProjectDocument.load(output)
            same = doc.semantic_snapshot() == reopened.semantic_snapshot()
            if not same:
                issues.append("semantic tree changed during writer round-trip")
            if not issues:
                # Confirm arrangement chains remain readable after serialization.
                parents = sorted({n.get("afe1") for n in reopened.links if n.get("type") in {"2", "3"}})
                for parent in parents:
                    reopened.sibling_order(parent)
            results.append({
                "file": name,
                "source_sha256": sha256(source),
                "output_sha256": sha256(output),
                "actions": len(doc.actions),
                "links": len(doc.links),
                "parameters": len(doc.params_node.findall("param")),
                "objects": len(list(doc.objects_node)),
                "sibling_parent_groups": len({n.get("afe1") for n in doc.links if n.get("type") in {"2", "3"}}),
                "semantic_roundtrip": same,
                "issues": issues,
            })
    return {
        "suite": "IS-2 Stage 2 sample reader/writer validation",
        "sample_count": len(results),
        "passed": sum(not row["issues"] for row in results),
        "failed": sum(bool(row["issues"]) for row in results),
        "results": results,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--samples", type=Path, default=ROOT / "samples")
    parser.add_argument("--out", type=Path, default=ROOT / "analysis" / "stage2_sample_roundtrip.json")
    args = parser.parse_args()
    report = validate(args.samples)
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({k: report[k] for k in ("suite", "sample_count", "passed", "failed")}, ensure_ascii=False))
    return 0 if report["failed"] == 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())
