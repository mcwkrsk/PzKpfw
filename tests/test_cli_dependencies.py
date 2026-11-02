import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re import ProjectDocument
from is2_re.cli import main


def make_project(path: Path) -> None:
    doc = ProjectDocument.new_empty("CLI dependency audit")
    action = doc.add_action("Action", action_type=0)
    category = doc.concept_structure.add_category("Category", class_id=1)
    doc.dynamic_structure.add_content_link(action, category)
    doc.save(path)


def test_dependencies_command_prints_structured_report(tmp_path, capsys):
    project = tmp_path / "project.is2"
    make_project(project)
    result = main(["dependencies", str(project)])
    output = json.loads(capsys.readouterr().out)
    assert result == 0
    assert output["entity_count"] >= 2
    assert output["reference_count"] == 2
    assert output["dangling_count"] == 0


def test_dependencies_command_writes_json_file(tmp_path, capsys):
    project = tmp_path / "project.is2"
    report_path = tmp_path / "reports" / "dependencies.json"
    make_project(project)
    result = main(["dependencies", str(project), "--output", str(report_path)])
    stdout = json.loads(capsys.readouterr().out)
    report = json.loads(report_path.read_text(encoding="utf-8"))
    assert result == 0
    assert stdout["output"] == str(report_path)
    assert report["reference_count"] == 2
    assert report["dangling_count"] == 0
