from pathlib import Path
import json

ROOT = Path(__file__).resolve().parents[1]


def test_parameter_table_report_is_complete_and_cautious():
    report = ROOT / "docs/29_stage1_17_parameter_table_sync_and_link_cleanup.md"
    text = report.read_text(encoding="utf-8")
    for token in (
        "0x10003940", "Parameter::setGroup", "AIElement::setCodingType",
        "Parameter::setNumber", "Parameter::setObject", "Parameter::setSign",
        "AIElement::setName", "0x100059D0", "LinkType=4",
        "post-erase ownership", "не обнаружено", "не установлены",
    ):
        assert token in text


def test_parameter_table_column_map_is_exact():
    report = (ROOT / "docs/29_stage1_17_parameter_table_sync_and_link_cleanup.md").read_text(encoding="utf-8")
    expected = [
        "| 0 | group | `Parameter::setGroup(int)`",
        "| 1 | coding type | `AIElement::setCodingType(CodingType)`",
        "| 2 | number | `Parameter::setNumber(int)`",
        "| 3 | associated object | `Parameter::setObject(Object*)`",
        "| 4 | sign | `Parameter::setSign(MString)`",
        "| 5 | name | `AIElement::setName(MString)`",
    ]
    for row in expected:
        assert row in report


def test_disassembly_snapshots_cover_handler_and_parameter_delete():
    table_asm = ROOT / "analysis/disassembly/pm_params_parameter_table_sync.asm"
    slots_asm = ROOT / "analysis/disassembly/pm_params_parameter_slots.asm"
    assert table_asm.exists() and slots_asm.exists()
    assert "10003940" in table_asm.read_text(encoding="utf-8")
    slots = slots_asm.read_text(encoding="utf-8")
    for address in ("10005650", "100059d0", "10005b20"):
        assert address in slots.lower()


def test_audit_script_pins_original_binaries_and_emits_static_limits():
    script = (ROOT / "tools/audit_pm_params_parameter_table.py").read_text(encoding="utf-8")
    assert "22c867d11fcc724b79fbff420f514d7adccd7a8eb7565e9b4b43e60b267ea781" in script
    assert "80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525" in script
    assert "static_only" in script
    assert "Post-erase ownership" in script or "post-erase ownership" in script
