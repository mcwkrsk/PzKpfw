from pathlib import Path
import sys
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re import ProjectDocument, dependency_report


def test_dependency_report_maps_typed_endpoint_references():
    doc = ProjectDocument.new_empty("dependency fixture")
    action = doc.add_action("Action", action_type=0)
    cat_a = doc.concept_structure.add_category("Category A", class_id=1)
    cat_b = doc.concept_structure.add_category("Category B", class_id=2)
    spz_a = doc.dynamic_structure.add_element("spz A")
    spz_b = doc.dynamic_structure.add_element("spz B")
    doc.concept_structure.add_link(2, e1=cat_a, e2=cat_b)
    doc.dynamic_structure.add_spz_link(e1=spz_a, e2=spz_b)
    doc.dynamic_structure.add_content_link(action, cat_b)

    report = dependency_report(doc)
    by_key = {(item["domain"], item["id"]): item for item in report["entities"]}
    assert by_key[("action", action)]["references"][0]["relation_kind"] == "ae_content_link"
    assert by_key[("category", cat_a)]["references"][0]["relation_kind"] == "scbinarylink"
    assert by_key[("category", cat_b)]["reference_count"] == 2
    assert by_key[("spz_element", spz_a)]["references"][0]["relation_kind"] == "aie_binary_link"
    assert report["reference_count"] == 6
    assert all(not item["opaque_risk"] for item in report["entities"])


def test_dependency_report_flags_opaque_branches_without_mutating_document():
    doc = ProjectDocument.new_empty("opaque fixture")
    action = doc.add_action("Action", action_type=0)
    cat = doc.concept_structure.add_category("Category", class_id=1)
    content = doc.dynamic_structure.ensure_content()
    content.append(ET.Element("VendorContent", {"blob": "preserve"}))
    before = doc.semantic_snapshot()

    report = dependency_report(doc)
    by_key = {(item["domain"], item["id"]): item for item in report["entities"]}
    assert by_key[("action", action)]["opaque_risk"] is True
    assert by_key[("category", cat)]["opaque_risk"] is True
    assert report["opaque_count"] == 1
    assert doc.semantic_snapshot() == before


def test_dependency_report_explains_delete_risk_levels():
    doc = ProjectDocument.new_empty("dependency risk fixture")
    action = doc.add_action("Action", action_type=0)
    category = doc.concept_structure.add_category("Category", class_id=1)
    doc.dynamic_structure.add_content_link(action, category)
    report = dependency_report(doc)
    by_key = {(item["domain"], item["id"]): item for item in report["entities"]}
    action_item = by_key[("action", action)]
    category_item = by_key[("category", category)]
    assert action_item["risk_level"] == "REFERENCED"
    assert action_item["known_cascade_review_required"] is True
    assert action_item["safe_without_cascade"] is False
    assert "explicit supported cascade" in action_item["deletion_guidance"]
    assert report["risk_summary"]["REFERENCED"] == 2
    assert category_item["reference_count"] == 1
