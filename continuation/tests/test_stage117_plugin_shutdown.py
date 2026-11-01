import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
AUDIT = ROOT / "analysis/plugins/plugin_shutdown_audit.json"


def load_audit():
    return json.loads(AUDIT.read_text(encoding="utf-8"))


def test_plugin_shutdown_audit_is_sha_pinned_and_complete():
    data = load_audit()
    assert data["audit"] == "stage117-plugin-module-shutdown-boundary"
    assert data["status"] == "PASS"
    assert data["passed"] == data["total"] == 33
    assert data["host_sha256"] == "ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2"
    assert len(data["binary_sha256"]) == 7


def test_host_loader_virtual_order_and_backpointer_are_recorded():
    data = load_audit()
    assert data["loader"]["vtable_call_order"] == [
        "+0x08 descriptor getter", "+0x04 create widgets", "+0x00 post-create"
    ]
    assert data["loader"]["workwidget_module_backpointer"] == "+0x18"
    assert data["loader"]["module_registry_global"] == "0x004696B8"


def test_all_five_plugins_expose_only_the_observed_factory_lifecycle_export():
    data = load_audit()
    assert len(data["plugin_exports_and_imports"]) == 5
    for plugin, evidence in data["plugin_exports_and_imports"].items():
        assert evidence["exports"] == ["loadmodule"], plugin
        assert evidence["no_named_freelibrary_loadlibrary_or_qlibrary_unload_import"] is True


def test_shutdown_frees_registry_storage_not_module_pointees():
    data = load_audit()
    cleanup = data["module_registry_destructor"]
    assert cleanup["global"] == "0x004696B8"
    assert "QArrayData::deallocate" in cleanup["observed_cleanup"]
    assert cleanup["pointee_destructor_loop_observed"] is False
    handler = data["destroy_handler"]
    assert handler["does_not_reference_module_registry_global"] is True
    assert handler["does_not_establish_IsModule_or_MenuWidget_destruction"] is True


def test_dynamic_resolution_caveat_is_explicit():
    data = load_audit()
    assert data["qlibrary"]["getprocaddress_imports"] == [
        "IS.exe", "PM_auto.dll", "PM_matrix_web.dll", "PM_params.dll", "PM_spec_WEB.dll"
    ]
    expected = ["InitializeConditionVariable", "SleepConditionVariableCS", "WakeAllConditionVariable"]
    for targets in data["qlibrary"]["getprocaddress_resolution_targets"].values():
        assert targets == expected
    limitations = " ".join(data["limitations"])
    assert "no dynamically resolved FreeLibrary call was observed" in limitations
    assert "no Windows runtime" in limitations


def test_plugin_shutdown_report_and_disassembly_snapshots_exist():
    report = (ROOT / "docs/48_stage1_17_plugin_module_shutdown_boundary.md").read_text(encoding="utf-8")
    assert "33/33 checks" in report
    assert "GetProcAddress" in report
    assert "does not prove complete object ownership" in report
    snapshots = [
        "plugin_loader_0x404340.asm",
        "workwidget_register_0x410b10.asm",
        "workwidget_destroyed_handler_0x411a00.asm",
        "module_registry_destructor_0x418740.asm",
        "getproc_IS_condition_api_resolution.asm",
        "getproc_PM_auto_condition_api_resolution.asm",
        "getproc_PM_matrix_web_condition_api_resolution.asm",
        "getproc_PM_params_condition_api_resolution.asm",
        "getproc_PM_spec_WEB_condition_api_resolution.asm",
    ]
    for name in snapshots:
        body = (ROOT / "analysis/disassembly" / name).read_text(encoding="utf-8")
        assert "disassembly of section .text" in body.lower()


def test_module_registry_has_only_static_init_loader_append_and_static_dtor_xrefs():
    data = load_audit()
    refs = data["module_registry_global_xrefs"]
    assert refs["global"] == "0x004696B8"
    assert refs["host_full_text_disassembly_reference_count"] == 4
    assert refs["reference_instruction_addresses"] == [
        "0x004010DB", "0x0040451A", "0x00418740", "0x0041875F"
    ]
    assert "indirect aliases" in refs["scope"]
    snapshot = (ROOT / "analysis/disassembly/module_registry_global_xrefs.asm").read_text(encoding="utf-8")
    assert "0x4696b8" in snapshot.lower()
