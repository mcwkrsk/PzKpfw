"""Integrated IS-2 structure editor in Tk: screenshot-informed, independent UI.

All persistent edits go through ProjectDocument; no private Qt/IS-2 binary is
required. Unidentified native extensions are kept untouched in the XML.
"""
from __future__ import annotations
from .i18n import tr

import json
import tkinter as tk
from tkinter import ttk, filedialog, messagebox, font as tkfont
from pathlib import Path

from .coursework import (
    build_course_scene, scene_svg, course_checklist, renumber_structure, set_alternative_labels, _wrapped_lines, edge_paths,
)
from .gui_models import action_tree_rows
from .specifications import action_code, parameter_code, primary_links, add_primary_link, remove_primary_link, FORM_NAMES
from .exports import export_report
from .specifications import form_html
from .grid_tree import GridTreeview
from .ui_performance import CoalescedCallback
from .ui_resources import persistent_menu
from .focus_view import PackSnapshot, restored_sash_positions
from .is2_spd_view import build_is2_spd_scene, is2_connectors, is2_parameter_marks, is2_spd_svg
from .ui_theme import BACKGROUND, SURFACE, INK, MUTED, BORDER, PRIMARY, PALE_BLUE, TEAL

KIND_TEXT = {'0': tr('Элементарное'), '1': tr('Альтернатива'), '2': tr('Последовательность'), '3': tr('Цикл') }
FORMAL_LABELS = {'0': tr('Аналитическая'), '2': tr('Алгоритмическая')}
STATUS_LABELS = {'0': tr('Элементарное'), '1': tr('Промежуточное')}


def _fit_text_lines(value, measure, max_width, max_lines):
    """Word-wrap and ellipsize using the actual font metrics in pixels."""
    if max_width <= 0 or max_lines <= 0:
        return []
    remaining = (value or tr('(без названия)')).strip() or tr('(без названия)')
    lines = []
    while remaining and len(lines) < max_lines:
        count = 0
        for i in range(1, len(remaining) + 1):
            if measure(remaining[:i]) > max_width:
                break
            count = i
        if not count:
            break
        if count < len(remaining):
            space = remaining.rfind(' ', 0, count + 1)
            if space > 0:
                count = space
        line, remaining = remaining[:count].rstrip(), remaining[count:].lstrip()
        lines.append(line)
    if remaining and lines:
        last = lines[-1].rstrip(' .')
        while last and measure(last + '…') > max_width:
            last = last[:-1]
        lines[-1] = last + '…' if measure(last + '…') <= max_width else ''
    return lines


class CourseworkPanel(ttk.Frame):
    """End-to-end editor for structure, properties, parameters and print views."""

    def __init__(self, master, app):
        super().__init__(master)
        self.app = app
        self.focus_id: str | None = None
        self.selected_id: str | None = None
        self.depth_limit: int | None = 2
        self.zoom = 0.9
        self.search_var = tk.StringVar()
        self._param_options: dict[str, str] = {}
        self._scene = None
        self._edit_buttons = []
        self._navigation_history = []
        self._navigation_document = None
        self._is2_view = False
        self._is2_sheets = {}
        self._build()

    @property
    def doc(self):
        return self.app.doc

    def _build(self):
        # The structure editor is a normal program tab; project creation belongs
        # to the application header rather than a special 'coursework' workspace.
        top = ttk.Frame(self, padding=(11, 8, 11, 0))
        top.pack(fill='x')
        ttk.Label(top, text=tr('Формирование СПД'), font=('TkDefaultFont', 13, 'bold')).pack(side='left')
        ttk.Label(top, text=tr('Выберите действие на схеме или слева; свойства редактируются справа'),
                  style='Muted.TLabel').pack(side='left', padx=(17, 0))
        focus_button = ttk.Button(top, text=tr('⛶ На весь экран'), command=lambda: self.app.enter_diagram_focus(self))
        focus_button._tooltip_text = tr('Скрыть панели и показать схему на всю рабочую область.')
        focus_button.pack(side='right')
        self._is2_mode_button = ttk.Button(top, text=tr('Вид ИС-2'), command=self._toggle_is2_view)
        self._is2_mode_button._tooltip_text = tr('Переключить расположение схемы на листы по образцу ИС-2.')
        self._is2_mode_button.pack(side='right', padx=(0, 6))

        structure = ttk.Frame(self, padding=(11, 7, 11, 2))
        structure.pack(fill='x')
        for label, callback, primary in [
            (tr('+ Корневое'), self._add_root, False), (tr('+ Дочернее'), self._add_child, True),
            (tr('Вставить до'), lambda: self._insert(False), False),
            (tr('Вставить после'), lambda: self._insert(True), False),
            (tr('Условия ветвей…'), self._alternative_labels, False),
            ('↑', lambda: self._move(-1), False), ('↓', lambda: self._move(1), False),
            (tr('Удалить'), self._delete, False),
        ]:
            button = ttk.Button(structure, text=label, command=callback,
                                style='Primary.TButton' if primary else 'TButton')
            button.pack(side='left', padx=(0, 5))
            self._edit_buttons.append(button)
        code_button = ttk.Button(structure, text=tr('Перенумеровать z…'), command=self._renumber)
        code_button.pack(side='right')
        self._edit_buttons.append(code_button)

        # The creation dialog already offers the new action's type. Keep
        # conversion of an existing action available in a compact menu.
        construction = ttk.Menubutton(structure, text=tr('Изменить конструкцию ▾'))
        choices = tk.Menu(construction, tearoff=False)
        for label, kind in ((tr('Последовательность'), 'sequence'), (tr('Альтернатива'), 'alternative'),
                            (tr('Цикл'), 'iteration'), (tr('Элементарное'), 'elementary')):
            choices.add_command(label=label, command=lambda k=kind: self._convert(k))
        construction.configure(menu=choices)
        construction.pack(side='left', padx=(0, 5))
        self._edit_buttons.append(construction)

        views = ttk.Frame(self, padding=(11, 4, 11, 8))
        views.pack(fill='x')
        for label, action in (
            (tr('Общая схема'), self._root_scene), (tr('Вся декомпозиция'), self._full_scene),
            (tr('Экспорт SVG'), self._export_svg), (tr('Проверить модель'), self._check),
        ):
            ttk.Button(views, text=label, command=action).pack(side='left', padx=(0, 5))
        self.mode_label = ttk.Label(views, text=tr('Вся модель · 100%'), style='Muted.TLabel')
        self.mode_label.pack(side='right')
        self._is2_sheet_bar = ttk.Frame(self, padding=(11, 2, 11, 5))
        ttk.Label(self._is2_sheet_bar, text=tr('Лист:')).pack(side='left', padx=(0, 6))
        self._is2_sheet_choice = ttk.Combobox(self._is2_sheet_bar, state='readonly', width=54)
        self._is2_sheet_choice.pack(side='left', fill='x', expand=True)
        self._is2_sheet_choice.bind('<<ComboboxSelected>>', self._select_is2_sheet)
        ttk.Label(self._is2_sheet_bar, text=tr('Расположение — реконструкция'), style='Muted.TLabel').pack(side='left', padx=10)

        panes = ttk.Panedwindow(self, orient='horizontal')
        panes.pack(fill='both', expand=True, padx=10, pady=(0, 9))
        left = ttk.Frame(panes, width=245)
        center = ttk.Frame(panes)
        right = ttk.Frame(panes, width=330)
        self._focus_panes, self._focus_left, self._focus_right = panes, left, right
        self._focus_return_bar = ttk.Frame(self, padding=(6, 4))
        self._navigation_back_button = ttk.Button(self._focus_return_bar, text=tr('← Назад по схеме'),
                                                   command=self._back_scene, state='disabled')
        self._navigation_back_button._tooltip_text = tr('Вернуться к предыдущему виду схемы; изменения проекта не отменяются.')
        self._navigation_back_button.pack(side='left')
        ttk.Button(self._focus_return_bar, text=tr('← Вернуться'), command=self.app.exit_diagram_focus).pack(side='right')
        panes.add(left, weight=2)
        panes.add(center, weight=8)
        panes.add(right, weight=3)

        ttk.Label(left, text=tr('ДЕРЕВО ДЕЙСТВИЙ'), font=('TkDefaultFont', 10, 'bold'),
                  padding=(4, 4)).pack(anchor='w')
        search_bar = ttk.Frame(left)
        search_bar.pack(fill='x', pady=(5, 6))
        self.search_entry = ttk.Entry(search_bar, textvariable=self.search_var)
        self.search_entry.pack(side='left', fill='x', expand=True)
        ttk.Button(search_bar, text='×', width=3,
                   command=lambda: self.search_var.set('')).pack(side='left', padx=(3, 0))
        self.search_var.trace_add('write', lambda *_: self._refresh_tree())
        ttk.Label(left, text=tr('Поиск по коду и наименованию'),
                  style='Muted.TLabel').pack(anchor='w', pady=(0, 5))
        treebox = ttk.Frame(left)
        treebox.pack(fill='both', expand=True)
        self.tree = GridTreeview(treebox, show='tree', selectmode='browse')
        self._tree_requested_width = 240
        ty = ttk.Scrollbar(treebox, orient='vertical', command=self.tree.yview)
        tx = ttk.Scrollbar(treebox, orient='horizontal', command=self.tree.xview)
        self.tree.configure(yscrollcommand=ty.set, xscrollcommand=tx.set)
        self.tree.column('#0', width=self._tree_requested_width, stretch=False)
        self.tree.grid(row=0, column=0, sticky='nsew')
        ty.grid(row=0, column=1, sticky='ns')
        tx.grid(row=1, column=0, sticky='ew')
        treebox.columnconfigure(0, weight=1)
        treebox.rowconfigure(0, weight=1)
        self.tree.bind('<Configure>', self._update_tree_column_width)
        self.tree.bind('<<TreeviewSelect>>', self._tree_select)
        self.tree.bind('<Double-1>', lambda _event: self._focus_scene())
        self.tree.bind('<F2>', lambda _event: self._focus_name())
        self.tree.bind('<Delete>', lambda _event: self._confirm_delete())
        self.tree_count = ttk.Label(left, text='', style='Muted.TLabel', padding=(5, 6))
        self.tree_count.pack(anchor='w')

        self.canvas = tk.Canvas(center, bg='#f9fbfe', highlightthickness=0,
                                bd=0, cursor='arrow')
        self.canvas._theme_course_canvas = True
        sx = ttk.Scrollbar(center, orient='horizontal', command=self.canvas.xview)
        sy = ttk.Scrollbar(center, orient='vertical', command=self.canvas.yview)
        self.canvas.configure(xscrollcommand=sx.set, yscrollcommand=sy.set)
        self.canvas.grid(row=0, column=0, sticky='nsew')
        sy.grid(row=0, column=1, sticky='ns'); sx.grid(row=1, column=0, sticky='ew')
        center.columnconfigure(0, weight=1); center.rowconfigure(0, weight=1)
        self._resize_redraw = CoalescedCallback(self.canvas, self._draw)
        self.canvas.bind('<Configure>', self._resize_redraw.request)
        self.canvas.bind('<Button-1>', self._canvas_select)
        self.canvas.bind('<Double-1>', self._canvas_open)
        self.canvas.bind('<Button-3>', self._canvas_context_menu)
        self.canvas.bind('<ButtonPress-2>', lambda e: self.canvas.scan_mark(e.x, e.y))
        self.canvas.bind('<B2-Motion>', lambda e: self.canvas.scan_dragto(e.x, e.y, gain=1))
        self.canvas.bind('<Control-MouseWheel>', self._wheel)
        self.canvas.bind('<Control-Button-4>', lambda _event: self._zoom(1.08))
        self.canvas.bind('<Control-Button-5>', lambda _event: self._zoom(1/1.08))
        self.canvas.bind('<Control-Key-0>', lambda _event: self._fit_scene())
        self.canvas.bind('<F2>', lambda _event: self._focus_name())
        self._canvas_help = ttk.Label(center, text=tr('ЛКМ — выбрать · двойной щелчок — открыть лист · Ctrl + колесо — масштаб · Ctrl + 0 — вписать · средняя кнопка — перемещение'),
                                      style='Muted.TLabel', padding=(6, 4))
        self._canvas_help.grid(row=2, column=0, sticky='w')

        # Scrollable inspector: on 650–720 px screens the function/argument
        # controls remain available, unlike the previous fixed-height sidebar.
        side_canvas = tk.Canvas(right, highlightthickness=0, background=BACKGROUND, bd=0)
        side_canvas._theme_background = True
        side_scroll = ttk.Scrollbar(right, orient='vertical', command=side_canvas.yview)
        side_canvas.configure(yscrollcommand=side_scroll.set)
        side_canvas.pack(side='left', fill='both', expand=True)
        side_scroll.pack(side='right', fill='y')
        inspector = ttk.Frame(side_canvas, padding=(10, 8, 10, 16))
        self._inspector_window = side_canvas.create_window((0, 0), window=inspector, anchor='nw')
        def update_inspector_region(_event=None):
            bounds = side_canvas.bbox(self._inspector_window)
            if not bounds:
                return
            viewport_height = side_canvas.winfo_height()
            side_canvas.configure(scrollregion=(0, 0, max(1, side_canvas.winfo_width()),
                                                max(viewport_height, bounds[3])))
            if bounds[3] <= viewport_height:
                side_canvas.yview_moveto(0)

        def resize_inspector(event):
            side_canvas.itemconfigure(self._inspector_window, width=event.width)
            update_inspector_region()

        inspector.bind('<Configure>', update_inspector_region)
        side_canvas.bind('<Configure>', resize_inspector)
        side_canvas.bind('<MouseWheel>', lambda e: side_canvas.yview_scroll(-1 if e.delta > 0 else 1, 'units'))
        side_canvas.bind('<Button-4>', lambda _e: side_canvas.yview_scroll(-1, 'units'))
        side_canvas.bind('<Button-5>', lambda _e: side_canvas.yview_scroll(1, 'units'))
        ttk.Label(inspector, text=tr('СВОЙСТВА ДЕЙСТВИЯ'),
                  font=('TkDefaultFont', 10, 'bold')).pack(anchor='w')
        self.property_code = ttk.Label(inspector, text=tr('Выберите действие'), style='Muted.TLabel')
        self.property_code.pack(anchor='w', pady=(7, 8))
        ttk.Label(inspector, text=tr('Наименование')).pack(anchor='w')
        self.property_name = tk.Text(inspector, height=4, width=29, wrap='word', undo=True,
                                     bg=SURFACE, fg=INK, relief='solid', bd=1, font=('TkDefaultFont', 10),
                                     highlightthickness=1, highlightcolor=PRIMARY, highlightbackground=BORDER)
        self.property_name.pack(fill='x', pady=(3, 8))
        self.property_type = ttk.Label(inspector, text=tr('Тип: —'), style='Muted.TLabel', wraplength=290)
        self.property_type.pack(anchor='w', pady=(0, 7))
        ttk.Label(inspector, text=tr('Степень формализации')).pack(anchor='w')
        self.property_formal = ttk.Combobox(inspector, state='readonly', values=tuple(FORMAL_LABELS.values()))
        self.property_formal.pack(fill='x', pady=(3, 9))
        ttk.Label(inspector, text=tr('Статус')).pack(anchor='w')
        self.property_status = ttk.Combobox(inspector, state='readonly', values=tuple(STATUS_LABELS.values()))
        self.property_status.pack(fill='x', pady=(3, 9))
        ttk.Label(inspector, text=tr('Структурная метка (XML @mark)')).pack(anchor='w')
        self.property_mark = ttk.Entry(inspector)
        self.property_mark.pack(fill='x', pady=(3, 10))
        property_button = ttk.Button(inspector, text=tr('Сохранить свойства действия'), command=self._apply_properties,
                                     style='Primary.TButton')
        property_button.pack(fill='x', pady=(0, 12))
        self._edit_buttons.append(property_button)
        self.property_name.bind('<Control-Return>', lambda _event: (self._apply_properties(), 'break')[-1])
        ttk.Separator(inspector).pack(fill='x', pady=5)
        ttk.Label(inspector, text=tr('ФУНКЦИИ И АРГУМЕНТЫ'),
                  font=('TkDefaultFont', 10, 'bold')).pack(anchor='w', pady=(5, 8))
        ttk.Label(inspector, text=tr('Параметр для выбранного действия')).pack(anchor='w')
        self.parameter_var = tk.StringVar()
        self.parameter_choice = ttk.Combobox(inspector, state='readonly', textvariable=self.parameter_var)
        self.parameter_choice.pack(fill='x', pady=(3, 7))
        row = ttk.Frame(inspector)
        row.pack(fill='x')
        ttk.Button(row, text=tr('+ Функция (*)'), command=lambda: self._add_parameter_link('*')).pack(side='left')
        ttk.Button(row, text=tr('+ Аргумент (+)'), command=lambda: self._add_parameter_link('+')).pack(side='left', padx=4)
        self.link_tree = GridTreeview(inspector, columns=('role', 'name'), show='headings',
                                      height=5, selectmode='browse')
        self.link_tree.heading('role', text=tr('Роль')); self.link_tree.heading('name', text=tr('Параметр'))
        self.link_tree.column('role', width=58, stretch=False)
        self.link_tree.column('name', width=182)
        self.link_tree.pack(fill='both', expand=True, pady=(8, 5))
        ttk.Button(inspector, text=tr('Убрать выбранную связь'),
                   command=self._delete_parameter_link).pack(fill='x')
        ttk.Separator(inspector).pack(fill='x', pady=11)
        ttk.Button(inspector, text=tr('+ Новый параметр…'), command=self._add_parameter).pack(fill='x', pady=(0, 5))
        ttk.Button(inspector, text=tr('+ Новый объект…'), command=self._add_object).pack(fill='x')
        ttk.Label(inspector, text=tr('Все параметры, формы и матрица доступны в верхних разделах программы.'),
                  style='Muted.TLabel', wraplength=290, justify='left').pack(fill='x', pady=(11, 0))

    def set_editing_enabled(self, enabled: bool):
        state = 'normal' if enabled else 'disabled'
        for button in self._edit_buttons:
            button.configure(state=state)

    def _focus_name(self):
        if self.selected_id:
            self.property_name.focus_set()
            self.property_name.tag_add('sel', '1.0', 'end-1c')

    def _confirm_delete(self):
        if self.doc is not None and self.selected_id:
            # The document editor asks for confirmation and handles dependent records.
            self._delete()

    def _canvas_context_menu(self, event):
        items = self.canvas.find_overlapping(event.x, event.y, event.x, event.y)
        for item in reversed(items):
            for tag in self.canvas.gettags(item):
                if tag.startswith('course-action:'):
                    self.select_action(tag.split(':', 1)[1])
                    break
        menu = persistent_menu(self, '_action_context_popup', (
            (tr('Редактировать название'), self._focus_name),
            (tr('Добавить дочернее действие'), self._add_child),
            (tr('Вставить после'), lambda: self._insert(True)),
            (tr('Изменить тип…'), self._convert),
            (tr('Открыть лист'), self._focus_scene),
            None,
            (tr('Удалить действие'), self._confirm_delete),
        ))
        try:
            menu.tk_popup(event.x_root, event.y_root)
        finally:
            menu.grab_release()

    def enter_focus_view(self):
        self._update_navigation_controls()
        self._focus_layout = PackSnapshot(self)
        self._focus_restore_token = getattr(self, '_focus_restore_token', 0) + 1
        self._focus_pane_width = self._focus_panes.winfo_width()
        self._focus_sashes = [self._focus_panes.sashpos(i) for i in (0, 1)]
        self._focus_layout.hide_except({self._focus_panes})
        self._focus_panes.forget(self._focus_left)
        self._focus_panes.forget(self._focus_right)
        self._canvas_help.grid_remove()
        self._focus_return_bar.pack(fill='x', before=self._focus_panes)

    def exit_focus_view(self):
        self._focus_return_bar.pack_forget()
        self._focus_panes.insert(0, self._focus_left, weight=2)
        self._focus_panes.add(self._focus_right, weight=3)
        self._canvas_help.grid()
        self._focus_layout.restore()
        token = self._focus_restore_token

        def restore_sashes(attempt=0):
            try:
                if (not self._focus_panes.winfo_exists() or self.app._diagram_focus is not None
                        or token != self._focus_restore_token):
                    return
                # Geometry must settle after both the notebook and its sidebars
                # are restored; otherwise Tk can place the right sash offscreen.
                self._focus_panes.update_idletasks()
                width = self._focus_panes.winfo_width()
                if width < 300 and attempt < 2:
                    self.after(80, lambda: restore_sashes(attempt + 1))
                    return
                first, second = restored_sash_positions(width, self._focus_pane_width, self._focus_sashes)
                self._focus_panes.sashpos(1, second)
                self._focus_panes.sashpos(0, first)
                self._focus_panes.sashpos(1, second)
                self._focus_panes.update_idletasks()
                if self._focus_right.winfo_width() < min(80, width // 4) and attempt < 2:
                    self.after(80, lambda: restore_sashes(attempt + 1))
            except tk.TclError:
                pass
        self.after_idle(restore_sashes)

    def _fit_scene(self):
        if self.doc is None:
            return
        scene = self._display_scene()
        self.canvas.update_idletasks()
        width = max(240, self.canvas.winfo_width() - 32)
        height = max(200, self.canvas.winfo_height() - 32)
        self.zoom = max(0.25, min(1.6, width / max(1, scene.width),
                                       height / max(1, scene.height)))
        self._draw()
        self.canvas.xview_moveto(0)
        self.canvas.yview_moveto(0)

    def _update_tree_column_width(self, _event=None):
        width = max(self._tree_requested_width, self.tree.winfo_width() - 4)
        if int(self.tree.column('#0', 'width')) != width:
            self.tree.column('#0', width=width)

    def _refresh_tree(self):
        if not hasattr(self, 'tree') or self.doc is None:
            return
        nodes = {n.get('id', ''): n for n in self.doc.actions}
        rows = action_tree_rows(self.doc)
        term = self.search_var.get().strip().casefold()
        parents = {row.action_id: row.parent_id for row in rows}
        visible = set(nodes)
        if term:
            visible = set()
            for action_id, node in nodes.items():
                if term in (action_code(node) + ' ' + node.get('name', '')).casefold():
                    current = action_id
                    while current in nodes and current not in visible:
                        visible.add(current)
                        current = parents.get(current, '')
        self.tree.delete(*self.tree.get_children())
        font = tkfont.nametofont('TkDefaultFont')
        self._tree_requested_width = 240
        for row in rows:
            if row.action_id not in visible:
                continue
            parent = row.parent_id if row.parent_id in visible else ''
            node = nodes[row.action_id]
            caption = f'{action_code(node)}  {node.get("name", "")}'
            self._tree_requested_width = max(self._tree_requested_width, font.measure(caption) + 25 * (row.depth + 1) + 24)
            self.tree.insert(parent, 'end', iid=row.action_id, text=caption)
        self._update_tree_column_width()
        for top in self.tree.get_children(''):
            self.tree.item(top, open=True)
        if self.selected_id and self.tree.exists(self.selected_id):
            self.tree.selection_set(self.selected_id)
        self.tree_count.configure(text=tr('Показано: {shown} из {total}').format(shown=len(visible), total=len(nodes)))

    def refresh(self):
        if self.doc is not self._navigation_document:
            self._navigation_document = self.doc
            self._navigation_history.clear()
        if self.doc is None:
            self._update_navigation_controls()
            self.canvas.delete('all')
            self.tree.delete(*self.tree.get_children())
            self._clear_properties()
            self.tree_count.configure(text='')
            return
        nodes = {n.get('id', ''): n for n in self.doc.actions}
        if self.focus_id not in nodes:
            self.focus_id = None
        if self.selected_id not in nodes:
            self.selected_id = None
        self._update_navigation_controls()
        self._refresh_tree()
        if self._is2_view:
            self._refresh_is2_sheets()
        self._draw()
        self._show_properties()

    def _display_scene(self):
        builder = build_is2_spd_scene if getattr(self, '_is2_view', False) else build_course_scene
        return builder(self.doc, self.focus_id, max_depth=self.depth_limit)

    def _toggle_is2_view(self):
        self._is2_view = not self._is2_view
        self._is2_mode_button.configure(text=tr('Обычный вид') if self._is2_view else tr('Вид ИС-2'))
        if self._is2_view:
            self._refresh_is2_sheets()
            self._is2_sheet_bar.pack(fill='x', before=self._focus_panes)
        else:
            self._is2_sheet_bar.pack_forget()
        self._draw()

    def _refresh_is2_sheets(self):
        self._is2_sheets = {tr('Общая схема'): None}
        if self.doc is not None:
            nodes = {node.get('id', ''): node for node in self.doc.actions}
            parents = {link.get('afe1', '') for link in self.doc.links if link.get('type') == '2'}
            for row in action_tree_rows(self.doc):
                if row.action_id in parents:
                    node = nodes[row.action_id]
                    label = f'{action_code(node)} · {node.get("name", "")} (ID {row.action_id})'
                    self._is2_sheets[label] = row.action_id
        self._is2_sheet_choice.configure(values=tuple(self._is2_sheets))
        self._sync_is2_sheet()

    def _sync_is2_sheet(self):
        label = next((label for label, ident in self._is2_sheets.items() if ident == self.focus_id), '')
        self._is2_sheet_choice.set(label)

    def _select_is2_sheet(self, _event=None):
        label = self._is2_sheet_choice.get()
        if label in self._is2_sheets:
            self._navigate_scene(self._is2_sheets[label], 2)

    def _draw_is2(self):
        canvas = self.canvas
        scene = self._display_scene()
        self._scene = scene
        self._sync_is2_sheet()
        canvas.configure(background='#eeeeee')
        z = self.zoom
        paper_w, paper_h = scene.width*z, scene.height*z
        width, height = max(paper_w, canvas.winfo_width()), max(paper_h, canvas.winfo_height())
        ox, oy = max(0, (width-paper_w)/2), max(0, (height-paper_h)/2)
        canvas.create_rectangle(ox,oy,ox+paper_w,oy+paper_h,fill='#ffffff',outline='#555555',tags=('paper',))
        step_x, step_y = scene.column_width*z, scene.row_height*z
        for i in range(int(scene.width/scene.column_width)+1):
            canvas.create_line(ox+i*step_x,oy,ox+i*step_x,oy+paper_h,fill='#c4c4c4',tags=('grid',))
        for i in range(int(scene.height/scene.row_height)+1):
            canvas.create_line(ox,oy+i*step_y,ox+paper_w,oy+i*step_y,fill='#c4c4c4',tags=('grid',))
        for x1,y1,x2,y2 in is2_connectors(scene):
            canvas.create_line(ox+x1*z,oy+y1*z,ox+x2*z,oy+y2*z,fill='#555555',width=max(1,1.2*z))
        scene_nodes = {node.ident: node for node in scene.nodes}
        for edge in scene.edges:
            parent, child = scene_nodes[edge.source], scene_nodes[edge.target]
            if parent.kind == '3':
                canvas.create_text(ox+(parent.x+scene.node_width/2+7)*z,
                                   oy+(parent.y+scene.node_height+child.y)*z/2,
                                   text='+', fill='#202020', font=('Arial', max(6, round(11*z))))
        marks = is2_parameter_marks(self.doc)
        show_labels = z >= .55
        if show_labels:
            small_font = tkfont.Font(root=canvas,family='Arial',size=-max(6,round(10*z)))
            title_fonts = {size: tkfont.Font(root=canvas,family='Arial',size=-size)
                           for size in range(max(5,round(8*z)), max(6,round(12*z))+1)}
            self._scene_fonts = (small_font, *title_fonts.values())
        w,h = scene.node_width*z,scene.node_height*z
        for node in scene.nodes:
            x,y = ox+node.x*z,oy+node.y*z
            tags = ('course-node', 'course-action:'+node.ident)
            color = '#128228' if node.ident == self.selected_id else '#202020'
            canvas.create_rectangle(x,y,x+w,y+h,fill='#ffffff',outline=color,width=2 if node.ident==self.selected_id else 1.2,tags=tags)
            band = 15*z if node.kind=='1' else 0
            if band:
                canvas.create_line(x,y+h-band,x+w,y+h-band,fill=color,tags=tags)
                canvas.create_line(x+w/2,y+h-band,x+w/2,y+h,fill=color,tags=tags)
            if not show_labels:
                continue
            if band:
                for number,fraction in (('1',.25),('2',.75)):
                    canvas.create_text(x+w*fraction,y+h-band/2,text=number,fill=color,font=small_font,tags=tags)
            pad=max(2,4*z)
            available = max(1, h-band-small_font.metrics('linespace')-2*pad)
            for size in sorted(title_fonts, reverse=True):
                title_font = title_fonts[size]
                line_height = title_font.metrics('linespace')
                line_count = max(1, int(available // line_height))
                lines = _fit_text_lines(node.title, title_font.measure, w-2*pad, line_count)
                if lines and not lines[-1].endswith('…'):
                    break
            top = y + pad + max(0, (available - len(lines)*line_height)/2)
            for index,line in enumerate(lines):
                canvas.create_text(x+w/2,top+index*line_height,anchor='n',text=line,fill='#202020',font=title_font,tags=tags)
            bottom=y+h-band-pad
            for text, tx, anchor in ((node.code,x+w-pad,'se'),(marks.get(node.ident,''),x+pad,'sw')):
                fitted = _fit_text_lines(text,small_font.measure,w*.45,1) if text else []
                if fitted:
                    canvas.create_text(tx,bottom,anchor=anchor,text=fitted[0],fill=color,font=small_font,tags=tags)
        canvas.configure(scrollregion=(0,0,width,height))
        title = tr('Общая схема') if self.focus_id is None else action_code(self.doc.action(self.focus_id))
        self.mode_label.configure(text=tr('Вид ИС-2 · {title} · {zoom}%').format(title=title, zoom=round(z*100)))

    def _draw(self):
        canvas = self.canvas
        canvas.delete('all')
        dark = self.app.theme_name.get() == 'dark'
        canvas.configure(background='#1b1b29' if dark else '#ffffff')
        if self.doc is None:
            canvas.create_text(28, 32, anchor='nw', text=tr('// РАБОЧАЯ ОБЛАСТЬ'),
                               fill='#aaaabd' if dark else '#65697d', font=('TkDefaultFont', 10))
            canvas.create_text(28, 70, anchor='nw', text=tr('Создайте или откройте проект'),
                               fill='#f3f3f8' if dark else '#242536', font=('TkDefaultFont', 14, 'bold'))
            canvas.create_text(28, 104, anchor='nw', text=tr('Здесь появится схема вашей модели.'),
                               fill='#aaaabd' if dark else '#65697d', font=('TkDefaultFont', 10))
            return
        if getattr(self, '_is2_view', False):
            self._draw_is2()
            return
        scene = self._display_scene()
        self._scene = scene
        s = self.zoom
        w = scene.node_width * s; h = scene.node_height * s
        # Cover both the scene and the entire viewport, in every view mode.
        grid_width = max(scene.width * s, canvas.winfo_width())
        grid_height = max(scene.height * s, canvas.winfo_height())
        step_x = max(24.0, scene.column_width * s, grid_width / 1200)
        step_y = max(24.0, scene.row_height * s, grid_height / 1200)
        grid_color = '#303041' if dark else '#e4eaf2'
        for i in range(int(grid_width / step_x) + 2):
            x_grid = i * step_x
            canvas.create_line(x_grid, 0, x_grid, grid_height, fill=grid_color, tags=('grid',))
        for i in range(int(grid_height / step_y) + 2):
            y_grid = i * step_y
            canvas.create_line(0, y_grid, grid_width, y_grid, fill=grid_color, tags=('grid',))
        # Tiny text cannot be read and Tk does not clip text to rectangles.
        # Hide it at overview scales; selecting a block still shows full text.
        show_labels = s >= 0.55
        if show_labels:
            title_font = tkfont.Font(root=canvas, family='Arial', size=-max(6, round(13*s)))
            code_font = tkfont.Font(root=canvas, family='Arial', size=-max(6, round(11*s)), weight='bold')
            small_font = tkfont.Font(root=canvas, family='Arial', size=-max(6, round(10*s)))
            self._scene_fonts = (title_font, code_font, small_font)
        by_id = {n.ident: n for n in scene.nodes}
        for edge, points in edge_paths(scene):
            coords = [value*s for value in points]
            canvas.create_line(*coords, fill='#737d9a' if dark else '#8ba0b8',
                               width=max(1,1.5*s), arrow='last' if edge.kind == '1' else 'none')
        children_by_parent = {}
        for edge in scene.edges:
            children_by_parent.setdefault(edge.source, []).append(by_id[edge.target])
        for parent in scene.nodes:
            kids = sorted(children_by_parent.get(parent.ident, ()), key=lambda node:node.x)
            if len(kids) > 1 and parent.kind == '2':
                for a,b in zip(kids,kids[1:]):
                    canvas.create_line((a.x+scene.node_width)*s, (a.y+scene.node_height/2)*s,
                                       b.x*s,(b.y+scene.node_height/2)*s,fill='#70cfcb' if dark else '#4874ad',arrow='last')
        for node in scene.nodes:
            x,y = node.x*s,node.y*s
            tags=('course-node', 'course-action:'+node.ident)
            is_selected = node.ident == self.selected_id
            color = PRIMARY if is_selected else (('#70cfcb' if dark else '#207a75') if node.kind == '1' else ('#72758d' if dark else '#526c88'))
            fill = ('#30365f' if is_selected else '#282836') if dark else (PALE_BLUE if is_selected else SURFACE)
            ink = '#f3f3f8' if dark else INK
            canvas.create_rectangle(x+2*s,y+3*s,x+w+2*s,y+h+3*s,fill='#12121d' if dark else '#e8edf5',outline='',tags=tags)
            canvas.create_rectangle(x,y,x+w,y+h,fill=fill,outline=color,
                                    width=2.5 if is_selected else 1.4,tags=tags)
            is_alternative = node.kind == '1'
            # The two branch cells share a dedicated bottom band. The action
            # code stays in the main part of the block, above that band.
            band_height = (max(13*s, small_font.metrics('linespace') + 2*max(1, 2*s))
                           if show_labels else 13*s) if is_alternative else 0
            band_top = y + h - band_height
            if is_alternative:
                canvas.create_line(x, band_top, x+w, band_top, fill=color, tags=tags)
                canvas.create_line(x+w/2, band_top, x+w/2, y+h, fill=color, tags=tags)
            if show_labels:
                pad = max(2, 5*s)
                code_bottom = band_top - max(1, 2*s) if is_alternative else y+h-pad
                available = max(0, code_bottom - code_font.metrics('linespace') - (y + pad))
                line_height = title_font.metrics('linespace')
                lines = _fit_text_lines(node.title, title_font.measure, max(0, w - 2*pad), int(available // line_height))
                for idx, line in enumerate(lines):
                    canvas.create_text(x+w/2, y+pad+idx*line_height, anchor='n', text=line,
                                       fill=ink, font=title_font, tags=tags)
                code = _fit_text_lines(node.code, code_font.measure, max(0, w - 2*pad), 1)
                if code and code[0]:
                    canvas.create_text(x+w-pad, code_bottom, anchor='se', text=code[0],
                                       fill=ink, font=code_font, tags=tags)
                if is_alternative:
                    for number, center in (('1', x+w/4), ('2', x+3*w/4)):
                        canvas.create_text(center, band_top+band_height/2, anchor='center',
                                           text=number, fill=ink, font=small_font, tags=tags)
        canvas.configure(scrollregion=(0, 0, grid_width, grid_height))
        title = tr('Весь проект') if self.focus_id is None else action_code(self.doc.action(self.focus_id))
        scope = tr('глубина 2 + выходы альтернатив') if self.depth_limit == 2 else tr('вся структура')
        hint = ' · ' + tr('Увеличьте масштаб для подписей') if not show_labels else ''
        self.mode_label.configure(text=tr('{title} · {scope} · {zoom}%{hint}').format(title=title, scope=scope, zoom=round(s*100), hint=hint))

    def _tree_select(self, _event=None):
        selected = self.tree.selection()
        if selected:
            self.select_action(selected[0])

    def select_action(self, ident: str):
        if self.doc is None or ident not in {n.get('id') for n in self.doc.actions}:
            return
        if self.selected_id == ident:
            return
        self.selected_id = ident
        if self.tree.exists(ident) and self.tree.selection() != (ident,):
            self.tree.selection_set(ident)
            self.tree.see(ident)
        if self.app.action_tree.exists(ident):
            self.app.action_tree.selection_set(ident)
            self.app.action_tree.see(ident)
        self._draw()
        self._show_properties()

    def _canvas_select(self, _event=None):
        self.canvas.focus_set()
        items = self.canvas.find_withtag('current')
        if not items:
            return
        for tag in self.canvas.gettags(items[0]):
            if tag.startswith('course-action:'):
                self.select_action(tag.split(':',1)[1])
                break

    def _canvas_open(self, event=None):
        self._canvas_select(event)
        self._focus_scene()

    def _zoom(self, scale):
        self.zoom = max(0.25, min(2.5, self.zoom*scale))
        self._resize_redraw.request()

    def _wheel(self, event):
        if event.delta:
            steps = event.delta / 120 if self.canvas.tk.call('tk', 'windowingsystem') == 'win32' else event.delta
            self._zoom(1.08 ** steps)
        return 'break'

    def _view_state(self):
        return (self.focus_id, self.depth_limit, self.zoom,
                self.canvas.xview()[0], self.canvas.yview()[0])

    def _update_navigation_controls(self):
        can_return = self.doc is not None and (bool(self._navigation_history) or self.focus_id is not None)
        self._navigation_back_button.configure(state='normal' if can_return else 'disabled')

    def _navigate_scene(self, focus, depth):
        if self.doc is None or (focus, depth) == (self.focus_id, self.depth_limit):
            return
        self._navigation_history.append(self._view_state())
        # Limit retained view states; this is not document undo history.
        del self._navigation_history[:-100]
        self.focus_id, self.depth_limit = focus, depth
        self._draw()
        self.canvas.xview_moveto(0)
        self.canvas.yview_moveto(0)
        self._update_navigation_controls()

    def _back_scene(self):
        if self.doc is None:
            return
        ids = {node.get('id', '') for node in self.doc.actions}
        while self._navigation_history:
            focus, depth, zoom, xview, yview = self._navigation_history.pop()
            if focus is not None and focus not in ids:
                continue
            self.focus_id, self.depth_limit, self.zoom = focus, depth, zoom
            self._draw()
            self.canvas.xview_moveto(xview)
            self.canvas.yview_moveto(yview)
            self._update_navigation_controls()
            return
        # A leaf can already be focused when fullscreen is entered. In that
        # case, navigate to its real parent even without earlier view history.
        if self.focus_id is not None:
            parent = next((link.get('afe1') for link in self.doc.links
                           if link.get('type') == '2' and link.get('afe2') == self.focus_id), None)
            self.focus_id = parent if parent in ids else None
            self.depth_limit = 2
            self._draw()
            self.canvas.xview_moveto(0)
            self.canvas.yview_moveto(0)
        self._update_navigation_controls()

    def _full_scene(self):
        self._navigate_scene(None, None)

    def _root_scene(self):
        self._navigate_scene(None, 2)

    def _focus_scene(self):
        if self.selected_id:
            self._navigate_scene(self.selected_id, 2)

    def _clear_properties(self):
        self.property_code.configure(text=tr('Выберите действие'))
        self.property_type.configure(text=tr('Тип: —'))
        self.property_name.delete('1.0','end')
        self.property_formal.set(''); self.property_status.set(''); self.property_mark.delete(0,'end')
        self.link_tree.delete(*self.link_tree.get_children())

    def _show_properties(self):
        self._clear_properties()
        if self.doc is None or not self.selected_id:
            return
        node = self.doc.action(self.selected_id)
        self.property_code.configure(text=f'{action_code(node)} · XML ID {self.selected_id}')
        self.property_type.configure(text=tr('Тип: {kind}').format(kind=KIND_TEXT.get(node.get('type',''), tr('неизвестен'))) + (' · ' + ' / '.join(x.get('text','') for x in node.findall('alts')) if node.get('type')=='1' else ''))
        self.property_name.insert('1.0', node.get('name',''))
        self.property_formal.set(FORMAL_LABELS.get(node.get('formalization',''),''))
        self.property_status.set(STATUS_LABELS.get(node.get('status',''),''))
        self.property_mark.insert(0,node.get('mark',''))
        params = {p.get('id',''):p for p in self.doc.params_node.findall('param')}
        self._param_options.clear()
        for pid,p in params.items():
            caption=f'{parameter_code(p)} · {p.get("name", "")} (ID {pid})'
            self._param_options[caption]=pid
        self.parameter_choice.configure(values=tuple(self._param_options))
        if self._param_options:
            self.parameter_var.set(next(iter(self._param_options)))
        else:
            self.parameter_var.set('')
        links,_=primary_links(self.doc)
        for idx,(action,pid,mark,power) in enumerate(links):
            if action != self.selected_id:
                continue
            p = params.get(pid)
            name=(parameter_code(p)+' '+p.get('name','')) if p is not None else pid
            self.link_tree.insert('', 'end', iid=f'link{idx}', values=(mark,name), tags=(pid,mark))

    def _apply_properties(self):
        if self.doc is None or not self.selected_id:
            return
        formal = next((code for code,label in FORMAL_LABELS.items() if label==self.property_formal.get()),None)
        status = next((code for code,label in STATUS_LABELS.items() if label==self.property_status.get()),None)
        if formal is None or status is None:
            messagebox.showerror(tr('Действие'),tr('Выберите степень формализации и статус'),parent=self)
            return
        name = self.property_name.get('1.0','end-1c').strip()
        if not name:
            messagebox.showerror(tr('Действие'),tr('Наименование не может быть пустым'),parent=self)
            return
        try:
            self.doc.update_action(self.selected_id, name=name, formalization=formal,
                                   status=status, mark=self.property_mark.get())
            self.app._mark_dirty(tr('Изменены свойства действия {action_id}').format(action_id=self.selected_id))
            self.app.refresh_all()
        except Exception as exc:
            messagebox.showerror(tr('Действие'),str(exc),parent=self)

    def _sync(self):
        if self.selected_id and self.app.action_tree.exists(self.selected_id):
            self.app.action_tree.selection_set(self.selected_id)
            self.app.action_tree.see(self.selected_id)

    def _add_root(self):
        self.app.add_root_action()

    def _add_child(self):
        self._sync(); self.app.add_child_action()

    def _insert(self, after: bool):
        self._sync(); self.app.insert_selected_action(after)

    def _convert(self, kind=None):
        self._sync(); self.app.convert_selected_action(kind)

    def _delete(self):
        self._sync(); self.app.delete_action()

    def _move(self, direction):
        self._sync(); self.app.move_action(direction)

    def _alternative_labels(self):
        if self.doc is None or not self.selected_id:
            return
        node=self.doc.action(self.selected_id)
        if node.get('type') != '1':
            messagebox.showinfo(tr('Альтернатива'), tr('Выберите действие типа «Альтернатива».'), parent=self)
            return
        old=[x.get('text','') for x in node.findall('alts')]
        from .gui import RecordDialog
        dialog=RecordDialog(self,tr('Варианты альтернативы'),[
            ('first',tr('Вариант 1'),old[0] if len(old)>0 else tr('Условие 1'),None),
            ('second',tr('Вариант 2'),old[1] if len(old)>1 else tr('Условие 2'),None),
        ])
        self.wait_window(dialog)
        if dialog.result is None:
            return
        try:
            set_alternative_labels(self.doc,self.selected_id,[dialog.result['first'],dialog.result['second']])
            self.app._mark_dirty(tr('Подписи альтернативы {action_id}').format(action_id=self.selected_id))
            self.app.refresh_all()
        except Exception as exc:
            messagebox.showerror(tr('Альтернатива'),str(exc),parent=self)

    def _renumber(self):
        if self.doc is None: return
        if not messagebox.askyesno(tr('Нумерация действий'),
                 tr('Назначить коды вида z11, z21, z3.10 по глубине дерева и порядку обхода?\n'
                 'Существующие symbol/level/number будут изменены. Это алгоритм PzKpfw, НЕ подтверждённый native codeStructure().'),
                 parent=self):
            return
        try:
            report=renumber_structure(self.doc)
            self.app._mark_dirty(tr('Коды действий перенумерованы (PzKpfw)'))
            self.app.refresh_all()
            messagebox.showinfo(tr('Коды'), tr('Обработано действий: {count}\nИзменено: {changed}').format(count=report['action_count'], changed=len(report['reassigned'])),parent=self)
        except Exception as exc:
            messagebox.showerror(tr('Коды действий'),str(exc),parent=self)

    def _add_parameter_link(self,marker):
        if self.doc is None or not self.selected_id:
            return
        pid=self._param_options.get(self.parameter_var.get())
        if not pid:
            messagebox.showinfo(tr('Параметры'),tr('Создайте или выберите параметр'),parent=self)
            return
        try:
            add_primary_link(self.doc,self.selected_id,pid,marker)
            self.app._mark_dirty(tr('Привязан параметр к действию'))
            self.app.refresh_all()
        except Exception as exc:
            messagebox.showerror(tr('Матрица'),str(exc),parent=self)

    def _delete_parameter_link(self):
        if self.doc is None or not self.selected_id or not self.link_tree.selection():
            return
        item=self.link_tree.selection()[0]
        pid,mark=self.link_tree.item(item,'tags')
        try:
            remove_primary_link(self.doc,self.selected_id,pid,mark)
            self.app._mark_dirty(tr('Удалена привязка параметра'))
            self.app.refresh_all()
        except Exception as exc:
            messagebox.showerror(tr('Матрица'),str(exc),parent=self)

    def _add_parameter(self):
        self.app.add_parameter()

    def _add_object(self):
        self.app.add_object()

    def _show_form(self,key):
        if self.doc is None:return
        if key == 'M':
            self.app.notebook.select(self.app.matrix_page)
            self.app._refresh_matrix()
        else:
            self.app.form_selection.set(FORM_NAMES[key])
            self.app.notebook.select(self.app.forms_page)
            self.app._refresh_form()

    def _export_svg(self):
        if self.doc is None:return
        target=filedialog.asksaveasfilename(parent=self,title=tr('Схема проекта SVG'),defaultextension='.svg',filetypes=[('SVG','*.svg')])
        if not target:return
        try:
            scene = self._display_scene()
            svg = is2_spd_svg(self.doc, scene, self.selected_id) if self._is2_view else scene_svg(scene, selected=self.selected_id)
            Path(target).write_text(svg,encoding='utf-8')
            self.app.status.set(tr('Схема SVG сохранена: {path}').format(path=target))
        except OSError as exc: messagebox.showerror(tr('Экспорт SVG'),str(exc),parent=self)

    def _export_all(self):
        if self.doc is None:return
        folder=filedialog.askdirectory(parent=self,title=tr('Папка комплекта проекта'))
        if not folder:return
        path=Path(folder)
        destinations=[path/name for name in ('kursovoy_spd.svg','kursovoy_decomposition.svg','kursovoy_forms.html','kursovoy_report.html','kursovoy_check.json')]
        if any(p.exists() for p in destinations) and not messagebox.askyesno(tr('Экспорт'),tr('Некоторые файлы существуют. Перезаписать?'),parent=self):
            return
        try:
            documents=[
                scene_svg(build_course_scene(self.doc,max_depth=2)),
                scene_svg(build_course_scene(self.doc,max_depth=None)),
                form_html(self.doc),export_report(self.doc),
                json.dumps(course_checklist(self.doc),ensure_ascii=False,indent=2),
            ]
            for path_item,data in zip(destinations,documents):
                path_item.write_text(data,encoding='utf-8')
            messagebox.showinfo(tr('Комплект проекта'),tr('Готовы: схема СПД, декомпозиция, формы A/B/D/D1/D2, отчёт, проверка.\nПапка: {path}').format(path=path),parent=self)
        except (OSError,ValueError) as exc: messagebox.showerror(tr('Экспорт'),str(exc),parent=self)

    def _check(self):
        if self.doc is None:return
        report=course_checklist(self.doc)
        notes=[tr('Действий: {actions} (элементарных: {elementary}); параметров: {parameters}; объектов: {objects}').format(
                   actions=report['actions'], elementary=report['elementary_actions'], parameters=report['parameters'], objects=report['objects']),
               tr('Формы: {forms}').format(forms=', '.join(f'{k}={v}' for k,v in report['form_rows'].items()))]
        for key,title in [('errors',tr('Ошибки XML')),('missing_codes',tr('Действия без кода')),('missing_names',tr('Без имени')),
                          ('empty_composite_actions',tr('Пустые составные действия')),('placeholder_actions',tr('Заглушки'))]:
            data=report[key]
            notes.append(title+': '+(', '.join(map(str,data[:12]))+('…' if len(data)>12 else '') if data else tr('нет')))
        notes.extend(report['remarks'])
        messagebox.showinfo(tr('Проверка модели'),'\n'.join(notes),parent=self)
