#!/usr/bin/env python3
"""GUI smoke for the project comparison and selective restore workflow."""
from __future__ import annotations

from pathlib import Path
import sys
import tempfile
import tkinter as tk
from tkinter import ttk
from unittest.mock import patch
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re import ProjectDocument
from is2_re.gui import Is2Studio

FIXTURE = ROOT / "tests" / "fixtures" / "minimal.is2"


def _walk(widget):
    yield widget
    for child in widget.winfo_children():
        yield from _walk(child)


def main() -> int:
    with tempfile.TemporaryDirectory(prefix="pzkpfw-diff-gui-") as temp:
        temp_dir = Path(temp)
        reference_path = temp_dir / "reference.is2"
        current_path = temp_dir / "current.is2"

        reference = ProjectDocument.load(FIXTURE)
        extension = ET.SubElement(reference.root, "extensions")
        ET.SubElement(extension, "legacy", {"id": "old-1", "kind": "review"}).text = "reference value"
        reference.save(reference_path)

        current = reference.clone()
        current.update_project_metadata(name="Current version")
        current.root.find("extensions").remove(current.root.find("extensions/legacy"))
        ET.SubElement(current.root.find("extensions"), "new", {"id": "new-1"}).text = "newer value"
        current.save(current_path)

        app = Is2Studio()
        try:
            app.doc = ProjectDocument.load(current_path)
            app.path = current_path
            app._reset_history(saved=True)
            app.refresh_all()
            app._set_enabled(True)
            app.update_idletasks()

            with patch("is2_re.gui.filedialog.askopenfilename", return_value=str(reference_path)):
                app.show_project_diff()
            dialogs = [child for child in app.winfo_children() if isinstance(child, tk.Toplevel)]
            assert dialogs, "comparison dialog was not opened"
            dialog = dialogs[-1]
            widgets = list(_walk(dialog))
            tree = next(widget for widget in widgets if isinstance(widget, ttk.Treeview))
            safe_ids = []
            for iid in tree.get_children(""):
                values = tree.item(iid, "values")
                # Removed and modified rows are restorable; the new-only row is not.
                if values[0] in {"Удалено в текущей", "Изменён атрибут", "Изменён текст"} and values[-1] == "Восстановимо":
                    safe_ids.append(iid)
            assert safe_ids, "no safely restorable rows found"
            tree.selection_set(safe_ids)
            restore_button = next(widget for widget in widgets if isinstance(widget, ttk.Button) and widget.cget("text") == "Восстановить выбранное")
            with patch("is2_re.gui.messagebox.askyesno", return_value=True), patch("is2_re.gui.messagebox.showinfo"):
                restore_button.invoke()
                app.update()

            assert app.doc.root.get("name") == "fixture"
            assert app.doc.root.find("extensions/legacy").get("id") == "old-1"
            assert app.doc.root.find("extensions/new") is not None
            assert app.dirty and app.history.can_undo
            app.undo()
            assert app.doc.root.get("name") == "Current version"
            assert app.doc.root.find("extensions/legacy") is None
            app.redo()
            assert app.doc.root.get("name") == "fixture"
            assert app.doc.root.find("extensions/legacy") is not None
        finally:
            app.destroy()
    print("PASS: GUI compare, selective restore, dependency/writer preflight, grouped Undo/Redo")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
