"""Atomic, validated project backups kept outside native .is2 documents.

Backups are stored beside the project in ``.pzkpfw-backups/<filename>/``.
The backup bytes are exact copies of the source file; no metadata is added to
or removed from the native XML. Restore operations validate the XML envelope,
create a rollback backup of an existing destination, and replace it atomically.
"""
from __future__ import annotations

from dataclasses import dataclass
from datetime import datetime, timezone
import hashlib
import os
from pathlib import Path
import tempfile
from typing import Iterable

from .document import MAX_PROJECT_BYTES, ProjectDocument


class BackupError(ValueError):
    """Raised when a project backup cannot be created, listed or restored safely."""


@dataclass(frozen=True)
class BackupInfo:
    path: Path
    size_bytes: int
    sha256: str
    created_at: str
    valid_xml: bool
    validation_issues: tuple[str, ...] = ()


def backup_directory(source: str | Path, root: str | Path | None = None) -> Path:
    source = Path(source).expanduser().resolve()
    if root is not None:
        return Path(root).expanduser().resolve()
    return source.parent / ".pzkpfw-backups" / source.name


def _sha256(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _atomic_write(destination: Path, payload: bytes) -> None:
    destination.parent.mkdir(parents=True, exist_ok=True)
    fd, temp_name = tempfile.mkstemp(prefix=f".{destination.name}.", suffix=".tmp", dir=str(destination.parent))
    try:
        with os.fdopen(fd, "wb") as stream:
            stream.write(payload)
            stream.flush()
            os.fsync(stream.fileno())
        temp_path = Path(temp_name)
        if _sha256(temp_path.read_bytes()) != _sha256(payload):
            raise BackupError("temporary backup verification failed")
        os.replace(temp_name, destination)
        try:
            directory_fd = os.open(destination.parent, os.O_RDONLY)
            try:
                os.fsync(directory_fd)
            finally:
                os.close(directory_fd)
        except OSError:
            pass  # Directory fsync is not available on every platform.
    except Exception:
        try:
            os.unlink(temp_name)
        except FileNotFoundError:
            pass
        raise


def _validate_backup_bytes(payload: bytes) -> tuple[bool, tuple[str, ...]]:
    if len(payload) > MAX_PROJECT_BYTES:
        return False, (f"backup exceeds project safety limit ({len(payload)} bytes)",)
    try:
        doc = ProjectDocument.from_bytes(payload)
    except Exception as exc:
        return False, (f"invalid project XML: {exc}",)
    issues = tuple(doc.validate(deep=True))
    return not issues, issues


def create_project_backup(
    source: str | Path,
    *,
    backup_root: str | Path | None = None,
    keep: int = 20,
) -> BackupInfo:
    """Create a verified, exact backup of ``source``.

    Identical bytes are not duplicated. The newest ``keep`` backups are kept.
    ``keep`` must be positive; rotation only removes backups made by this module.
    """
    if isinstance(keep, bool) or int(keep) != keep or keep < 1:
        raise BackupError("keep must be a positive integer")
    source = Path(source).expanduser().resolve()
    if not source.is_file():
        raise BackupError(f"project file does not exist: {source}")
    size = source.stat().st_size
    if size > MAX_PROJECT_BYTES:
        raise BackupError(f"project exceeds safety limit ({size} bytes)")
    payload = source.read_bytes()
    digest = _sha256(payload)
    root = backup_directory(source, backup_root)
    root.mkdir(parents=True, exist_ok=True)

    for existing in sorted(root.glob("*.is2.bak"), key=lambda item: item.name, reverse=True):
        try:
            if _sha256(existing.read_bytes()) == digest:
                return inspect_backup(existing)
        except OSError:
            continue

    now = datetime.now(timezone.utc)
    stamp = now.strftime("%Y%m%dT%H%M%S.%fZ")
    destination = root / f"{stamp}_{digest[:16]}.is2.bak"
    _atomic_write(destination, payload)

    backups = sorted(root.glob("*.is2.bak"), key=lambda item: item.name, reverse=True)
    for stale in backups[int(keep):]:
        try:
            stale.unlink()
        except OSError:
            # A failed prune must not invalidate the verified backup just made.
            pass
    return inspect_backup(destination)


def inspect_backup(path: str | Path) -> BackupInfo:
    path = Path(path).expanduser().resolve()
    if not path.is_file() or path.suffixes[-2:] != [".is2", ".bak"]:
        raise BackupError(f"not a PzKpfw project backup: {path}")
    payload = path.read_bytes()
    valid, issues = _validate_backup_bytes(payload)
    created = datetime.fromtimestamp(path.stat().st_mtime, tz=timezone.utc).isoformat()
    return BackupInfo(path, len(payload), _sha256(payload), created, valid, issues)


def list_project_backups(
    source: str | Path,
    *,
    backup_root: str | Path | None = None,
) -> list[BackupInfo]:
    root = backup_directory(source, backup_root)
    if not root.exists():
        return []
    records: list[BackupInfo] = []
    for path in root.glob("*.is2.bak"):
        try:
            records.append(inspect_backup(path))
        except (OSError, BackupError):
            continue
    return sorted(records, key=lambda item: (item.created_at, item.path.name), reverse=True)


def restore_project_backup(
    backup: str | Path,
    destination: str | Path,
    *,
    overwrite: bool = False,
    backup_existing: bool = True,
    keep: int = 20,
) -> tuple[Path, BackupInfo | None]:
    """Restore a validated backup atomically.

    Existing destinations are never replaced unless ``overwrite=True``. When
    replacing an existing project, an exact rollback copy is created first.
    The backup and destination must be distinct paths.
    """
    info = inspect_backup(backup)
    if not info.valid_xml:
        raise BackupError("backup is not a structurally valid project: " + "; ".join(info.validation_issues[:8]))
    destination = Path(destination).expanduser().resolve()
    if info.path == destination:
        raise BackupError("backup path and destination must differ")
    if destination.exists() and not overwrite:
        raise BackupError(f"destination already exists; pass overwrite=True to replace it: {destination}")

    rollback: BackupInfo | None = None
    if destination.exists() and backup_existing:
        rollback = create_project_backup(destination, keep=keep)

    payload = info.path.read_bytes()
    # Re-validate immediately before replacement to detect concurrent tampering.
    if _sha256(payload) != info.sha256:
        raise BackupError("backup changed after inspection; restore aborted")
    reopened = ProjectDocument.from_bytes(payload)
    if reopened.validate(deep=True):
        raise BackupError("backup validation changed before restore; restore aborted")
    _atomic_write(destination, payload)
    return destination, rollback


def backup_report(records: Iterable[BackupInfo]) -> dict:
    rows = [
        {
            "path": str(item.path), "size_bytes": item.size_bytes,
            "sha256": item.sha256, "created_at": item.created_at,
            "valid_xml": item.valid_xml, "validation_issues": list(item.validation_issues),
        }
        for item in records
    ]
    return {"schema_version": 1, "backup_count": len(rows), "backups": rows}
