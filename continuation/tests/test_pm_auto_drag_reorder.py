import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def test_drag_and_core_move_snapshot():
    data = json.loads((ROOT / "analysis/pm_auto/drag_reorder.json").read_text(encoding="utf-8"))
    assert data["drag_handler"]["va"] == "0x100064F0"
    assert data["drag_handler"]["callback"] == "FunctionalDiagram::itemDraged(DiagramBlock*, DiagramBlock*)"
    assert data["core_move"]["va"] == "0x1000C020"
    assert data["core_move"]["signature_reconstructed"].endswith("AFElement* predecessor)")


def test_real_model_link_rewire_is_recorded():
    data = json.loads((ROOT / "analysis/pm_auto/drag_reorder.json").read_text(encoding="utf-8"))
    behavior = " ".join(data["core_move"]["confirmed_behavior"])
    for expected in ("Unlinks and removes", "composition link", "arrangement links", "codeStructure"):
        assert expected in behavior


def test_double_click_is_explicitly_partial():
    data = json.loads((ROOT / "analysis/pm_auto/drag_reorder.json").read_text(encoding="utf-8"))
    assert data["related_double_click"]["va"] == "0x10006EB0"
    assert data["related_double_click"]["unresolved"]
    assert "0x10015990" in " ".join(data["related_double_click"]["confirmed_behavior"])


def test_binary_hash_pins_match_snapshot():
    data = json.loads((ROOT / "analysis/pm_auto/drag_reorder.json").read_text(encoding="utf-8"))
    assert data["binaries"]["PM_auto.dll"]["sha256"] == "c3cbde9cb83a7c10774a0faa4541622005856d09b79ce94dec3d8bd90d083018"
    assert data["binaries"]["MAIWmodels.dll"]["sha256"] == "80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525"
