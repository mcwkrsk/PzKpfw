from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))


def test_desktop_gui_module_imports_without_creating_a_window():
    import is2_re.gui as gui
    assert callable(gui.main)
    assert hasattr(gui, "Is2Studio")


def test_desktop_action_projection_exposes_every_record_once():
    from is2_re.document import ProjectDocument
    from is2_re.gui_models import action_tree_rows
    doc = ProjectDocument.load(ROOT / "samples" / "kursach_user_supplied_42_actions.is2")
    rows = action_tree_rows(doc)
    assert len(rows) == len(doc.actions)
    assert len({r.action_id for r in rows}) == len(doc.actions)
    parent_nine = [r.action_id for r in rows if r.parent_id == "9"]
    assert parent_nine == ["27", "83", "28", "29", "30", "31"]


def test_action_diagram_layout_preserves_composition_and_sibling_chain_edges():
    from is2_re.document import ProjectDocument
    from is2_re.gui_models import action_diagram_layout
    doc = ProjectDocument.load(ROOT / "samples" / "kursach_user_supplied_42_actions.is2")
    rows, positions, composition, sequence = action_diagram_layout(doc)
    assert len(rows) == len(doc.actions)
    assert set(positions) == {node.get("id") for node in doc.actions}
    assert ("9", "27") in composition
    assert ("27", "83") in sequence
    assert ("83", "28") in sequence
