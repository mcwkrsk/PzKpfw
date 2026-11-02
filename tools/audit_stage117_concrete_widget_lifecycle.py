#!/usr/bin/env python3
"""SHA-pinned audit of concrete WorkWidget and nested QObject destruction paths.

Static PE32/RTTI/vtable/disassembly inspection only. This does not execute the
Windows application, observe QObject events, or prove the exact runtime owner
of every page or module object.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import pathlib
import re
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from recover_plugin_rtti import parse_pe  # noqa: E402
from recover_qt_moc_contracts import recover as recover_qt_moc  # noqa: E402

EXPECTED = {
    "IS.exe": "ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2",
    "Model_Visualiser.dll": "1187c7a59ae2dbb8eb91bebbbe89850d9724a62ff186865733930f1488bce880",
    "PM_auto.dll": "c3cbde9cb83a7c10774a0faa4541622005856d09b79ce94dec3d8bd90d083018",
    "PM_matrix_web.dll": "55d25ef0f07a069d80226abae1583928be92cf023fb66ffddbdd32b4f1a66f22",
    "PM_params.dll": "22c867d11fcc724b79fbff420f514d7adccd7a8eb7565e9b4b43e60b267ea781",
    "PM_spec_WEB.dll": "ef0365f6fd3f69648ccf28c5eb564312f70faa9bbd892543a933ec4ae7fa6d68",
}
PLUGINS = [
    "Model_Visualiser.dll", "PM_auto.dll", "PM_matrix_web.dll",
    "PM_params.dll", "PM_spec_WEB.dll",
]
WORKWIDGETS = {
    "PM_auto.dll": {
        "decorated_type": ".?AVPM_auto@@", "class": "PM_auto",
        "dtor_va": 0x100018E0, "size": 0x174,
        "start": 0x100018E0, "stop": 0x10001913,
        "expected_cleanup": "call   0x100053b0",
    },
    "PM_params.dll": {
        "decorated_type": ".?AVParamsWidget@@", "class": "ParamsWidget",
        "dtor_va": 0x100042E0, "size": 0x4C,
        "start": 0x100042E0, "stop": 0x1000431C,
        "expected_cleanup": "call   dword ptr ds:0x1000a7fc",
    },
    "PM_spec_WEB.dll": {
        "decorated_type": ".?AVPM_spec_widget@@", "class": "PM_spec_widget",
        "dtor_va": 0x100021A0, "size": 0x64,
        "start": 0x100021A0, "stop": 0x100021D0,
        "expected_cleanup": "call   dword ptr ds:0x1000c30c",
    },
    "PM_matrix_web.dll": {
        "decorated_type": ".?AVPm_matrix_web@@", "class": "Pm_matrix_web",
        "dtor_va": 0x10001700, "size": 0x60,
        "start": 0x10001700, "stop": 0x1000175E,
        "expected_cleanup": "call   dword ptr ds:0x10008554",
    },
    "Model_Visualiser.dll": {
        "decorated_type": ".?AVModel_Visualiser@@", "class": "Model_Visualiser",
        "dtor_va": 0x10007980, "size": 0x64,
        "start": 0x10007980, "stop": 0x100079D2,
        "expected_cleanup": "call   dword ptr ds:0x1000d554",
    },
}
RANGES = {
    "controlfrom_on_new_0x402390.asm": ("IS.exe", 0x402390, 0x402530),
    "controlfrom_on_saveas_0x402530.asm": ("IS.exe", 0x402530, 0x402740),
    "controlfrom_map_cleanup_0x401770.asm": ("IS.exe", 0x401770, 0x401AB0),
    "controlfrom_secondary_map_cleanup_0x402870.asm": ("IS.exe", 0x402870, 0x402990),
    "controlfrom_askforsaving_adapter_0x401680.asm": ("IS.exe", 0x401680, 0x401720),
    "controlfrom_ctor_cleanup_0x40c600.asm": ("IS.exe", 0x40C600, 0x40C8A8),
    "controlfrom_list_deleteLater_0x402b50.asm": ("IS.exe", 0x402B50, 0x402C50),
    "controlfrom_dtor_0x40ced0.asm": ("IS.exe", 0x40CED0, 0x40CF60),
    "mainform_eventfilter_deleteLater_0x410d50.asm": ("IS.exe", 0x410D50, 0x410E70),
    "pm_auto_slotobject_create_0x1001ae90.asm": ("PM_auto.dll", 0x1001AE90, 0x1001AF40),
    "pm_auto_cbwithbtn_ctor_0x1001b3c0.asm": ("PM_auto.dll", 0x1001B3C0, 0x1001B483),
    "pm_auto_clicked_slotobject_0x1001b610.asm": ("PM_auto.dll", 0x1001B610, 0x1001B680),
    "pm_params_objectsed_widget_dtor_0x100017b0.asm": ("PM_params.dll", 0x100017B0, 0x10001820),
}


def sha256(path: pathlib.Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def objdump(path: pathlib.Path, *args: str) -> str:
    proc = subprocess.run(["objdump", *args, str(path)], check=True,
                          capture_output=True, text=True)
    return proc.stdout


def disasm(path: pathlib.Path, start: int, stop: int) -> str:
    return objdump(path, "-d", "-Mintel", f"--start-address=0x{start:x}",
                   f"--stop-address=0x{stop:x}").lower()


def build(original_dir: pathlib.Path) -> tuple[dict, dict[str, str]]:
    files = {"IS.exe": original_dir / "IS.exe"}
    files.update({name: original_dir / "modules" / name for name in PLUGINS})
    hashes: dict[str, str] = {}
    for name, path in files.items():
        if not path.is_file():
            raise FileNotFoundError(f"Missing required binary: {path}")
        digest = sha256(path)
        if digest != EXPECTED[name]:
            raise ValueError(f"SHA-256 mismatch for {name}: expected {EXPECTED[name]}, got {digest}")
        hashes[name] = digest

    snapshots: dict[str, str] = {}
    for snap, (binary, start, stop) in RANGES.items():
        snapshots[snap] = disasm(files[binary], start, stop)
    for binary, item in WORKWIDGETS.items():
        snapshots[f"{pathlib.Path(binary).stem.lower()}_deleting_dtor_{item['dtor_va']:08x}.asm"] = disasm(
            files[binary], item["start"], item["stop"]
        )

    # Rebuild the primary plugin vtables directly from the exact input images.
    plugin_vtables: dict[str, dict] = {}
    for binary, item in WORKWIDGETS.items():
        parsed = parse_pe(files[binary])
        candidates = [
            table for table in parsed["vtable_candidates"]
            if table["type"] == item["decorated_type"]
        ]
        primary = []
        for table in candidates:
            col = next((c for c in parsed["complete_object_locators"]
                        if c["va"] == table["col_va"]), None)
            if col and col["object_offset"] == 0:
                primary.append((table, col))
        if len(primary) != 1:
            raise ValueError(f"Expected one primary vftable for {binary} {item['decorated_type']}; got {len(primary)}")
        table, col = primary[0]
        slots = table["slots"]
        plugin_vtables[binary] = {
            "class": item["class"],
            "decorated_type": item["decorated_type"],
            "vftable_va": f"0x{table['vftable_va']:08X}",
            "complete_object_locator_va": f"0x{col['va']:08X}",
            "object_offset": col["object_offset"],
            "primary_slot_count": len(slots),
            "deleting_destructor_slot_index": 3,
            "deleting_destructor_slot_offset": "0x0C",
            "deleting_destructor_va": f"0x{slots[3]:08X}" if len(slots) > 3 else None,
            "object_size_from_deleting_destructor": f"0x{item['size']:X}",
        }

    host_full = objdump(files["IS.exe"], "-d", "-Mintel").lower()
    host_402 = snapshots["controlfrom_list_deleteLater_0x402b50.asm"]
    cf_on_new = snapshots["controlfrom_on_new_0x402390.asm"]
    cf_on_saveas = snapshots["controlfrom_on_saveas_0x402530.asm"]
    cf_map_cleanup = snapshots["controlfrom_map_cleanup_0x401770.asm"]
    cf_secondary_cleanup = snapshots["controlfrom_secondary_map_cleanup_0x402870.asm"]
    cf_ask_adapter = snapshots["controlfrom_askforsaving_adapter_0x401680.asm"]
    host_ctor = snapshots["controlfrom_ctor_cleanup_0x40c600.asm"]
    host_cf_dtor = snapshots["controlfrom_dtor_0x40ced0.asm"]
    host_event = snapshots["mainform_eventfilter_deleteLater_0x410d50.asm"]
    auto_create = snapshots["pm_auto_slotobject_create_0x1001ae90.asm"]
    auto_ctor = snapshots["pm_auto_cbwithbtn_ctor_0x1001b3c0.asm"]
    auto_dispatch = snapshots["pm_auto_clicked_slotobject_0x1001b610.asm"]
    params_dtor = snapshots["pm_params_objectsed_widget_dtor_0x100017b0.asm"]

    host_moc = recover_qt_moc(files["IS.exe"])
    controlfrom_moc = next(
        item for item in host_moc["qmetaobjects"] if item["class_name"] == "ControlFrom"
    )
    controlfrom_methods = controlfrom_moc["methods"]

    checks: dict[str, bool] = {}
    for binary, item in WORKWIDGETS.items():
        dtor = snapshots[f"{pathlib.Path(binary).stem.lower()}_deleting_dtor_{item['dtor_va']:08x}.asm"]
        checks[f"{pathlib.Path(binary).stem}_primary_vtable_slot_3_is_expected_deleting_dtor"] = (
            plugin_vtables[binary]["deleting_destructor_va"] == f"0x{item['dtor_va']:08X}"
        )
        checks[f"{pathlib.Path(binary).stem}_deleting_dtor_tests_delete_flag"] = (
            "test   byte ptr [ebp+0x8],0x1" in dtor
        )
        checks[f"{pathlib.Path(binary).stem}_deleting_dtor_uses_expected_object_size"] = (
            f"push   0x{item['size']:x}" in dtor
        )
        checks[f"{pathlib.Path(binary).stem}_deleting_dtor_runs_class_cleanup"] = (
            item["expected_cleanup"] in dtor
        )

    host_refs = [line.strip() for line in host_full.splitlines() if "0x419374" in line]
    checks.update({
        "host_all_three_qobject_deleteLater_iat_references_recognized": len(host_refs) == 3,
        "host_controlfrom_helper_loads_deleteLater_iat_at_402bdb": bool(re.search(r"^\s*402bdb:.*0x419374", host_402, re.M)),
        "controlfrom_moc_class_inherits_workwidget_and_has_ten_methods": (
            controlfrom_moc["super_class"] == "WorkWidget" and controlfrom_moc["method_count"] == 10
        ),
        "controlfrom_moc_static_metacall_is_4010f0": controlfrom_moc["static_metacall_va"] == 0x4010F0,
        "controlfrom_moc_index_1_is_pbnew_and_dispatches_402390": (
            controlfrom_methods[1]["name"] == "on_pbNew_clicked"
            and "401115:" in host_full and "jmp    0x402390" in host_full[host_full.find("401115:"):host_full.find("40111e:")]
        ),
        "controlfrom_moc_index_3_is_pbsaveas_and_dispatches_402530": (
            controlfrom_methods[3]["name"] == "on_pbSaveAs_clicked"
            and "401127:" in host_full and "jmp    0x402530" in host_full[host_full.find("401127:"):host_full.find("401130:")]
        ),
        "controlfrom_saveas_calls_shared_map_cleanup_method_401770": "call   0x401770" in cf_on_saveas,
        "controlfrom_map_cleanup_method_uses_its_this_map_member": (
            "mov    eax,ecx" in cf_map_cleanup and "lea    ebx,[eax+0xac]" in cf_map_cleanup
            and "401a6d:" in cf_map_cleanup and "call   0x402b50" in cf_map_cleanup
        ),
        "controlfrom_new_calls_secondary_cleanup_method_402870": "call   0x402870" in cf_on_new,
        "controlfrom_secondary_method_forwards_to_shared_map_cleanup": (
            "40291d:" in cf_secondary_cleanup and "call   0x401770" in cf_secondary_cleanup
        ),
        "controlfrom_askforsaving_adapter_passes_same_controlfrom_to_secondary_method": (
            "call   0x401b80" in cf_ask_adapter and "mov    ecx,dword ptr [esi]" in cf_ask_adapter
            and "call   0x402870" in cf_ask_adapter
        ),
        "host_controlfrom_helper_calls_loaded_deleteLater_on_selected_list_entry": (
            "402bee:" in host_402 and "mov    ecx,dword ptr [edx]" in host_402
            and "402bf4:" in host_402 and "call   edi" in host_402
        ),
        "host_controlfrom_cleanup_advances_through_pointer_cells_and_alternates": (
            "add    edx,0x4" in host_402 and "xor    esi,0x1" in host_402
        ),
        "controlfrom_ctor_initializes_plus_b0_with_qmap_shared_null": (
            "mov    eax,ds:0x419310" in host_ctor
            and "mov    dword ptr [edi+0xb0],eax" in host_ctor
        ),
        "controlfrom_ctor_invokes_collection_cleanup": "call   0x402b50" in host_ctor,
        "controlfrom_rtti_derives_from_workwidget": any(
            col["type"] == ".?AVControlFrom@@"
            and ".?AVWorkWidget@@" in [base["type"] for base in col["bases"]]
            for col in parse_pe(files["IS.exe"])["complete_object_locators"]
        ),
        "controlfrom_dtor_destroys_plus_b0_container": "lea    ecx,[esi+0xb0]" in host_cf_dtor
            and "call   0x40cb90" in host_cf_dtor,
        "controlfrom_dtor_does_not_directly_call_deleteLater_helper": "call   0x402b50" not in host_cf_dtor,
        "mainform_eventfilter_calls_deleteLater_on_this": (
            "410e4f:" in host_event and "mov    ecx,esi" in host_event
            and "410e51:" in host_event and "call   dword ptr ds:0x419374" in host_event
        ),
        "feedbackform_vtable_slot_30_targets_deleteLater_wrapper": any(
            table["type"] == ".?AVFeedbackForm@@"
            and table["vftable_va"] == 0x4595B4
            and table["slots"][30] == 0x40F380
            for table in parse_pe(files["IS.exe"])["vtable_candidates"]
        ),
        "feedbackform_wrapper_forwards_this_to_deleteLater": (
            "call   dword ptr ds:0x419374" in disasm(files["IS.exe"], 0x40F380, 0x40F389)
        ),
        "pm_auto_slotobject_records_sender_and_captured_widget": (
            "mov    dword ptr [eax+0x8],ecx" in auto_create
            and "mov    dword ptr [eax+0xc],ecx" in auto_create
        ),
        "pm_auto_container_passes_cbwithbtn_into_slotobject_capture": (
            "push   esi" in auto_ctor and "push   edi" in auto_ctor
            and "push   dword ptr [esi+0x20]" in auto_ctor
            and "call   0x1001af10" in auto_ctor
        ),
        "pm_auto_clicked_callback_removes_captured_widget_from_layout": (
            "push   dword ptr [esi+0xc]" in auto_dispatch
            and "mov    ecx,dword ptr [ecx+0x24]" in auto_dispatch
            and "call   dword ptr ds:0x100227f8" in auto_dispatch
        ),
        "pm_auto_clicked_callback_calls_deleteLater_on_captured_widget": (
            "mov    ecx,dword ptr [esi+0xc]" in auto_dispatch
            and "jmp    dword ptr ds:0x10022318" in auto_dispatch
        ),
        "pm_auto_container_ctor_creates_cbwithbtn_as_child": (
            "push   edi" in auto_ctor and "call   0x1001b110" in auto_ctor
        ),
        "pm_params_objectsedit_dtor_fetches_view_model": (
            "mov    ecx,dword ptr [esi+0x3c]" in params_dtor
            and "call   dword ptr ds:0x1000a8d4" in params_dtor
        ),
        "pm_params_objectsedit_dtor_schedules_model_for_deleteLater": (
            "mov    ecx,eax" in params_dtor
            and "call   dword ptr ds:0x1000a220" in params_dtor
        ),
    })

    plugin_delete_later_imports: dict[str, bool] = {}
    for binary in PLUGINS:
        imports = objdump(files[binary], "-p").lower()
        plugin_delete_later_imports[binary] = "?deletelater@qobject@@qaexxz" in imports
    checks["only_pm_auto_and_pm_params_plugins_import_qobject_deleteLater"] = (
        {name for name, present in plugin_delete_later_imports.items() if present}
        == {"PM_auto.dll", "PM_params.dll"}
    )

    result = {
        "audit": "stage117-concrete-workwidget-destruction-paths",
        "schema_version": 1,
        "static_only": True,
        "status": "PASS" if all(checks.values()) else "FAIL",
        "passed": sum(bool(value) for value in checks.values()),
        "total": len(checks),
        "host_sha256": hashes["IS.exe"],
        "binary_sha256": hashes,
        "concrete_workwidget_deleting_destructors": plugin_vtables,
        "host_deleteLater": {
            "iat_va": "0x00419374",
            "direct_iat_references": host_refs,
            "controlfrom_collection_cleanup": {
                "owner_class": "ControlFrom (RTTI derives from WorkWidget; MOC super_class=WorkWidget)",
                "moc_static_metacall_va": "0x004010F0",
                "moc_method_count": 10,
                "confirmed_ui_call_paths": [
                    {
                        "slot": "ControlFrom::on_pbSaveAs_clicked",
                        "moc_method_index": 3,
                        "slot_body_va": "0x00402530",
                        "calls_map_cleanup_method_at": "0x004026BA -> 0x00401770",
                        "map_cleanup_method_calls_helper_at": "0x00401A6D -> 0x00402B50",
                    },
                    {
                        "slot": "ControlFrom::on_pbNew_clicked",
                        "moc_method_index": 1,
                        "slot_body_va": "0x00402390",
                        "calls_secondary_map_path_at": "0x004024D4 -> 0x00402870",
                        "secondary_method_calls_map_cleanup_at": "0x0040291D -> 0x00401770",
                        "map_cleanup_method_calls_helper_at": "0x00401A6D -> 0x00402B50",
                    },
                    {
                        "slot": "ControlFrom::askForSaving-gated adapter path",
                        "adapter_va": "0x00401680",
                        "receiver_provenance": "the adapter dereferences its captured ControlFrom* and calls askForSaving at 0x00401B80 before forwarding the same pointer to 0x00402870",
                    },
                    {
                        "slot": "ControlFrom constructor",
                        "constructor_va": "0x0040C600",
                        "helper_call_va": "0x0040C873",
                    },
                ],
                "map_object_address": "ControlFrom+0xAC; QMapDataBase* field observed at +0xB0",
                "map_value_type": "unresolved; helper selects alternating 32-bit cells as QObject* receivers",
                "helper_va": "0x00402B50",
                "deleteLater_iat_loaded_at": "0x00402BDB",
                "indirect_call_va": "0x00402BF4",
                "collection_member": "ControlFrom+0xB0",
                "collection_initialization": "QMapDataBase::shared_null at 0x00419310",
                "controlfrom_vftable_va": "0x00459220",
                "controlfrom_rtti": ".?AVControlFrom@@ derives from WorkWidget",
                "observed_iteration": "iterates the copied Qt map data; the helper's iterator advances through 32-bit cells and toggles selection, calling deleteLater on selected QObject* values. Exact map key/value type is unresolved",
                "other_static_callers": ["0x00401A6D", "0x0040C873"],
                "bounded_caller_type": {
                    "0x0040C873": "ControlFrom constructor passes its this pointer",
                    "0x00401A6D": "ControlFrom shared map-cleanup method 0x00401770, reached from the New and Save As MOC slots",
                },
                "destructor_path": "ControlFrom deleting destructor 0x0040CED0 calls container destructor helper 0x0040CB90 on +0xB0; it does not directly call 0x00402B50",
            },
            "feedbackform_virtual_wrapper": {
                "wrapper_va": "0x0040F380",
                "class_rtti": ".?AVFeedbackForm@@",
                "vftable_va": "0x004595B4",
                "slot_index": 30,
                "receiver": "FeedbackForm this; wrapper forwards ECX to QObject::deleteLater",
            },
            "mainform_eventfilter": {
                "entry_va": "0x00410D50",
                "call_va": "0x00410E51",
                "receiver": "MainForm this (ECX explicitly restored from ESI at 0x00410E4F)",
            },
        },
        "plugin_deleteLater": {
            "PM_auto.dll": {
                "iat_va": "0x10022318",
                "dispatcher_va": "0x1001B610",
                "connection_setup_va": "0x1001B3C0",
                "captured_pointer": "CbWithBtn* (passed as constructor ESI and stored in slot-object +0x0C)",
                "preceding_layout_operation": "QLayout::removeWidget(captured CbWithBtn*) via IAT 0x100227F8",
                "operation": "QObject::deleteLater(captured CbWithBtn*)",
            },
            "PM_params.dll": {
                "iat_va": "0x1000A220",
                "call_va": "0x100017F4",
                "enclosing_destructor": "ObjectsEditWidget deleting destructor 0x100017B0",
                "receiver": "QAbstractItemModel*: QAbstractItemView::model() returned from the view pointer at ObjectsEditWidget+0x3C",
                "operation": "QObject::deleteLater(QAbstractItemModel*)",
            },
            "PM_spec_WEB.dll": {"imports_qobject_deleteLater": False},
            "PM_matrix_web.dll": {"imports_qobject_deleteLater": False},
            "Model_Visualiser.dll": {"imports_qobject_deleteLater": False},
        },
        "interpretation": {
            "all_five_concrete_workwidget_types_expose_deleting_destructor": True,
            "what_this_proves": "Each plugin's concrete primary WorkWidget vftable has slot index 3 at byte offset 0x0C pointing to a class-specific deleting-destructor implementation with a size-guarded operator-delete path.",
            "what_this_does_not_prove": "This does not prove that the host close handler or Qt runtime actually invokes the deleting destructor for a top-level WorkWidget. The caller/owner path for those five top-level objects remains unresolved.",
            "controlfrom_cleanup_scope": "The ControlFrom list cleanup is a distinct helper path; its collection item type is not proven to be one of the five top-level plugin WorkWidgets.",
        },
        "checks": checks,
        "limitations": [
            "Static SHA-pinned PE32 disassembly and RTTI/vtable recovery only; no Windows application execution or QObject destruction trace.",
            "A deleting destructor in each concrete WorkWidget vtable proves destruction support, not who invokes it or whether it is invoked on close.",
            "The top-level WorkWidget deleting-destructor caller/owner path remains unresolved despite all five vtable entries being identified.",
            "The ControlFrom+0xB0 QMapDataBase-backed collection's exact key/value types remain unresolved; no claim is made that it stores top-level plugin WorkWidget pointers.",
            "The Qt runtime binaries and exact Qt minor version are not in the supplied package, so deferred deletion and QObject parent destruction timing remain runtime questions.",
        ],
    }
    return result, snapshots


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--original-dir", type=pathlib.Path,
                        default=pathlib.Path(os.environ.get("IS2_ORIGINAL_DIR", ROOT.parent / "original")))
    parser.add_argument("--out", type=pathlib.Path,
                        default=ROOT / "analysis/host_interface/concrete_widget_lifecycle.json")
    parser.add_argument("--snapshot-dir", type=pathlib.Path,
                        default=ROOT / "analysis/disassembly")
    args = parser.parse_args()
    try:
        result, snapshots = build(args.original_dir)
    except (OSError, subprocess.CalledProcessError, ValueError) as exc:
        print(str(exc), file=sys.stderr)
        return 2

    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    args.snapshot_dir.mkdir(parents=True, exist_ok=True)
    for name, text in snapshots.items():
        (args.snapshot_dir / name).write_text(text, encoding="utf-8")
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return 0 if result["status"] == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
