from __future__ import annotations

from pathlib import Path
import json
import sys
import xml.etree.ElementTree as ET

import pytest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re import ProjectDocument
from is2_re.cli import main
from is2_re.repair import (
    RepairError,
    apply_link_repairs,
    link_integrity_report,
    parse_repair_assignment,
    parse_repair_selector,
)


def make_broken_project() -> ProjectDocument:
    doc = ProjectDocument.new_empty("Repair fixture")
    action_a = doc.add_action("Action A", action_type=0)
    action_b = doc.add_action("Action B", action_type=0)
    cat_a = doc.concept_structure.add_category("Category A", class_id=1)
    cat_b = doc.concept_structure.add_category("Category B", class_id=2)
    cat_c = doc.concept_structure.add_category("Category C", class_id=3)
    spz_a = doc.dynamic_structure.add_element("SPZ A")
    spz_b = doc.dynamic_structure.add_element("SPZ B")
    parameter_id = doc.add_parameter({"name": "Parameter"})
    object_id = doc.add_object("Object")
    doc.set_parameter_object(parameter_id, object_id)

    sc_id = doc.concept_structure.add_link(3, e1=cat_a, e2=cat_b, e3=cat_c)
    sc_node = doc.concept_structure.link(sc_id)
    sc_node.set("e2", "990")
    sc_node.set("vendor", "keep-sc")

    spz_index = doc.dynamic_structure.add_spz_link(e1=spz_a, e2=spz_b, e3="0", name="SPZ link")
    spz_node = doc.dynamic_structure.links[spz_index]
    spz_node.set("e2", "991")
    spz_node.set("vendor", "keep-spz")
    ET.SubElement(spz_node, "vendorChild", {"k": "v"})

    content_index = doc.dynamic_structure.add_content_link(action_a, cat_a, char=1, power=2)
    content_node = doc.dynamic_structure.content_records[content_index]
    content_node.set("e2", "992")
    content_node.set("vendor", "keep-content")

    doc.parameter(parameter_id).set("o", "993")
    return doc


def test_link_integrity_report_lists_typed_issues_and_clear_policy():
    doc = make_broken_project()
    report = link_integrity_report(doc)
    issues = {item["selector"]: item for item in report["issues"]}
    assert set(issues) == {
        "scbinarylink:0:e2",
        "aie_binary_link:0:e2",
        "ae_content_link:0:e2",
        "parameter_object:0:object",
    }
    assert issues["scbinarylink:0:e2"]["expected_domain"] == "category"
    assert issues["aie_binary_link:0:e2"]["expected_domain"] == "spz_element"
    assert issues["ae_content_link:0:e2"]["expected_domain"] == "category"
    assert issues["parameter_object:0:object"]["expected_domain"] == "object"
    assert issues["scbinarylink:0:e2"]["can_clear"] is False
    assert issues["aie_binary_link:0:e2"]["can_clear"] is True
    assert issues["ae_content_link:0:e2"]["can_clear"] is False
    assert issues["parameter_object:0:object"]["can_clear"] is True
    assert report["summary"]["dangling_count"] == 4


def test_explicit_remap_repairs_all_typed_domains_without_mutating_source():
    doc = make_broken_project()
    before = doc.semantic_snapshot()
    repaired, report = apply_link_repairs(doc, {
        "scbinarylink:0:e2": "3",
        "aie_binary_link:0:e2": "2",
        "ae_content_link:0:e2": "1",
        "parameter_object:0:object": "1",
    })
    assert doc.semantic_snapshot() == before, "repair must work on a clone"
    assert repaired.validate(deep=True) == []
    assert link_integrity_report(repaired)["summary"]["dangling_count"] == 0
    assert report["summary"]["applied_count"] == 4
    assert report["summary"]["safe_to_save"] is True
    assert repaired.concept_structure.links[0].get("e2") == "3"
    assert repaired.dynamic_structure.links[0].get("e2") == "2"
    assert repaired.dynamic_structure.content_records[0].get("e2") == "1"
    assert repaired.params_node.findall("param")[0].get("o") == "1"
    assert repaired.concept_structure.links[0].get("vendor") == "keep-sc"
    assert repaired.dynamic_structure.links[0].get("vendor") == "keep-spz"
    assert repaired.dynamic_structure.links[0].find("vendorChild").get("k") == "v"
    assert repaired.dynamic_structure.content_records[0].get("vendor") == "keep-content"


def test_only_native_optional_endpoints_can_be_cleared():
    doc = ProjectDocument.new_empty("Clear repair")
    cat_a = doc.concept_structure.add_category("A", class_id=1)
    cat_b = doc.concept_structure.add_category("B", class_id=2)
    cat_c = doc.concept_structure.add_category("C", class_id=3)
    spz_a = doc.dynamic_structure.add_element("SPZ A")
    spz_b = doc.dynamic_structure.add_element("SPZ B")
    link_id = doc.concept_structure.add_link(3, e1=cat_a, e2=cat_b, e3=cat_c)
    doc.concept_structure.link(link_id).set("e3", "998")
    spz_index = doc.dynamic_structure.add_spz_link(e1=spz_a, e2=spz_b, e3="0")
    doc.dynamic_structure.links[spz_index].set("e3", "997")

    repaired, report = apply_link_repairs(doc, clears=["scbinarylink:0:e3", "aie_binary_link:0:e3"])
    assert repaired.concept_structure.links[0].get("e3") == "0"
    assert repaired.dynamic_structure.links[0].get("e3") == "0"
    assert report["summary"]["applied_count"] == 2
    assert report["summary"]["remaining_dangling_count"] == 0
    assert repaired.validate(deep=True) == []


def test_optional_primarymodel_object_reference_can_be_cleared():
    doc = make_broken_project()
    parameter = doc.params_node.findall("param")[0]
    parameter.set("o", "993")
    # Resolve the fixture's other deliberately broken endpoints so this test
    # isolates optional PrimaryModel/@o clearing.
    doc.concept_structure.links[0].set("e2", "2")
    doc.dynamic_structure.links[0].set("e2", "2")
    doc.dynamic_structure.content_records[0].set("e2", "1")
    repaired, report = apply_link_repairs(doc, clears=["parameter_object:0:object"])
    assert "o" not in repaired.params_node.findall("param")[0].attrib
    assert doc.params_node.findall("param")[0].get("o") == "993"
    assert repaired.validate(deep=True) == []
    assert report["summary"]["applied_count"] == 1
    assert report["summary"]["remaining_dangling_count"] == 0


def test_repair_refuses_wrong_domain_missing_or_duplicate_targets_without_mutation():
    doc = make_broken_project()
    before = doc.semantic_snapshot()
    # ID 3 exists in the category domain but not in the spz_element domain.
    with pytest.raises(RepairError, match="expected domain"):
        apply_link_repairs(doc, {"aie_binary_link:0:e2": "3"})
    with pytest.raises(RepairError, match="does not exist"):
        apply_link_repairs(doc, {"aie_binary_link:0:e2": "9999"})
    duplicate = doc.clone()
    ET.SubElement(duplicate.concept_structure.elements_node, "pk", {"id": "3", "name": "Duplicate", "class": "1", "group": "0", "number": "0"})
    with pytest.raises(RepairError, match="duplicated"):
        apply_link_repairs(duplicate, {"scbinarylink:0:e2": "3"})
    assert doc.semantic_snapshot() == before


def test_repair_rejects_null_target_even_through_direct_api():
    doc = make_broken_project()
    for target in ("0", "", "   "):
        with pytest.raises(RepairError, match="nonzero existing ID"):
            apply_link_repairs(doc, {"aie_binary_link:0:e2": target})


def test_repair_rejects_required_endpoint_clear_and_non_dangling_selector():
    doc = make_broken_project()
    with pytest.raises(RepairError, match="cannot clear safely"):
        apply_link_repairs(doc, clears=["ae_content_link:0:e2"])
    with pytest.raises(RepairError, match="not currently reported"):
        apply_link_repairs(doc, {"aie_binary_link:0:e1": "1"})


def test_repair_selector_and_assignment_parsing():
    assert parse_repair_selector("aie_binary_link:4:e2") == ("aie_binary_link", 4, "e2")
    assert parse_repair_assignment("parameter_object:0:object=17") == ("parameter_object:0:object", "17")
    for value in ("bad", "scbinarylink:-1:e1", "ae_content_link:0:e3"):
        try:
            parse_repair_selector(value)
        except RepairError:
            pass
        else:
            raise AssertionError(value)


def test_link_integrity_cli_reports_json_and_exit_status(tmp_path, capsys):
    project = tmp_path / "broken.is2"
    make_broken_project().save(project)
    # This file is intentionally malformed at the endpoint level; the XML envelope remains parseable.
    doc = ProjectDocument.load(project)
    doc.dynamic_structure.links[0].set("e2", "991")
    doc.save(project)
    code = main(["link-integrity", str(project)])
    output = json.loads(capsys.readouterr().out)
    assert code == 2
    assert output["summary"]["dangling_count"] == 4


def test_repair_links_cli_preview_then_apply_to_separate_copy(tmp_path, capsys):
    source = tmp_path / "broken.is2"
    output = tmp_path / "repaired.is2"
    doc = make_broken_project()
    doc.save(source)
    before = source.read_bytes()
    specs = [
        "scbinarylink:0:e2=3",
        "aie_binary_link:0:e2=2",
        "ae_content_link:0:e2=1",
        "parameter_object:0:object=1",
    ]
    assert main(["repair-links", str(source), *sum((["--set", item] for item in specs), [])]) == 0
    preview = json.loads(capsys.readouterr().out)
    assert preview["mode"] == "preview"
    assert preview["summary"]["safe_to_save"] is True
    assert not output.exists()
    assert source.read_bytes() == before

    argv = ["repair-links", str(source)]
    for item in specs:
        argv += ["--set", item]
    argv += ["--apply", "--output", str(output)]
    assert main(argv) == 0
    applied = json.loads(capsys.readouterr().out)
    assert applied["written_to"] == str(output)
    assert ProjectDocument.load(output).validate(deep=True) == []
    assert source.read_bytes() == before


def test_repair_cli_refuses_overwrite_input_or_existing_destination(tmp_path, capsys):
    source = tmp_path / "broken.is2"
    make_broken_project().save(source)
    result = main(["repair-links", str(source), "--apply", "--output", str(source), "--set", "scbinarylink:0:e2=3"])
    assert result == 2
    assert "never overwritten" in capsys.readouterr().err

    existing = tmp_path / "existing.is2"
    existing.write_text("keep", encoding="utf-8")
    result = main(["repair-links", str(source), "--apply", "--output", str(existing), "--set", "scbinarylink:0:e2=3"])
    assert result == 2
    assert existing.read_text(encoding="utf-8") == "keep"
    assert "destination already exists" in capsys.readouterr().err

def test_repair_cli_validates_report_destination_before_writing_project(tmp_path, capsys):
    source = tmp_path / "broken.is2"
    output = tmp_path / "repaired.is2"
    make_broken_project().save(source)
    before = source.read_bytes()
    result = main([
        "repair-links", str(source), "--set", "scbinarylink:0:e2=3",
        "--apply", "--output", str(output), "--report", str(source),
    ])
    assert result == 2
    assert "--report path" in capsys.readouterr().err
    assert source.read_bytes() == before
    assert not output.exists()

