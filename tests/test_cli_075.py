import hashlib
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re import ProjectDocument
from is2_re.cli import main
from is2_re.view_state import sidecar_path


def _sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _make_project(path: Path) -> None:
    doc = ProjectDocument.new_empty("PzKpfw 0.7.5 CLI fixture")
    action = doc.add_action("Action", action_type=0)
    category_a = doc.concept_structure.add_category("Category A", class_id=2, group=10)
    category_b = doc.concept_structure.add_category("Category B", class_id=3, group=20)
    doc.concept_structure.add_link(2, e1=category_a, e2=category_b)
    doc.dynamic_structure.add_content_link(action, category_a, char=0, power=1)
    doc.save(path)


def test_layout_command_writes_sidecar_without_modifying_native_project(tmp_path, capsys):
    project = tmp_path / "project.is2"
    export = tmp_path / "layout.json"
    _make_project(project)
    before = _sha256(project)

    assert main(["layout", str(project), "--output", str(export)]) == 0

    stdout = json.loads(capsys.readouterr().out)
    exported = json.loads(export.read_text(encoding="utf-8"))
    sidecar = sidecar_path(project)
    saved = json.loads(sidecar.read_text(encoding="utf-8"))
    assert stdout["native_project_modified"] is False
    assert stdout["node_count"] == exported["node_count"] == len(saved["positions"])
    assert exported["positions"]
    assert _sha256(project) == before


def test_concept_report_command_exports_group_and_link_diagnostics(tmp_path, capsys):
    project = tmp_path / "project.is2"
    report_path = tmp_path / "reports" / "concept.json"
    _make_project(project)

    assert main(["concept-report", str(project), "--output", str(report_path)]) == 0

    stdout = json.loads(capsys.readouterr().out)
    report = json.loads(report_path.read_text(encoding="utf-8"))
    assert stdout["category_count"] == 2
    assert stdout["group_count"] == 2
    assert report["link_count"] >= 1
    assert report["link_type_counts"]
    assert report["duplicate_numbers"] == []


def test_set_parameter_object_cli_assigns_and_clears_native_reference(tmp_path, capsys):
    project = tmp_path / "input.is2"
    assigned = tmp_path / "assigned.is2"
    cleared = tmp_path / "cleared.is2"
    doc = ProjectDocument.new_empty("PrimaryModel CLI")
    parameter_id = doc.add_parameter({"name": "P", "codingType": "0"})
    object_id = doc.add_object("O")
    doc.save(project)

    assert main(["set-parameter-object", str(project), str(assigned), parameter_id,
                 "--object-id", object_id]) == 0
    result = json.loads(capsys.readouterr().out)
    assert result["operation"] == "assigned"
    reloaded = ProjectDocument.load(assigned)
    assert reloaded.parameter(parameter_id).get("o") == object_id

    assert main(["set-parameter-object", str(assigned), str(cleared), parameter_id, "--clear"]) == 0
    json.loads(capsys.readouterr().out)
    assert ProjectDocument.load(cleared).parameter(parameter_id).get("o") is None


def test_delete_object_cli_requires_and_applies_explicit_reference_clear(tmp_path, capsys):
    project = tmp_path / "input.is2"
    output = tmp_path / "output.is2"
    doc = ProjectDocument.new_empty("PrimaryModel delete CLI")
    parameter_id = doc.add_parameter({"name": "P", "codingType": "0"})
    object_id = doc.add_object("O")
    doc.set_parameter_object(parameter_id, object_id)
    doc.save(project)

    assert main(["delete-object", str(project), str(output), object_id]) == 2
    capsys.readouterr()
    assert not output.exists()

    assert main(["delete-object", str(project), str(output), object_id,
                 "--clear-parameter-references"]) == 0
    result = json.loads(capsys.readouterr().out)
    assert result["cleared_parameter_references"] is True
    reloaded = ProjectDocument.load(output)
    assert reloaded.parameter_object_references(object_id) == []
    assert all(node.get("id") != object_id for node in reloaded.objects_node.findall("object"))
