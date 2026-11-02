from pathlib import Path
import json
import sys
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))
from is2_re import ProjectDocument
from is2_re.cli import main

FIXTURE = ROOT / "tests" / "fixtures" / "minimal.is2"


def _write_versions(tmp_path):
    reference = ProjectDocument.load(FIXTURE)
    current = reference.clone()
    current.update_project_metadata(name="Current")
    current.action("2").set("name", "Changed leaf")
    extensions = ET.SubElement(reference.root, "extensions")
    ET.SubElement(extensions, "entry", {"id": "legacy", "name": "old"})
    ref = tmp_path / "reference.is2"
    cur = tmp_path / "current.is2"
    reference.save(ref)
    current.save(cur)
    return ref, cur


def test_cli_diff_writes_report_and_selective_restore_writes_separate_project(tmp_path, capsys):
    reference, current = _write_versions(tmp_path)
    report_path = tmp_path / "diff.json"
    assert main(["diff", str(reference), str(current), "--output", str(report_path)]) == 0
    result = json.loads(capsys.readouterr().out)
    report = json.loads(report_path.read_text(encoding="utf-8"))
    assert result["summary"]["total"] == report["summary"]["total"]
    root_name = next(item for item in report["operations"]
                     if item["kind"] == "modified_attribute" and item["path"] == [] and item["attribute"] == "name")

    output = tmp_path / "restored.is2"
    restore_report = tmp_path / "restore.json"
    assert main([
        "restore-diff", str(reference), str(current), str(output),
        "--select", root_name["operation_id"], "--report", str(restore_report),
    ]) == 0
    restore_result = json.loads(capsys.readouterr().out)
    assert restore_result["validation"] == "PASS_NO_NEW_ISSUES_EXISTING_ISSUES_REMAIN"
    assert restore_result["remaining_validation_issues"] == 3
    assert ProjectDocument.load(output).root.get("name") == "fixture"
    assert ProjectDocument.load(current).root.get("name") == "Current"
    assert json.loads(restore_report.read_text(encoding="utf-8"))["restored_count"] == 1


def test_cli_diff_never_overwrites_input_projects(tmp_path, capsys):
    reference, current = _write_versions(tmp_path)
    before = current.read_bytes()
    assert main(["diff", str(reference), str(current), "--output", str(current)]) == 2
    capsys.readouterr()
    assert current.read_bytes() == before


def test_cli_restore_requires_separate_nonexisting_output_or_overwrite(tmp_path, capsys):
    reference, current = _write_versions(tmp_path)
    target = tmp_path / "target.is2"
    target.write_text("not project", encoding="utf-8")
    assert main(["restore-diff", str(reference), str(current), str(target), "--select", "D000001"]) == 2
    capsys.readouterr()
    assert target.read_text(encoding="utf-8") == "not project"


def test_cli_restore_cannot_overwrite_reference_or_current(tmp_path, capsys):
    reference, current = _write_versions(tmp_path)
    diff = json.loads((tmp_path / "missing.json").read_text()) if False else None
    assert main(["restore-diff", str(reference), str(current), str(current), "--select", "D000001"]) == 2
    capsys.readouterr()
