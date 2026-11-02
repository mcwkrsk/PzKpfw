from pathlib import Path
import sys
import xml.etree.ElementTree as ET

import pytest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))
from is2_re import ProjectDocument, ProjectFormatError

SAMPLES = ROOT / "samples"


def load_user_sample():
    return ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")


def test_all_samples_have_one_observed_spz_aelement_and_validate():
    for name in ("schaefer.is2", "untitled.is2", "kaka2.xml", "kursach.is2", "kursach_user_supplied_42_actions.is2"):
        doc = ProjectDocument.load(SAMPLES / name)
        records = doc.dynamic_structure.records()
        assert len(records) == 1
        assert records[0].id == "1"
        assert records[0].name == "PZ_1"
        assert records[0].symbol == 99
        assert doc.dynamic_structure.validate() == []


def test_read_and_validate_spz_are_non_mutating():
    doc = load_user_sample()
    spz = doc.root.find("models/ConceptModel/spz")
    before = ET.tostring(spz, encoding="unicode")
    assert len(doc.dynamic_structure.records()) == 1
    assert doc.dynamic_structure.validate() == []
    assert ET.tostring(spz, encoding="unicode") == before


def test_add_update_and_save_aelement_preserve_other_project_data(tmp_path):
    doc = load_user_sample()
    before_actions = ET.tostring(doc.root.find("models/primaryModel/spd"), encoding="unicode")
    ident = doc.dynamic_structure.add_element("PZ_2", type=2, status=1, formalization=0, level=2, number=2, symbol=321)
    assert ident == "2"
    assert doc.dynamic_structure.spz_node.get("last_id") == "2"
    doc.dynamic_structure.update_element(ident, name="Updated PZ", status=3, symbol=65535)
    assert doc.dynamic_structure.element(ident).get("name") == "Updated PZ"
    assert doc.dynamic_structure.validate() == []
    assert ET.tostring(doc.root.find("models/primaryModel/spd"), encoding="unicode") == before_actions
    target = tmp_path / "spz-added.is2"
    doc.save(target)
    reopened = ProjectDocument.load(target)
    rec = reopened.dynamic_structure.records()[1]
    assert (rec.id, rec.name, rec.type, rec.status, rec.level, rec.number, rec.symbol) == (
        "2", "Updated PZ", 2, 3, 2, 2, 65535
    )
    assert reopened.validate() == []


def test_add_spz_element_uses_observed_high_water_counter_without_reuse():
    doc = load_user_sample()
    first = doc.dynamic_structure.add_element("Second")
    assert first == "2"
    doc.dynamic_structure.delete_element(first)
    second = doc.dynamic_structure.add_element("Third")
    assert second == "3"
    assert doc.dynamic_structure.spz_node.get("last_id") == "3"


def test_spz_counter_underflow_refuses_id_reuse():
    doc = load_user_sample()
    doc.dynamic_structure.spz_node.set("last_id", "0")
    with pytest.raises(ProjectFormatError, match="below max current ID"):
        doc.dynamic_structure.add_element("Must not reuse")


def test_delete_is_blocked_when_spz_links_or_content_may_reference_element():
    doc = load_user_sample()
    ident = doc.dynamic_structure.records()[0].id
    ET.SubElement(doc.root.find("models/ConceptModel/spz/links"), "link", {"opaque": "1"})
    with pytest.raises(ProjectFormatError, match="spz/links contains opaque records"):
        doc.dynamic_structure.delete_element(ident)

    doc = load_user_sample()
    ident = doc.dynamic_structure.records()[0].id
    ET.SubElement(doc.root.find("models/ConceptModel/content"), "opaque", {"opaque": "1"})
    # Content endpoints belong to PrimaryModel actions and ConceptModel/cs
    # categories, not to spz AElements; unrelated opaque content does not block.
    doc.dynamic_structure.delete_element(ident)
    assert ident not in {n.get("id") for n in doc.dynamic_structure.elements}


def test_delete_is_blocked_when_aelement_has_opaque_children():
    doc = load_user_sample()
    ident = doc.dynamic_structure.records()[0].id
    ET.SubElement(doc.dynamic_structure.element(ident), "vendorExtension", {"value": "keep"})
    with pytest.raises(ProjectFormatError, match="opaque child records"):
        doc.dynamic_structure.delete_element(ident)


def test_unknown_attributes_and_children_survive_scalar_edits_and_roundtrip(tmp_path):
    doc = load_user_sample()
    node = doc.dynamic_structure.element("1")
    node.set("vendorAttr", "keep")
    ET.SubElement(node, "vendorNested", {"opaque": "yes"})
    doc.dynamic_structure.update_element("1", name="Changed")
    out = tmp_path / "spz-opaque-preserved.is2"
    doc.save(out)
    reopened = ProjectDocument.load(out)
    node2 = reopened.dynamic_structure.element("1")
    assert node2.get("vendorAttr") == "keep"
    assert node2.find("vendorNested").get("opaque") == "yes"
    assert node2.get("name") == "Changed"


def test_validation_rejects_duplicate_or_invalid_scalar_fields():
    doc = load_user_sample()
    spz = doc.dynamic_structure
    first = spz.elements[0]
    duplicate = ET.SubElement(spz._elements_container(), "AElement", dict(first.attrib))
    issues = doc.validate()
    assert any("duplicate spz AElement IDs" in issue for issue in issues)
    duplicate.set("id", "2")
    duplicate.set("symbol", "65536")
    assert any("outside uint16" in issue for issue in doc.validate())
    duplicate.set("symbol", "1")
    duplicate.set("number", "x")
    assert any("invalid integer attribute" in issue for issue in doc.validate())


def test_cli_add_and_set_spz_element_roundtrip(tmp_path):
    from is2_re.cli import main
    source = SAMPLES / "kursach_user_supplied_42_actions.is2"
    added = tmp_path / "spz-cli-added.is2"
    assert main(["add-spz-element", str(source), str(added), "--name", "PZ_CLI", "--type", "2", "--symbol", "123"]) == 0
    doc = ProjectDocument.load(added)
    assert doc.dynamic_structure.element("2").get("name") == "PZ_CLI"
    updated = tmp_path / "spz-cli-updated.is2"
    assert main(["set-spz-element", str(added), str(updated), "2", "--set", "name=CLI_Updated", "--set", "symbol=124"]) == 0
    reopened = ProjectDocument.load(updated)
    assert reopened.dynamic_structure.element("2").get("name") == "CLI_Updated"
    assert reopened.dynamic_structure.element("2").get("symbol") == "124"
