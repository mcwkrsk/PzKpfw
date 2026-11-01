import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DATA = json.loads((ROOT / "analysis/pm_auto/structural_edit_commands.json").read_text(encoding="utf-8"))
AUDIT = json.loads((ROOT / "analysis/pm_auto/structural_edit_audit.json").read_text(encoding="utf-8"))


def test_structural_command_inventory_is_complete():
    assert DATA["schema"] == "is2.pm_auto.structural_edit_commands.v1"
    commands = {item["slot"]: item for item in DATA["commands"]}
    assert set(commands) == {
        "newAlt_slot()", "newSeq_slot()", "newLoop_slot()", "toElementary_slot()",
        "newElementAfter_slot()", "newElementBefore_slot()", "deleteElement_slot()",
    }
    assert commands["newAlt_slot()"]["integer_argument"] == 2
    assert commands["newSeq_slot()"]["integer_argument"] == 2


def test_insert_before_and_after_share_core_api_but_use_different_anchors():
    commands = {item["slot"]: item for item in DATA["commands"]}
    after = commands["newElementAfter_slot()"]
    before = commands["newElementBefore_slot()"]
    assert after["core_api"] == before["core_api"]
    assert "selected element as the insertion anchor" in after["confirmed"][1]
    assert "previous sibling" in before["confirmed"][1]


def test_delete_path_reaches_core_remove_and_child_link_cleanup():
    delete = next(c for c in DATA["commands"] if c["slot"] == "deleteElement_slot()")
    assert delete["call_chain"] == ["0x1000A4E0", "0x1000DB60", "0x1000DC44"]
    assert any("_removeAFElementChildren" in s for s in delete["confirmed"])
    assert any("unlink(true)" in s and "removeFromList()" in s for s in delete["confirmed"])


def test_enum_values_are_recorded_without_inventing_status_names():
    values = DATA["core_enum_arguments_observed"]
    assert values["AFStructure::makeAlternative"] == {
        "setType": 1, "setStatus": 1, "setFormalization": 0
    }
    assert values["AFStructure::makeElementary"] == {
        "setType": 0, "setStatus": 0, "setFormalization": 0
    }
    assert "status/formalization" in DATA["limitations"][1]


def test_audit_uses_exact_binaries_and_passes():
    assert AUDIT["status"] == "passed"
    assert AUDIT["hashes"]["PM_auto.dll"] == DATA["binaries"]["PM_auto.dll"]["sha256"]
    assert AUDIT["hashes"]["MAIWmodels.dll"] == DATA["binaries"]["MAIWmodels.dll"]["sha256"]
    assert all(x["status"] == "passed" for x in AUDIT["functions"].values())
    assert all(x["status"] == "passed" for x in AUDIT["core_implementations"].values())
