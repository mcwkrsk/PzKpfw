"""Utilities for keeping Tk event handlers responsive."""
import tkinter as tk

# Full redraw after mouse-wheel zoom: once the wheel has been still this long.
ZOOM_REDRAW_DELAY_MS = 150


class CoalescedCallback:
    """Run at most once per interval while retaining the latest widget state.

    Tk calls the callback on its own event loop; no UI work crosses threads.
    Events arriving during the interval share the same pending redraw. A final
    resize event therefore always produces an update after dragging stops.
    """
    def __init__(self, widget, callback, interval_ms=40):
        self.widget = widget
        self.callback = callback
        self.interval_ms = interval_ms
        self._job = None
        self.widget.bind('<Destroy>', self._on_destroy, add='+')

    def _on_destroy(self, event):
        if event.widget is self.widget:
            self.cancel()

    def cancel(self):
        if self._job is None:
            return
        job, self._job = self._job, None
        try:
            self.widget.after_cancel(job)
        except tk.TclError:
            pass

    def request(self, _event=None):
        if self._job is not None:
            return
        try:
            self._job = self.widget.after(self.interval_ms, self._run)
        except tk.TclError:
            pass

    def _run(self):
        self._job = None
        try:
            alive = self.widget.winfo_exists()
        except tk.TclError:
            return
        if alive:
            self.callback()


class DebouncedCallback(CoalescedCallback):
    """Run once, `interval_ms` after the LAST request (trailing debounce).

    Used for the expensive part of an interaction that arrives in bursts,
    such as a full redraw after several mouse-wheel zoom steps.
    """
    def request(self, _event=None):
        self.cancel()
        try:
            self._job = self.widget.after(self.interval_ms, self._run)
        except tk.TclError:
            pass

    def flush(self):
        """Run a pending callback now (e.g. before something reads the result)."""
        if self._job is not None:
            self.cancel()
            self._run()


def preview_scale(canvas, factor):
    """Scale what is already drawn on `canvas` around the origin.

    Shapes and positions follow the new zoom at once (a cheap Tk operation);
    text keeps its size until the real redraw replaces the preview.
    """
    if not factor or abs(factor - 1) < 1e-6:
        return
    try:
        canvas.scale('all', 0, 0, factor, factor)
        region = canvas.cget('scrollregion')
        if region:
            values = [float(v) for v in str(region).split()]
            if len(values) == 4:
                canvas.configure(scrollregion=tuple(v * factor for v in values))
    except (tk.TclError, ValueError):
        pass
