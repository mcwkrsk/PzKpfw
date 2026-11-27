"""Layout helpers for the two interface modes: a wrapping command row and a side menu.

Widgets are never re-created when the interface mode changes: Tk can manage a
widget inside any descendant of its parent (`pack(in_=...)`), so the same
buttons are simply packed into different containers.
"""
from __future__ import annotations

import tkinter as tk
from tkinter import ttk

from .ui_theme import PALETTES


class FlowRow(ttk.Frame):
    """Lays out widgets left to right and wraps them onto new lines when the
    window is narrow, instead of cutting the last buttons off."""

    def __init__(self, master, *, gap=5, line_gap=4, overflow_host=None, **kwargs):
        super().__init__(master, **kwargs)
        self.gap, self.line_gap = gap, line_gap
        # Where the right group goes when it does not fit on the last line
        # (e.g. the right end of the sheet strip) instead of a line of its own.
        self.overflow_host = overflow_host
        self._items = []
        self._right = []
        self._lines = []
        self._layout_key = None
        self.bind('<Configure>', self._on_configure, add='+')

    def set_items(self, widgets, right=()) -> None:
        """`widgets` flow from the left; `right` stay together at the right edge
        of the last line (or of a line of their own when there is no room)."""
        self.clear()
        self._items = list(widgets)
        self._right = list(right)
        self._layout(force=True)

    def clear(self) -> None:
        for widget in self._items + self._right:
            try:
                widget.pack_forget()
            except tk.TclError:
                pass
        self._items = []
        self._right = []
        self._layout_key = None

    def _on_configure(self, _event=None):
        self._layout()

    def _layout(self, force=False):
        if not self._items and not self._right:
            return
        width = self.winfo_width()
        if width <= 1:
            width = self.winfo_reqwidth() or 10_000
        # Lines depend only on the widths; skip work when nothing changed.
        sizes = [w.winfo_reqwidth() for w in self._items]
        lines, current, used = [], [], 0
        for widget, size in zip(self._items, sizes):
            need = size + (self.gap if current else 0)
            if current and used + need > width:
                lines.append(current)
                current, used = [], 0
                need = size
            current.append(widget)
            used += need
        if current:
            lines.append(current)
        right_width = sum(w.winfo_reqwidth() for w in self._right) + self.gap * max(0, len(self._right) - 1)
        own_line = bool(self._right) and (not lines or used + self.gap * 2 + right_width > width)
        key = (tuple(tuple(id(w) for w in line) for line in lines), own_line)
        if key == self._layout_key and not force:
            return
        self._layout_key = key
        host = self.overflow_host if own_line else None
        if own_line and host is None:
            lines.append([])
        for widget in self._items + self._right:
            widget.pack_forget()
        while len(self._lines) < len(lines):
            frame = ttk.Frame(self)
            self._lines.append(frame)
        for index, frame in enumerate(self._lines):
            if index < len(lines):
                frame.pack(fill='x', pady=(0 if index == 0 else self.line_gap, 0))
            else:
                frame.pack_forget()
        for frame, line in zip(self._lines, lines):
            for position, widget in enumerate(line):
                widget.pack(in_=frame, side='left', padx=(0 if position == 0 else self.gap, 0))
                widget.lift()
        if self._right and (lines or host is not None):
            if host is not None:
                for position, widget in enumerate(self._right):
                    widget.pack(in_=host, side='left', padx=(0 if position == 0 else self.gap, 0))
                    widget.lift()
                return
            last = self._lines[len(lines) - 1]
            # Packed from the right edge: the gap goes on the right of each
            # button except the rightmost one.
            for position, widget in enumerate(reversed(self._right)):
                widget.pack(in_=last, side='right', padx=(0, 0 if position == 0 else self.gap))
                widget.lift()


class SideMenu(ttk.Frame):
    """A panel that slides over the left edge of the window (not full screen).

    entries: list of (section title, [(label, callback), ...]); a callback of
    None makes a disabled, informational line. Closes on Esc, on a second
    press of the menu button, after an entry is chosen and on a click outside.
    """

    WIDTH = 330

    def __init__(self, root, *, anchor_widget, toggle_widget=None, title='', on_open=None, on_close=None):
        super().__init__(root, style='Sidebar.TFrame')
        self.on_open, self.on_close = on_open, on_close
        self.root = root
        self.anchor_widget = anchor_widget          # the panel starts below this widget
        self.toggle_widget = toggle_widget
        self.title = title
        self.is_open = False
        self._entries_factory = lambda: []
        header = ttk.Frame(self, style='Sidebar.TFrame', padding=(14, 10, 8, 6))
        header.pack(fill='x')
        self._title_label = ttk.Label(header, text=title, style='Sidebar.TLabel', font=('TkDefaultFont', 12, 'bold'))
        self._title_label.pack(side='left')
        ttk.Button(header, text='✕', width=3, style='Sidebar.TButton', command=self.close).pack(side='right')
        ttk.Frame(self, style='SidebarSeparator.TFrame', height=1).pack(fill='x')
        body = ttk.Frame(self, style='Sidebar.TFrame')
        body.pack(fill='both', expand=True)
        self._canvas = tk.Canvas(body, highlightthickness=0, borderwidth=0)
        self._scroll = ttk.Scrollbar(body, orient='vertical', command=self._canvas.yview)
        self._canvas.configure(yscrollcommand=self._scroll.set)
        self._canvas.pack(side='left', fill='both', expand=True)
        self._content = ttk.Frame(self._canvas, style='Sidebar.TFrame', padding=(0, 4, 0, 12))
        self._window = self._canvas.create_window(0, 0, anchor='nw', window=self._content)
        self._content.bind('<Configure>', self._update_scroll, add='+')
        self._canvas.bind('<Configure>', lambda e: self._canvas.itemconfigure(self._window, width=e.width), add='+')
        self._canvas.bind('<MouseWheel>', self._wheel, add='+')
        self._edge = ttk.Frame(self, style='SidebarSeparator.TFrame', width=1)
        self._edge.place(relx=1.0, x=-1, y=0, relheight=1.0, width=1)
        self.bind('<Escape>', lambda _e: self.close(), add='+')
        root.bind('<Configure>', self._follow_root, add='+')
        root.bind_all('<Button-1>', self._click_anywhere, add='+')

    # ---- content
    def set_entries(self, factory) -> None:
        """factory() -> entries; called each time the menu opens (recent files change)."""
        self._entries_factory = factory

    def _rebuild(self):
        for child in self._content.winfo_children():
            child.destroy()
        for index, (section, items) in enumerate(self._entries_factory()):
            if index:
                ttk.Frame(self._content, style='SidebarSeparator.TFrame', height=1).pack(fill='x', padx=14, pady=(8, 4))
            ttk.Label(self._content, text=section.upper(), style='SidebarHeading.TLabel',
                      padding=(14, 6, 14, 2)).pack(fill='x')
            for label, callback in items:
                if callback is None:
                    ttk.Label(self._content, text=label, style='SidebarMuted.TLabel', padding=(14, 4)).pack(fill='x')
                    continue
                button = ttk.Button(self._content, text=label, style='Sidebar.TButton',
                                    command=lambda c=callback: self._choose(c))
                button.pack(fill='x')
                button.bind('<MouseWheel>', self._wheel, add='+')

    def _choose(self, callback):
        self.close()
        callback()

    # ---- showing
    def toggle(self):
        self.close() if self.is_open else self.open()

    def open(self):
        if self.is_open:
            return
        theme = self.root.theme_name.get() if hasattr(self.root, 'theme_name') else 'dark'
        palette = PALETTES.get(theme, PALETTES['dark'])
        self._canvas.configure(background=palette['surface'])
        self._rebuild()
        self.is_open = True
        if self.on_open is not None:
            self.on_open()
        self._place()
        self.lift()
        self.focus_set()

    def close(self):
        if not self.is_open:
            return
        self.is_open = False
        self.place_forget()
        if self.on_close is not None:
            self.on_close()

    def _place(self):
        try:
            top = self.anchor_widget.winfo_rooty() - self.root.winfo_rooty()
        except tk.TclError:
            top = 0
        height = max(100, self.root.winfo_height() - top)
        self.place(in_=self.root, x=0, y=top, width=self.WIDTH, height=height)
        self._update_scroll()

    def _follow_root(self, event):
        if self.is_open and event.widget is self.root:
            self._place()

    def _update_scroll(self, _event=None):
        self._canvas.configure(scrollregion=self._canvas.bbox('all') or (0, 0, 0, 0))
        needs = self._content.winfo_reqheight() > self._canvas.winfo_height() > 1
        if needs and not self._scroll.winfo_ismapped():
            self._scroll.pack(side='right', fill='y', before=self._canvas)
        elif not needs and self._scroll.winfo_ismapped():
            self._scroll.pack_forget()

    def _wheel(self, event):
        if self._scroll.winfo_ismapped():
            self._canvas.yview_scroll(-1 if event.delta > 0 else 1, 'units')
        return 'break'

    def _click_anywhere(self, event):
        if not self.is_open:
            return
        name = str(event.widget)
        inside = name.startswith(str(self))
        toggle = self.toggle_widget is not None and name.startswith(str(self.toggle_widget))
        if not inside and not toggle:
            self.close()


class SheetStrip(ttk.Frame):
    """One line of sheet buttons that scrolls sideways (mouse wheel, ‹ ›)
    instead of wrapping when a project has many composite actions."""

    def __init__(self, master, on_select, **kwargs):
        super().__init__(master, **kwargs)
        self.on_select = on_select
        self._buttons = {}
        self._selected = object()
        self._left = ttk.Button(self, text='‹', width=2, style='SheetTab.TButton', command=lambda: self._scroll(-1))
        self._right = ttk.Button(self, text='›', width=2, style='SheetTab.TButton', command=lambda: self._scroll(1))
        self._canvas = tk.Canvas(self, height=10, highlightthickness=0, borderwidth=0)
        # Room at the right end for other buttons (see FlowRow.overflow_host).
        self.extra = ttk.Frame(self)
        self.extra.pack(side='right', padx=(8, 0))
        self._canvas.pack(side='left', fill='x', expand=True)
        self._inner = ttk.Frame(self._canvas)
        self._canvas.create_window(0, 0, anchor='nw', window=self._inner)
        self._inner.bind('<Configure>', self._update, add='+')
        self._canvas.bind('<Configure>', self._update, add='+')
        for widget in (self._canvas, self._inner):
            widget.bind('<MouseWheel>', self._wheel, add='+')
            widget.bind('<Shift-MouseWheel>', self._wheel, add='+')

    def set_sheets(self, sheets) -> None:
        """sheets: [(key, label)]; rebuilt only when the list changes."""
        sheets = list(sheets)
        if sheets == getattr(self, '_sheets', None):
            return
        self._sheets = sheets
        for button in self._buttons.values():
            button.destroy()
        self._buttons = {}
        for key, label in sheets:
            button = ttk.Button(self._inner, text=label, style='SheetTab.TButton', width=0,
                                command=lambda k=key: self.on_select(k))
            button.pack(side='left', padx=(0, 2))
            button.bind('<MouseWheel>', self._wheel, add='+')
            self._buttons[key] = button
        current, self._selected = self._selected, object()
        self.select(current)

    def select(self, key) -> None:
        if key == self._selected:
            return
        old = self._buttons.get(self._selected)
        if old is not None:
            old.state(['!selected'])
        self._selected = key
        button = self._buttons.get(key)
        if button is not None:
            button.state(['selected'])
            self.after_idle(lambda: self._see(button))

    def apply_palette(self, palette) -> None:
        self._canvas.configure(background=palette['bg'])

    def _update(self, _event=None):
        self._canvas.configure(height=self._inner.winfo_reqheight(), scrollregion=(0, 0, self._inner.winfo_reqwidth(), 0))
        overflow = self._inner.winfo_reqwidth() > self._canvas.winfo_width() > 1
        if overflow and not self._left.winfo_ismapped():
            self._left.pack(side='left', before=self._canvas, padx=(0, 4))
            self._right.pack(side='right', before=self._canvas, padx=(4, 0))
        elif not overflow and self._left.winfo_ismapped():
            self._left.pack_forget()
            self._right.pack_forget()
            self._canvas.xview_moveto(0)

    def _scroll(self, direction):
        self._canvas.xview_scroll(direction * 5, 'units')

    def _wheel(self, event):
        self._canvas.xview_scroll(-1 if event.delta > 0 else 1, 'units')
        return 'break'

    def _see(self, button):
        try:
            total = max(1, self._inner.winfo_reqwidth())
            view = self._canvas.winfo_width()
            x = button.winfo_x()
            first, last = self._canvas.xview()
            if x < first * total or x + button.winfo_width() > last * total:
                self._canvas.xview_moveto(max(0, (x - 20) / total))
        except tk.TclError:
            pass
