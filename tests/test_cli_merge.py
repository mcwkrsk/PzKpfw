import json
from pathlib import Path
import sys
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re import ProjectDocument
from is2_re.cli import main

FIXTURE = ROOT / "tests" / "fixtures" / "minimal.is2"


def _branches(tmp_path, *, conflict=False):
    base = ProjectDocument.load(FIXTURE)
    base_path = tmp_path / "base.is2"
    ours_path = tmp_path / "ours.is2"
    theirs_path = tmp_path / "theirs.is2"
    output_path = tmp_path / "merged.is2"
    report_path = tmp_path / "merge-report.json"
    base.save(base_path)
    ours, theirs = base.clone(), base.clone()
    ours.update_project_metadata(name="Local")
    if conflict:
        theirs.update_project_metadata(name="Incoming")
    else:
        theirs.update_project_metadata(info="Incoming details")
    ours.save(ours_path); theirs.save(theirs_path)
    return base_path, ours_path, theirs_path, output_path, report_path


def test_cli_merge_writes_non_conflicting_three_way_result(tmp_path, capsys):
    base, ours, theirs, output, report = _branches(tmp_path)
    code = main(["merge", str(base), str(ours), str(theirs), str(output), "--report", str(report)])
    assert code == 0
    merged = ProjectDocument.load(output)
    assert merged.root.get("name") == "Local"
    assert merged.root.get("info") == "Incoming details"
    assert json.loads(report.read_text())['ready_to_write'] is True
    assert json.loads(capsys.readouterr().out)["written"] is True


def test_cli_merge_blocks_unresolved_conflict_without_creating_output(tmp_path):
    base, ours, theirs, output, report = _branches(tmp_path, conflict=True)
    code = main(["merge", str(base), str(ours), str(theirs), str(output), "--report", str(report)])
    assert code == 3
    assert not output.exists()
    payload = json.loads(report.read_text())
    assert payload["unresolved_conflict_count"] == 1


def test_cli_merge_writes_after_explicit_conflict_resolution(tmp_path):
    base, ours, theirs, output, report = _branches(tmp_path, conflict=True)
    code = main(["merge", str(base), str(ours), str(theirs), str(output),
                 "--resolve", "M000001=theirs", "--report", str(report)])
    assert code == 0
    assert ProjectDocument.load(output).root.get("name") == "Incoming"
    assert json.loads(report.read_text())["ready_to_write"] is True


def test_cli_graph_diff_exports_structured_report(tmp_path, capsys):
    fixture = ROOT / "samples" / "synthetic_relationships_0.7.3.is2"
    reference = ProjectDocument.load(fixture)
    current = reference.clone()
    current.dynamic_structure.content_records[0].set("e1", "2")
    old_path, new_path, report_path = tmp_path / "old.is2", tmp_path / "new.is2", tmp_path / "graph-diff.json"
    reference.save(old_path); current.save(new_path)
    code = main(["graph-diff", str(old_path), str(new_path), "--output", str(report_path)])
    assert code == 0
    report = json.loads(report_path.read_text())
    assert report["summary"]["rewired_edges"] == 1
    assert json.loads(capsys.readouterr().out)["summary"]["rewired_edges"] == 1


def test_cli_merge_protects_all_input_paths(tmp_path):
    base, ours, theirs, _, _ = _branches(tmp_path)
    code = main(["merge", str(base), str(ours), str(theirs), str(ours), "--overwrite"])
    assert code == 2
    assert ProjectDocument.load(ours).root.get("name") == "Local"


def test_cli_restore_diff_can_include_related_missing_records(tmp_path):
    from is2_re.diff import compare_documents

    reference = ProjectDocument.load(ROOT / "samples" / "synthetic_relationships_0.7.3.is2")
    current = reference.clone()
    current.actions_node.remove(current.action("1"))
    content = current.root.find("models/ConceptModel/content")
    for node in list(content):
        content.remove(node)
    reference_path, current_path = tmp_path / "reference.is2", tmp_path / "current.is2"
    output_path, report_path = tmp_path / "restored.is2", tmp_path / "restore-report.json"
    reference.save(reference_path); current.save(current_path)
    diff = compare_documents(reference, current)
    action_op = next(item for item in diff.operations if item.kind == "removed" and item.tag == "pd" and 'id="1"' in (item.fragment_xml or ""))
    code = main([
        "restore-diff", str(reference_path), str(current_path), str(output_path),
        "--select", action_op.operation_id, "--include-related", "--allow-ambiguous",
        "--report", str(report_path),
    ])
    assert code == 0
    restored = ProjectDocument.load(output_path)
    assert restored.action("1") is not None
    assert any(node.get("e1") == "1" for node in restored.dynamic_structure.content_records)
    payload = json.loads(report_path.read_text())
    assert payload["related_bundle"]["added_operation_ids"]
