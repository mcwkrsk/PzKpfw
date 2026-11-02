from pathlib import Path
import json
import sys

import pytest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re.view_state import (
    ViewStateError, load_view_state, normalize_view_state, save_view_state, sidecar_path,
)


def test_view_state_round_trip_uses_separate_sidecar(tmp_path):
    project = tmp_path / "demo.is2"
    project.write_text("<project/>", encoding="utf-8")
    target = save_view_state(
        project, positions={"action:1": (120, 80), "relation:x": [900, 160]}, zoom=1.25,
        active_tab=7, selections={"parameter": "11", "graph": "parameter:11", "cg_relation_parameter_object": "1"},
        window_geometry="1320x820+20+30", graph_filter="Parameter → Object", graph_search="fuel",
    )
    assert target == sidecar_path(project)
    assert target.name == "demo.is2.pzkpfw-view.json"
    loaded = load_view_state(project, valid_keys={"action:1", "relation:x", "parameter:11"})
    assert loaded == {
        "schema_version": 3,
        "zoom": 1.25,
        "positions": {"action:1": [120.0, 80.0], "relation:x": [900.0, 160.0]},
        "active_tab": 7,
        "selections": {"parameter": "11", "graph": "parameter:11", "cg_relation_parameter_object": "1"},
        "window_geometry": "1320x820+20+30",
        "graph_filter": "Parameter → Object",
        "graph_search": "fuel",
    }
    assert project.read_text(encoding="utf-8") == "<project/>"


def test_view_state_migrates_v1_sidecar_and_filters_stale_keys():
    normalized = normalize_view_state({
        "schema_version": 1, "zoom": 1.0,
        "positions": {"action:1": [100, 200], "missing": [1, 2], "bad": [float("nan"), 10], "shape": [1]},
    }, valid_keys={"action:1"})
    assert normalized == {
        "schema_version": 3, "zoom": 1.0, "positions": {"action:1": [100.0, 200.0]},
        "active_tab": 0, "selections": {}, "window_geometry": None,
        "graph_filter": "Все", "graph_search": "",
    }


def test_view_state_sanitizes_editor_values_and_rejects_unknown_schema():
    normalized = normalize_view_state({
        "schema_version": 3, "zoom": 1.0, "positions": {},
        "active_tab": -1,
        "selections": {"parameter": "11", "bad key": "x", "evil": "\n"},
        "window_geometry": "0x0+0+0",
        "graph_filter": "not-a-filter", "graph_search": "x" * 300,
    })
    assert normalized["active_tab"] == 0
    assert normalized["selections"] == {"parameter": "11"}
    assert normalized["window_geometry"] is None
    assert normalized["graph_filter"] == "Все"
    assert normalized["graph_search"] == ""
    with pytest.raises(ViewStateError, match="schema_version"):
        normalize_view_state({"schema_version": 99, "zoom": 1, "positions": {}})
    with pytest.raises(ViewStateError, match="zoom"):
        normalize_view_state({"schema_version": 1, "zoom": 0.01, "positions": {}})


def test_view_state_detects_corrupt_sidecar(tmp_path):
    project = tmp_path / "bad.is2"
    project.write_text("<project/>", encoding="utf-8")
    sidecar_path(project).write_text("not-json", encoding="utf-8")
    with pytest.raises(ViewStateError, match="cannot read"):
        load_view_state(project)
