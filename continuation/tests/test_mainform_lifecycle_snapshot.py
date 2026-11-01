import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SNAPSHOT = ROOT / "analysis" / "host_interface" / "mainform_lifecycle.json"


def test_mainform_moc_method_map():
    data = json.loads(SNAPSHOT.read_text(encoding="utf-8"))
    assert data["static_only"] is True
    assert data["sha256"] == "ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2"
    methods = data["moc"]["methods"]
    assert len(methods) == 9
    assert methods[0]["name"] == "on_workWidget_destroyed"
    assert methods[0]["target_va"] == "0x00411A00"
    assert methods[1]["name"] == "on_tabMenu_currentChanged"
    assert methods[1]["argc"] == 1
    assert methods[8]["name"] == "showEvent"
    assert methods[8]["dispatch"].startswith("virtual call")


def test_module_widget_collection_is_not_smart_pointer_claim():
    data = json.loads(SNAPSHOT.read_text(encoding="utf-8"))
    collection = data["module_workwidget_collection"]
    assert collection["module_field_offset"] == "+0x0C"
    assert "QListData::append" in collection["evidence"]
    assert "not a per-widget QSharedPointer" in collection["evidence"]


def test_host_destroy_handler_does_not_delete_menu_or_module():
    data = json.loads(SNAPSHOT.read_text(encoding="utf-8"))
    absent = data["host_lifecycle"]["handler_does_not_call"]
    assert "MenuWidget destructor" in absent
    assert "IsModule destructor or operator delete" in absent
    assert "QLibrary::unload" in absent


def test_destroy_handler_detaches_before_removing_shared_registry_entry():
    data = json.loads(SNAPSHOT.read_text(encoding="utf-8"))
    actions = data["host_lifecycle"]["handler_actions"]
    detach_index = next(i for i, item in enumerate(actions) if "QListData::detach" in item)
    remove_index = next(i for i, item in enumerate(actions) if "QListData::remove(index)" in item)
    assert detach_index < remove_index
    assert data["qlibrary_imports"]["QLibrary_unload_import_present"] is False
