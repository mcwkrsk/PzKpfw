"""Small Tk icons independent of installed fonts and external libraries."""
from __future__ import annotations
import tkinter as tk

# Undo arrow with a bent tail, coordinates on a 16x16 transparent image.
_UNDO_PIXELS = {
    (5, 3), (4, 4), (3, 5), (2, 6), (3, 7), (4, 8), (5, 9),
    (3, 6), (4, 6), (5, 6), (6, 6), (7, 6), (8, 6), (9, 6),
    (10, 7), (11, 8), (11, 9), (10, 10), (9, 11), (8, 11), (7, 11),
}

def make_history_icon(master, color: str, *, redo: bool = False) -> tk.PhotoImage:
    """Draw a transparent undo/redo image, mirroring the geometry for redo."""
    image = tk.PhotoImage(master=master, width=16, height=16)
    for x, y in _UNDO_PIXELS:
        image.put(color, (15 - x if redo else x, y))
    return image
