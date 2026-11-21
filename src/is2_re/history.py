"""Bounded snapshot undo/redo history with a detailed in-memory activity journal.

Document snapshots are compressed UTF-8 XML bytes and remain in memory only.
The journal stores metadata (timestamp, operation, hashes and details), never
project payloads, and is not written into native ``.is2`` files.
"""
from __future__ import annotations

from dataclasses import dataclass
from datetime import datetime, timezone
import hashlib
import zlib


def _utc_now() -> str:
    return datetime.now(timezone.utc).isoformat(timespec="milliseconds").replace("+00:00", "Z")


def _digest(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


@dataclass(frozen=True)
class HistoryEntry:
    label: str
    compressed_xml: bytes
    created_at: str
    before_sha256: str
    operations: tuple[str, ...] = ()

    def restore(self) -> bytes:
        return zlib.decompress(self.compressed_xml)

    @property
    def compressed_size(self) -> int:
        return len(self.compressed_xml)


@dataclass(frozen=True)
class HistoryEvent:
    sequence: int
    timestamp: str
    action: str
    label: str
    details: tuple[str, ...] = ()
    state_sha256: str | None = None

    def as_dict(self) -> dict:
        return {
            "sequence": self.sequence,
            "timestamp": self.timestamp,
            "action": self.action,
            "label": self.label,
            "details": list(self.details),
            "state_sha256": self.state_sha256,
        }


class SnapshotHistory:
    """A bounded two-stack history plus a bounded metadata-only journal."""

    def __init__(self, limit: int = 50, *, journal_limit: int = 500):
        if isinstance(limit, bool) or int(limit) != limit or limit < 1:
            raise ValueError("history limit must be at least 1")
        if isinstance(journal_limit, bool) or int(journal_limit) != journal_limit or journal_limit < 1:
            raise ValueError("journal_limit must be at least 1")
        self.limit = int(limit)
        self.journal_limit = int(journal_limit)
        self._undo: list[HistoryEntry] = []
        self._redo: list[HistoryEntry] = []
        self._journal: list[HistoryEvent] = []
        self._sequence = 0

    @property
    def can_undo(self) -> bool:
        return bool(self._undo)

    @property
    def can_redo(self) -> bool:
        return bool(self._redo)

    @property
    def undo_label(self) -> str | None:
        return self._undo[-1].label if self._undo else None

    @property
    def redo_label(self) -> str | None:
        return self._redo[-1].label if self._redo else None

    @property
    def undo_depth(self) -> int:
        return len(self._undo)

    @property
    def redo_depth(self) -> int:
        return len(self._redo)

    @property
    def undo_labels(self) -> tuple[str, ...]:
        """Labels in the order they will be undone (newest first)."""
        return tuple(entry.label for entry in reversed(self._undo))

    @property
    def redo_labels(self) -> tuple[str, ...]:
        """Labels in the order in which they will be replayed (next first)."""
        return tuple(entry.label for entry in reversed(self._redo))

    @property
    def timeline(self) -> tuple[tuple[str, str, int], ...]:
        """Только чтение UI projection: (stack, label, ordinal)."""
        items: list[tuple[str, str, int]] = []
        for index, label in enumerate(self.undo_labels, start=1):
            items.append(("undo", label, index))
        for index, label in enumerate(self.redo_labels, start=1):
            items.append(("redo", label, index))
        return tuple(items)

    @property
    def journal(self) -> tuple[HistoryEvent, ...]:
        """Chronological metadata-only operation log, oldest first."""
        return tuple(self._journal)

    def entry_info(self, stack: str, ordinal: int) -> dict | None:
        if stack not in {"undo", "redo"} or isinstance(ordinal, bool) or int(ordinal) != ordinal or ordinal < 1:
            return None
        entries = self._undo if stack == "undo" else self._redo
        if ordinal > len(entries):
            return None
        entry = entries[-ordinal]
        return {
            "label": entry.label,
            "created_at": entry.created_at,
            "before_sha256": entry.before_sha256,
            "compressed_size": entry.compressed_size,
            "operations": entry.operations,
        }

    def _event(self, action: str, label: str, details: tuple[str, ...] = (), state: bytes | None = None) -> None:
        self._sequence += 1
        self._journal.append(HistoryEvent(
            sequence=self._sequence,
            timestamp=_utc_now(),
            action=str(action),
            label=str(label),
            details=tuple(details),
            state_sha256=_digest(state) if state is not None else None,
        ))
        if len(self._journal) > self.journal_limit:
            del self._journal[:len(self._journal) - self.journal_limit]

    def clear(self) -> None:
        self._undo.clear()
        self._redo.clear()
        self._journal.clear()
        self._sequence = 0

    def note(self, action: str, label: str, *, details: tuple[str, ...] | list[str] = (), state: bytes | None = None) -> None:
        """Append a non-mutating lifecycle event (open, save, backup, restore)."""
        self._event(action, label, tuple(str(item) for item in details), state)

    @staticmethod
    def _pack(
        label: str,
        payload: bytes,
        *,
        created_at: str | None = None,
        operations: tuple[str, ...] = (),
    ) -> HistoryEntry:
        return HistoryEntry(
            str(label), zlib.compress(payload, level=1), created_at or _utc_now(),
            _digest(payload), tuple(operations),
        )

    def record(self, before: bytes, after: bytes, label: str, *, details: tuple[str, ...] | list[str] = ()) -> bool:
        """Record one committed edit. A no-op does not disturb redo history."""
        if before == after:
            return False
        details = tuple(str(item) for item in details if str(item).strip())
        self._undo.append(self._pack(label, before, operations=details))
        if len(self._undo) > self.limit:
            del self._undo[:len(self._undo) - self.limit]
        self._redo.clear()
        self._event("commit", label, details, after)
        return True

    def record_group(
        self, before: bytes, after: bytes, operations: list[str] | tuple[str, ...], *, title: str | None = None,
    ) -> bool:
        """Record a compound transaction as one undo entry with detailed sub-operations."""
        labels = tuple(str(item).strip() for item in operations if str(item).strip())
        if not labels:
            return self.record(before, after, title or "Групповое изменение")
        summary = title or f"Группа ({len(labels)} операций): " + "; ".join(labels[:3])
        if len(labels) > 3:
            summary += f"; и ещё {len(labels) - 3}"
        if before == after:
            return False
        self._undo.append(self._pack(summary, before, operations=labels))
        if len(self._undo) > self.limit:
            del self._undo[:len(self._undo) - self.limit]
        self._redo.clear()
        self._event("commit_group", summary, labels, after)
        return True

    def undo(self, current: bytes) -> tuple[bytes, str] | None:
        if not self._undo:
            return None
        entry = self._undo.pop()
        self._redo.append(self._pack(
            entry.label, current, created_at=entry.created_at, operations=entry.operations,
        ))
        if len(self._redo) > self.limit:
            del self._redo[:len(self._redo) - self.limit]
        restored = entry.restore()
        self._event("undo", entry.label, entry.operations, restored)
        return restored, entry.label

    def redo(self, current: bytes) -> tuple[bytes, str] | None:
        if not self._redo:
            return None
        entry = self._redo.pop()
        self._undo.append(self._pack(
            entry.label, current, created_at=entry.created_at, operations=entry.operations,
        ))
        if len(self._undo) > self.limit:
            del self._undo[:len(self._undo) - self.limit]
        restored = entry.restore()
        self._event("redo", entry.label, entry.operations, restored)
        return restored, entry.label

    def jump_to(self, current: bytes, *, stack: str, ordinal: int) -> tuple[bytes, tuple[str, ...]]:
        """Move to a selected history boundary as if Undo/Redo were repeated."""
        if stack not in {"undo", "redo"}:
            raise ValueError("stack must be 'undo' or 'redo'")
        if isinstance(ordinal, bool) or int(ordinal) != ordinal or ordinal < 1:
            raise ValueError("ordinal must be a positive integer")
        available = self.undo_depth if stack == "undo" else self.redo_depth
        if ordinal > available:
            raise IndexError(f"history {stack} item {ordinal} is unavailable (depth={available})")
        snapshot = current
        labels: list[str] = []
        operation = self.undo if stack == "undo" else self.redo
        for _ in range(int(ordinal)):
            result = operation(snapshot)
            if result is None:
                raise RuntimeError("history changed while jumping")
            snapshot, label = result
            labels.append(label)
        self._event("jump", f"Переход по истории: {stack} × {ordinal}", tuple(labels), snapshot)
        return snapshot, tuple(labels)
