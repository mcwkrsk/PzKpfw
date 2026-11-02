#!/usr/bin/env python3
"""Create a small, fully synthetic project exercising all recovered link kinds."""
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))
from is2_re import ProjectDocument  # noqa: E402


def main() -> int:
    doc = ProjectDocument.new_empty("PzKpfw synthetic relationship graph fixture", user_name="PzKpfw Test Fixture")
    action_a = doc.add_action("Synthetic action A", action_type=1)
    action_b = doc.add_action("Synthetic action B", action_type=1)
    category_a = doc.concept_structure.add_category("Synthetic category A", class_id=1)
    category_b = doc.concept_structure.add_category("Synthetic category B", class_id=2)
    spz_a = doc.dynamic_structure.add_element("Synthetic spz A", type=0, status=0)
    spz_b = doc.dynamic_structure.add_element("Synthetic spz B", type=0, status=0)
    doc.concept_structure.add_link(2, e1=category_a, e2=category_b, name="Synthetic SCBinaryLink")
    doc.dynamic_structure.add_spz_link(e1=spz_a, e2=spz_b, name="Synthetic AIEBinaryLink")
    doc.dynamic_structure.add_content_link(action_a, category_b, char=1, power=2, duplicate="reject")
    doc.dynamic_structure.add_content_link(action_b, category_a, char=2, power=3, duplicate="reject")
    issues = doc.validate(deep=True)
    if issues:
        raise SystemExit("Synthetic fixture validation failed: " + "; ".join(issues))
    out = ROOT / "samples" / "synthetic_relationships_0.7.3.is2"
    doc.save(out)
    print(f"Created {out.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
