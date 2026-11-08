"""Notebook navigation made of visible themed buttons."""
from tkinter import ttk


class ButtonNotebook(ttk.Frame):
    def __init__(self, master, **kwargs):
        super().__init__(master, **kwargs)
        self.bar = ttk.Frame(self)
        self.bar.pack(fill='x', pady=(0, 5))
        self.book = ttk.Notebook(self, style='Main.TNotebook')
        self.book.pack(fill='both', expand=True)
        self.buttons = {}
        self.book.bind('<<NotebookTabChanged>>', self._changed)

    def add(self, child, text):
        self.book.add(child, text=text)
        button = ttk.Button(self.bar, text=text, style='MainNav.TButton',
                            command=lambda: self.select(child))
        button.pack(side='left', padx=(0, 5))
        self.buttons[str(child)] = button
        self._update_buttons()

    def forget(self, tab):
        self.book.forget(tab)
        button = self.buttons.pop(str(tab), None)
        if button is not None:
            button.destroy()
        self._update_buttons()

    def tabs(self):
        return self.book.tabs()

    def select(self, tab=None):
        if tab is None:
            return self.book.select()
        self.book.select(tab)
        self._update_buttons()

    def index(self, tab):
        return self.book.index(tab)

    def _update_buttons(self):
        selected = self.book.select()
        for key, button in self.buttons.items():
            button.state(['selected'] if key == selected else ['!selected'])

    def _changed(self, _event):
        self._update_buttons()
        self.event_generate('<<NotebookTabChanged>>')
