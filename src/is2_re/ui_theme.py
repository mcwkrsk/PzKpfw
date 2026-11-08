"""Reference-inspired light and dark themes for the Tk desktop UI."""
from __future__ import annotations
import json
import os
from pathlib import Path
import tkinter as tk
from tkinter import ttk, font as tkfont

# Compatibility constants used by the diagram, which deliberately keeps a light canvas.
BACKGROUND = '#f2f3fa'
SURFACE = '#ffffff'
INK = '#222338'
MUTED = '#666b82'
BORDER = '#d8daea'
PRIMARY = '#5766f3'
PRIMARY_HOVER = '#4554df'
PALE_BLUE = '#e8eaff'
TEAL = '#258b89'

PALETTES = {
    'dark': dict(bg='#151522', surface='#242432', ink='#f3f3f8', muted='#aaaabd', border='#414153', button='#303041', button_border='#5c5d78', tab='#252536', tab_border='#50516a', disabled='#262633', accent='#70cfcb', primary='#5766f3', hover='#6976ff', selected='#30314b', field='#1b1b29'),
    'light': dict(bg='#f5f5fa', surface='#ffffff', ink='#242536', muted='#65697d', border='#dedfea', button='#eef0fb', button_border='#7a829e', tab='#e8eaf5', tab_border='#7a829e', disabled='#e9eaf0', accent='#14827e', primary='#5766f3', hover='#4554df', selected='#e8eaff', field='#ffffff'),
}

def _preferences_path() -> Path:
    base = os.environ.get('APPDATA') if os.name == 'nt' else os.environ.get('XDG_CONFIG_HOME')
    return (Path(base) if base else Path.home() / ('.config' if os.name != 'nt' else 'AppData/Roaming')) / 'PzKpfw' / 'appearance.json'

def load_theme() -> str:
    try:
        value = json.loads(_preferences_path().read_text(encoding='utf-8')).get('theme')
        return value if value in PALETTES else 'dark'
    except (OSError, ValueError, AttributeError):
        return 'dark'

def save_theme(name: str) -> bool:
    if name not in PALETTES:
        raise ValueError('Unknown theme')
    try:
        path = _preferences_path()
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(json.dumps({'theme': name}, ensure_ascii=False), encoding='utf-8')
        return True
    except OSError:
        return False

def apply_theme(root: tk.Tk, name: str = 'dark') -> None:
    p = PALETTES[name]
    style = ttk.Style(root)
    if 'clam' in style.theme_names():
        style.theme_use('clam')
    # Use a readable monospaced family with Cyrillic support when available.
    families = set(tkfont.families(root))
    family = next((item for item in ('Consolas', 'DejaVu Sans Mono', 'Liberation Mono') if item in families), None)
    for fontname in ('TkDefaultFont', 'TkTextFont', 'TkMenuFont'):
        try:
            options = {'size': 10}
            if family:
                options['family'] = family
            tkfont.nametofont(fontname).configure(**options)
        except tk.TclError:
            pass
    ui_family = family or 'TkFixedFont'
    root.configure(background=p['bg'])
    root.option_add('*Text.background', p['field'])
    root.option_add('*Text.foreground', p['ink'])
    root.option_add('*Text.insertBackground', p['ink'])
    root.option_add('*Text.selectBackground', p['primary'])
    root.option_add('*Text.selectForeground', '#ffffff')
    root.option_add('*Menu.background', p['surface'])
    root.option_add('*Menu.foreground', p['ink'])
    root.option_add('*Menu.activeBackground', p['primary'])
    root.option_add('*Menu.activeForeground', '#ffffff')
    style.configure('.', font='TkDefaultFont', foreground=p['ink'], background=p['bg'])
    style.configure('TFrame', background=p['bg'])
    style.configure('AppTitle.TLabel', background=p['bg'], foreground=p['ink'], font=(ui_family, 18, 'bold'))
    style.configure('AppAccent.TLabel', background=p['bg'], foreground=p['accent'], font=(ui_family, 18, 'bold'))
    style.configure('Eyebrow.TLabel', background=p['bg'], foreground=p['muted'], font=(ui_family, 9))
    style.configure('Brand.TFrame', background=p['surface'])
    for name_, fg in [('Brand.TLabel',p['ink']), ('Brand.Title.TLabel',p['accent']), ('Brand.Muted.TLabel',p['muted'])]:
        style.configure(name_, background=p['surface'], foreground=fg)
    style.configure('TLabel', background=p['bg'], foreground=p['ink'])
    style.configure('Muted.TLabel', background=p['bg'], foreground=p['muted'])
    # Clam's border element is used explicitly for a complete outline on all
    # four sides, including notebook tabs on Windows.
    style.configure('TButton', padding=(10, 7), borderwidth=1,
                    bordercolor=p['button_border'], lightcolor=p['button_border'],
                    darkcolor=p['button_border'], background=p['button'],
                    foreground=p['ink'], relief='flat')
    style.map('TButton',
              background=[('disabled', p['disabled']), ('pressed', p['selected']), ('active', p['selected'])],
              foreground=[('disabled', p['muted'])],
              bordercolor=[('disabled', p['border']), ('active', p['primary'])],
              lightcolor=[('active', p['primary'])], darkcolor=[('active', p['primary'])])
    style.configure('Primary.TButton', background=p['primary'], foreground='white', borderwidth=1,
                    bordercolor=p['primary'], lightcolor=p['primary'], darkcolor=p['primary'],
                    padding=(13, 7), font=(ui_family, 10, 'bold'))
    style.map('Primary.TButton', background=[('disabled', p['disabled']), ('active', p['hover']), ('pressed', p['hover'])],
              foreground=[('disabled', p['muted']), ('active', 'white')])
    style.configure('Quiet.TButton', background=p['button'], foreground=p['ink'], borderwidth=1,
                    bordercolor=p['button_border'], lightcolor=p['button_border'], darkcolor=p['button_border'], padding=(8, 5))
    style.map('Quiet.TButton', background=[('active', p['selected'])], foreground=[('active', p['ink'])])
    style.configure('TMenubutton', padding=(10, 7), background=p['button'], foreground=p['ink'],
                    borderwidth=1, bordercolor=p['button_border'], lightcolor=p['button_border'],
                    darkcolor=p['button_border'], relief='flat', arrowcolor=p['ink'])
    style.map('TMenubutton', background=[('active', p['selected']), ('disabled', p['disabled'])],
              foreground=[('disabled', p['muted'])])
    style.configure('Danger.TButton', foreground=('#ff9a9a' if name == 'dark' else '#a43b39'))
    style.configure('TNotebook', background=p['bg'], borderwidth=0, lightcolor=p['bg'], darkcolor=p['bg'], bordercolor=p['bg'], tabmargins=(0, 3, 0, 8))
    style.layout('TNotebook.Tab', [
        ('Button.border', {'sticky': 'nswe', 'children': [
            ('Button.padding', {'sticky': 'nswe', 'children': [
                ('Notebook.label', {'side': 'top', 'sticky': ''})
            ]})
        ]})
    ])
    style.configure('TNotebook.Tab', padding=(12, 8), background=p['tab'], foreground=p['ink'],
                    borderwidth=1, relief='flat', bordercolor=p['tab_border'],
                    lightcolor=p['tab_border'], darkcolor=p['tab_border'])
    style.map('TNotebook.Tab',
              background=[('selected', p['selected']), ('active', p['button'])],
              foreground=[('selected', p['ink']), ('active', p['ink'])],
              bordercolor=[('selected', p['primary']), ('active', p['accent'])],
              lightcolor=[('selected', p['primary']), ('active', p['accent'])],
              darkcolor=[('selected', p['primary']), ('active', p['accent'])])
    # Top-level navigation is made from real buttons; hide only its native tabs.
    style.configure('Main.TNotebook', background=p['bg'], borderwidth=0, tabmargins=0)
    style.layout('Main.TNotebook.Tab', [])
    style.configure('MainNav.TButton', padding=(9, 7), background=p['button'], foreground=p['ink'],
                    borderwidth=1, bordercolor=p['button_border'], lightcolor=p['button_border'],
                    darkcolor=p['button_border'], relief='flat')
    style.map('MainNav.TButton',
              background=[('selected', p['primary']), ('active', p['selected'])],
              foreground=[('selected', '#ffffff'), ('active', p['ink'])],
              bordercolor=[('selected', p['primary']), ('active', p['accent'])],
              lightcolor=[('selected', p['primary']), ('active', p['accent'])],
              darkcolor=[('selected', p['primary']), ('active', p['accent'])])
    style.configure('Treeview', background=p['field'], fieldbackground=p['field'], rowheight=31, foreground=p['ink'], borderwidth=0, relief='flat')
    style.map('Treeview', background=[('selected',p['primary'])], foreground=[('selected','#ffffff')])
    style.configure('Treeview.Heading', background=p['surface'], foreground=p['ink'], font=(ui_family, 10, 'bold'), padding=(7, 7), relief='flat')
    style.map('Treeview.Heading', background=[('active',p['selected'])])
    style.configure('TEntry', padding=6, fieldbackground=p['field'], foreground=p['ink'], insertcolor=p['ink'])
    style.configure('TCombobox', padding=5, fieldbackground=p['field'], foreground=p['ink'], arrowcolor=p['ink'])
    style.map('TCombobox', fieldbackground=[('readonly',p['field'])], foreground=[('readonly',p['ink'])])
    style.configure('TCheckbutton', background=p['bg'], foreground=p['ink'])
    style.map('TCheckbutton', background=[('active',p['bg'])])
    style.configure('TRadiobutton', background=p['bg'], foreground=p['ink'])
    style.map('TRadiobutton', background=[('active',p['bg'])])
    style.configure('TLabelframe', background=p['bg'], bordercolor=p['border'], padding=8)
    style.configure('TLabelframe.Label', background=p['bg'], foreground=p['ink'], font=(ui_family, 10, 'bold'))
    style.configure('TPanedwindow', background=p['bg'])
    style.configure('Sash', sashthickness=7, background=p['bg'], gripcount=0)
    style.configure('Vertical.TScrollbar', background=p['surface'], troughcolor=p['bg'], bordercolor=p['bg'], arrowcolor=p['muted'], relief='flat')
    style.map('Vertical.TScrollbar', background=[('active', p['border'])])
    style.configure('Horizontal.TScrollbar', background=p['surface'], troughcolor=p['bg'], bordercolor=p['bg'], arrowcolor=p['muted'], relief='flat')
    style.map('Horizontal.TScrollbar', background=[('active', p['border'])])
    style.configure('TSeparator', background=p['border'])
    # Recolour existing text and menus; diagrams retain their contrasting paper canvas.
    def visit(widget):
        for child in widget.winfo_children():
            if hasattr(child, 'set_grid_color'):
                child.set_grid_color(p['border'] if name == 'dark' else '#aab0c6')
            if isinstance(child, tk.Text):
                child.configure(background=p['field'], foreground=p['ink'], insertbackground=p['ink'], selectbackground=p['primary'], selectforeground='#ffffff')
            elif isinstance(child, tk.Canvas) and getattr(child, '_theme_course_canvas', False):
                child.configure(background=p['field'])
            elif isinstance(child, tk.Canvas) and getattr(child, '_theme_background', False):
                child.configure(background=p['bg'])
            elif isinstance(child, tk.Menu):
                try:
                    child.configure(background=p['surface'], foreground=p['ink'], activebackground=p['primary'], activeforeground='#ffffff')
                except tk.TclError:
                    pass
            visit(child)
    visit(root)
