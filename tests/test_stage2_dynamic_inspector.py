from pathlib import Path
import json
import sys
import xml.etree.ElementTree as ET

import pytest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))
from is2_re import ProjectDocument, ProjectFormatError

SAMPLE = ROOT / "samples" / "kursach_user_supplied_42_actions.is2"


def load_document():
    return ProjectDocument.load(SAMPLE)


def add_inspection_fixture(doc):
    action_id = doc.add_action("inspection content action", action_type=0)
    category_id = doc.concept_structure.add_category("Category for inspection", class_id=1)
    spz_links = doc.root.find("models/ConceptModel/spz/links")
    ET.SubElement(spz_links, "AElement", {"id": "0", "name": "link", "e1": "1", "e2": "1", "e3": "0", "vendor": "keep"})
    content = doc.root.find("models/ConceptModel/content")
    item = ET.SubElement(content, "AElement", {"id": "0", "name": "", "type": "4", "e1": action_id, "e2": category_id, "char": "45", "power": "3", "vendor": "opaque"})
    ET.SubElement(item, "extension", {"mode": "preserve"})


def test_dynamic_inspection_is_typed_non_mutating_and_preserves_unknown_xml():
    doc = load_document()
    add_inspection_fixture(doc)
    before = ET.tostring(doc.root, encoding="unicode")

    links = doc.dynamic_structure.spz_link_records()
    content = doc.dynamic_structure.content_link_records()

    assert len(links) == 1
    assert (links[0].tag, links[0].e1, links[0].e2, links[0].e3) == ("AElement", 1, 1, 0)
    assert links[0].raw_attributes["vendor"] == "keep"
    assert len(content) == 1
    assert (content[0].char, content[0].power) == (45, 3)
    assert content[0].opaque_child_count == 1
    assert content[0].raw_attributes["vendor"] == "opaque"
    assert ET.tostring(doc.root, encoding="unicode") == before


def test_dynamic_inspection_json_includes_edit_policy_and_raw_attributes():
    doc = load_document()
    add_inspection_fixture(doc)
    report = doc.dynamic_structure.inspection()

    assert report["spz_links"][0]["raw_attributes"]["vendor"] == "keep"
    assert report["content_records"][0]["raw_attributes"]["vendor"] == "opaque"
    assert "add/edit/delete enabled" in report["editing_policy"]["ConceptModel/content"]
    assert report["validation_issues"] == []
    json.dumps(report, ensure_ascii=False)


def test_validation_rejects_non_integer_spz_endpoint_field():
    doc = load_document()
    links = doc.root.find("models/ConceptModel/spz/links")
    ET.SubElement(links, "link", {"e1": "not-an-id"})

    issues = doc.validate()
    assert any("spz/links[0]@e1 must be an integer" in issue for issue in issues)


def test_validation_checks_content_char_and_int32_bounds():
    doc = load_document()
    content = doc.root.find("models/ConceptModel/content")
    ET.SubElement(content, "link", {"e1": "1", "e2": "2", "char": "128", "power": str(2**31)})

    issues = doc.validate()
    assert any("@char is outside signed 8-bit range" in issue for issue in issues)
    assert any("@power is outside signed 32-bit range" in issue for issue in issues)


def test_validation_checks_content_even_without_spz_branch():
    doc = load_document()
    concept = doc.root.find("models/ConceptModel")
    spz = concept.find("spz")
    concept.remove(spz)
    content = concept.find("content")
    ET.SubElement(content, "link", {"e1": "bad"})

    issues = doc.dynamic_structure.validate()
    assert any("ConceptModel/content[0]@e1 must be an integer" in issue for issue in issues)


def test_roundtrip_preserves_inspected_dynamic_records(tmp_path):
    doc = load_document()
    add_inspection_fixture(doc)
    output = tmp_path / "dynamic-inspection-roundtrip.is2"
    doc.save(output)
    reopened = ProjectDocument.load(output)

    assert reopened.dynamic_structure.spz_link_records()[0].raw_attributes["vendor"] == "keep"
    content_node = reopened.dynamic_structure.content_records[0]
    assert content_node.get("power") == "3"
    assert content_node.find("extension").get("mode") == "preserve"


def test_a_element_deletion_remains_blocked_with_inspected_link_records():
    doc = load_document()
    add_inspection_fixture(doc)
    with pytest.raises(ProjectFormatError, match="referenced by 1 spz/links"):
        doc.dynamic_structure.delete_element("1")


def test_cli_inspect_conceptmodel_returns_structural_inventory(tmp_path, capsys):
    from is2_re.cli import main
    doc = load_document()
    add_inspection_fixture(doc)
    source = tmp_path / "inspect-source.is2"
    doc.save(source)

    assert main(["inspect-conceptmodel", str(source)]) == 0
    output = json.loads(capsys.readouterr().out)
    assert len(output["spz_links"]) == 1
    assert len(output["content_records"]) == 1
    assert output["content_records"][0]["char"] == 45
