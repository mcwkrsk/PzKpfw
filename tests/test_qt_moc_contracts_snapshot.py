from __future__ import annotations
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DATA = json.loads((ROOT / "analysis/plugins/qt_moc_contracts.json").read_text(encoding="utf-8"))


def _plugin(name: str):
    return next(p for p in DATA["plugins"] if p["binary"] == name)


def _class(binary: str, class_name: str):
    return next(o for o in _plugin(binary)["qmetaobjects"] if o["class_name"] == class_name)


def _method_signatures(binary: str, class_name: str):
    return {m["signature"] for m in _class(binary, class_name)["methods"]}


def test_complete_all_section_snapshot_counts():
    assert sum(p["qmetaobject_count"] for p in DATA["plugins"]) == 28
    assert sum(p["total_methods"] for p in DATA["plugins"]) == 44
    assert sum(p["total_signals"] for p in DATA["plugins"]) == 6
    assert [p["qmetaobject_count"] for p in DATA["plugins"]] == [10, 4, 6, 4, 4]


def test_data_section_metaobjects_are_present():
    assert _class("PM_params.dll", "ObjectsEditWidget")["section"] == ".data"
    assert _class("Model_Visualiser.dll", "Deca::QDecomposeTab")["section"] == ".data"
    assert _class("PM_auto.dll", "BaseDiagram")["section"] == ".data"
    assert _class("PM_auto.dll", "CbWithBtn")["section"] == ".data"
    assert _class("PM_auto.dll", "CbWithBtnContainer")["section"] == ".data"


def test_objects_edit_widget_methods_are_exact():
    assert _method_signatures("PM_params.dll", "ObjectsEditWidget") == {
        "on_pbDel_pressed()", "on_pbAdd_pressed()", "on_pbUp_pressed()", "on_pbDown_pressed()"
    }


def test_decompose_tab_signal_is_real_moc_signal():
    obj = _class("Model_Visualiser.dll", "Deca::QDecomposeTab")
    assert obj["signal_count"] == 1
    assert obj["methods"][0]["kind"] == "signal"
    assert obj["methods"][0]["signature"] == "difficuldActionClicked(QString arg0)"


def test_model_visualiser_slot_matches_signal_signature():
    assert "change_tab_clot(QString arg0)" in _method_signatures("Model_Visualiser.dll", "Model_Visualiser")


def test_functional_diagram_signal_contract():
    obj = _class("PM_auto.dll", "FunctionalDiagram")
    assert obj["signal_count"] == 4
    assert {m["name"] for m in obj["methods"] if m["kind"] == "signal"} == {
        "selectionChanged", "itemDoubleClick", "itemDraged", "closed"
    }


def test_all_five_modules_call_qt_auto_connect():
    assert all(p["connect_slots_by_name_imports"] for p in DATA["plugins"])


def test_no_unresolved_parameter_types_in_snapshot():
    for plugin in DATA["plugins"]:
        for obj in plugin["qmetaobjects"]:
            for method in obj["methods"]:
                assert not method["return_type"].startswith("QMetaType(")
                for arg in method["arguments"]:
                    assert not arg["type"].startswith("QMetaType(")


def test_autoconnect_object_name_snapshot_matches_all_slots():
    auto = json.loads((ROOT / "analysis/plugins/qt_autoconnect_candidates.json").read_text(encoding="utf-8"))
    rows = [x for p in auto["plugins"] for x in p["auto_connect_candidates"]]
    assert len(rows) == 20
    assert all(x["object_name_string_found"] for x in rows)
    assert all(x["string_references"] for x in rows)


def test_autoconnect_slots_do_not_include_matrix_web_own_methods():
    auto = json.loads((ROOT / "analysis/plugins/qt_autoconnect_candidates.json").read_text(encoding="utf-8"))
    matrix = next(p for p in auto["plugins"] if p["binary"] == "PM_matrix_web.dll")
    assert matrix["auto_connect_candidates"] == []
