from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
AUDIT = json.loads((ROOT / "analysis/pm_auto/stage116_audit.json").read_text(encoding="utf-8"))


def test_stage116_is_bound_to_the_observed_binary_build():
    assert AUDIT["binary_sha256"]["PM_auto.dll"] == "c3cbde9cb83a7c10774a0faa4541622005856d09b79ce94dec3d8bd90d083018"
    assert AUDIT["binary_sha256"]["MAIWmodels.dll"] == "80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525"


def test_model_projection_cleanup_uses_two_models_and_two_indexes():
    finding = AUDIT["findings"]["model_projection_helper"]
    assert finding["address"] == "0x1000A360"
    assert finding["model_offsets"] == ["this+0x120", "this+0x128"]
    assert finding["map_offsets"] == ["this+0x140", "this+0x144"]
    assert finding["recursion_observed"] is False
    assert finding["caller_addresses"] == ["0x1000DBA4", "0x1001163D"]


def test_context_mode_table_preserves_observed_offsets_only():
    finding = AUDIT["findings"]["context_widget_enable_matrix"]
    assert finding["always_enabled_offsets"] == ["0x58", "0x54", "0xB8"]
    assert finding["modes"]["1"] == ["0x70", "0x78", "0x6C", "0xA0"]
    assert finding["modes"]["2"] == ["0x7C", "0x78", "0x6C", "0xA0"]
    assert finding["modes"]["3"] == ["0x70", "0x7C", "0x78", "0xA0"]
    assert finding["modes"]["4"] == ["0x70", "0x7C", "0x6C", "0xA0"]
    assert finding["widget_names_resolved"] is False


def test_nested_diagram_lifecycle_keeps_back_references_explicit():
    finding = AUDIT["findings"]["nested_diagram_lifecycle"]
    assert finding["create_slot"] == "0x10009FB0"
    assert finding["delete_slot"] == "0x1000A040"
    assert "DiagramBlock+0x1C4" in finding["back_reference_offsets"]
    assert finding["exact ownership/parenting"] == "not fully established statically"


def test_undo_redo_assessment_does_not_overclaim_absence():
    finding = AUDIT["findings"]["undo_redo_surface"]
    assert finding["QUndoStack_or_QUndoCommand_imports"] == {}
    assert finding["PM_auto_revert_submit_real_call_instructions"] == []
    assert "not proof" in finding["assessment"]


def test_all_three_sample_projects_validate_and_link_pairs_correlate():
    assert AUDIT["validation"]["sample_count"] == 3
    assert AUDIT["validation"]["all_samples_parse_and_validate"] is True
    expected = {"schaefer.is2": 6, "untitled.is2": 6, "kaka2.xml": 72}
    for sample in AUDIT["sample_projects"]:
        assert sample["validated"] is True
        pairs = sample["link_pair_correlation"]
        assert pairs["type_2_pairs"] == expected[sample["file"]]
        assert pairs["type_3_pairs"] == expected[sample["file"]]
        assert pairs["same_afe1_afe2_pairs"] == expected[sample["file"]]
        assert pairs["type_2_only_pairs"] == 0
        assert pairs["type_3_only_pairs"] == 0
