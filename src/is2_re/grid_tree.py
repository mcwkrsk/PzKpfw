"""Treeview with thin row and column dividers in the visible viewport."""
from __future__ import annotations
import tkinter as tk
from tkinter import ttk

class GridTreeview(ttk.Treeview):
    def __init__(self, master=None, **kwargs):
        self._grid_ready = False
        self._grid_job = None
        self._grid_lines = []
        self._grid_color = '#50516a'
        super().__init__(master, **kwargs)
        self._grid_ready = True
        for event in ('<Configure>', '<Map>', '<MouseWheel>', '<ButtonRelease-1>', '<KeyRelease>',
                      '<<TreeviewOpen>>', '<<TreeviewClose>>', '<<TreeviewSelect>>'):
            self.bind(event, self._schedule_grid, add='+')
        self._schedule_grid()

    def set_grid_color(self, color):
        self._grid_color = color
        for line in self._grid_lines:
            line.configure(bg=color)
        self._schedule_grid()

    def configure(self, cnf=None, **kwargs):
        if isinstance(cnf, dict):
            kwargs = {**cnf, **kwargs}; cnf = None
        for key in ('xscrollcommand', 'yscrollcommand'):
            if key in kwargs and callable(kwargs[key]):
                callback = kwargs[key]
                def wrapped(*args, cb=callback):
                    cb(*args)
                    self._schedule_grid()
                kwargs[key] = wrapped
        result = super().configure(cnf, **kwargs)
        self._schedule_grid()
        return result

    config = configure

    def insert(self, *args, **kwargs):
        result = super().insert(*args, **kwargs)
        self._schedule_grid()
        return result

    def delete(self, *items):
        result = super().delete(*items)
        self._schedule_grid()
        return result

    def _schedule_grid(self, _event=None):
        if not self._grid_ready or self._grid_job is not None:
            return
        try:
            self._grid_job = self.after_idle(self._draw_grid)
        except tk.TclError:
            pass

    def _draw_grid(self):
        self._grid_job = None
        try:
            if not self.winfo_exists() or not self.winfo_ismapped():
                return
            width, height = self.winfo_width(), self.winfo_height()
            # Identify visible rows by position; this works with collapsed nodes
            # and avoids iterating over potentially thousands of hidden rows.
            rows = []
            last = None
            y = 1
            while y < height:
                item = self.identify_row(y)
                if item and item != last:
                    bounds = self.bbox(item)
                    if bounds:
                        rows.append((item, bounds))
                        last = item
                        y = max(y + 1, bounds[1] + bounds[3])
                        continue
                y += 4
            if not rows:
                for line in self._grid_lines: line.place_forget()
                return
            specs = []
            for _, (_, y0, _, h) in rows:
                if 0 < y0 + h - 1 < height:
                    specs.append((0, y0 + h - 1, width, 1))
            item = rows[0][0]
            show = self.tk.splitlist(self.cget('show'))
            cols = ['#0'] if 'tree' in show else []
            display = self.cget('displaycolumns')
            if display in ('#all', ('#all',)):
                count = len(self.tk.splitlist(self.cget('columns')))
            else:
                count = len(display) if not isinstance(display, str) else len(self.tk.splitlist(display))
            cols += ['#'+str(i) for i in range(1, count+1)]
            for col in cols:
                box = self.bbox(item, col)
                if box:
                    edge = box[0]+box[2]-1
                    if 0 < edge < width-1:
                        specs.append((edge, rows[0][1][1], 1, min(height, rows[-1][1][1]+rows[-1][1][3])-rows[0][1][1]))
            while len(self._grid_lines) < len(specs):
                self._grid_lines.append(tk.Frame(self, background=self._grid_color, borderwidth=0, takefocus=0))
            for line, (x, y, w, h) in zip(self._grid_lines, specs):
                if w > 0 and h > 0:
                    line.place(x=x, y=y, width=w, height=h)
                    line.lift()
            for line in self._grid_lines[len(specs):]: line.place_forget()
        except tk.TclError:
            # Widget may have been destroyed while an idle redraw was queued.
            return
