from pathlib import Path
import json
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re import ProjectDocument
from is2_re.cli import main


def test_cli_backup_list_and_restore_with_rollback(tmp_path, capsys):
    source = tmp_path / "project.is2"
    doc = ProjectDocument.new_empty("Original")
    doc.add_action("A", action_type=0)
    doc.save(source)

    assert main(["backup", str(source)]) == 0
    created = json.loads(capsys.readouterr().out)
    backup = Path(created["backup"])
    assert backup.is_file() and created["valid_xml"]

    assert main(["list-backups", str(source)]) == 0
    listed = json.loads(capsys.readouterr().out)
    assert listed["backup_count"] == 1
    assert listed["backups"][0]["sha256"] == created["sha256"]

    # Mutate destination, then restore to it with an automatic rollback copy.
    changed = ProjectDocument.load(source)
    changed.update_project_metadata(name="Changed")
    changed.save(source)
    current_bytes = source.read_bytes()
    assert main(["restore-backup", str(backup), str(source), "--overwrite"]) == 0
    restored = json.loads(capsys.readouterr().out)
    assert restored["rollback_backup"]
    assert ProjectDocument.load(source).root.get("name") == "Original"
    rollback = Path(restored["rollback_backup"])
    assert rollback.read_bytes() == current_bytes


def test_cli_restore_does_not_overwrite_destination_without_flag(tmp_path, capsys):
    source = tmp_path / "source.is2"
    target = tmp_path / "target.is2"
    doc = ProjectDocument.new_empty("Source")
    doc.save(source)
    target_doc = ProjectDocument.new_empty("Target")
    target_doc.save(target)
    before = target.read_bytes()
    assert main(["backup", str(source)]) == 0
    backup = json.loads(capsys.readouterr().out)["backup"]
    assert main(["restore-backup", backup, str(target)]) == 2
    capsys.readouterr()
    assert target.read_bytes() == before


def test_cli_list_backups_json_output_is_separate_from_source(tmp_path, capsys):
    source = tmp_path / "source.is2"
    report_path = tmp_path / "backup-report.json"
    doc = ProjectDocument.new_empty("Source")
    doc.save(source)
    assert main(["backup", str(source)]) == 0
    capsys.readouterr()
    assert main(["list-backups", str(source), "--output", str(report_path)]) == 0
    result = json.loads(capsys.readouterr().out)
    report = json.loads(report_path.read_text(encoding="utf-8"))
    assert result["backup_count"] == report["backup_count"] == 1
    assert report["backups"][0]["valid_xml"] is True
