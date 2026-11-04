"""Integrated IS-2 structure editor in Tk: screenshot-informed, independent UI.

All persistent edits go through ProjectDocument; no private Qt/IS-2 binary is
required. Unidentified native extensions are kept untouched in the XML.
"""
from __future__ import annotations

import json
import tkinter as tk
from tkinter import ttk, filedialog, messagebox
from pathlib import Path

from .coursework import (
    build_course_scene, scene_svg, course_checklist, renumber_structure, set_alternative_labels, _wrapped_lines,
)
from .gui_models import action_tree_rows
from .specifications import action_code, parameter_code, primary_links, add_primary_link, remove_primary_link, FORM_NAMES
from .exports import export_report
from .specifications import form_html
from .ui_theme import BACKGROUND, SURFACE, INK, MUTED, BORDER, PRIMARY, PALE_BLUE, TEAL

KIND_TEXT = {'0': 'Элементарное', '1': 'Альтернатива', '2': 'Последовательность', '3': 'Цикл'}
FORMAL_LABELS = {'0': 'Аналитическая', '2': 'Алгоритмическая'}
STATUS_LABELS = {'0': 'Элементарное', '1': 'Промежуточное'}


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
        self._build()

    @property
    def doc(self):
        return self.app.doc

    def _build(self):
        # The structure editor is a normal program tab; project creation belongs
        # to the application header rather than a special 'coursework' workspace.
        top = ttk.Frame(self, padding=(11, 8, 11, 0))
        top.pack(fill='x')
        ttk.Label(top, text='Формирование СПД', font=('TkDefaultFont', 13, 'bold'),
                  foreground=INK).pack(side='left')
        ttk.Label(top, text='Выберите действие на схеме или слева; свойства редактируются справа',
                  style='Muted.TLabel').pack(side='left', padx=(17, 0))

        structure = ttk.Frame(self, padding=(11, 7, 11, 2))
        structure.pack(fill='x')
        for label, callback, primary in [
            ('+ Корневое', self._add_root, False), ('+ Дочернее', self._add_child, True),
            ('Вставить до', lambda: self._insert(False), False),
            ('Вставить после', lambda: self._insert(True), False),
            ('Тип / конструкция…', self._convert, False),
            ('Условия ветвей…', self._alternative_labels, False),
            ('↑', lambda: self._move(-1), False), ('↓', lambda: self._move(1), False),
            ('Удалить', self._delete, False),
        ]:
            button = ttk.Button(structure, text=label, command=callback,
                                style='Primary.TButton' if primary else 'TButton')
            button.pack(side='left', padx=(0, 5))
            self._edit_buttons.append(button)
        code_button = ttk.Button(structure, text='Перенумеровать z…', command=self._renumber)
        code_button.pack(side='right')
        self._edit_buttons.append(code_button)

        views = ttk.Frame(self, padding=(11, 4, 11, 8))
        views.pack(fill='x')
        for label, action in (
            ('Общая схема', self._root_scene), ('Вся декомпозиция', self._full_scene),
            ('Лист действия', self._focus_scene), ('−', lambda: self._zoom(.8)),
            ('+', lambda: self._zoom(1.25)), ('Вписать', self._fit_scene),
            ('Экспорт SVG', self._export_svg), ('Проверить модель', self._check),
        ):
            ttk.Button(views, text=label, command=action).pack(side='left', padx=(0, 5))
        self.mode_label = ttk.Label(views, text='Вся модель · 100%', style='Muted.TLabel')
        self.mode_label.pack(side='right')

        panes = ttk.Panedwindow(self, orient='horizontal')
        panes.pack(fill='both', expand=True, padx=10, pady=(0, 9))
        left = ttk.Frame(panes, width=245)
        center = ttk.Frame(panes)
        right = ttk.Frame(panes, width=330)
        panes.add(left, weight=2)
        panes.add(center, weight=8)
        panes.add(right, weight=3)

        ttk.Label(left, text='ДЕРЕВО ДЕЙСТВИЙ', font=('TkDefaultFont', 10, 'bold'),
                  foreground=INK, padding=(4, 4)).pack(anchor='w')
        search_bar = ttk.Frame(left)
        search_bar.pack(fill='x', pady=(5, 6))
        self.search_entry = ttk.Entry(search_bar, textvariable=self.search_var)
        self.search_entry.pack(side='left', fill='x', expand=True)
        ttk.Button(search_bar, text='×', width=3,
                   command=lambda: self.search_var.set('')).pack(side='left', padx=(3, 0))
        self.search_var.trace_add('write', lambda *_: self._refresh_tree())
        ttk.Label(left, text='Поиск по коду и наименованию',
                  style='Muted.TLabel').pack(anchor='w', pady=(0, 5))
        treebox = ttk.Frame(left)
        treebox.pack(fill='both', expand=True)
        self.tree = ttk.Treeview(treebox, show='tree', selectmode='browse')
        ty = ttk.Scrollbar(treebox, orient='vertical', command=self.tree.yview)
        self.tree.configure(yscrollcommand=ty.set)
        self.tree.pack(side='left', fill='both', expand=True)
        ty.pack(side='right', fill='y')
        self.tree.bind('<<TreeviewSelect>>', self._tree_select)
        self.tree.bind('<Double-1>', lambda _event: self._focus_scene())
        self.tree.bind('<F2>', lambda _event: self._focus_name())
        self.tree.bind('<Delete>', lambda _event: self._confirm_delete())
        self.tree_count = ttk.Label(left, text='', style='Muted.TLabel', padding=(5, 6))
        self.tree_count.pack(anchor='w')

        self.canvas = tk.Canvas(center, bg='#f9fbfe', highlightthickness=0,
                                bd=0, cursor='arrow')
        sx = ttk.Scrollbar(center, orient='horizontal', command=self.canvas.xview)
        sy = ttk.Scrollbar(center, orient='vertical', command=self.canvas.yview)
        self.canvas.configure(xscrollcommand=sx.set, yscrollcommand=sy.set)
        self.canvas.grid(row=0, column=0, sticky='nsew')
        sy.grid(row=0, column=1, sticky='ns'); sx.grid(row=1, column=0, sticky='ew')
        center.columnconfigure(0, weight=1); center.rowconfigure(0, weight=1)
        self.canvas.bind('<Button-1>', self._canvas_select)
        self.canvas.bind('<Double-1>', self._canvas_open)
        self.canvas.bind('<Button-3>', self._canvas_context_menu)
        self.canvas.bind('<ButtonPress-2>', lambda e: self.canvas.scan_mark(e.x, e.y))
        self.canvas.bind('<B2-Motion>', lambda e: self.canvas.scan_dragto(e.x, e.y, gain=1))
        self.canvas.bind('<Control-MouseWheel>', self._wheel)
        self.canvas.bind('<Control-Button-4>', lambda _event: self._zoom(1.2))
        self.canvas.bind('<Control-Button-5>', lambda _event: self._zoom(.83))
        self.canvas.bind('<F2>', lambda _event: self._focus_name())
        ttk.Label(center, text='ЛКМ — выбрать · двойной щелчок — открыть лист · колесо + Ctrl — масштаб · средняя кнопка — перемещение',
                  style='Muted.TLabel', padding=(6, 4)).grid(row=2, column=0, sticky='w')

        # Scrollable inspector: on 650–720 px screens the function/argument
        # controls remain available, unlike the previous fixed-height sidebar.
        side_canvas = tk.Canvas(right, highlightthickness=0, background=BACKGROUND, bd=0)
        side_scroll = ttk.Scrollbar(right, orient='vertical', command=side_canvas.yview)
        side_canvas.configure(yscrollcommand=side_scroll.set)
        side_canvas.pack(side='left', fill='both', expand=True)
        side_scroll.pack(side='right', fill='y')
        inspector = ttk.Frame(side_canvas, padding=(10, 8, 10, 16))
        self._inspector_window = side_canvas.create_window((0, 0), window=inspector, anchor='nw')
        inspector.bind('<Configure>', lambda _e: side_canvas.configure(scrollregion=side_canvas.bbox('all')))
        side_canvas.bind('<Configure>', lambda e: side_canvas.itemconfigure(self._inspector_window, width=e.width))
        side_canvas.bind('<MouseWheel>', lambda e: side_canvas.yview_scroll(-1 if e.delta > 0 else 1, 'units'))
        side_canvas.bind('<Button-4>', lambda _e: side_canvas.yview_scroll(-1, 'units'))
        side_canvas.bind('<Button-5>', lambda _e: side_canvas.yview_scroll(1, 'units'))
        ttk.Label(inspector, text='СВОЙСТВА ДЕЙСТВИЯ',
                  font=('TkDefaultFont', 10, 'bold')).pack(anchor='w')
        self.property_code = ttk.Label(inspector, text='Выберите действие', style='Muted.TLabel')
        self.property_code.pack(anchor='w', pady=(7, 8))
        ttk.Label(inspector, text='Наименование').pack(anchor='w')
        self.property_name = tk.Text(inspector, height=4, width=29, wrap='word', undo=True,
                                     bg=SURFACE, fg=INK, relief='solid', bd=1, font=('TkDefaultFont', 10),
                                     highlightthickness=1, highlightcolor=PRIMARY, highlightbackground=BORDER)
        self.property_name.pack(fill='x', pady=(3, 8))
        self.property_type = ttk.Label(inspector, text='Тип: —', style='Muted.TLabel', wraplength=290)
        self.property_type.pack(anchor='w', pady=(0, 7))
        ttk.Label(inspector, text='Степень формализации').pack(anchor='w')
        self.property_formal = ttk.Combobox(inspector, state='readonly', values=tuple(FORMAL_LABELS.values()))
        self.property_formal.pack(fill='x', pady=(3, 9))
        ttk.Label(inspector, text='Статус').pack(anchor='w')
        self.property_status = ttk.Combobox(inspector, state='readonly', values=tuple(STATUS_LABELS.values()))
        self.property_status.pack(fill='x', pady=(3, 9))
        ttk.Label(inspector, text='Структурная метка (XML @mark)').pack(anchor='w')
        self.property_mark = ttk.Entry(inspector)
        self.property_mark.pack(fill='x', pady=(3, 10))
        property_button = ttk.Button(inspector, text='Сохранить свойства действия', command=self._apply_properties,
                                     style='Primary.TButton')
        property_button.pack(fill='x', pady=(0, 12))
        self._edit_buttons.append(property_button)
        self.property_name.bind('<Control-Return>', lambda _event: (self._apply_properties(), 'break')[-1])
        ttk.Separator(inspector).pack(fill='x', pady=5)
        ttk.Label(inspector, text='ФУНКЦИИ И АРГУМЕНТЫ',
                  font=('TkDefaultFont', 10, 'bold')).pack(anchor='w', pady=(5, 8))
        ttk.Label(inspector, text='Параметр для выбранного действия').pack(anchor='w')
        self.parameter_var = tk.StringVar()
        self.parameter_choice = ttk.Combobox(inspector, state='readonly', textvariable=self.parameter_var)
        self.parameter_choice.pack(fill='x', pady=(3, 7))
        row = ttk.Frame(inspector)
        row.pack(fill='x')
        ttk.Button(row, text='+ Функция (*)', command=lambda: self._add_parameter_link('*')).pack(side='left')
        ttk.Button(row, text='+ Аргумент (+)', command=lambda: self._add_parameter_link('+')).pack(side='left', padx=4)
        self.link_tree = ttk.Treeview(inspector, columns=('role', 'name'), show='headings',
                                      height=5, selectmode='browse')
        self.link_tree.heading('role', text='Роль'); self.link_tree.heading('name', text='Параметр')
        self.link_tree.column('role', width=58, stretch=False)
        self.link_tree.column('name', width=182)
        self.link_tree.pack(fill='both', expand=True, pady=(8, 5))
        ttk.Button(inspector, text='Убрать выбранную связь',
                   command=self._delete_parameter_link).pack(fill='x')
        ttk.Separator(inspector).pack(fill='x', pady=11)
        ttk.Button(inspector, text='+ Новый параметр…', command=self._add_parameter).pack(fill='x', pady=(0, 5))
        ttk.Button(inspector, text='+ Новый объект…', command=self._add_object).pack(fill='x')
        ttk.Label(inspector, text='Все параметры, формы и матрица доступны в верхних разделах программы.',
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
        menu = tk.Menu(self, tearoff=False)
        for label, callback in (
            ('Редактировать название', self._focus_name),
            ('Добавить дочернее действие', self._add_child),
            ('Вставить после', lambda: self._insert(True)),
            ('Изменить тип…', self._convert),
            ('Открыть лист', self._focus_scene),
        ):
            menu.add_command(label=label, command=callback)
        menu.add_separator()
        menu.add_command(label='Удалить действие', command=self._confirm_delete)
        try:
            menu.tk_popup(event.x_root, event.y_root)
        finally:
            menu.grab_release()

    def _fit_scene(self):
        if self.doc is None:
            return
        scene = build_course_scene(self.doc, self.focus_id, max_depth=self.depth_limit)
        self.canvas.update_idletasks()
        width = max(240, self.canvas.winfo_width() - 32)
        height = max(200, self.canvas.winfo_height() - 32)
        self.zoom = max(0.25, min(1.6, width / max(1, scene.width),
                                       height / max(1, scene.height)))
        self._draw()
        self.canvas.xview_moveto(0)
        self.canvas.yview_moveto(0)

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
        for row in rows:
            if row.action_id not in visible:
                continue
            parent = row.parent_id if row.parent_id in visible else ''
            node = nodes[row.action_id]
            self.tree.insert(parent, 'end', iid=row.action_id,
                             text=f'{action_code(node)}  {node.get("name", "")[:78]}')
        for top in self.tree.get_children(''):
            self.tree.item(top, open=True)
        if self.selected_id and self.tree.exists(self.selected_id):
            self.tree.selection_set(self.selected_id)
        self.tree_count.configure(text=f'Показано: {len(visible)} из {len(nodes)}')

    def refresh(self):
        if self.doc is None:
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
        self._refresh_tree()
        self._draw()
        self._show_properties()

    def _draw(self):
        canvas = self.canvas
        canvas.delete('all')
        if self.doc is None:
            return
        scene = build_course_scene(self.doc, self.focus_id, max_depth=self.depth_limit)
        self._scene = scene
        s = self.zoom
        w = scene.node_width * s; h = scene.node_height * s
        if self.depth_limit is not None:
            for x in range(0, scene.width + scene.column_width, scene.column_width):
                canvas.create_line(x*s, 0, x*s, scene.height*s, fill='#e4eaf2')
            for y in range(0, scene.height + scene.row_height, scene.row_height):
                canvas.create_line(0, y*s, scene.width*s, y*s, fill='#e4eaf2')
        by_id = {n.ident: n for n in scene.nodes}
        for edge in scene.edges:
            p, c = by_id[edge.source], by_id[edge.target]
            x1, y1 = (p.x + scene.node_width/2)*s, (p.y + scene.node_height)*s
            x2, y2 = (c.x + scene.node_width/2)*s, c.y*s
            my = (y1 + y2)/2
            canvas.create_line(x1,y1,x1,my,x2,my,x2,y2, fill='#8ba0b8', width=max(1,1.5*s))
        for parent in scene.nodes:
            kids = sorted((by_id[e.target] for e in scene.edges if e.source==parent.ident), key=lambda node:node.x)
            if len(kids) > 1 and parent.kind == '2':
                for a,b in zip(kids,kids[1:]):
                    canvas.create_line((a.x+scene.node_width)*s, (a.y+scene.node_height/2)*s,
                                       b.x*s,(b.y+scene.node_height/2)*s,fill='#4874ad',arrow='last')
        for node in scene.nodes:
            x,y = node.x*s,node.y*s
            tags=('course-node', 'course-action:'+node.ident)
            is_selected = node.ident == self.selected_id
            color = PRIMARY if is_selected else ('#207a75' if node.kind == '1' else '#526c88')
            fill = PALE_BLUE if is_selected else SURFACE
            canvas.create_rectangle(x+2*s,y+3*s,x+w+2*s,y+h+3*s,fill='#e8edf5',outline='',tags=tags)
            canvas.create_rectangle(x,y,x+w,y+h,fill=fill,outline=color,
                                    width=2.5 if is_selected else 1.4,tags=tags)
            for idx,line in enumerate(_wrapped_lines(node.title)):
                canvas.create_text(x+w/2,y+(18+idx*15)*s,text=line,fill=INK,
                                   width=w-12, font=('Arial',max(7,round(10*s))), tags=tags)
            if node.kind == '1':
                canvas.create_line(x,y+h-13*s,x+w,y+h-13*s,fill=color,tags=tags)
                canvas.create_text(x+10*s,y+h-6*s,text='1',font=('Arial',max(7,round(8*s))),tags=tags)
                canvas.create_text(x+w-10*s,y+h-6*s,text='2',font=('Arial',max(7,round(8*s))),tags=tags)
            canvas.create_text(x+w-5*s,y+h-5*s,anchor='se',text=node.code,
                               font=('Arial',max(7,round(10*s)),'bold'),tags=tags)
        canvas.configure(scrollregion=(0,0,scene.width*s,scene.height*s))
        title = 'Весь проект' if self.focus_id is None else action_code(self.doc.action(self.focus_id))
        self.mode_label.configure(text=f'{title} · {"глубина 2" if self.depth_limit == 2 else "вся структура"} · {round(s*100)}%')

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
        self._draw()

    def _wheel(self, event):
        self._zoom(1.15 if event.delta > 0 else 0.87)
        return 'break'

    def _full_scene(self):
        self.focus_id = None; self.depth_limit = None; self._draw()

    def _root_scene(self):
        self.focus_id = None; self.depth_limit = 2; self._draw()

    def _focus_scene(self):
        if self.selected_id:
            self.focus_id = self.selected_id
            self.depth_limit = 2
            self._draw()

    def _clear_properties(self):
        self.property_code.configure(text='Выберите действие')
        self.property_type.configure(text='Тип: —')
        self.property_name.delete('1.0','end')
        self.property_formal.set(''); self.property_status.set(''); self.property_mark.delete(0,'end')
        self.link_tree.delete(*self.link_tree.get_children())

    def _show_properties(self):
        self._clear_properties()
        if self.doc is None or not self.selected_id:
            return
        node = self.doc.action(self.selected_id)
        self.property_code.configure(text=f'{action_code(node)} · XML ID {self.selected_id}')
        self.property_type.configure(text='Тип: ' + KIND_TEXT.get(node.get('type',''),'неизвестен') + (' · ' + ' / '.join(x.get('text','') for x in node.findall('alts')) if node.get('type')=='1' else ''))
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
            messagebox.showerror('Действие','Выберите степень формализации и статус',parent=self)
            return
        name = self.property_name.get('1.0','end-1c').strip()
        if not name:
            messagebox.showerror('Действие','Наименование не может быть пустым',parent=self)
            return
        try:
            self.doc.update_action(self.selected_id, name=name, formalization=formal,
                                   status=status, mark=self.property_mark.get())
            self.app._mark_dirty('Изменены свойства действия '+self.selected_id)
            self.app.refresh_all()
        except Exception as exc:
            messagebox.showerror('Действие',str(exc),parent=self)

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

    def _convert(self):
        self._sync(); self.app.convert_selected_action()

    def _delete(self):
        self._sync(); self.app.delete_action()

    def _move(self, direction):
        self._sync(); self.app.move_action(direction)

    def _alternative_labels(self):
        if self.doc is None or not self.selected_id:
            return
        node=self.doc.action(self.selected_id)
        if node.get('type') != '1':
            messagebox.showinfo('Альтернатива', 'Выберите действие типа «Альтернатива».', parent=self)
            return
        old=[x.get('text','') for x in node.findall('alts')]
        from .gui import RecordDialog
        dialog=RecordDialog(self,'Варианты альтернативы',[
            ('first','Вариант 1',old[0] if len(old)>0 else 'Условие 1',None),
            ('second','Вариант 2',old[1] if len(old)>1 else 'Условие 2',None),
        ])
        self.wait_window(dialog)
        if dialog.result is None:
            return
        try:
            set_alternative_labels(self.doc,self.selected_id,[dialog.result['first'],dialog.result['second']])
            self.app._mark_dirty('Подписи альтернативы '+self.selected_id)
            self.app.refresh_all()
        except Exception as exc:
            messagebox.showerror('Альтернатива',str(exc),parent=self)

    def _renumber(self):
        if self.doc is None: return
        if not messagebox.askyesno('Нумерация действий',
                 'Назначить коды вида z11, z21, z3.10 по глубине дерева и порядку обхода?\n'
                 'Существующие symbol/level/number будут изменены. Это алгоритм PzKpfw, НЕ подтверждённый native codeStructure().',
                 parent=self):
            return
        try:
            report=renumber_structure(self.doc)
            self.app._mark_dirty('Коды действий перенумерованы (PzKpfw)')
            self.app.refresh_all()
            messagebox.showinfo('Коды', f'Обработано действий: {report["action_count"]}\nИзменено: {len(report["reassigned"])}',parent=self)
        except Exception as exc:
            messagebox.showerror('Коды действий',str(exc),parent=self)

    def _add_parameter_link(self,marker):
        if self.doc is None or not self.selected_id:
            return
        pid=self._param_options.get(self.parameter_var.get())
        if not pid:
            messagebox.showinfo('Параметры','Создайте или выберите параметр',parent=self)
            return
        try:
            add_primary_link(self.doc,self.selected_id,pid,marker)
            self.app._mark_dirty('Привязан параметр к действию')
            self.app.refresh_all()
        except Exception as exc:
            messagebox.showerror('Матрица',str(exc),parent=self)

    def _delete_parameter_link(self):
        if self.doc is None or not self.selected_id or not self.link_tree.selection():
            return
        item=self.link_tree.selection()[0]
        pid,mark=self.link_tree.item(item,'tags')
        try:
            remove_primary_link(self.doc,self.selected_id,pid,mark)
            self.app._mark_dirty('Удалена привязка параметра')
            self.app.refresh_all()
        except Exception as exc:
            messagebox.showerror('Матрица',str(exc),parent=self)

    def _add_parameter(self):
        if self.doc is None:return
        # Native parameter columns: group, codingType, number, object, sign, name.
        from .gui import RecordDialog
        current=[p for p in self.doc.params_node.findall('param') if p.get('group','0')=='0']
        new_number=max((int(p.get('number','0')) for p in current if p.get('number','').isdigit()),default=0)+1
        fields=[('name','Наименование параметра','',None),('group','Группа (обычно 0)','0',None),
                ('number','Номер в группе',str(new_number),None),('sign','Обозначение','',None)]
        dialog=RecordDialog(self,'Добавить параметр',fields);self.wait_window(dialog)
        if dialog.result is None:return
        d=dialog.result
        if not d['name'].strip():
            messagebox.showerror('Параметр','Укажите наименование',parent=self);return
        try:
            self.doc.add_parameter({'name':d['name'].strip(),'group':d['group'],
                                    'number':d['number'],'sign':d['sign'],'codingType':'1'})
            self.app._mark_dirty('Добавлен параметр проекта')
            self.app.refresh_all()
        except Exception as exc:messagebox.showerror('Параметр',str(exc),parent=self)

    def _add_object(self):
        if self.doc is None:return
        from .gui import RecordDialog
        dialog=RecordDialog(self,'Добавить объект',[('name','Наименование объекта','',None)])
        self.wait_window(dialog)
        if dialog.result is None:return
        try:
            self.doc.add_object(dialog.result['name'].strip())
            self.app._mark_dirty('Добавлен объект')
            self.app.refresh_all()
        except Exception as exc:messagebox.showerror('Объект',str(exc),parent=self)

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
        target=filedialog.asksaveasfilename(parent=self,title='Схема проекта SVG',defaultextension='.svg',filetypes=[('SVG','*.svg')])
        if not target:return
        try:
            svg=scene_svg(build_course_scene(self.doc,self.focus_id,max_depth=self.depth_limit),selected=self.selected_id)
            Path(target).write_text(svg,encoding='utf-8')
            self.app.status.set('Схема SVG сохранена: '+target)
        except OSError as exc: messagebox.showerror('Экспорт SVG',str(exc),parent=self)

    def _export_all(self):
        if self.doc is None:return
        folder=filedialog.askdirectory(parent=self,title='Папка комплекта проекта')
        if not folder:return
        path=Path(folder)
        destinations=[path/name for name in ('kursovoy_spd.svg','kursovoy_decomposition.svg','kursovoy_forms.html','kursovoy_report.html','kursovoy_check.json')]
        if any(p.exists() for p in destinations) and not messagebox.askyesno('Экспорт','Некоторые файлы существуют. Перезаписать?',parent=self):
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
            messagebox.showinfo('Комплект проекта','Готовы: схема СПД, декомпозиция, формы A/B/D/D1/D2, отчёт, проверка.\nПапка: '+str(path),parent=self)
        except (OSError,ValueError) as exc: messagebox.showerror('Экспорт',str(exc),parent=self)

    def _check(self):
        if self.doc is None:return
        report=course_checklist(self.doc)
        notes=[f'Действий: {report["actions"]} (элементарных: {report["elementary_actions"]}); параметров: {report["parameters"]}; объектов: {report["objects"]}',
               'Формы: '+', '.join(f'{k}={v}' for k,v in report['form_rows'].items())]
        for key,title in [('errors','Ошибки XML'),('missing_codes','Действия без кода'),('missing_names','Без имени'),
                          ('empty_composite_actions','Пустые составные действия'),('placeholder_actions','Заглушки')]:
            data=report[key]
            notes.append(title+': '+(', '.join(map(str,data[:12]))+('…' if len(data)>12 else '') if data else 'нет'))
        notes.extend(report['remarks'])
        messagebox.showinfo('Проверка модели','\n'.join(notes),parent=self)
