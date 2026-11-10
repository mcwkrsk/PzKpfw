"""Small helpers for resources owned by a Tk widget."""
from __future__ import annotations
import tkinter as tk


def persistent_menu(owner, attribute, entries):
    """Create one menu per owner; the owner destroys it with its other children.

    Each entry is a (label, callback) pair; None inserts a separator. Menus
    remain alive after tk_popup returns because Tk handles selection later.
    """
    menu = getattr(owner, attribute, None)
    if menu is None:
        menu = tk.Menu(owner, tearoff=False)
        try:
            for entry in entries:
                if entry is None:
                    menu.add_separator()
                else:
                    label, callback = entry
                    menu.add_command(label=label, command=callback)
        except Exception:
            menu.destroy()
            raise
        setattr(owner, attribute, menu)
    return menu


def canvas_tag_at(canvas, event, prefix, tolerance=1):
    """Return the value of the topmost matching tag under a canvas event."""
    x, y = canvas.canvasx(event.x), canvas.canvasy(event.y)
    items = canvas.find_overlapping(x-tolerance, y-tolerance, x+tolerance, y+tolerance)
    for item in reversed(items):
        for tag in canvas.gettags(item):
            if tag.startswith(prefix):
                return tag[len(prefix):]
    return None
