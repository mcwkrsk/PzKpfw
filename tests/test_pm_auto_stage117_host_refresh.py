import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def _report():
    return json.loads(
        (ROOT / "analysis/host_interface/pm_auto_host_refresh.json").read_text(
            encoding="utf-8"
        )
    )


def test_stage117_host_refresh_audit_is_sha_pinned_and_passed():
    data = _report()
    assert data["status"] == "passed_static_audit"
    assert data["static_only"] is True
    assert len(data["checks"]) == 31
    assert all(data["checks"].values())
    assert data["source_hashes"]["MAIWmodels.dll"] == (
        "80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525"
    )


def test_stage117_plugins_resolve_primary_model_from_shared_host_context():
    data = _report()
    identity = data["primary_model_identity"]
    assert identity["both_resolution_chains"] == (
        "plugin_global -> context[0] -> appState[+0x08]"
    )
    assert identity["conclusion"].startswith("both plugins resolve the same PrimaryModel")
    assert data["host_context"]["app_state_plus_8"].startswith("PrimaryModel*")


def test_stage117_host_activation_dispatches_pm_auto_refresh_slot47():
    data = _report()
    refresh = data["activation_refresh"]
    assert refresh["virtual_byte_offset"] == "0xBC"
    assert refresh["virtual_slot_index"] == 47
    assert refresh["pm_auto_slot47_target"] == "0x100019D0"
    assert refresh["pm_params_slot47_target"] == "0x10007E10 (RET)"
    assert refresh["base_pm_auto_workwidget_slot47_target"] == "0x10002C70 (RET); derived PM_auto overrides it"


def test_stage117_parameter_picker_rebuild_uses_common_parameter_list():
    data = _report()
    checks = data["checks"]
    assert checks["pm_auto_refresh_clears_model"]
    assert checks["pm_auto_refresh_reads_parameter_count_and_items"]
    assert checks["pm_auto_refresh_sorts_local_parameter_buffer"]
    assert checks["pm_auto_refresh_builds_model_rows"]
    assert data["activation_refresh"]["pm_auto_slot47_behavior"].startswith(
        "rebuilds parameter picker model"
    )


def test_stage117_parameter_delete_removes_vector_entry_without_proven_destruction():
    data = _report()
    checks = data["checks"]
    assert checks["pm_params_delete_calls_parameterslist_delete"]
    assert checks["parameters_list_delete_thunk_jumps_to_vector_erase"]
    assert checks["parameter_vector_erase_updates_end_pointer"]
    assert checks["parameters_list_destructor_walks_both_pointer_arrays"]
    assert checks["parameters_list_destructor_dispatches_element_deleting_dtor"]
    ownership = data["parameter_ownership"]
    assert "does not itself destroy" in ownership["ownership_conclusion"]
    assert "remain unresolved" in ownership["ownership_conclusion"]
