import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DATA = json.loads((ROOT / "analysis/pm_auto/content_handlers.json").read_text(encoding="utf-8"))


def test_content_handler_snapshot_has_five_functions():
    assert DATA["schema"] == "is2.pm_auto.content_handlers.v1"
    assert len(DATA["handlers"]) == 5
    assert {h["va"] for h in DATA["handlers"]} == {
        "0x10005F00", "0x10006DC0", "0x10006BF0", "0x10005890", "0x100059C0"
    }


def test_marker_bytes_and_flags_are_preserved_without_semantic_guess():
    plus, dot, star, remove, _name = DATA["handlers"]
    assert (plus["marker_byte"], plus["boolean_argument"]) == ("0x2B", False)
    assert (dot["marker_byte"], dot["boolean_argument"]) == ("0x2E", False)
    assert star["va"] == "0x10006BF0"
    assert any("removeContentLink" in step and "'*', false" in step for step in star["steps"])
    assert any("addContentLink" in s and "'*', true" in s for s in star["steps"])
    assert remove["core_calls"] == ["AEBinaryLink::unlink(true)", "AEBinaryLink::removeFromList()"]
    assert DATA["unknowns"][0].startswith("Domain meaning")


def test_name_editor_normalization_and_core_mutation():
    name_handler = next(h for h in DATA["handlers"] if h["va"] == "0x100059C0")
    assert name_handler["text_path"] == [
        "QTextEdit::toPlainText", "QString::simplified", "QString::trimmed",
        "QString::toStdWString", "MString(wchar_t*)"
    ]
    assert name_handler["core_call"] == "AElement::setName(MString)"


def test_runtime_claim_is_explicitly_false():
    assert DATA["runtime_validation"] is False
