import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def test_stage18_module_ownership_audit_snapshot():
    report = json.loads((ROOT / "analysis/plugins/module_ownership_audit.json").read_text())
    assert report["static_only"] is True
    assert report["base_interface"]["virtual_destructor_observed"] is False
    assert report["base_interface"]["slots"] == [
        "default RET body", "default RET body", "pure virtual (_purecall)"
    ]
    assert len(report["plugins"]) == 5
    for plugin in report["plugins"]:
        assert plugin["base_vtable"]["slot2_iat_symbol"] == "_purecall"
        assert plugin["widget_list"]["member_offset"] == "0x0c"
        assert plugin["widget_list"]["stored_value"] == "raw WorkWidget* copied into QListData storage"
        assert plugin["widget_list"]["qlistdata_append_iat_va"]
    cleanup = report["host_module_registry_cleanup"]
    assert cleanup["function_va"] == "0x00418740"
    assert cleanup["pointer_iteration_or_module_delete_observed"] is False
