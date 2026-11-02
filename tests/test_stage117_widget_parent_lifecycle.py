import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
AUDIT = ROOT / "analysis/host_interface/widget_parent_ownership.json"


def load_audit():
    return json.loads(AUDIT.read_text(encoding="utf-8"))


def test_widget_parent_lifecycle_audit_is_sha_pinned_and_passes():
    data = load_audit()
    assert data["audit"] == "stage117-workwidget-menuwidget-parent-lifecycle"
    assert data["static_only"] is True
    assert data["status"] == "PASS"
    assert data["passed"] == data["total"] == 31
    assert data["host_sha256"] == "ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2"
    assert len(data["binary_sha256"]) == 7


def test_registration_and_reciprocal_pointer_contract_are_recorded():
    data = load_audit()
    registration = data["registration"]
    assert registration["entry_va"] == "0x00410B10"
    assert registration["mainform_tab_widget_member"] == "+0x80"
    assert registration["mainform_workwidget_layout_member"] == "+0x88"
    links = data["reciprocal_raw_links"]
    assert links["helper_va"] == "0x00413DD0"
    assert links["workwidget_plus_0x20"] == "MenuWidget*"
    assert links["menuwidget_plus_0x18"] == "WorkWidget*"


def test_menuwidget_post_link_virtual_is_noop_in_all_five_plugins():
    data = load_audit()
    slots = data["plugin_menuwidget_post_link_slot"]["per_plugin"]
    assert len(slots) == 5
    assert all(item["slot_index"] == 45 for item in slots.values())
    assert all(item["slot_offset"] == "0xB4" for item in slots.values())
    assert all(item["is_single_ret_stub"] for item in slots.values())
    assert all(item["shared_virtual_slots_4_through_44_match_workwidget"] for item in slots.values())


def test_menuwidget_has_no_custom_moc_slots_or_signals_in_any_plugin():
    evidence = load_audit()["plugin_menuwidget_moc_contract"]["per_plugin"]
    assert len(evidence) == 5
    for item in evidence.values():
        assert item["menuwidget_method_count"] == 0
        assert item["menuwidget_signal_count"] == 0
        assert item["menuwidget_methods"] == []
        assert item["static_metacall_matches_menuwidget_slot_b4"] is True


def test_close_handler_removes_page_but_does_not_clear_backlink():
    data = load_audit()
    handler = data["destroyed_handler"]
    assert handler["entry_va"] == "0x00411A00"
    assert "QTabWidget::removeTab(index)" in handler["actions"][1]
    assert handler["does_not_clear_menuwidget_plus_0x18"] is True
    assert handler["does_not_reparent_menuwidget_after_removal"] is True
    assert handler["does_not_show_an_explicit_menuwidget_deletion_in_bounded_body"] is True


def test_qt_parent_retention_is_separated_from_runtime_claims():
    data = load_audit()
    qt = data["qt_contract"]
    assert "QTabWidget::removeTab -> internal QStackedWidget::removeWidget" == qt["removetab_path"]
    assert "parent object/widget as QStackedWidget" in qt["removal_semantics"]
    assert "exact minor-version runtime" in qt["version_caveat"]
    limitations = " ".join(data["limitations"])
    assert "No runtime crash was observed" in limitations
    assert "runtime" in limitations


def test_report_and_disassembly_snapshots_exist():
    report = (ROOT / "docs/49_stage1_17_workwidget_menuwidget_parent_lifecycle.md").read_text(encoding="utf-8")
    assert "31/31" in report
    assert "MainForm+0x3C" in report
    assert "no runtime consumer dereference/UAF/crash has been observed" in report
    required = [
        "workwidget_register_0x410b10.asm",
        "workwidget_menu_link_helper_0x413dd0.asm",
        "workwidget_destroyed_handler_0x411a00.asm",
        "mainform_ctor_calls_ui_setup_0x41056d.asm",
        "mainform_root_frame_construct_0x4122ba.asm",
        "mainform_nested_frame_layout_construct_0x41317a.asm",
        "mainform_tab_menu_current_changed_0x4115c0.asm",
    ]
    for name in required:
        assert "disassembly of section .text" in (ROOT / "analysis/disassembly" / name).read_text(encoding="utf-8").lower()
    for stem in ["Model_Visualiser", "PM_auto", "PM_matrix_web", "PM_params", "PM_spec_WEB"]:
        assert (ROOT / "analysis/disassembly" / f"menuwidget_b4_{stem}.asm").is_file()


def test_workwidget_qobject_parent_chain_is_recovered():
    data = load_audit()
    ownership = data["workwidget_qobject_ownership"]
    assert ownership["ui_setup_helper_va"] == "0x00412140"
    chain = ownership["parent_chain"]
    assert [item["object"] for item in chain] == [
        "MainForm+0x3C", "MainForm+0x84", "MainForm+0x88", "registered WorkWidget"
    ]
    assert chain[0]["qobject_parent"] == "MainForm (constructor argument [ebp+0x08])"
    assert chain[1]["qobject_parent"] == "MainForm+0x3C (argument [EDI+0x04])"
    assert chain[2]["qobject_parent_widget"] == "MainForm+0x84 QFrame (argument [EDI+0x4C])"
    assert "MainForm+0x84 QFrame" in chain[3]["qobject_parent_after_addchildwidget"]
    assert "not established" in ownership["per_tab_close"].lower()
    assert "MainForm recursively destroys" in ownership["eventual_teardown"]


def test_layout_parent_chain_disassembly_snapshots_exist():
    required = [
        "mainform_ctor_calls_ui_setup_0x41056d.asm",
        "mainform_root_frame_construct_0x4122ba.asm",
        "mainform_nested_frame_layout_construct_0x41317a.asm",
        "mainform_tab_menu_current_changed_0x4115c0.asm",
    ]
    for name in required:
        body = (ROOT / "analysis/disassembly" / name).read_text(encoding="utf-8").lower()
        assert "disassembly of section .text" in body


def test_tab_change_is_navigation_not_the_destroyed_handler():
    navigation = load_audit()["tab_navigation"]
    assert navigation["handler_va"] == "0x004115C0"
    assert "QTabWidget" in navigation["observed_actions"][1]
    assert "WorkWidget virtual slot +0xBC" in navigation["observed_actions"][3]
    assert navigation["close_button_api_imports"] == {
        "QTabWidget::setTabsClosable": False,
        "QTabBar::setTabButton": False,
    }
    assert "not a per-tab destruction/close handler" in navigation["interpretation"]
