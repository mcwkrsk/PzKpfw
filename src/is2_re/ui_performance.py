"""Utilities for keeping Tk event handlers responsive."""
import tkinter as tk


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
