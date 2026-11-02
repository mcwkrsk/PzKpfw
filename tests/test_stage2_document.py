from pathlib import Path
import sys

import pytest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))
from is2_re import ProjectDocument, ProjectFormatError

SAMPLES = ROOT / "samples"


@pytest.mark.parametrize("name", [
    "schaefer.is2", "untitled.is2", "kaka2.xml", "kursach.is2",
    "kursach_user_supplied_42_actions.is2",
])
def test_all_golden_samples_validate_and_roundtrip(tmp_path, name):
    doc = ProjectDocument.load(SAMPLES / name)
    assert doc.validate() == []
    target = tmp_path / name
    assert doc.roundtrip_to(target) == []
    loaded = ProjectDocument.load(target)
    assert loaded.semantic_snapshot() == doc.semantic_snapshot()


def test_sibling_chain_uses_arrangement_not_numeric_sort():
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    assert doc.sibling_order("9") == ["27", "83", "28", "29", "30", "31"]
    assert doc.sibling_order("1") == ["2", "3", "73", "72"]


def test_add_action_appends_composition_and_arrangement_and_roundtrips(tmp_path):
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    new_id = doc.add_action("Новый дочерний шаг", action_type=0, parent_id="9", level=5, number=12)
    assert new_id == "85"
    assert doc.sibling_order("9") == ["27", "83", "28", "29", "30", "31", "85"]
    assert doc.actions_node.get("lastID") == "85"
    assert doc.validate() == []
    out = tmp_path / "added.is2"
    doc.save(out)
    loaded = ProjectDocument.load(out)
    assert loaded.sibling_order("9")[-1] == "85"
    assert loaded.action("85").get("name") == "Новый дочерний шаг"


def test_delete_middle_sibling_splices_arrangement_chain_without_reusing_id():
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    doc.delete_action("29")
    assert doc.sibling_order("9") == ["27", "83", "28", "30", "31"]
    assert doc.actions_node.get("lastID") == "84"
    assert doc.validate() == []


def test_delete_parent_requires_explicit_cascade():
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    with pytest.raises(ValueError, match="has children"):
        doc.delete_action("9")
    doc.delete_action("9", cascade=True)
    assert "9" not in {n.get("id") for n in doc.actions}
    assert doc.validate() == []


def test_parameter_and_object_counters_are_monotonic():
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    param_id = doc.add_parameter({"name": "Новый параметр", "group": 1, "codingType": 1, "number": 1})
    object_id = doc.add_object("Новый объект")
    assert param_id == "11"
    assert object_id == "3"
    assert doc.params_node.get("LastID") == "11"
    assert doc.objects_node.get("LastID") == "3"
    assert doc.validate() == []


def test_unknown_elements_attributes_and_module_params_survive_writer(tmp_path):
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    doc.root.set("vendorFlag", "keep-me")
    vendor = doc.root.find("models/primaryModel")
    import xml.etree.ElementTree as ET
    ET.SubElement(vendor, "vendorExtension", {"version": "7"})
    doc.root.find("ModuleParams/Module/param").set("custom", "opaque")
    before = doc.semantic_snapshot()
    out = tmp_path / "opaque.is2"
    doc.save(out)
    loaded = ProjectDocument.load(out)
    assert loaded.semantic_snapshot() == before
    assert loaded.root.get("vendorFlag") == "keep-me"
    assert loaded.root.find("models/primaryModel/vendorExtension").get("version") == "7"
    assert loaded.root.find("ModuleParams/Module/param").get("custom") == "opaque"


def test_invalid_arrangement_cycle_is_reported():
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    link = next(n for n in doc.links if n.get("type") == "3" and n.get("afe1") == "9" and n.get("afe2") == "31")
    link.set("afe3", "27")
    assert any("cycle" in issue for issue in doc.validate())


def test_counter_underflow_refuses_to_reuse_ids():
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    doc.actions_node.set("lastID", "4")
    with pytest.raises(ProjectFormatError, match="below max current ID"):
        doc.add_action("must fail", action_type=0)


def test_delete_action_is_blocked_when_concept_content_is_present():
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    import xml.etree.ElementTree as ET
    content = doc.root.find("models/ConceptModel/content")
    ET.SubElement(content, "opaqueContentRecord", {"af": "1", "ai": "1"})
    with pytest.raises(ValueError, match="cross-model content-link endpoints"):
        doc.delete_action("84")


@pytest.mark.parametrize(("action_id", "expected"), [
    ("73", ["2", "3", "72"]),
    ("72", ["2", "3", "73"]),
])
def test_delete_sibling_head_or_tail(action_id, expected):
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    doc.delete_action(action_id)
    assert doc.sibling_order("1") == expected
    assert doc.validate() == []


def test_delete_parameter_blocked_when_content_structure_is_populated():
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    import xml.etree.ElementTree as ET
    content = doc.root.find("models/ConceptModel/content")
    ET.SubElement(content, "opaqueContentRecord", {"af": "1", "ai": "1"})
    with pytest.raises(ValueError, match="cross-model content-link endpoints"):
        doc.delete_parameter("1")


def test_object_delete_requires_explicit_clear_for_native_parameter_references():
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    with pytest.raises(ValueError, match="referenced by parameter"):
        doc.delete_object("1")
    refs = doc.parameter_object_references("1")
    assert refs
    doc.delete_object("1", clear_parameter_references=True)
    assert "1" not in {n.get("id") for n in doc.objects_node}
    assert all(doc.parameter(parameter_id).get("o") is None for parameter_id, _ in refs)
    assert doc.validate() == []


def test_stage2_corpus_validator_reports_all_five_samples(tmp_path):
    import subprocess
    report_path = tmp_path / "stage2.json"
    completed = subprocess.run(
        [sys.executable, str(ROOT / "tools/validate_stage2.py"), "--samples", str(SAMPLES), "--out", str(report_path)],
        cwd=ROOT, capture_output=True, text=True, check=False,
    )
    assert completed.returncode == 0, completed.stderr + completed.stdout
    import json
    report = json.loads(report_path.read_text(encoding="utf-8"))
    assert report["sample_count"] == 5
    assert report["passed"] == 5
    assert report["failed"] == 0


def test_action_tree_projection_follows_observed_sibling_order():
    from is2_re.gui_models import action_tree_rows
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    rows = action_tree_rows(doc)
    child_ids = [row.action_id for row in rows if row.parent_id == "9"]
    assert child_ids == ["27", "83", "28", "29", "30", "31"]


def test_project_and_user_metadata_updates_preserve_unrelated_attributes():
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    doc.root.set("vendorProjectAttr", "keep")
    doc.user_node.set("vendorUserAttr", "keep-user")
    doc.update_project_metadata(name="Новый паспорт", info="Описание")
    doc.update_user_metadata(name="Пользователь 2", info="Примечание")
    assert doc.root.get("name") == "Новый паспорт"
    assert doc.root.get("info") == "Описание"
    assert doc.root.get("vendorProjectAttr") == "keep"
    assert doc.user_node.get("name") == "Пользователь 2"
    assert doc.user_node.get("info") == "Примечание"
    assert doc.user_node.get("vendorUserAttr") == "keep-user"


def test_project_metadata_rejects_empty_title_without_mutating():
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    before = dict(doc.root.attrib)
    with pytest.raises(ValueError, match="must not be empty"):
        doc.update_project_metadata(name=" ", info="will not apply")
    assert dict(doc.root.attrib) == before


def test_new_empty_project_uses_recovered_envelope_and_roundtrips(tmp_path):
    doc = ProjectDocument.new_empty("Пустой проект", info="Тест", user_name="Автор")
    assert doc.validate() == []
    assert not doc.actions
    assert doc.root.find("models/ConceptModel/cs/elemets") is not None
    assert doc.root.find("models/ConceptModel/spz/links") is not None
    assert doc.root.find("models/ConceptModel/content") is not None
    action_id = doc.add_action("Корневое действие", action_type=1)
    child_id = doc.add_action("Дочернее действие", action_type=0, parent_id=action_id)
    category_a = doc.concept_structure.add_category("Категория A", class_id=1)
    category_b = doc.concept_structure.add_category("Категория B", class_id=3)
    doc.concept_structure.add_link(2, e1=category_a, e2=category_b)
    param_id = doc.add_parameter({"name": "p", "group": 0, "codingType": 1, "number": 1, "sign": ""})
    object_id = doc.add_object("Объект")
    assert (action_id, child_id, param_id, object_id) == ("1", "2", "1", "1")
    assert doc.validate() == []
    target = tmp_path / "new-project.is2"
    snapshot = doc.semantic_snapshot()
    doc.save(target)
    reopened = ProjectDocument.load(target)
    assert reopened.semantic_snapshot() == snapshot
    assert reopened.validate() == []


def test_new_empty_project_rejects_blank_name():
    with pytest.raises(ValueError, match="project name"):
        ProjectDocument.new_empty(" ")


def test_primary_parameter_object_reference_assignment_clear_and_roundtrip(tmp_path):
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    parameter_id = "5"  # this sample has parameter IDs with and without @o
    object_id = "2"
    before = doc.semantic_snapshot()
    doc.set_parameter_object(parameter_id, object_id)
    assert doc.parameter(parameter_id).get("o") == object_id
    assert (parameter_id, object_id) in doc.parameter_object_references(object_id)
    assert doc.validate() == []
    output = tmp_path / "parameter-object.is2"
    doc.save(output)
    reopened = ProjectDocument.load(output)
    assert reopened.parameter(parameter_id).get("o") == object_id
    reopened.set_parameter_object(parameter_id, None)
    assert reopened.parameter(parameter_id).get("o") is None
    assert doc.semantic_snapshot() != before


def test_primary_parameter_object_assignment_refuses_missing_target_without_mutation():
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    parameter_id = "5"
    before = doc.semantic_snapshot()
    with pytest.raises(KeyError, match="object id"):
        doc.set_parameter_object(parameter_id, "99999")
    assert doc.semantic_snapshot() == before


def test_primary_model_validate_detects_dangling_param_object_reference():
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    doc.parameter("5").set("o", "99999")
    assert any("references missing object id 99999 via @o" in issue for issue in doc.validate())
