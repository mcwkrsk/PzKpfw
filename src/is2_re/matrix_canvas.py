"""Viewport-only matrix rendering with a constant number of Tk widgets."""
from __future__ import annotations

from bisect import bisect_right
import tkinter as tk
from .ui_theme import PALETTES


def visible_range(offset, viewport, step, count):
    if step <= 0 or count <= 0 or viewport <= 0:
        return 0, 0
    return max(0, int(offset // step)), min(count, int((offset + viewport + step - 1) // step))


def wheel_steps(delta, windowing_system):
    """Preserve small Windows touchpad deltas rather than turning each into a notch."""
    if not delta:
        return 0.0
    return delta / 120.0 if windowing_system == 'win32' else float(delta)


class MatrixCanvas(tk.Canvas):
    """The backing rows are immutable until refresh; scrolling changes only the viewport."""
    def __init__(self, master, *, theme, font, heading_font, on_width_change=None):
        super().__init__(master, highlightthickness=0, takefocus=1)
        self.theme, self.font, self.heading_font = theme, font, heading_font
        self.on_width_change = on_width_change
        self.headers, self.rows, self.widths, self.edges = (), (), [], [0]
        self.row_height, self.header_height = 27, 28
        self.offset_x = self.offset_y = 0
        self.selected_row = self.selected_column = None
        self._pending = None
        self._drag_column = None
        self._items = {}
        self._used = {}
        self._item_cache = {}
        self._visible_counts = {}
        self._layers_dirty = False
        self._wheel_remainder_x = self._wheel_remainder_y = 0.0
        self._windowing_system = self.tk.call('tk', 'windowingsystem')
        self._xcommand = self._ycommand = None
        self.bind('<Configure>', self._resize, add='+')
        self.bind('<Map>', self._resize, add='+')
        self.bind('<Destroy>', self._destroy, add='+')
        self.bind('<ButtonPress-1>', self._press, add='+')
        self.bind('<B1-Motion>', self._drag, add='+')
        self.bind('<ButtonRelease-1>', self._release, add='+')
        self.bind('<MouseWheel>', self._wheel, add='+')
        self.bind('<Shift-MouseWheel>', self._horizontal_wheel, add='+')
        self.bind('<Button-4>', lambda _e: self._scroll_wheel(-1), add='+')
        self.bind('<Button-5>', lambda _e: self._scroll_wheel(1), add='+')
        self.bind('<KeyPress>', self._key, add='+')

    def set_callbacks(self, xscroll, yscroll):
        self._xcommand, self._ycommand = xscroll, yscroll

    def set_data(self, headers, rows, widths):
        self.headers = tuple(headers)
        self.rows = tuple(tuple(row) for row in rows)
        self.widths = list(widths)
        self.selected_row = self.selected_column = None
        self.offset_x = self.offset_y = 0
        self._rebuild_edges()
        self._schedule()

    def set_scale(self, widths, row_height):
        self.widths = list(widths)
        self.row_height = row_height
        self.header_height = max(24, row_height)
        self._rebuild_edges()
        self._clamp()
        self._schedule()

    def _rebuild_edges(self):
        self.edges = [0]
        for width in self.widths:
            self.edges.append(self.edges[-1] + width)

    def _dimensions(self):
        return max(1, self.winfo_width()), max(1, self.winfo_height() - self.header_height)

    def _clamp(self):
        width, height = self._dimensions()
        self.offset_x = max(0, min(self.offset_x, max(0, self.edges[-1] - width)))
        self.offset_y = max(0, min(self.offset_y, max(0, len(self.rows) * self.row_height - height)))

    def _view(self, axis, args):
        width, height = self._dimensions()
        extent = self.edges[-1] if axis == 'x' else len(self.rows)*self.row_height
        size = width if axis == 'x' else height
        offset = self.offset_x if axis == 'x' else self.offset_y
        if not args:
            return (offset / extent, min(1.0, (offset + size) / extent)) if extent else (0.0, 1.0)
        if args[0] == 'moveto':
            offset = round(float(args[1]) * extent)
        elif args[0] == 'scroll':
            delta = int(args[1])
            amount = (size * .9 if args[2] == 'pages' else (40 if axis == 'x' else self.row_height))
            offset += round(delta * amount)
        if axis == 'x': self.offset_x = offset
        else: self.offset_y = offset
        self._clamp()
        self._sync_scrollbars()
        self._schedule()

    def xview(self, *args): return self._view('x', args)
    def yview(self, *args): return self._view('y', args)
    def _sync_scrollbars(self):
        if self._xcommand: self._xcommand(*self.xview())
        if self._ycommand: self._ycommand(*self.yview())

    def _resize(self, _event=None):
        self._clamp()
        self._sync_scrollbars()
        self._schedule()

    def _destroy(self, event):
        if event.widget is self and self._pending is not None:
            try: self.after_cancel(self._pending)
            except tk.TclError: pass
            self._pending = None

    def _schedule(self):
        if self._pending is None:
            self._pending = self.after_idle(self._draw)

    def _item(self, layer, kind, *coords, **options):
        pool = self._items.setdefault(layer, [])
        index = self._used.get(layer, 0)
        self._used[layer] = index + 1
        if index == len(pool):
            item = getattr(self, 'create_' + kind)(*coords, tags=(layer,), **options)
            pool.append(item)
            self._item_cache[item] = (coords, dict(options), True)
            self._layers_dirty = True
        else:
            item = pool[index]
            old_coords, old_options, visible = self._item_cache[item]
            if old_coords != coords:
                self.coords(item, *coords)
            changes = {key: value for key, value in options.items() if old_options.get(key) != value}
            if not visible:
                changes['state'] = 'normal'
            if changes:
                self.itemconfigure(item, **changes)
            self._item_cache[item] = (coords, dict(options), True)

    def _finish_items(self):
        layers = ('selection', 'grid', 'body_text', 'heading_bg', 'heading_cells', 'heading_text', 'heading_line')
        for layer, pool in self._items.items():
            used = self._used.get(layer, 0)
            previous = self._visible_counts.get(layer, 0)
            for item in pool[used:previous]:
                self.itemconfigure(item, state='hidden')
                coords, options, _ = self._item_cache[item]
                self._item_cache[item] = (coords, options, False)
            self._visible_counts[layer] = used
        if self._layers_dirty:
            for layer in layers:
                self.tag_raise(layer)
            self._layers_dirty = False

    def _draw(self):
        self._pending = None
        if not self.winfo_ismapped(): return
        self._used.clear()
        p = PALETTES[self.theme()]
        width, body_height = self._dimensions()
        total_height = self.winfo_height()
        self.configure(background=p['field'])
        first_row, last_row = visible_range(self.offset_y, body_height, self.row_height, len(self.rows))
        first_col = max(0, bisect_right(self.edges, self.offset_x) - 1)
        last_col = min(len(self.headers), bisect_right(self.edges, self.offset_x + width))
        if self.selected_column is not None and first_col <= self.selected_column < last_col:
            x1 = self.edges[self.selected_column] - self.offset_x
            x2 = self.edges[self.selected_column+1] - self.offset_x
            self._item('selection', 'rectangle', x1, self.header_height, x2, total_height, fill=p['primary'], outline='')
        if self.selected_row is not None and first_row <= self.selected_row < last_row:
            y = self.header_height + self.selected_row * self.row_height - self.offset_y
            self._item('selection', 'rectangle', 0, y, width, y + self.row_height, fill=p['primary'], outline='')
        for col in range(first_col, last_col):
            x = self.edges[col] - self.offset_x
            self._item('grid', 'line', x, self.header_height, x, total_height, fill=p['border'])
        for row in range(first_row, last_row):
            y = self.header_height + row*self.row_height - self.offset_y
            self._item('grid', 'line', 0, y, width, y, fill=p['border'])
            values = self.rows[row]
            for col in range(first_col, min(last_col, len(values))):
                value = values[col]
                if value:
                    color = '#ffffff' if row == self.selected_row or col == self.selected_column else p['ink']
                    self._item('body_text', 'text', (self.edges[col]+self.edges[col+1])/2 - self.offset_x,
                                     y+self.row_height/2, text=str(value), fill=color, font=self.font,
                                     width=max(1,self.widths[col]-4))
        # The header overlays partially scrolled rows, keeping it fixed.
        self._item('heading_bg', 'rectangle', 0, 0, width, self.header_height, fill=p['surface'], outline='')
        for col in range(first_col, last_col):
            x = self.edges[col] - self.offset_x
            cw = self.widths[col]
            self._item('heading_cells', 'rectangle', x, 0, x+cw, self.header_height, fill=p['surface'], outline=p['border'])
            self._item('heading_text', 'text', x+cw/2, self.header_height/2, text=self.headers[col], font=self.heading_font,
                             fill=p['ink'], width=max(1, cw-6))
        self._item('heading_line', 'line', 0, self.header_height, width, self.header_height, fill=p['border'])
        self._finish_items()

    def identify_row(self, y):
        if y < self.header_height: return ''
        row = int((y - self.header_height + self.offset_y) // self.row_height)
        return f'matrix{row}' if 0 <= row < len(self.rows) else ''

    def identify_column(self, x):
        col = bisect_right(self.edges, x + self.offset_x) - 1
        return f'#{col+1}' if 0 <= col < len(self.headers) else ''

    def bbox(self, item, column):
        row = int(item.removeprefix('matrix'))
        col = int(column[1:])-1
        if not (0 <= row < len(self.rows) and 0 <= col < len(self.headers)): return ()
        y = self.header_height + row*self.row_height - self.offset_y
        if y + self.row_height <= self.header_height or y >= self.winfo_height(): return ()
        return self.edges[col]-self.offset_x, y, self.widths[col], self.row_height

    def _press(self, event):
        self.focus_set()
        if event.y < self.header_height:
            pos = event.x + self.offset_x
            col = bisect_right(self.edges, pos) - 1
            if 0 <= col < len(self.widths) and abs(self.edges[col+1]-pos) <= 5:
                self._drag_column = (col, event.x, self.widths[col])
            return
        row, col = self.identify_row(event.y), self.identify_column(event.x)
        if row and col:
            self.selected_row = int(row.removeprefix('matrix'))
            index = int(col[1:])-1
            self.selected_column = index if index >= 2 else None
            if self._pending is not None:
                self.after_cancel(self._pending)
                self._pending = None
            self._draw()

    def _drag(self, event):
        if self._drag_column is None: return
        col, start, original = self._drag_column
        self.widths[col] = max(40, original + event.x - start)
        self._rebuild_edges()
        self._clamp()
        self._sync_scrollbars()
        self._schedule()
        if self.on_width_change: self.on_width_change()

    def _release(self, _event): self._drag_column = None
    def _scroll_wheel(self, direction): self.yview('scroll', direction, 'units'); return 'break'
    def _wheel_pixels(self, axis, delta):
        steps = wheel_steps(delta, self._windowing_system)
        attr = '_wheel_remainder_' + axis
        pixels = getattr(self, attr) - steps * (self.row_height if axis == 'y' else 40)
        whole = int(pixels)
        setattr(self, attr, pixels - whole)
        if not whole:
            return 'break'
        if axis == 'y': self.offset_y += whole
        else: self.offset_x += whole
        self._clamp()
        self._sync_scrollbars()
        self._schedule()
        return 'break'

    def _wheel(self, event): return self._wheel_pixels('y', event.delta)
    def _horizontal_wheel(self, event):
        return self._wheel_pixels('x', event.delta)
    def _key(self, event):
        if not self.rows or event.keysym not in ('Up', 'Down', 'Left', 'Right'): return
        row = self.selected_row if self.selected_row is not None else 0
        col = self.selected_column if self.selected_column is not None else 2
        if event.keysym == 'Up': row -= 1
        if event.keysym == 'Down': row += 1
        if event.keysym == 'Left': col -= 1
        if event.keysym == 'Right': col += 1
        self.selected_row = max(0, min(len(self.rows)-1, row))
        self.selected_column = max(2, min(len(self.headers)-1, col)) if len(self.headers) > 2 else None
        top, bottom = self.selected_row*self.row_height, (self.selected_row+1)*self.row_height
        body = self._dimensions()[1]
        if top < self.offset_y: self.offset_y = top
        elif bottom > self.offset_y + body: self.offset_y = bottom-body
        if self.selected_column is not None:
            left, right = self.edges[self.selected_column:self.selected_column+2]
            viewport = self._dimensions()[0]
            if left < self.offset_x: self.offset_x = left
            elif right > self.offset_x+viewport: self.offset_x = right-viewport
        self._clamp(); self._sync_scrollbars(); self._schedule()
        return 'break'
