from pathlib import Path
import json

ROOT = Path(__file__).resolve().parents[1]


def test_type4_report_establishes_aecontentlink_identity_and_endpoints():
    report = (ROOT / "docs/30_stage1_17_linktype4_aecontentlink_contract.md").read_text(encoding="utf-8")
    for token in (
        "`LinkType == 4`", "`AEContentLink`", "0x10003400", "0x10017188",
        "0x10003310", "AFElement*", "AIElement*", "0x10003640",
        "private `+0x2C`", "private `+0x30`", "0x100059D0",
        "Post-erase ownership", "No Windows runtime",
    ):
        assert token in report


def test_type4_static_audit_all_checks_pass():
    data = json.loads((ROOT / "analysis/pm_params/aecontentlink_type4_audit.json").read_text(encoding="utf-8"))
    assert data["checks_passed"] == data["checks_total"] == 19
    assert data["contract"] == {
        "dynamic_class": "AEContentLink",
        "link_type": 4,
        "endpoint_0": "AFElement*",
        "endpoint_1": "AIElement*",
        "marker_offset": "AEContentLinkPrivate+0x2C",
        "power_offset": "AEContentLinkPrivate+0x30",
        "link_type_offset": "AEBinaryLinkPrivate+0x28",
    }


def test_disassembly_contains_constructor_and_endpoint_accessors():
    ctor = (ROOT / "analysis/disassembly/maiwmodels_aecontentlink_factory_and_dedup.asm").read_text(encoding="utf-8")
    access = (ROOT / "analysis/disassembly/maiwmodels_aecontentlink_endpoints_and_fields.asm").read_text(encoding="utf-8")
    assert "100026a0" in ctor.lower() and "10003400" in access.lower()
    for addr in ("10003180", "10003610", "10003620", "10003630", "10003640", "10003670", "10003680"):
        assert addr in access.lower()


def test_parameter_report_crosslinks_resolved_type4_contract():
    report = (ROOT / "docs/29_stage1_17_parameter_table_sync_and_link_cleanup.md").read_text(encoding="utf-8")
    assert "docs/30_stage1_17_linktype4_aecontentlink_contract.md" in report
    assert "идентифицировано как `AEContentLink`" in report
