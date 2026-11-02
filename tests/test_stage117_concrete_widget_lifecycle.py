import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
AUDIT = ROOT / "analysis/host_interface/concrete_widget_lifecycle.json"


def data():
    return json.loads(AUDIT.read_text(encoding="utf-8"))


def test_concrete_widget_lifecycle_audit_is_sha_pinned_and_passes():
    report = data()
    assert report["audit"] == "stage117-concrete-workwidget-destruction-paths"
    assert report["static_only"] is True
    assert report["status"] == "PASS"
    assert report["passed"] == report["total"] == 49
    assert report["host_sha256"] == "ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2"
    assert len(report["binary_sha256"]) == 6


def test_all_five_primary_workwidgets_expose_expected_deleting_destructor():
    items = data()["concrete_workwidget_deleting_destructors"]
    assert set(items) == {
        "PM_auto.dll", "PM_params.dll", "PM_spec_WEB.dll",
        "PM_matrix_web.dll", "Model_Visualiser.dll",
    }
    for item in items.values():
        assert item["deleting_destructor_slot_index"] == 3
        assert item["deleting_destructor_slot_offset"] == "0x0C"
        assert item["object_offset"] == 0
        assert item["deleting_destructor_va"].startswith("0x100")
        assert item["object_size_from_deleting_destructor"].startswith("0x")


def test_controlfrom_qmap_cleanup_is_tied_to_new_and_saveas_slots():
    cleanup = data()["host_deleteLater"]["controlfrom_collection_cleanup"]
    assert cleanup["owner_class"].startswith("ControlFrom")
    assert cleanup["moc_static_metacall_va"] == "0x004010F0"
    assert cleanup["moc_method_count"] == 10
    paths = cleanup["confirmed_ui_call_paths"]
    assert len(paths) == 4
    assert paths[0]["slot"] == "ControlFrom::on_pbSaveAs_clicked"
    assert paths[0]["map_cleanup_method_calls_helper_at"] == "0x00401A6D -> 0x00402B50"
    assert paths[1]["slot"] == "ControlFrom::on_pbNew_clicked"
    assert paths[1]["secondary_method_calls_map_cleanup_at"] == "0x0040291D -> 0x00401770"
    assert "unresolved" in cleanup["map_value_type"]
    assert "ControlFrom shared map-cleanup method" in cleanup["bounded_caller_type"]["0x00401A6D"]


def test_host_deleteLater_iat_references_are_all_classified():
    host = data()["host_deleteLater"]
    assert host["iat_va"] == "0x00419374"
    assert len(host["direct_iat_references"]) == 3
    assert host["controlfrom_collection_cleanup"]["indirect_call_va"] == "0x00402BF4"
    assert host["feedbackform_virtual_wrapper"]["slot_index"] == 30
    assert host["mainform_eventfilter"]["receiver"].startswith("MainForm this")


def test_plugin_deleteLater_paths_are_nested_objects_only():
    plugins = data()["plugin_deleteLater"]
    assert "CbWithBtn*" in plugins["PM_auto.dll"]["captured_pointer"]
    assert "QLayout::removeWidget" in plugins["PM_auto.dll"]["preceding_layout_operation"]
    assert "QAbstractItemModel*" in plugins["PM_params.dll"]["receiver"]
    for name in ["PM_spec_WEB.dll", "PM_matrix_web.dll", "Model_Visualiser.dll"]:
        assert plugins[name]["imports_qobject_deleteLater"] is False


def test_report_does_not_claim_top_level_widget_or_module_destruction_is_proven():
    report = data()
    assert report["interpretation"]["all_five_concrete_workwidget_types_expose_deleting_destructor"] is True
    assert "does not prove" in report["interpretation"]["what_this_does_not_prove"]
    limitations = " ".join(report["limitations"])
    assert "caller/owner path" in limitations
    assert "runtime" in limitations


def test_documentation_and_disassembly_snapshots_are_present():
    doc = (ROOT / "docs/50_stage1_17_concrete_workwidget_destruction_paths.md").read_text(encoding="utf-8")
    assert "49/49" in doc
    assert "Stage 1 is formally closed as the static reverse-engineering baseline" in doc
    required = [
        "controlfrom_on_new_0x402390.asm",
        "controlfrom_on_saveas_0x402530.asm",
        "controlfrom_map_cleanup_0x401770.asm",
        "controlfrom_secondary_map_cleanup_0x402870.asm",
        "controlfrom_askforsaving_adapter_0x401680.asm",
        "controlfrom_list_deleteLater_0x402b50.asm",
    ]
    for name in required:
        snapshot = ROOT / "analysis/disassembly" / name
        assert snapshot.is_file()
        assert "disassembly of section .text" in snapshot.read_text(encoding="utf-8").lower()
