#!/usr/bin/env python3
"""SHA-pinned static audit of WorkWidget/MenuWidget registration and close paths.

This audit recovers the host's two-way raw widget links, Qt page registration,
the bounded QObject::destroyed handler, and the MainForm-owned QFrame/QGridLayout
parent chain used to host WorkWidget pages. Qt layout/object-tree semantics are
recorded as an external semantic dependency; this
script does not execute the Windows application or prove runtime UAF behavior.
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
from recover_workwidget_contract import recover_one  # noqa: E402
from recover_qt_moc_contracts import recover as recover_qt_moc  # noqa: E402
EXPECTED = {
    "IS.exe": "ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2",
    "MAIWmodels.dll": "80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525",
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
RANGES = {
    "workwidget_register_0x410b10.asm": (0x410B10, 0x410BE2),
    "workwidget_menu_link_helper_0x413dd0.asm": (0x413DD0, 0x413DE8),
    "workwidget_destroyed_handler_0x411a00.asm": (0x411A00, 0x411AEA),
    "mainform_ctor_calls_ui_setup_0x41056d.asm": (0x41056D, 0x410585),
    "mainform_root_frame_construct_0x4122ba.asm": (0x4122BA, 0x412310),
    "mainform_nested_frame_layout_construct_0x41317a.asm": (0x41317A, 0x41329F),
    "mainform_tab_menu_current_changed_0x4115c0.asm": (0x4115C0, 0x41175B),
    "mainform_tabwidget_construct_and_name_0x413058.asm": (0x413058, 0x4130B0),
    "mainform_connect_slots_by_name_0x4132b2.asm": (0x4132B2, 0x4132D5),
    "tabmenu_objectname_literal_helper_0x410800.asm": (0x410800, 0x410810),
}


def sha256(path: pathlib.Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def run_objdump(*args: str, path: pathlib.Path) -> str:
    proc = subprocess.run(["objdump", *args, str(path)], check=True,
                          capture_output=True, text=True)
    return proc.stdout


def disasm(binary: pathlib.Path, start: int, stop: int) -> str:
    return run_objdump(
        "-d", "-Mintel", f"--start-address=0x{start:x}",
        f"--stop-address=0x{stop:x}", path=binary,
    ).lower()


def build(original_dir: pathlib.Path) -> tuple[dict, dict[str, str]]:
    files = {
        "IS.exe": original_dir / "IS.exe",
        "MAIWmodels.dll": original_dir / "MAIWmodels.dll",
    }
    files.update({name: original_dir / "modules" / name for name in PLUGINS})

    hashes: dict[str, str] = {}
    for name, path in files.items():
        if not path.is_file():
            raise FileNotFoundError(f"Missing required binary: {path}")
        digest = sha256(path)
        if digest != EXPECTED[name]:
            raise ValueError(
                f"SHA-256 mismatch for {name}: expected {EXPECTED[name]}, got {digest}"
            )
        hashes[name] = digest

    host = files["IS.exe"]
    chunks = {name: disasm(host, *bounds) for name, bounds in RANGES.items()}
    menu_slot_evidence: dict[str, dict] = {}
    menu_moc_evidence: dict[str, dict] = {}
    vtable_shared_slot_evidence: dict[str, dict] = {}
    for plugin_name in PLUGINS:
        parsed = recover_one(files[plugin_name])
        table = next(
            table for table in parsed["tables"]
            if table["class"] == "MenuWidget" and table["object_offset"] == 0
        )
        slot = next(slot for slot in table["slots"] if slot["index"] == 45)
        work_table = next(
            table for table in parsed["tables"]
            if table["class"] == "WorkWidget" and table["object_offset"] == 0
        )
        shared_differences = [
            index for index in range(4, 45)
            if table["slots"][index]["target_va"] != work_table["slots"][index]["target_va"]
        ]
        target = slot["target_va"]
        body = disasm(files[plugin_name], target, target + 1)
        moc = recover_qt_moc(files[plugin_name])
        menu_meta = next(obj for obj in moc["qmetaobjects"] if obj["class_name"] == "MenuWidget")
        work_meta = next(obj for obj in moc["qmetaobjects"] if obj["class_name"] == "WorkWidget")
        snapshot_name = f"menuwidget_b4_{pathlib.Path(plugin_name).stem}.asm"
        chunks[snapshot_name] = body
        is_ret = bool(re.search(
            rf"^\s*{target:x}:\s+c3\s+ret\s*$", body, re.M
        ))
        menu_slot_evidence[plugin_name] = {
            "vftable_va": f"0x{table['vftable_va']:08X}",
            "slot_index": 45,
            "slot_offset": "0xB4",
            "target_va": f"0x{target:08X}",
            "is_single_ret_stub": is_ret,
            "shared_virtual_slots_4_through_44_match_workwidget": not shared_differences,
            "shared_virtual_slot_differences": shared_differences,
        }
        menu_moc_evidence[plugin_name] = {
            "menuwidget_method_count": menu_meta["method_count"],
            "menuwidget_signal_count": menu_meta["signal_count"],
            "menuwidget_methods": menu_meta["methods"],
            "menuwidget_static_metacall_va": f"0x{menu_meta['static_metacall_va']:08X}",
            "workwidget_method_count": work_meta["method_count"],
            "workwidget_signal_count": work_meta["signal_count"],
            "static_metacall_matches_menuwidget_slot_b4": menu_meta["static_metacall_va"] == target,
            "binary_sha256": moc["sha256"],
        }
    registration = chunks["workwidget_register_0x410b10.asm"]
    link_helper = chunks["workwidget_menu_link_helper_0x413dd0.asm"]
    destroyed = chunks["workwidget_destroyed_handler_0x411a00.asm"]
    ctor_setup = chunks["mainform_ctor_calls_ui_setup_0x41056d.asm"]
    root_frame = chunks["mainform_root_frame_construct_0x4122ba.asm"]
    nested_frame_layout = chunks["mainform_nested_frame_layout_construct_0x41317a.asm"]
    tab_menu_changed = chunks["mainform_tab_menu_current_changed_0x4115c0.asm"]
    tabwidget_construct = chunks["mainform_tabwidget_construct_and_name_0x413058.asm"]
    connect_slots_by_name = chunks["mainform_connect_slots_by_name_0x4132b2.asm"]
    tabmenu_name_helper = chunks["tabmenu_objectname_literal_helper_0x410800.asm"]
    host_imports = run_objdump("-p", path=host).lower()
    host_bytes = host.read_bytes()
    tabmenu_utf16_present = "tabMenu".encode("utf-16le") in host_bytes
    moc_slot_name_present = b"on_tabMenu_currentChanged" in host_bytes

    checks = {
        "host_sha256_matches_stage117_reference": hashes["IS.exe"] == EXPECTED["IS.exe"],
        "registration_imports_qwidget_setparent": "?setparent@qwidget@@qaexpav1@@z" in host_imports,
        "registration_explicitly_sets_menu_parent_to_mainform": (
            "push   dword ptr [ebp-0x4]" in registration
            and "mov    ecx,edi" in registration
            and "call   dword ptr ds:0x41985c" in registration
        ),
        "registration_adds_workwidget_to_mainform_layout": (
            "mov    ecx,dword ptr [edi+0x88]" in registration
            and "push   esi" in registration
            and "call   dword ptr ds:0x41989c" in registration
        ),
        "mainform_constructor_calls_generated_ui_setup_with_this": (
            "lea    ecx,[ebx+0x38]" in ctor_setup
            and "push   ebx" in ctor_setup
            and "call   0x412140" in ctor_setup
        ),
        "generated_ui_setup_constructs_root_qframe_with_mainform_parent": (
            "push   dword ptr [ebp+0x8]" in root_frame
            and "mov    ecx,ebx" in root_frame
            and "call   dword ptr ds:0x419ad0" in root_frame
            and "mov    dword ptr [edi+0x4],ebx" in root_frame
        ),
        "generated_ui_setup_constructs_workwidget_qframe_with_root_frame_parent": (
            "push   dword ptr [edi+0x4]" in nested_frame_layout
            and "mov    ecx,ebx" in nested_frame_layout
            and "call   dword ptr ds:0x419ad0" in nested_frame_layout
            and "mov    dword ptr [edi+0x4c],ebx" in nested_frame_layout
        ),
        "generated_ui_setup_constructs_qgridlayout_with_workwidget_frame_parent": (
            "push   dword ptr [edi+0x4c]" in nested_frame_layout
            and "mov    ecx,ebx" in nested_frame_layout
            and "call   dword ptr ds:0x419a94" in nested_frame_layout
            and "mov    dword ptr [edi+0x50],ebx" in nested_frame_layout
        ),
        "host_imports_qframe_qgridlayout_and_qlayout_addwidget": all(
            symbol in host_imports for symbol in (
                "?addwidget@qlayout@@qaexpavqwidget@@@z",
                "??0qgridlayout@@qae@pavqwidget@@@z",
                "??0qframe@@qae@pavqwidget@@",
            )
        ),
        "mainform_tab_menu_change_fetches_menu_page_by_index": (
            "mov    ecx,dword ptr [edi+0x80]" in tab_menu_changed
            and "push   esi" in tab_menu_changed
            and "call   dword ptr ds:0x41988c" in tab_menu_changed
        ),
        "mainform_tab_menu_change_reads_workwidget_backlink_and_calls_virtual_refresh": (
            "mov    ebx,dword ptr [eax+0x18]" in tab_menu_changed
            and "call   dword ptr [eax+0xbc]" in tab_menu_changed
        ),
        "mainform_tabwidget_is_named_tabmenu_before_connectslotsbyname": (
            "mov    dword ptr [edi+0x48],edx" in tabwidget_construct
            and "call   esi" in tabwidget_construct
            and "mov    dword ptr [eax],0x459c74" in tabmenu_name_helper
            and tabmenu_utf16_present
        ),
        "mainform_generated_ui_calls_connectslotsbyname_with_mainform": (
            "mov    ebx,dword ptr [ebp+0x8]" in connect_slots_by_name
            and "push   ebx" in connect_slots_by_name
            and "call   dword ptr ds:0x41928c" in connect_slots_by_name
            and "connectslotsbyname@qmetaobject" in host_imports
            and moc_slot_name_present
        ),
        "mainform_tab_current_changed_dereferences_widget_result_without_null_guard": (
            "call   dword ptr ds:0x41988c" in tab_menu_changed
            and re.search(
                r"call\s+dword ptr ds:0x41988c\s*\n\s*[0-9a-f]+:.*mov\s+ebx,dword ptr \[eax\+0x18\]",
                tab_menu_changed, re.S,
            ) is not None
        ),
        "host_does_not_import_qtabwidget_tabsclosable_or_qtabbar_settabbutton": (
            "?settabsclosable@qtabwidget@@" not in host_imports
            and "?settabbutton@qtabbar@@" not in host_imports
        ),
        "registration_links_menu_as_qtabwidget_page": (
            "mov    ecx,dword ptr [esi+0x80]" in registration
            and "push   edi" in registration
            and "call   dword ptr ds:0x419880" in registration
        ),
        "registration_calls_raw_link_helper": "call   0x413dd0" in registration,
        "helper_writes_workwidget_menu_forward_pointer_plus_20": (
            "mov    dword ptr [ecx+0x20],edx" in link_helper
        ),
        "helper_writes_menu_workwidget_back_pointer_plus_18": (
            "mov    dword ptr [edx+0x18],ecx" in link_helper
        ),
        "helper_calls_menu_virtual_slot_plus_b4_after_linking": (
            "mov    ecx,edx" in link_helper
            and "call   dword ptr [eax+0xb4]" in link_helper
        ),
        "destroyed_handler_reads_menu_from_workwidget_plus_20": (
            "mov    eax,dword ptr [ebx+0x20]" in destroyed
        ),
        "destroyed_handler_uses_mainform_qtabwidget_plus_80": (
            "mov    ecx,dword ptr [edi+0x80]" in destroyed
        ),
        "destroyed_handler_enumerates_qtabwidget_pages": (
            "call   dword ptr ds:0x41988c" in destroyed
        ),
        "destroyed_handler_removes_matching_tab_via_removeTab": (
            "call   dword ptr ds:0x419884" in destroyed
        ),
        "destroyed_handler_removes_workwidget_from_mainform_list": (
            "add    edi,0x30" in destroyed
            and "call   dword ptr ds:0x419234" in destroyed
        ),
        "destroyed_handler_does_not_clear_menu_back_pointer_plus_18": (
            "[ebx+0x18]" not in destroyed and "[edi+0x18]" not in destroyed
        ),
        "destroyed_handler_does_not_call_setparent_to_reparent_menu": (
            "0x41985c" not in destroyed
        ),
        "all_five_menuwidget_slot_b4_targets_are_single_ret_stubs": all(
            evidence["is_single_ret_stub"] for evidence in menu_slot_evidence.values()
        ),
        "menuwidget_and_workwidget_share_virtual_targets_slots_4_through_44": all(
            evidence["shared_virtual_slots_4_through_44_match_workwidget"]
            for evidence in menu_slot_evidence.values()
        ),
        "all_five_menuwidget_moc_objects_have_zero_methods_and_signals": all(
            evidence["menuwidget_method_count"] == 0
            and evidence["menuwidget_signal_count"] == 0
            and evidence["menuwidget_methods"] == []
            for evidence in menu_moc_evidence.values()
        ),
        "all_five_menuwidget_static_metacalls_match_the_noop_slot_b4": all(
            evidence["static_metacall_matches_menuwidget_slot_b4"]
            for evidence in menu_moc_evidence.values()
        ),
    }

    result = {
        "audit": "stage117-workwidget-menuwidget-parent-lifecycle",
        "static_only": True,
        "host": "IS.exe",
        "host_sha256": hashes["IS.exe"],
        "binary_sha256": hashes,
        "registration": {
            "entry_va": "0x00410B10",
            "workwidget": "argument at [ebp+0x08], this=ESI",
            "menuwidget": "returned by WorkWidget vtable slot +0xB4, held in EDI",
            "mainform_tab_widget_member": "+0x80",
            "mainform_workwidget_layout_member": "+0x88",
            "mainform_workwidget_list_member": "+0x30",
            "calls": [
                "QLayout::addWidget(WorkWidget*) via IAT 0x0041989C",
                "QWidget::setParent(MainForm*) on MenuWidget via IAT 0x0041985C",
                "host helper 0x00413DD0 establishes reciprocal raw pointers",
                "QTabWidget::addTab(MenuWidget*, label) via IAT 0x00419880",
            ],
        },
        "workwidget_qobject_ownership": {
            "ui_setup_helper_va": "0x00412140",
            "mainform_constructor_callsite": "0x0041057A",
            "ui_substructure_base": "MainForm+0x38 (EDI)",
            "parent_chain": [
                {
                    "object": "MainForm+0x3C",
                    "type": "QFrame",
                    "constructor_callsite": "0x004122DB",
                    "constructor_import": "QFrame(QWidget*, Qt::WindowFlags) at IAT 0x00419AD0",
                    "qobject_parent": "MainForm (constructor argument [ebp+0x08])",
                    "member_store": "[EDI+0x04] = object, where EDI = MainForm+0x38"
                },
                {
                    "object": "MainForm+0x84",
                    "type": "QFrame",
                    "constructor_callsite": "0x00413191",
                    "constructor_import": "QFrame(QWidget*, Qt::WindowFlags) at IAT 0x00419AD0",
                    "qobject_parent": "MainForm+0x3C (argument [EDI+0x04])",
                    "member_store": "[EDI+0x4C] = object"
                },
                {
                    "object": "MainForm+0x88",
                    "type": "QGridLayout",
                    "constructor_callsite": "0x00413231",
                    "constructor_import": "QGridLayout(QWidget*) at IAT 0x00419A94",
                    "qobject_parent_widget": "MainForm+0x84 QFrame (argument [EDI+0x4C])",
                    "member_store": "[EDI+0x50] = object"
                },
                {
                    "object": "registered WorkWidget",
                    "type": "plugin concrete QWidget subclass",
                    "insertion_callsite": "0x00410B5F",
                    "call": "QLayout::addWidget(QWidget*) at IAT 0x0041989C, this=MainForm+0x88",
                    "qobject_parent_after_addchildwidget": "MainForm+0x84 QFrame (unless already that parent)",
                    "ownership_basis": "Qt 5 QLayout::addChildWidget obtains parentWidget() and sets QWidget parent to it when necessary"
                }
            ],
            "tree_shape": [
                "MainForm",
                "  QFrame at MainForm+0x3C",
                "    QFrame at MainForm+0x84",
                "      QGridLayout at MainForm+0x88",
                "      WorkWidget page (QObject child of the +0x84 QFrame after addWidget)"
            ],
            "eventual_teardown": "Under Qt QObject parent-child semantics, destroying MainForm recursively destroys its descendant QFrames and the WorkWidget children of MainForm+0x84; this establishes eventual parent-owned teardown, not the exact sibling destruction order.",
            "per_tab_close": "Not established: the WorkWidget destroyed() handler is a reaction to destruction and removes its MenuWidget tab/list entry; it does not itself prove that a user closing a tab initiates WorkWidget destruction.",
            "external_contract_urls": [
                "https://codebrowser.dev/qt5/qtbase/src/widgets/kernel/qlayout.cpp.html",
                "https://www.qthub.com/static/doc/qt5/qtwidgets/qlayout.html",
                "https://www.qthub.com/static/doc/qt5/qtcore/qobject.html"
            ],
            "qt_version_caveat": "The binary imports Qt5 APIs, but the exact Qt 5 minor-version runtime DLLs were not included; source/API semantics are an external Qt 5 contract, not a runtime observation of this application."
        },
        "tab_navigation": {
            "moc_method": "MainForm::on_tabMenu_currentChanged(int)",
            "handler_va": "0x004115C0",
            "observed_actions": [
                "iterates the WorkWidget pointer collection at MainForm+0x30",
                "obtains the MenuWidget page from QTabWidget at MainForm+0x80 using the changed index",
                "reads WorkWidget* from MenuWidget+0x18",
                "invokes WorkWidget virtual slot +0xBC on the selected page's paired WorkWidget"
            ],
            "interpretation": "This is the tab-selection/navigation path; it is not a per-tab destruction/close handler. Its unchecked widget(index) result creates a conditional edge case when Qt emits currentChanged(-1).",
            "object_name": "tabMenu",
            "object_name_evidence": {
                "qtabwidget_member": "MainForm+0x80 (UI helper EDI+0x48)",
                "literal_helper_va": "0x00410800",
                "literal_descriptor_va": "0x00459C74",
                "utf16_literal_present": tabmenu_utf16_present,
                "setter_callsite": "0x004130A2 (indirect through QObject::setObjectName IAT loaded at 0x00412189)",
            },
            "auto_connect_evidence": {
                "generated_ui_setup_va": "0x00412140",
                "connect_slots_by_name_callsite": "0x004132C9",
                "connect_slots_by_name_iat": "0x0041928C",
                "argument": "MainForm* from [ebp+0x08]",
                "moc_slot_name": "on_tabMenu_currentChanged(int)",
                "moc_slot_target": "0x004115C0",
            },
            "unchecked_widget_lookup": {
                "widget_lookup_callsite": "0x00411677",
                "widget_iat": "0x0041988C",
                "backlink_read": "0x0041167D: mov ebx, dword ptr [eax+0x18]",
                "null_check_between_lookup_and_read": False,
            },
            "close_button_api_imports": {
                "QTabWidget::setTabsClosable": False,
                "QTabBar::setTabButton": False
            },
            "scope_caveat": "No standard Qt tab-close-button setup appears in the named import table. This does not rule out a custom event or a non-imported indirect mechanism; the MOC handler inventory and call graph must be considered with it."
        },
        "plugin_menuwidget_post_link_slot": {
            "slot_offset": "0xB4",
            "per_plugin": menu_slot_evidence,
            "interpretation": "The host invokes this slot immediately after setting the two raw links; each supplied plugin's primary MenuWidget vtable points to a one-byte RET stub. Shared virtual slots 4..44 use identical code targets in the sibling WorkWidget vtable.",
        },
        "plugin_menuwidget_moc_contract": {
            "per_plugin": menu_moc_evidence,
            "interpretation": "The recovered Qt 5 MOC metadata contains no own methods/signals for MenuWidget in any of the five DLLs; static_metacall points to the same no-op address as the primary MenuWidget vtable slot +0xB4.",
        },
        "reciprocal_raw_links": {
            "helper_va": "0x00413DD0",
            "workwidget_plus_0x20": "MenuWidget*",
            "menuwidget_plus_0x18": "WorkWidget*",
            "post_link_virtual": "MenuWidget vtable slot +0xB4",
            "note": "The helper performs raw pointer stores; no refcount/smart-pointer operation is present in this bounded helper.",
        },
        "destroyed_handler": {
            "entry_va": "0x00411A00",
            "menu_source": "sender WorkWidget+0x20",
            "actions": [
                "enumerates QTabWidget pages at MainForm+0x80",
                "calls QTabWidget::removeTab(index) for the matching MenuWidget page",
                "removes sender WorkWidget* from MainForm+0x30",
            ],
            "does_not_clear_menuwidget_plus_0x18": True,
            "does_not_reparent_menuwidget_after_removal": True,
            "does_not_show_an_explicit_menuwidget_deletion_in_bounded_body": True,
        },
        "qt_contract": {
            "reference_api": "Qt 5 QTabWidget / QStackedWidget",
            "qtabwidget_internal_stack": "QTabWidget creates QStackedWidget with itself as parent",
            "addtab_path": "QTabWidget::addTab -> insertTab -> internal QStackedWidget::insertWidget",
            "removetab_path": "QTabWidget::removeTab -> internal QStackedWidget::removeWidget",
            "removal_semantics": "removeTab does not delete the page; QStackedWidget::removeWidget leaves parent object/widget as QStackedWidget",
            "source_urls": [
                "https://codebrowser.dev/qt5/qtbase/src/widgets/widgets/qtabwidget.cpp.html",
                "https://codebrowser.dev/qt5/qtbase/src/widgets/widgets/qstackedwidget.cpp.html",
                "https://www.qthub.com/static/doc/qt5/qtwidgets/qtabwidget.html",
            ],
            "last_tab_current_changed_path": [
                "QStackedLayout::takeAt removes the current/last page and emits widgetRemoved(index)",
                "QStackedWidget forwards widgetRemoved(index) to QTabWidgetPrivate::_q_removeTab(index)",
                "QTabWidgetPrivate::_q_removeTab calls QTabBar::removeTab(index)",
                "QTabBar::removeTab emits currentChanged(-1) when the removed tab was current and no tabs remain",
                "QTabWidgetPrivate::_q_showTab(-1) emits QTabWidget::currentChanged(-1)",
                "MainForm auto-connected on_tabMenu_currentChanged(int) receives -1",
            ],
            "widget_negative_index_semantics": "QTabWidget::widget(-1) delegates to its internal stack; QStackedLayout::widget(-1) returns nullptr.",
            "version_caveat": "The supplied IS.exe imports Qt5Core/Qt5Gui/Qt5Widgets/Qt5Xml/Qt5Network; the matching Qt runtime binaries were not included, so the Qt 5 source/API path is not independently checked against the exact minor-version runtime.",
        },
        "derived_lifecycle": {
            "after_close": "The MenuWidget page is removed from the tab index/list but, under the documented Qt 5 contract, remains a child of the internal QStackedWidget unless another path reparents or destroys it.",
            "back_pointer": "MenuWidget+0x18 remains a raw pointer to the WorkWidget whose destroyed() signal is being handled; the bounded host handler does not clear it. The ordinary currentChanged handler reads only the page returned for the new current index; with surviving tabs, Qt selects a surviving page rather than reselecting the removed one.",
            "last_tab_removal_null_dereference_candidate": {
                "condition": "A WorkWidget is destroyed independently while MainForm remains alive, its MenuWidget is the current and final tab, and the auto-connected receiver is still connected and signals are not blocked.",
                "qt_signal_path": "QStackedLayout::widgetRemoved -> QTabWidgetPrivate::_q_removeTab -> QTabBar::removeTab -> currentChanged(-1) -> QTabWidgetPrivate::_q_showTab(-1) -> QTabWidget::currentChanged(-1)",
                "host_slot": "MainForm::on_tabMenu_currentChanged(int) at 0x004115C0, connected by QMetaObject::connectSlotsByName(MainForm) at 0x004132C9",
                "lookup_and_dereference": "QTabWidget::widget(-1) returns nullptr; host reads [EAX+0x18] at 0x0041167D without a null check.",
                "assessment": "Conditional static null-dereference/crash candidate. No Windows/Qt runtime crash has been observed; the exact Qt minor version and the runtime precondition that WorkWidget destruction occurs while MainForm remains alive are not established.",
            },
            "risk": "Two separate issues remain: an uncleared raw MenuWidget+0x18 backlink; and a conditional null-dereference candidate if the final current tab is removed while MainForm currentChanged slot remains active. The specific currentChanged path does not read the removed page stale backlink when another tab survives.",
            "confidence": "High for the host auto-connect setup, unchecked widget-result dereference and MainForm destroy handler; high for the documented Qt 5 source path; runtime reachability/crash remains untested.",
        },
        "checks": checks,
        "passed": sum(checks.values()),
        "total": len(checks),
        "status": "PASS" if all(checks.values()) else "FAIL",
        "limitations": [
            "Static PE32 disassembly only; no Windows process or Qt object tree was instrumented.",
            "The exact Qt5 minor version used by the target runtime is not confirmed because Qt runtime DLLs were not in the original folder.",
            "The currentChanged slot dereferences QTabWidget::widget(index) without a null check; Qt 5 source semantics yield nullptr for index -1, producing a conditional static null-dereference candidate when the final current tab is removed. No runtime crash was observed.",
            "The stale MenuWidget+0x18 backlink is not consumed by the normal currentChanged path when Qt selects a surviving page; other plugin helper/event paths are not fully excluded.",
            "A separate plugin callback or destructor outside the bounded host paths could reparent/delete the menu; a whole-program dynamic trace is still required.",
            "The conclusion that removed pages remain children follows the Qt 5 QTabWidget/QStackedWidget contract and should be revalidated against the exact bundled Qt5 runtime.",
        ],
    }
    return result, chunks


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--original-dir", type=pathlib.Path,
        default=pathlib.Path(os.environ.get("IS2_ORIGINAL_DIR", ROOT.parent / "original")),
    )
    parser.add_argument("--out", type=pathlib.Path,
                        default=ROOT / "analysis/host_interface/widget_parent_ownership.json")
    parser.add_argument("--snapshot-dir", type=pathlib.Path,
                        default=ROOT / "analysis/disassembly")
    args = parser.parse_args()
    try:
        result, chunks = build(args.original_dir)
    except (OSError, subprocess.CalledProcessError, ValueError) as exc:
        print(str(exc), file=sys.stderr)
        return 2

    if args.snapshot_dir:
        args.snapshot_dir.mkdir(parents=True, exist_ok=True)
        for name, body in chunks.items():
            (args.snapshot_dir / name).write_text(body, encoding="utf-8")
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return 0 if result["status"] == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
