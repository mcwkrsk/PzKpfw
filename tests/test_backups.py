from pathlib import Path
import sys

import pytest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re import ProjectDocument
from is2_re.backups import (
    BackupError, backup_directory, create_project_backup, list_project_backups,
    restore_project_backup,
)


def _project(path: Path, name: str) -> bytes:
    doc = ProjectDocument.new_empty(name)
    doc.add_action("Action", action_type=0)
    doc.save(path)
    return path.read_bytes()


def test_create_backup_is_exact_deduplicated_and_outside_native_project(tmp_path):
    source = tmp_path / "project.is2"
    original = _project(source, "Original")
    info = create_project_backup(source)
    assert info.valid_xml
    assert info.path.read_bytes() == original
    assert info.sha256
    assert info.path.parent == backup_directory(source)

    second = create_project_backup(source)
    assert second.path == info.path
    assert len(list_project_backups(source)) == 1
    assert source.read_bytes() == original


def test_backup_rotation_keeps_newest_n_distinct_snapshots(tmp_path):
    source = tmp_path / "project.is2"
    _project(source, "Version 1")
    create_project_backup(source, keep=2)
    doc = ProjectDocument.load(source)
    doc.update_project_metadata(name="Version 2")
    doc.save(source)
    create_project_backup(source, keep=2)
    doc = ProjectDocument.load(source)
    doc.update_project_metadata(name="Version 3")
    doc.save(source)
    create_project_backup(source, keep=2)
    backups = list_project_backups(source)
    assert len(backups) == 2
    assert all(item.valid_xml for item in backups)


def test_restore_to_new_destination_and_refuse_existing_without_overwrite(tmp_path):
    source = tmp_path / "source.is2"
    original = _project(source, "Backup Source")
    backup = create_project_backup(source)
    destination = tmp_path / "restored.is2"
    restored, rollback = restore_project_backup(backup.path, destination)
    assert restored == destination.resolve()
    assert rollback is None
    assert destination.read_bytes() == original

    with pytest.raises(BackupError, match="already exists"):
        restore_project_backup(backup.path, destination)


def test_restore_existing_destination_creates_rollback_backup(tmp_path):
    source = tmp_path / "source.is2"
    original = _project(source, "Snapshot")
    backup = create_project_backup(source)
    destination = tmp_path / "current.is2"
    current = _project(destination, "Current")

    restored, rollback = restore_project_backup(backup.path, destination, overwrite=True)
    assert restored == destination.resolve()
    assert rollback is not None
    assert rollback.path.read_bytes() == current
    assert destination.read_bytes() == original
    assert ProjectDocument.load(destination).validate(deep=True) == []


def test_restore_rejects_corrupt_backup_and_keeps_destination_unchanged(tmp_path):
    destination = tmp_path / "current.is2"
    original = _project(destination, "Current")
    corrupt = tmp_path / "broken.is2.bak"
    corrupt.write_text("not xml", encoding="utf-8")
    with pytest.raises(BackupError, match="not a structurally valid project"):
        restore_project_backup(corrupt, destination, overwrite=True)
    assert destination.read_bytes() == original


def test_backup_keep_parameter_must_be_positive(tmp_path):
    source = tmp_path / "project.is2"
    _project(source, "Current")
    with pytest.raises(BackupError, match="positive integer"):
        create_project_backup(source, keep=0)
