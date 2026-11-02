from pathlib import Path
import json
import sys
import xml.etree.ElementTree as ET

import pytest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))
from is2_re import ProjectDocument
from is2_re.model import ProjectFormatError

SAMPLE = ROOT / "samples" / "kursach_user_supplied_42_actions.is2"


def doc_with_records():
    doc = ProjectDocument.load(SAMPLE)
    # This is a non-empty synthetic fixture: the supplied golden corpus has
    # no dynamic links/content records.
    doc.dynamic_structure.add_element("PZ_2")
    action_id = doc.add_action("Content target action", action_type=0)
    doc.concept_structure.add_category("Content target", class_id=1)
    links = doc.root.find("models/ConceptModel/spz/links")
    link = ET.SubElement(links, "AElement", {
        "id": "0", "name": "link", "type": "3", "e1": "1", "e2": "2", "e3": "0",
        "vendor": "keep-me",
    })
    ET.SubElement(link, "vendorExtension", {"k": "v"})
    content = doc.root.find("models/ConceptModel/content")
    record = ET.SubElement(content, "AElement", {
        "id": "0", "name": "", "type": "4", "e1": action_id, "e2": "1", "char": "45", "power": "3",
        "vendor": "preserve-content",
    })
    ET.SubElement(record, "opaque", {"token": "x"})
    return doc


def test_spz_link_endpoint_update_preserves_opaque_fields_and_nested_xml(tmp_path):
    doc = doc_with_records()
    doc.dynamic_structure.update_spz_link(0, e1=2, e3=1, name="renamed", type=4, symbol=255)
    node = doc.dynamic_structure.links[0]
    assert node.attrib == {
        "id": "0", "name": "renamed", "type": "4", "symbol": "255", "e1": "2", "e2": "2", "e3": "1", "vendor": "keep-me"
    }
    assert node.find("vendorExtension").get("k") == "v"
    out = tmp_path / "endpoint-edit.is2"
    doc.save(out)
    reopened = ProjectDocument.load(out)
    check = reopened.dynamic_structure.links[0]
    assert (check.get("e1"), check.get("e2"), check.get("e3")) == ("2", "2", "1")
    assert check.get("type") == "4" and check.get("name") == "renamed" and check.get("symbol") == "255" and check.get("vendor") == "keep-me"
    assert check.find("vendorExtension").get("k") == "v"


def test_spz_link_rejects_unknown_or_invalid_endpoint_without_partial_mutation():
    doc = doc_with_records()
    node = doc.dynamic_structure.links[0]
    before = dict(node.attrib)
    with pytest.raises(ValueError, match="references unknown ID 999"):
        doc.dynamic_structure.update_spz_link(0, e1=2, e2=999)
    assert node.attrib == before
    with pytest.raises(ValueError, match="signed 32-bit"):
        doc.dynamic_structure.update_spz_link(0, e1=2**31)
    assert node.attrib == before
    with pytest.raises(ValueError, match="unsupported spz link fields"):
        doc.dynamic_structure.update_spz_link(0, vendorField=4)
    assert node.attrib == before


def test_spz_link_null_and_index_handling():
    doc = doc_with_records()
    doc.dynamic_structure.update_spz_link(0, e3=None)
    assert doc.dynamic_structure.links[0].get("e3") == "0"
    with pytest.raises(IndexError):
        doc.dynamic_structure.update_spz_link(10, e1=1)


def test_content_update_only_changes_char_power_and_preserves_endpoints():
    doc = doc_with_records()
    node = doc.dynamic_structure.content_records[0]
    doc.dynamic_structure.update_content_record(0, char=-128, power=2**31 - 1)
    assert node.get("e1") == next(n.get("id") for n in doc.actions if n.get("name") == "Content target action") and node.get("e2") == "1"
    assert node.get("char") == "-128" and node.get("power") == str(2**31 - 1)
    assert node.get("vendor") == "preserve-content"
    assert node.find("opaque").get("token") == "x"


def test_content_update_enforces_signed_field_ranges_without_partial_mutation():
    doc = doc_with_records()
    node = doc.dynamic_structure.content_records[0]
    before = dict(node.attrib)
    with pytest.raises(ValueError, match="signed 8-bit"):
        doc.dynamic_structure.update_content_record(0, char=128, power=9)
    assert node.attrib == before
    with pytest.raises(ValueError, match="signed 32-bit"):
        doc.dynamic_structure.update_content_record(0, power=2**31)
    assert node.attrib == before
    with pytest.raises(IndexError):
        doc.dynamic_structure.update_content_record(3, power=1)


def test_content_record_save_reopen_and_report(tmp_path):
    doc = doc_with_records()
    doc.dynamic_structure.update_content_record(0, char=67)
    out = tmp_path / "content-edit.is2"
    doc.save(out)
    reopened = ProjectDocument.load(out)
    rec = reopened.dynamic_structure.content_records[0]
    assert (rec.get("e1"), rec.get("e2"), rec.get("char"), rec.get("power")) == (next(n.get("id") for n in reopened.actions if n.get("name") == "Content target action"), "1", "67", "3")
    assert rec.find("opaque").get("token") == "x"
    policy = reopened.dynamic_structure.inspection()["editing_policy"]
    assert "editable" in policy["spz/links"]
    assert "add/edit/delete enabled" in policy["ConceptModel/content"]


def test_cli_set_spz_link_and_content_record(tmp_path, capsys):
    from is2_re.cli import main
    source = tmp_path / "cli-source.is2"
    spz_out = tmp_path / "cli-spz.is2"
    content_out = tmp_path / "cli-content.is2"
    doc = doc_with_records()
    doc.save(source)

    assert main(["set-spz-link", str(source), str(spz_out), "0", "--set", "e1=2", "--set", "e3=0", "--set", "name=cli-name", "--set", "symbol=7"]) == 0
    first = json.loads(capsys.readouterr().out)
    assert first["validation"] == "PASS"
    loaded_spz = ProjectDocument.load(spz_out).dynamic_structure.links[0]
    assert loaded_spz.get("e1") == "2"
    assert loaded_spz.get("name") == "cli-name" and loaded_spz.get("symbol") == "7"

    assert main(["set-content-record", str(spz_out), str(content_out), "0", "--set", "char=12", "--set", "power=99"]) == 0
    second = json.loads(capsys.readouterr().out)
    assert second["validation"] == "PASS"
    check = ProjectDocument.load(content_out).dynamic_structure.content_records[0]
    assert (check.get("char"), check.get("power")) == ("12", "99")


def test_cli_rejects_unknown_content_endpoint_edits(tmp_path, capsys):
    from is2_re.cli import main
    source = tmp_path / "cli-source.is2"
    output = tmp_path / "cli-out.is2"
    doc_with_records().save(source)
    assert main(["set-content-record", str(source), str(output), "0", "--set", "e1=99999"]) == 2
    assert "references unknown ID" in capsys.readouterr().err


def test_spz_link_does_not_accept_id_from_an_opaque_nested_extension():
    doc = doc_with_records()
    nested = ET.SubElement(doc.dynamic_structure.element("1"), "extension", {"id": "999"})
    assert nested.get("id") == "999"
    with pytest.raises(ValueError, match="references unknown ID 999"):
        doc.dynamic_structure.update_spz_link(0, e1=999)


def test_edited_dynamic_records_pass_writer_semantic_audit_without_private_markup():
    from is2_re import audit_document
    doc = doc_with_records()
    doc.dynamic_structure.update_spz_link(0, e1=2)
    doc.dynamic_structure.update_content_record(0, char=12, power=456)
    report = audit_document(doc)
    assert report["native_envelope"] == "PASS"
    assert report["structural_validation"] == "PASS"
    assert report["writer_semantic_roundtrip"] == "PASS"
    assert report["pzkpfw_private_markup_added"] is False
    assert report["original_is2_runtime_acceptance"] == "NOT_TESTED"


def test_add_delete_spz_link_and_content_link_are_writer_shaped_and_referentially_safe(tmp_path):
    doc = doc_with_records()
    structure = doc.dynamic_structure
    # Existing fixture row has endpoints 1,2,0. New row gets the next shared spz ID.
    before_last_id = structure.spz_node.get("last_id")
    new_spz_index = structure.add_spz_link(e1=1, e2=2, e3=0, name="new relation")
    new_spz = structure.links[new_spz_index]
    assert new_spz.tag == "AElement"
    assert new_spz.get("id") == "0"
    assert structure.spz_node.get("last_id") == before_last_id
    assert (new_spz.get("e1"), new_spz.get("e2"), new_spz.get("e3")) == ("1", "2", "0")
    structure.delete_spz_link(len(structure.links) - 1)
    assert len(structure.links) == 1

    index = structure.add_content_link(1, 1, char=46, power=1)
    created = structure.content_records[index]
    assert created.tag == "AElement"
    assert created.attrib == {"id": "0", "name": "", "e1": "1", "e2": "1", "type": "4", "char": "46", "power": "1"}
    structure.update_content_record(index, e1=2, e2=1, char=43)
    assert (created.get("e1"), created.get("e2"), created.get("char")) == ("2", "1", "43")
    structure.delete_content_link(index)
    assert len(structure.content_records) == 1
    assert doc.validate() == []


def test_content_duplicate_native_power_increment_semantics():
    doc = doc_with_records()
    structure = doc.dynamic_structure
    action_id = next(n.get("id") for n in doc.actions if n.get("name") == "Content target action")
    index = structure.add_content_link(action_id, 1, char=45, power=99, duplicate="increment_power")
    assert index == 0
    assert structure.content_records[0].get("power") == "4"
    before = structure.content_records[0].get("power")
    assert structure.add_content_link(action_id, 1, char=45) == 0
    assert structure.content_records[0].get("power") == before
    with pytest.raises(ValueError, match="already exists"):
        structure.add_content_link(action_id, 1, char=45, duplicate="reject")


def test_content_endpoints_are_checked_against_distinct_domains():
    doc = doc_with_records()
    action_id = next(n.get("id") for n in doc.actions if n.get("name") == "Content target action")
    with pytest.raises(ValueError, match="AIElement category"):
        doc.dynamic_structure.add_content_link(action_id, 999, char=45)
    with pytest.raises(ValueError, match="AFElement action"):
        doc.dynamic_structure.add_content_link(99999, 1, char=45)


def test_cascading_action_and_category_deletion_removes_only_attached_content_links():
    doc = doc_with_records()
    structure = doc.dynamic_structure
    action_id = next(n.get("id") for n in doc.actions if n.get("name") == "Content target action")
    structure.add_content_link(action_id, 1, char=43)
    assert len(structure.content_records) == 2
    with pytest.raises(ValueError, match="cascade_content"):
        doc.delete_action(action_id)
    doc.delete_action(action_id, cascade_content=True)
    assert len(structure.content_records) == 0
    assert action_id not in {n.get("id") for n in doc.actions}


def test_cli_add_and_delete_dynamic_link_records(tmp_path, capsys):
    from is2_re.cli import main
    doc = doc_with_records()
    source = tmp_path / "cli-dynamic-source.is2"
    first = tmp_path / "cli-spz-added.is2"
    second = tmp_path / "cli-content-added.is2"
    third = tmp_path / "cli-dynamic-deleted.is2"
    doc.save(source)
    assert main(["add-spz-link", str(source), str(first), "--e1", "1", "--e2", "2"]) == 0
    added = json.loads(capsys.readouterr().out)
    assert added["validation"] == "PASS"
    loaded = ProjectDocument.load(first)
    assert loaded.dynamic_structure.links[-1].tag == "AElement"
    action_id = next(n.get("id") for n in loaded.actions if n.get("name") == "Content target action")
    assert main(["add-content-link", str(first), str(second), "--e1", action_id, "--e2", "1"]) == 0
    result = json.loads(capsys.readouterr().out)
    assert result["validation"] == "PASS"
    assert ProjectDocument.load(second).dynamic_structure.content_records[-1].get("type") == "4"
    assert main(["delete-content-link", str(second), str(third), "1"]) == 0
    result = json.loads(capsys.readouterr().out)
    assert result["validation"] == "PASS"
    assert len(ProjectDocument.load(third).dynamic_structure.content_records) == 1


def test_category_content_cascade_removes_only_referencing_content_records():
    doc = doc_with_records()
    category_id = doc.concept_structure.categories[0].get("id")
    with pytest.raises(ValueError, match="cascade_content_links"):
        doc.concept_structure.delete_category(category_id)
    doc.concept_structure.delete_category(category_id, cascade_content_links=True)
    assert len(doc.dynamic_structure.content_records) == 0


def test_action_subtree_cascade_preflights_all_content_links_atomically():
    doc = ProjectDocument.load(SAMPLE)
    root_id = doc.add_action("Cascade root", action_type=0)
    child_id = doc.add_action("Cascade child", action_type=0, parent_id=root_id)
    leaf_id = doc.add_action("Cascade leaf", action_type=0, parent_id=child_id)
    category_id = doc.concept_structure.add_category("Cascade category", class_id=1)
    doc.dynamic_structure.add_content_link(leaf_id, category_id, char=0, power=1)
    before = doc.semantic_snapshot()

    with pytest.raises(ValueError, match="cascade_content=True"):
        doc.delete_action(root_id, cascade=True)
    assert doc.semantic_snapshot() == before, "a rejected subtree cascade must not partially mutate the XML"

    doc.delete_action(root_id, cascade=True, cascade_content=True)
    remaining = {node.get("id") for node in doc.actions}
    assert root_id not in remaining and child_id not in remaining and leaf_id not in remaining
    assert not doc.dynamic_structure.content_records
    assert doc.validate() == []


def test_native_content_link_constructor_defaults_are_not_plugin_marker_defaults():
    doc = doc_with_records()
    action_id = next(n.get("id") for n in doc.actions if n.get("name") == "Content target action")
    index = doc.dynamic_structure.add_content_link(action_id, 1)
    row = doc.dynamic_structure.content_records[index]
    assert row.attrib == {
        "id": "0", "name": "", "e1": action_id, "e2": "1",
        "type": "4", "char": "0", "power": "1",
    }


def test_category_cascade_refusal_is_atomic_when_both_link_kinds_exist():
    doc = doc_with_records()
    category_id = doc.concept_structure.categories[0].get("id")
    other_id = doc.concept_structure.add_category("Other category", class_id=2)
    doc.concept_structure.add_link(2, e1=category_id, e2=other_id)
    before = doc.semantic_snapshot()
    with pytest.raises(ValueError, match="cascade_links=True"):
        doc.concept_structure.delete_category(category_id, cascade_content_links=True)
    assert doc.semantic_snapshot() == before

    doc.concept_structure.delete_category(
        category_id, cascade_links=True, cascade_content_links=True
    )
    assert category_id not in {n.get("id") for n in doc.concept_structure.categories}
    assert not doc.dynamic_structure.content_records
    assert not any(category_id in {n.get("e1"), n.get("e2"), n.get("e3")} for n in doc.concept_structure.links)
    assert doc.validate() == []


def test_unknown_dynamic_records_cannot_be_updated_or_deleted():
    doc = ProjectDocument.load(SAMPLE)
    spz_links = doc.root.find("models/ConceptModel/spz/links")
    ET.SubElement(spz_links, "vendorBinaryLink", {"e1": "1", "e2": "0", "e3": "0", "secret": "keep"})
    content = doc.root.find("models/ConceptModel/content")
    ET.SubElement(content, "vendorContent", {"e1": "1", "e2": "1", "char": "0", "power": "1"})
    before = doc.semantic_snapshot()
    with pytest.raises(ProjectFormatError, match="opaque"):
        doc.dynamic_structure.update_spz_link(0, e1=1)
    with pytest.raises(ProjectFormatError, match="opaque"):
        doc.dynamic_structure.delete_spz_link(0)
    with pytest.raises(ProjectFormatError, match="opaque"):
        doc.dynamic_structure.update_content_record(0, char=1)
    with pytest.raises(ProjectFormatError, match="opaque"):
        doc.dynamic_structure.delete_content_link(0)
    assert doc.semantic_snapshot() == before


def test_spz_link_scalar_fields_enforce_integer_widths_atomically():
    doc = doc_with_records()
    link = doc.dynamic_structure.links[0]
    before = dict(link.attrib)
    with pytest.raises(ValueError, match="uint16"):
        doc.dynamic_structure.update_spz_link(0, name="changed", symbol=65536)
    assert link.attrib == before
    with pytest.raises(ValueError, match="signed 32-bit"):
        doc.dynamic_structure.update_spz_link(0, status=2**31)
    assert link.attrib == before
    doc.dynamic_structure.update_spz_link(0, name="updated", status=-1, formalization=2, level=3, number=4)
    assert (link.get("name"), link.get("status"), link.get("formalization"), link.get("level"), link.get("number")) == ("updated", "-1", "2", "3", "4")


def test_cli_delete_spz_link_writes_a_valid_project(tmp_path, capsys):
    from is2_re.cli import main
    doc = doc_with_records()
    source = tmp_path / "delete-spz-source.is2"
    output = tmp_path / "delete-spz-output.is2"
    doc.save(source)
    assert main(["delete-spz-link", str(source), str(output), "0"]) == 0
    result = json.loads(capsys.readouterr().out)
    assert result["validation"] == "PASS"
    reopened = ProjectDocument.load(output)
    assert not reopened.dynamic_structure.links
    assert reopened.validate() == []
