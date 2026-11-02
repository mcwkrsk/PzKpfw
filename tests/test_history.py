from __future__ import annotations

import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re.history import SnapshotHistory


def test_undo_redo_restores_exact_snapshots_and_labels():
    history = SnapshotHistory(limit=5)
    before = b"<project name='before'/>"
    after = b"<project name='after'/>"

    assert history.record(before, after, "rename project")
    assert history.can_undo and not history.can_redo
    restored, label = history.undo(after)
    assert restored == before
    assert label == "rename project"
    assert history.can_redo and not history.can_undo

    restored, label = history.redo(before)
    assert restored == after
    assert label == "rename project"
    assert history.can_undo and not history.can_redo


def test_new_edit_after_undo_discards_redo_branch():
    history = SnapshotHistory(limit=5)
    a, b, c = b"A", b"B", b"C"
    history.record(a, b, "first")
    restored, _ = history.undo(b)
    assert restored == a
    assert history.can_redo

    history.record(a, c, "branch")
    assert history.can_undo
    assert not history.can_redo
    assert history.undo(c)[0] == a


def test_noop_does_not_create_entry_or_clear_redo():
    history = SnapshotHistory()
    history.record(b"A", b"B", "first")
    history.undo(b"B")
    assert history.can_redo
    assert not history.record(b"A", b"A", "no-op")
    assert history.can_redo


def test_history_is_bounded_and_oldest_entries_are_discarded():
    history = SnapshotHistory(limit=2)
    history.record(b"A", b"B", "one")
    history.record(b"B", b"C", "two")
    history.record(b"C", b"D", "three")
    assert history.undo_depth == 2
    assert history.undo_label == "three"
    assert history.undo(b"D")[0] == b"C"
    assert history.undo(b"C")[0] == b"B"
    assert not history.can_undo


def test_history_rejects_nonpositive_limit():
    import pytest
    with pytest.raises(ValueError, match="at least 1"):
        SnapshotHistory(limit=0)


def test_history_timeline_is_read_only_and_lists_undo_then_redo_order():
    history = SnapshotHistory(limit=4)
    history.record(b"A", b"B", "rename")
    history.record(b"B", b"C", "add link")
    assert history.timeline == (("undo", "add link", 1), ("undo", "rename", 2))
    current, _ = history.undo(b"C")
    assert current == b"B"
    assert history.timeline == (("undo", "rename", 1), ("redo", "add link", 1))
    assert history.timeline[0][0] == "undo"
    assert history.timeline[1][0] == "redo"


def test_jump_to_undo_item_lands_before_selected_operation_and_updates_stacks():
    history = SnapshotHistory(limit=10)
    history.record(b"A", b"B", "rename")
    history.record(b"B", b"C", "add category")
    history.record(b"C", b"D", "add relation")
    restored, labels = history.jump_to(b"D", stack="undo", ordinal=2)
    assert restored == b"B"
    assert labels == ("add relation", "add category")
    assert history.undo_labels == ("rename",)
    assert history.redo_labels == ("add category", "add relation")


def test_jump_to_redo_item_lands_after_selected_operation():
    history = SnapshotHistory(limit=10)
    history.record(b"A", b"B", "one")
    history.record(b"B", b"C", "two")
    history.record(b"C", b"D", "three")
    state, _ = history.jump_to(b"D", stack="undo", ordinal=3)
    assert state == b"A"
    restored, labels = history.jump_to(state, stack="redo", ordinal=2)
    assert restored == b"C"
    assert labels == ("one", "two")
    assert history.undo_labels == ("two", "one")
    assert history.redo_labels == ("three",)


def test_jump_to_validates_stack_and_ordinal_without_mutating():
    import pytest
    history = SnapshotHistory(limit=5)
    history.record(b"A", b"B", "one")
    with pytest.raises(ValueError, match="stack"):
        history.jump_to(b"B", stack="other", ordinal=1)
    with pytest.raises(IndexError, match="unavailable"):
        history.jump_to(b"B", stack="undo", ordinal=2)
    assert history.undo_depth == 1
    assert not history.can_redo


def test_record_group_creates_one_atomic_timeline_entry_with_suboperations():
    history = SnapshotHistory(limit=10)
    changed = history.record_group(
        b"before", b"after", ["category 1 group", "category 2 group", "category 3 number"],
        title="Bulk ConceptModel edit",
    )
    assert changed
    assert history.undo_depth == 1
    assert history.undo_label == "Bulk ConceptModel edit"
    restored, label = history.undo(b"after")
    assert restored == b"before"
    assert label == "Bulk ConceptModel edit"


def test_record_group_generates_summary_and_noop_does_not_add_entry():
    history = SnapshotHistory()
    history.record_group(b"A", b"B", ["one", "two", "three", "four"])
    assert "Группа (4 операций)" in history.undo_label
    assert "и ещё 1" in history.undo_label
    assert not history.record_group(b"A", b"A", ["one"])
    assert history.undo_depth == 1


def test_detailed_history_journal_tracks_commit_group_undo_redo_and_jump():
    history = SnapshotHistory(limit=10, journal_limit=10)
    assert history.record(b"A", b"B", "Rename project", details=["project/@name: Old → New"])
    assert history.record_group(b"B", b"C", ["fix link e1", "fix link e2"], title="Bulk link repair")
    undo_info = history.entry_info("undo", 1)
    assert undo_info["label"] == "Bulk link repair"
    assert undo_info["operations"] == ("fix link e1", "fix link e2")
    assert len(undo_info["before_sha256"]) == 64
    assert undo_info["compressed_size"] > 0

    state, label = history.undo(b"C")
    assert state == b"B"
    assert label == "Bulk link repair"
    state, label = history.redo(state)
    assert state == b"C"
    events = history.journal
    assert [event.action for event in events] == ["commit", "commit_group", "undo", "redo"]
    assert events[1].details == ("fix link e1", "fix link e2")
    assert all(event.timestamp.endswith("Z") for event in events)
    assert events[-1].state_sha256


def test_history_journal_is_bounded_and_clear_resets_metadata():
    history = SnapshotHistory(limit=5, journal_limit=3)
    state = b"0"
    for index in range(5):
        after = str(index + 1).encode()
        history.record(state, after, f"edit {index}")
        state = after
    assert len(history.journal) == 3
    assert history.journal[0].label == "edit 2"
    history.clear()
    assert history.journal == ()
    assert history.undo_depth == 0
