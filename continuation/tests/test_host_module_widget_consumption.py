import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def test_host_module_widget_consumption_snapshot():
    data = json.loads((ROOT / "analysis/host_interface/module_widget_consumption.json").read_text())
    assert data["static_only"] is True
    assert data["module_widget_list"]["source_member_offset"] == "0x0c"
    assert data["module_widget_list"]["copy_helper_va"] == "0x00404320"
    assert data["module_widget_list"]["back_pointer_written"] == "WorkWidget+0x18 = owning IsModule*"
    assert data["destroy_handler"]["menu_pointer_offset"] == "WorkWidget+0x20"
    assert data["destroy_handler"]["mainform_widget_list_offset"] == "MainForm+0x30"
    assert data["destroy_handler"]["reads_workwidget_owner_back_pointer_0x18"] is False
    assert data["destroy_handler"]["touches_IsModule_widget_list_0x0c"] is False
