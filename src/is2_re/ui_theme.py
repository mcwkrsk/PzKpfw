"""System-font friendly compact visual language for the PzKpfw desktop editor.

No optional Tk theme or image resources are required.  Native Tk menus and dialogs
continue to work on Windows, X11 and macOS.
"""
from __future__ import annotations

import tkinter as tk
from tkinter import ttk, font as tkfont

BACKGROUND = '#f3f6fa'
SURFACE = '#ffffff'
INK = '#16263c'
MUTED = '#55677c'
BORDER = '#d8e1ec'
PRIMARY = '#1e5db5'
PRIMARY_HOVER = '#174886'
PALE_BLUE = '#eaf2ff'
TEAL = '#087b75'


def apply_theme(root: tk.Tk) -> None:
    style = ttk.Style(root)
    if 'clam' in style.theme_names():
        style.theme_use('clam')
    for name in ('TkDefaultFont', 'TkTextFont', 'TkMenuFont'):
        try:
            f = tkfont.nametofont(name)
            f.configure(size=10)
        except tk.TclError:
            pass
    root.configure(background=BACKGROUND)
    style.configure('.', font=('TkDefaultFont', 10), foreground=INK, background=BACKGROUND)
    style.configure('TFrame', background=BACKGROUND)
    # The white brand strip matches the supplied Tiger emblem's background.
    style.configure('Brand.TFrame', background=SURFACE)
    style.configure('Brand.TLabel', background=SURFACE, foreground=INK)
    style.configure('Brand.Title.TLabel', background=SURFACE, foreground=PRIMARY)
    style.configure('Brand.Muted.TLabel', background=SURFACE, foreground=MUTED)
    style.configure('TLabel', background=BACKGROUND, foreground=INK)
    style.configure('Muted.TLabel', background=BACKGROUND, foreground=MUTED)
    style.configure('TButton', padding=(9, 6), borderwidth=1, background=SURFACE,
                    foreground=INK, relief='flat')
    style.map('TButton', background=[('active', PALE_BLUE), ('disabled', BACKGROUND)],
              foreground=[('disabled', '#9aa7b5')])
    style.configure('Primary.TButton', background=PRIMARY, foreground='white', borderwidth=0,
                    padding=(13, 7), font=('TkDefaultFont', 10, 'bold'))
    style.map('Primary.TButton', background=[('active', PRIMARY_HOVER), ('pressed', PRIMARY_HOVER)],
              foreground=[('active', 'white'), ('disabled', '#a3b2c3')])
    style.configure('Danger.TButton', foreground='#a43b39')
    style.configure('TNotebook', background=BACKGROUND, borderwidth=0)
    style.configure('TNotebook.Tab', padding=(15, 9), background='#e6ecf4',
                    foreground=INK, borderwidth=0)
    style.map('TNotebook.Tab', background=[('selected', SURFACE), ('active', '#f9fbff')],
              foreground=[('selected', PRIMARY)])
    style.configure('Treeview', background=SURFACE, fieldbackground=SURFACE,
                    rowheight=28, foreground=INK, borderwidth=0)
    style.map('Treeview', background=[('selected', '#d6e8ff')], foreground=[('selected', INK)])
    style.configure('Treeview.Heading', background='#eaf0f7', foreground=INK,
                    font=('TkDefaultFont', 10, 'bold'), padding=(7, 7), relief='flat')
    style.map('Treeview.Heading', background=[('active', '#dce9fb')])
    style.configure('TEntry', padding=6, fieldbackground=SURFACE)
    style.configure('TCombobox', padding=5, fieldbackground=SURFACE)
    style.configure('TLabelframe', bordercolor=BORDER, padding=8)
    style.configure('TLabelframe.Label', font=('TkDefaultFont', 10, 'bold'))
    style.configure('TPanedwindow', background=BACKGROUND)
    style.configure('TSeparator', background=BORDER)
