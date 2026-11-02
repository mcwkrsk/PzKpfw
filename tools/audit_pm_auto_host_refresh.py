#!/usr/bin/env python3
"""SHA-pinned static audit of the IS.exe -> WorkWidget activation refresh path."""
from __future__ import annotations

import argparse
import csv
import hashlib
import json
import subprocess
import sys
from pathlib import Path

EXPECTED = {
    "IS.exe": "ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2",
    "PM_auto.dll": "c3cbde9cb83a7c10774a0faa4541622005856d09b79ce94dec3d8bd90d083018",
    "PM_params.dll": "22c867d11fcc724b79fbff420f514d7adccd7a8eb7565e9b4b43e60b267ea781",
    "MAIWmodels.dll": "80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525",
}

RANGES = [
    ("host_context_allocate", "IS.exe", "0x4050f0", "0x40511e"),
    ("app_state_primary_model", "IS.exe", "0x408ef6", "0x408f50"),
    ("host_widget_register", "IS.exe", "0x410b10", "0x410b4c"),
    ("host_tab_changed", "IS.exe", "0x4115c0", "0x411692"),
    ("pm_auto_context_getter", "PM_auto.dll", "0x10002bd0", "0x10002beb"),
    ("pm_auto_context_setter", "PM_auto.dll", "0x10002be0", "0x10002bed"),
    ("pm_auto_model_binding", "PM_auto.dll", "0x100019b0", "0x100019ca"),
    ("pm_auto_model_pointer_store", "PM_auto.dll", "0x1000e670", "0x1000e689"),
    ("pm_auto_refresh", "PM_auto.dll", "0x100019d0", "0x10002082"),
    ("pm_auto_base_workwidget_stub", "PM_auto.dll", "0x10002c70", "0x10002c72"),
    ("pm_params_context_getter", "PM_params.dll", "0x10007c70", "0x10007c7b"),
    ("pm_params_context_setter", "PM_params.dll", "0x10007c80", "0x10007c8d"),
    ("pm_params_primary_model_use", "PM_params.dll", "0x10004510", "0x10004570"),
    ("pm_params_workwidget_stub", "PM_params.dll", "0x10007e10", "0x10007e12"),
    ("pm_params_delete_handler", "PM_params.dll", "0x10005a80", "0x10005b3b"),
    ("parameters_list_delete_thunk", "MAIWmodels.dll", "0x10013bc0", "0x10013bc9"),
    ("parameter_vector_erase", "MAIWmodels.dll", "0x1000de60", "0x1000deb7"),
    ("parameters_list_add", "MAIWmodels.dll", "0x100139d0", "0x10013a3e"),
    ("parameters_list_append_vector", "MAIWmodels.dll", "0x1000ddb0", "0x1000dddf"),
    ("parameters_list_destructor", "MAIWmodels.dll", "0x1000d8e0", "0x1000d96a"),
    ("parameters_list_private_destructor", "MAIWmodels.dll", "0x1000d970", "0x1000da30"),
    ("parameters_list_destructor_thunk", "MAIWmodels.dll", "0x100136b0", "0x100136c8"),
]


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def disasm(path: Path, start: str, stop: str) -> str:
    return subprocess.check_output(
        ["objdump", "-d", "-Mintel", f"--start-address={start}", f"--stop-address={stop}", str(path)],
        text=True,
        errors="replace",
    )


def read_vtable_rows(path: Path) -> list[list[str]]:
    with path.open(encoding="utf-8", newline="") as stream:
        return list(csv.reader(stream, delimiter="\t"))


def find_target(rows: list[list[str]], binary: str, class_name: str, vtable: str, slot: int) -> str | None:
    for row in rows:
        if len(row) >= 6 and row[0] == binary and row[1] == class_name and row[3] == vtable and row[4] == str(slot):
            return row[5]
    return None


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", required=True, type=Path, help="Extracted IS2_PMauto_beta directory")
    parser.add_argument("--vtable-tsv", type=Path, default=None)
    parser.add_argument("--out-json", required=True, type=Path)
    parser.add_argument("--out-asm", required=True, type=Path)
    args = parser.parse_args()

    paths = {
        "IS.exe": args.root / "IS.exe",
        "PM_auto.dll": args.root / "modules/PM_auto.dll",
        "PM_params.dll": args.root / "modules/PM_params.dll",
        "MAIWmodels.dll": args.root / "MAIWmodels.dll",
    }
    hashes = {name: sha256(path) for name, path in paths.items()}
    if hashes != EXPECTED:
        print(json.dumps({"status": "rejected_hash_mismatch", "hashes": hashes}, indent=2))
        return 2

    excerpts: dict[str, str] = {}
    asm_parts: list[str] = []
    for label, binary, start, stop in RANGES:
        excerpt = disasm(paths[binary], start, stop)
        excerpts[label] = excerpt
        asm_parts.append(f"\n; ===== {binary} {label} {start}..{stop} =====\n{excerpt}")

    checks = {
        "host_allocates_0x14_context": "push   0x14" in excerpts["host_context_allocate"] and "ds:0x4696ac,esi" in excerpts["host_context_allocate"],
        "context_prefix_points_to_app_state": "ds:0x4696ac" in excerpts["app_state_primary_model"] and "ds:0x4696a4" in excerpts["app_state_primary_model"] and "[eax],ecx" in excerpts["app_state_primary_model"],
        "primary_model_vptr_installed": "[esi],0x457978" in excerpts["app_state_primary_model"],
        "primary_model_stored_at_app_state_plus_8": "[eax+0x8],esi" in excerpts["app_state_primary_model"],
        "host_passes_same_context_to_widget": "ds:0x4696ac" in excerpts["host_widget_register"] and "[eax+0xcc]" in excerpts["host_widget_register"],
        "host_tab_callback_resolves_menu_backlink": "[eax+0x18]" in excerpts["host_tab_changed"],
        "host_tab_callback_shows_workwidget": "ds:0x4197e8" in excerpts["host_tab_changed"],
        "host_tab_callback_invokes_slot_47": "[eax+0xbc]" in excerpts["host_tab_changed"],
        "pm_auto_stores_host_context": "ds:0x1007052c,eax" in excerpts["pm_auto_context_setter"],
        "pm_params_stores_host_context": "ds:0x10023544,eax" in excerpts["pm_params_context_setter"],
        "pm_auto_getter_resolves_appstate_primary_model": all(s in excerpts["pm_auto_context_getter"] for s in ["ds:0x1007052c", "[eax]", "[eax+0x8]"]),
        "pm_params_getter_resolves_same_appstate_primary_model": all(s in excerpts["pm_params_context_getter"] for s in ["ds:0x10023544", "[eax]", "[eax+0x8]"]),
        "pm_auto_stores_primarymodel_at_plus_11c": "[ecx+0x11c],eax" in excerpts["pm_auto_model_pointer_store"],
        "pm_params_calls_primarymodel_getparamslist": "ds:0x1000a0d4" in excerpts["pm_params_primary_model_use"] and "call   ebx" in excerpts["pm_params_primary_model_use"],
        "pm_auto_refresh_clears_model": "call   DWORD PTR ds:0x100224a4" in excerpts["pm_auto_refresh"] and "call   DWORD PTR ds:0x100224a8" in excerpts["pm_auto_refresh"],
        "pm_auto_refresh_reads_parameter_count_and_items": "call   DWORD PTR ds:0x10022098" in excerpts["pm_auto_refresh"] and "call   DWORD PTR ds:0x100220a0" in excerpts["pm_auto_refresh"] and "call   DWORD PTR ds:0x1002209c" in excerpts["pm_auto_refresh"],
        "pm_auto_refresh_sorts_local_parameter_buffer": "call   0x10003d10" in excerpts["pm_auto_refresh"],
        "pm_auto_refresh_builds_model_rows": "push   0x101" in excerpts["pm_auto_refresh"] and "call   DWORD PTR ds:0x100220ac" in excerpts["pm_auto_refresh"],
        "pm_params_delete_calls_parameterslist_delete": "call   DWORD PTR ds:0x1000a070" in excerpts["pm_params_delete_handler"],
        "parameters_list_delete_thunk_jumps_to_vector_erase": "jmp    0x1000de60" in excerpts["parameters_list_delete_thunk"],
        "parameter_vector_erase_updates_end_pointer": "[ecx+0x4],eax" in excerpts["parameter_vector_erase"] and "call   DWORD PTR ds:0x1001704c" in excerpts["parameter_vector_erase"],
        "parameters_list_add_allocates_and_appends": "push   0x8" in excerpts["parameters_list_add"] and "call   0x1000ddb0" in excerpts["parameters_list_add"] and "add    ecx,0x14" in excerpts["parameters_list_append_vector"],
        "parameters_list_destructor_walks_both_pointer_arrays": "[edx+0x18]" in excerpts["parameters_list_destructor"] and "[edx+0x14]" in excerpts["parameters_list_destructor"] and "[ecx+0x24]" in excerpts["parameters_list_destructor"] and "[ecx+0x20]" in excerpts["parameters_list_destructor"],
        "parameters_list_destructor_dispatches_element_deleting_dtor": "call   DWORD PTR [eax]" in excerpts["parameters_list_destructor"],
        "parameters_list_private_destructor_frees_vector_buffers": "call   0x10001c80" in excerpts["parameters_list_private_destructor"] and "[esi+0x14],0x0" in excerpts["parameters_list_private_destructor"] and "[esi+0x20],0x0" in excerpts["parameters_list_private_destructor"],
        "parameters_list_public_destructor_delegates_to_container_cleanup": "jmp    0x1000d8e0" in excerpts["parameters_list_destructor_thunk"],
        "base_pm_auto_workwidget_slot47_is_stub": "ret" in excerpts["pm_auto_base_workwidget_stub"],
        "pm_params_workwidget_slot47_is_stub": "ret" in excerpts["pm_params_workwidget_stub"],
    }

    vtable_path = args.vtable_tsv or Path(__file__).resolve().parents[1] / "analysis/plugins/plugin_vtables.tsv"
    rows = read_vtable_rows(vtable_path)
    targets = {
        "PM_auto_complete_object_slot47": find_target(rows, "PM_auto.dll", ".?AVPM_auto@@", "0x10057860", 47),
        "PM_auto_workwidget_base_slot47": find_target(rows, "PM_auto.dll", ".?AVWorkWidget@@", "0x10057a3c", 47),
        "PM_params_workwidget_slot47": find_target(rows, "PM_params.dll", ".?AVWorkWidget@@", "0x10018da0", 47),
    }
    checks["pm_auto_complete_vtable_overrides_slot47"] = targets["PM_auto_complete_object_slot47"] == "0x100019d0"
    checks["pm_auto_base_workwidget_slot47_targets_stub"] = targets["PM_auto_workwidget_base_slot47"] == "0x10002c70"
    checks["pm_params_workwidget_slot47_targets_stub"] = targets["PM_params_workwidget_slot47"] == "0x10007e10"

    args.out_asm.parent.mkdir(parents=True, exist_ok=True)
    args.out_asm.write_text("\n".join(asm_parts), encoding="utf-8")

    report = {
        "schema": "is2.pm_auto.host_refresh.v1",
        "status": "passed_static_audit" if all(checks.values()) else "failed",
        "static_only": True,
        "source_hashes": hashes,
        "checks": checks,
        "host_context": {
            "global_pointer": "IS.exe:0x4696AC",
            "allocation_size": "0x14",
            "context_plus_0": "appState*",
            "context_plus_4": "opaque QColor subobject (0x10 bytes)",
            "app_state_global": "IS.exe:0x4696A4",
            "app_state_plus_8": "PrimaryModel* (vptr 0x457978)",
            "host_registration_call": "IS.exe:0x410B10 -> WorkWidget vslot +0xCC(context*)",
        },
        "primary_model_identity": {
            "pm_auto_context_global": "PM_auto.dll:0x1007052C",
            "pm_params_context_global": "PM_params.dll:0x10023544",
            "pm_auto_getter": "PM_auto.dll:0x10002BD0",
            "pm_params_getter": "PM_params.dll:0x10007C70",
            "both_resolution_chains": "plugin_global -> context[0] -> appState[+0x08]",
            "pm_auto_destination_field": "PM_auto+0x11C",
            "pm_params_use": "PM_params.dll:0x10004510 calls PrimaryModel::getParamsList() on the getter result",
            "conclusion": "both plugins resolve the same PrimaryModel pointer from the same host PluginHostContext",
        },
        "activation_refresh": {
            "host_callback": "MainForm::on_tabMenu_currentChanged(int), IS.exe:0x4115C0",
            "current_tab_menu_to_workwidget": "QTabWidget::widget(index), then MenuWidget+0x18 -> WorkWidget*",
            "virtual_byte_offset": "0xBC",
            "virtual_slot_index": 47,
            "pm_auto_complete_object_vtable": "0x10057860",
            "pm_auto_slot47_target": "0x100019D0",
            "pm_auto_slot47_behavior": "rebuilds parameter picker model at PM_auto+0x15C and then calls DecompositionWidget::0x10008450",
            "pm_params_slot47_target": "0x10007E10 (RET)",
            "base_pm_auto_workwidget_slot47_target": "0x10002C70 (RET); derived PM_auto overrides it",
            "timing": "host calls QWidget::show(WorkWidget) immediately before slot 47 in the same tab-change handler",
        },
        "parameter_edit_path": {
            "pm_params_add": "0x10005650 -> ParametersList::addParameter -> codeList",
            "pm_params_delete": "0x100059D0 -> remove linked content objects -> ParametersList::deleteParameter -> remove UI row",
            "direct_pm_params_to_pm_auto_import_or_signal": "not found in the inspected PM_params imports/MOC contracts; this is a bounded negative result, not proof of no possible indirect route",
            "refresh_model_policy": "static evidence supports lazy refresh when PM_auto tab is activated; runtime delivery not tested",
        },
        "parameter_ownership": {
            "add_path": "ParametersList::addParameter (0x100139D0) allocates a Parameter wrapper, constructs it, then appends its pointer to the first pointer vector at ParametersListPrivate+0x14 via 0x1000DDB0",
            "delete_path": "ParametersList::deleteParameter (0x10013BC0) delegates to 0x1000DE60, which erases/memmoves the pointer range in the +0x14 vector and updates its end pointer",
            "delete_path_destructor_observation": "no Parameter deleting-destructor call is present in the deleteParameter thunk or vector-erase helper",
            "container_destructor": "ParametersList destructor (0x100136B0 -> 0x1000D8E0) iterates both pointer arrays at private+0x14 and private+0x20 and invokes each non-null element vtable deleting-destructor slot",
            "private_destructor": "ParametersListPrivate destructor (0x100136C0 -> 0x1000D970) frees backing buffers and its private subobject",
            "ownership_conclusion": "the pointer is removed from the +0x14 collection, but the inspected deleteParameter path does not itself destroy the Parameter object; ownership/secondary references after removal remain unresolved",
        },
        "vtable_targets": targets,
        "limitations": [
            "Static PE32 disassembly and RTTI/vtable snapshots only; no Windows runtime execution.",
            "A currentChanged event causes the host to call the current widget hook; behavior when reselecting an already-current tab is not established.",
            "The model is shown before the slot-47 refresh call in the same handler; exact paint scheduling is runtime-dependent.",
            "Parameter object destruction/ownership after ParametersList::deleteParameter remains unresolved; deleteParameter erases the vector entry but no deleting destructor is called in that path.",
            "No guarantee is made about stale Parameter* QVariant payload use outside the observed tab activation path.",
        ],
    }
    args.out_json.parent.mkdir(parents=True, exist_ok=True)
    args.out_json.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"status": report["status"], "passed": sum(checks.values()), "total": len(checks), "failed": [k for k, v in checks.items() if not v], "out_json": str(args.out_json), "out_asm": str(args.out_asm)}, indent=2))
    return 0 if all(checks.values()) else 1


if __name__ == "__main__":
    raise SystemExit(main())
