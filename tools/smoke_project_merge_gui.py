#!/usr/bin/env python3
"""GUI smoke for graph comparison and conflict-resolved three-way merge."""
from __future__ import annotations

from pathlib import Path
import sys
import tempfile
import tkinter as tk
from tkinter import ttk
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re import ProjectDocument
from is2_re.gui import Is2Studio

FIXTURE = ROOT / "tests" / "fixtures" / "minimal.is2"
GRAPH_FIXTURE = ROOT / "samples" / "synthetic_relationships_0.7.3.is2"


def _walk(widget):
    yield widget
    for child in widget.winfo_children():
        yield from _walk(child)


def _dialogs(app):
    return [child for child in app.winfo_children() if isinstance(child, tk.Toplevel)]


def main() -> int:
    with tempfile.TemporaryDirectory(prefix="pzkpfw-merge-gui-") as temp:
        folder = Path(temp)
        base_path, local_path, incoming_path = folder / "base.is2", folder / "local.is2", folder / "incoming.is2"
        base = ProjectDocument.load(FIXTURE)
        base.save(base_path)
        local, incoming = base.clone(), base.clone()
        local.update_project_metadata(name="Local branch")
        incoming.update_project_metadata(name="Incoming branch")
        local.save(local_path); incoming.save(incoming_path)

        app = Is2Studio()
        try:
            app.doc = ProjectDocument.load(local_path)
            app.path = local_path
            app._reset_history(saved=True)
            app.refresh_all()
            app._set_enabled(True)
            app.update_idletasks()

            with patch("is2_re.gui.filedialog.askopenfilename", side_effect=[str(base_path), str(incoming_path)]):
                app.show_three_way_merge()
            dialogs = _dialogs(app)
            assert dialogs, "three-way merge dialog was not opened"
            merge_dialog = dialogs[-1]
            widgets = list(_walk(merge_dialog))
            tree = next(widget for widget in widgets if isinstance(widget, ttk.Treeview))
            assert tree.get_children(""), "expected a conflicting root metadata field"
            tree.selection_set(tree.get_children("")[0])
            accept_incoming = next(widget for widget in widgets if isinstance(widget, ttk.Button) and widget.cget("text") == "Принять входящую")
            apply_button = next(widget for widget in widgets if isinstance(widget, ttk.Button) and widget.cget("text") == "Применить объединение")
            with patch("is2_re.gui.messagebox.showinfo"):
                accept_incoming.invoke()
                apply_button.invoke()
                app.update()
            assert app.doc.root.get("name") == "Incoming branch"
            assert app.dirty and app.history.can_undo

            # Open the side-by-side graph comparison and make sure both panels
            # render actual Canvas nodes from separate project snapshots.
            graph_reference = ProjectDocument.load(GRAPH_FIXTURE)
            graph_current = graph_reference.clone()
            graph_current.action("1").set("name", "Changed graph node")
            graph_path = folder / "graph-reference.is2"
            graph_reference.save(graph_path)
            app.doc = graph_current
            app.path = None
            with patch("is2_re.gui.filedialog.askopenfilename", return_value=str(graph_path)):
                app.show_relationship_graph_diff()
            graph_dialog = _dialogs(app)[-1]
            canvases = [widget for widget in _walk(graph_dialog) if isinstance(widget, tk.Canvas)]
            assert len(canvases) == 2, "side-by-side graph canvases were not created"
            assert all(canvas.find_all() for canvas in canvases), "graph canvases contain no rendered elements"
        finally:
            app.destroy()
    print("PASS: GUI three-way merge conflict resolution and side-by-side relationship graph comparison")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
