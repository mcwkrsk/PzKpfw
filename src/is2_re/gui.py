"""Tkinter desktop editor for PzKpfw / IS-2 project files.

The UI edits the recovered primary model, ConceptModel/cs, scalar AElement
fields and conservatively decoded fields of existing dynamic relation records.
"""
from __future__ import annotations

import hashlib
import json
import sys
import tkinter as tk
from tkinter import filedialog, messagebox, ttk
from pathlib import Path
import xml.etree.ElementTree as ET

from .document import ProjectDocument
from .model import ProjectFormatError
from .concept import CLASS_CHARS, CLASS_LABELS, LINK_LABELS
from .gui_models import action_tree_rows, action_diagram_layout
from .history import SnapshotHistory
from .compatibility import audit_document
from .graph import build_relationship_graph, filter_relationship_graph
from .graph_layout import automatic_relationship_layout
from .view_state import load_view_state, save_view_state, ViewStateError
from .dependencies import dependency_report
from .repair import link_integrity_report, available_repair_targets, apply_link_repairs
from .backups import create_project_backup, list_project_backups, restore_project_backup, BackupError
from .diff import (compare_documents, apply_selected_restores, expand_related_restore_bundle, ProjectDiffError)
from .merge import merge_documents, ProjectMergeError
from .graph_diff import compare_relationship_graphs
from .exports import write_export, TYPE_LABELS
from .specifications import project_forms, form_html, FORM_NAMES, add_primary_link, remove_primary_link, set_primary_link_power
from .decomposition import convert_action, insert_sibling
from .coursework import create_course_project
from .course_gui import CourseworkPanel
from .ui_theme import apply_theme, BACKGROUND, SURFACE, INK, MUTED, BORDER, PRIMARY


class RecordDialog(tk.Toplevel):
    def __init__(self, master, title: str, fields: list[tuple[str, str, str, tuple[str, ...] | None]]):
        super().__init__(master)
        self.title(title)
        self.resizable(True, False)
        self.result = None
        self.vars: dict[str, tk.StringVar] = {}
        body = ttk.Frame(self, padding=12)
        body.grid(row=0, column=0, sticky="nsew")
        for row, (key, label, value, choices) in enumerate(fields):
            ttk.Label(body, text=label).grid(row=row, column=0, sticky="w", padx=(0, 12), pady=4)
            var = tk.StringVar(value=value)
            self.vars[key] = var
            if choices:
                widget = ttk.Combobox(body, textvariable=var, values=choices, state="readonly", width=34)
            else:
                widget = ttk.Entry(body, textvariable=var, width=38)
            widget.grid(row=row, column=1, sticky="ew", pady=4)
        buttons = ttk.Frame(body)
        buttons.grid(row=len(fields), column=0, columnspan=2, sticky="e", pady=(10, 0))
        ttk.Button(buttons, text="Отмена", command=self.destroy).pack(side="right", padx=(6, 0))
        ttk.Button(buttons, text="Применить", command=self._accept).pack(side="right")
        body.columnconfigure(1, weight=1)
        self.transient(master)
        self.grab_set()
        self.bind("<Escape>", lambda _e: self.destroy())
        self.bind("<Return>", lambda _e: self._accept())
        self.wait_visibility()
        self.focus_set()

    def _accept(self):
        self.result = {key: var.get() for key, var in self.vars.items()}
        self.destroy()


class JsonAttributesDialog(tk.Toplevel):
    def __init__(self, master, title: str, attributes: dict[str, str]):
        super().__init__(master)
        self.title(title)
        self.geometry("560x420")
        self.result = None
        ttk.Label(self, text="Атрибуты XML в формате JSON. Поле id менять нельзя.", padding=8).pack(anchor="w")
        self.text = tk.Text(self, wrap="none", undo=True)
        self.text.pack(fill="both", expand=True, padx=8)
        self.text.insert("1.0", json.dumps(attributes, ensure_ascii=False, indent=2))
        buttons = ttk.Frame(self, padding=8)
        buttons.pack(fill="x")
        ttk.Button(buttons, text="Отмена", command=self.destroy).pack(side="right", padx=(6, 0))
        ttk.Button(buttons, text="Применить", command=self._accept).pack(side="right")
        self.transient(master)
        self.grab_set()
        self.wait_visibility()
        self.focus_set()

    def _accept(self):
        try:
            data = json.loads(self.text.get("1.0", "end-1c"))
            if not isinstance(data, dict) or any(not isinstance(k, str) for k in data):
                raise ValueError("Нужен JSON-объект с текстовыми ключами")
            if "id" in data:
                raise ValueError("Атрибут id задаётся счётчиком и не редактируется")
            if not all(isinstance(v, (str, int, float, bool)) or v is None for v in data.values()):
                raise ValueError("Значения атрибутов должны быть скалярными")
            self.result = {k: "" if v is None else str(v) for k, v in data.items()}
            self.destroy()
        except Exception as exc:
            messagebox.showerror("Некорректные атрибуты", str(exc), parent=self)


class Is2Studio(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("PzKpfw — редактор проектов .is2")
        self.geometry("1320x820")
        self.minsize(1050, 650)
        self._install_app_icon()
        apply_theme(self)
        self.doc: ProjectDocument | None = None
        self.path: Path | None = None
        self.dirty = False
        self.history = SnapshotHistory(limit=50)
        self._last_history_snapshot: bytes | None = None
        self._saved_fingerprint: str | None = None
        self.graph_positions: dict[str, tuple[float, float]] = {}
        self.graph_zoom = 1.0
        self.graph_selected_key: str | None = None
        self.graph_collapsed_groups: set[str] = set()
        self.graph_drag: dict | None = None
        self.graph_item_ids: dict[str, int] = {}
        self.history_window = None
        self.history_tree = None
        self.history_journal_tree = None
        self._pending_editor_state: dict = {}
        self._build_menu()
        self._build_layout()
        self.notebook.bind("<<NotebookTabChanged>>", self._on_notebook_tab_changed, add="+")
        self._set_enabled(False)
        self.protocol("WM_DELETE_WINDOW", self._quit)
        self._set_title()

    def _install_app_icon(self) -> None:
        """Set the PzKpfw application icon; tolerate platform-specific Tk issues."""
        assets = Path(__file__).resolve().parent / "assets"
        try:
            # Tk's PNG icon is used on Linux and other platforms.
            self._app_icon_image = tk.PhotoImage(file=str(assets / "pzkpfw.png"))
            self.iconphoto(True, self._app_icon_image)
        except (OSError, tk.TclError):
            self._app_icon_image = None
        if sys.platform == "win32":
            try:
                # .ico preserves multiple resolutions in Windows titlebars/taskbar.
                self.iconbitmap(str(assets / "pzkpfw.ico"))
            except (OSError, tk.TclError):
                pass

    def export_document(self, kind):
        if self.doc is None:
            messagebox.showinfo("Экспорт", "Сначала откройте проект.", parent=self)
            return
        config = {"report": (".html", "HTML"), "diagram": (".svg", "SVG"), "relations": (".csv", "CSV"), "matrix": (".csv", "CSV"), "primary-matrix": (".csv", "CSV"), "specifications": (".html", "HTML")}
        extension, label = config[kind]
        destination = filedialog.asksaveasfilename(parent=self, defaultextension=extension,
                                                    filetypes=[(label, "*" + extension)])
        if not destination:
            return
        try:
            write_export(self.doc, destination, kind, source_path=self.path, overwrite=True)
        except (OSError, ValueError, ProjectFormatError) as exc:
            messagebox.showerror("Ошибка экспорта", str(exc), parent=self)
            return
        messagebox.showinfo("Экспорт", "Файл создан. Это справочный экспорт PzKpfw; соответствие формам ИС-2 не проверено.", parent=self)

    def _build_menu(self):
        menu = tk.Menu(self)
        file_menu = tk.Menu(menu, tearoff=False)
        file_menu.add_command(label="Новый проект…", accelerator="Ctrl+N", command=self.new_project)
        file_menu.add_command(label="Новый проект с главным действием…", command=self.new_coursework)
        file_menu.add_command(label="Открыть…", accelerator="Ctrl+O", command=self.open_file)
        file_menu.add_command(label="Сохранить", accelerator="Ctrl+S", command=self.save)
        file_menu.add_command(label="Сохранить как…", command=self.save_as)
        file_menu.add_command(label="Резервные копии…", command=self.show_backups)
        file_menu.add_separator()
        file_menu.add_command(label="Экспорт обзора в HTML…", command=lambda: self.export_document("report"))
        file_menu.add_command(label="Экспорт схемы в SVG…", command=lambda: self.export_document("diagram"))
        file_menu.add_command(label="Экспорт таблицы связей в CSV…", command=lambda: self.export_document("relations"))
        file_menu.add_command(label="Экспорт матрицы состава в CSV…", command=lambda: self.export_document("matrix"))
        file_menu.add_separator()
        file_menu.add_command(label="Выход", command=self._quit)
        menu.add_cascade(label="Файл", menu=file_menu)
        self.edit_menu = tk.Menu(menu, tearoff=False)
        self.edit_menu.add_command(label="Отменить", accelerator="Ctrl+Z", command=self.undo, state="disabled")
        self.edit_menu.add_command(label="Повторить", accelerator="Ctrl+Y", command=self.redo, state="disabled")
        self.edit_menu.add_separator()
        self.edit_menu.add_command(label="История действий…", command=self.show_history)
        menu.add_cascade(label="Правка", menu=self.edit_menu)
        project_menu = tk.Menu(menu, tearoff=False)
        project_menu.add_command(label="Проверить проект", command=self.validate_project)
        project_menu.add_command(label="Проверить совместимость с ИС-2", command=self.check_compatibility)
        project_menu.add_command(label="Аудит зависимостей…", command=self.show_dependency_audit)
        project_menu.add_command(label="Исправление повреждённых ссылок…", command=self.show_link_repair_dialog)
        project_menu.add_command(label="Сравнить с другой версией…", command=self.show_project_diff)
        project_menu.add_command(label="Сравнить графы связей…", command=self.show_relationship_graph_diff)
        project_menu.add_command(label="Объединить три версии…", command=self.show_three_way_merge)
        project_menu.add_command(label="Обзор ConceptModel…", command=self.show_concept_catalog)
        project_menu.add_command(label="Обновить представления", command=self.refresh_all)
        menu.add_cascade(label="Проект", menu=project_menu)
        help_menu = tk.Menu(menu, tearoff=False)
        help_menu.add_command(label="О программе", command=self._about)
        menu.add_cascade(label="Справка", menu=help_menu)
        self.config(menu=menu)
        self.bind_all("<Control-n>", lambda _e: self.new_project())
        self.bind_all("<Control-o>", lambda _e: self.open_file())
        self.bind_all("<Control-s>", lambda _e: self.save())
        self.bind_all("<Control-z>", self._undo_shortcut)
        self.bind_all("<Control-y>", self._redo_shortcut)
        self.bind_all("<Control-Shift-Z>", self._redo_shortcut)

    def _build_layout(self):
        """User-facing editing workflow: structure, data, output, then advanced tools.

        The native project editor (formerly a standalone coursework tab) is the
        *primary* workspace.  Non-coursework tools are still available under
        'Дополнительно', without duplicating the main workflow.
        """
        # Brand artwork is a separate asset from the Windows/taskbar gear icon.
        # Keep the PhotoImage referenced for the whole Tk window lifetime.
        header = ttk.Frame(self, padding=(15, 8), style='Brand.TFrame')
        header.pack(fill='x')
        self._brand_logo = None
        try:
            logo_path = Path(__file__).resolve().parent / 'assets' / 'pzkpfw_logo_header.png'
            self._brand_logo = tk.PhotoImage(file=str(logo_path))
        except (OSError, tk.TclError):
            pass
        if self._brand_logo is not None:
            ttk.Label(header, image=self._brand_logo, style='Brand.TLabel').pack(side='left', padx=(0, 12))
        title_area = ttk.Frame(header, style='Brand.TFrame')
        title_area.pack(side='left')
        ttk.Label(title_area, text='PzKpfw', font=('TkDefaultFont', 19, 'bold'),
                  style='Brand.Title.TLabel').pack(anchor='w')
        ttk.Label(title_area, text='Редактор моделей и файлов ИС-2',
                  style='Brand.Muted.TLabel').pack(anchor='w')
        self.file_label = ttk.Label(header, text='Файл не открыт', style='Brand.Muted.TLabel')
        self.file_label.pack(side='right', padx=8)

        toolbar = ttk.Frame(self, padding=(14, 2, 14, 9))
        toolbar.pack(fill='x')
        ttk.Button(toolbar, text='Новый проект', command=self.new_coursework,
                   style='Primary.TButton').pack(side='left')
        ttk.Button(toolbar, text='Открыть .is2', command=self.open_file).pack(side='left', padx=(7, 0))
        ttk.Button(toolbar, text='Сохранить', command=self.save).pack(side='left', padx=(7, 0))
        ttk.Separator(toolbar, orient='vertical').pack(side='left', fill='y', padx=12)
        self.undo_button = ttk.Button(toolbar, text='↶ Отменить', command=self.undo, state='disabled')
        self.undo_button.pack(side='left', padx=(0, 4))
        self.redo_button = ttk.Button(toolbar, text='↷ Повторить', command=self.redo, state='disabled')
        self.redo_button.pack(side='left')
        ttk.Button(toolbar, text='Проверить проект', command=self.validate_project).pack(side='left', padx=(14, 0))
        ttk.Button(toolbar, text='Экспорт…', command=self._show_export_menu).pack(side='left', padx=(7, 0))

        self.notebook = ttk.Notebook(self)
        self.notebook.pack(fill='both', expand=True, padx=12, pady=(0, 8))
        self.course_page = ttk.Frame(self.notebook)    # kept as compatibility alias
        self.action_page = ttk.Frame(self.notebook)
        self.param_page = ttk.Frame(self.notebook)
        self.object_page = ttk.Frame(self.notebook)
        self.forms_page = ttk.Frame(self.notebook)
        self.matrix_page = ttk.Frame(self.notebook)
        self.service_page = ttk.Frame(self.notebook)
        for frame, name in (
            (self.course_page, 'Формирование СПД'),
            (self.action_page, 'Декомпозиция'),
            (self.param_page, 'Параметры'),
            (self.object_page, 'Объекты'),
            (self.forms_page, 'Спецификации'),
            (self.matrix_page, 'Матричная диаграмма'),
            (self.service_page, 'Дополнительно'),
        ):
            self.notebook.add(frame, text=name)
        self.advanced_tabs = ttk.Notebook(self.service_page)
        self.advanced_tabs.pack(fill='both', expand=True, padx=5, pady=5)
        self.metadata_page = ttk.Frame(self.advanced_tabs)
        self.diagram_page = ttk.Frame(self.advanced_tabs)
        self.concept_page = ttk.Frame(self.advanced_tabs)
        self.link_page = ttk.Frame(self.advanced_tabs)
        self.other_page = ttk.Frame(self.advanced_tabs)
        self.graph_page = ttk.Frame(self.advanced_tabs)
        self.xml_page = ttk.Frame(self.advanced_tabs)
        for frame, name in (
            (self.metadata_page, 'Паспорт'), (self.diagram_page, 'Техническая схема'),
            (self.concept_page, 'Категории (cs)'), (self.link_page, 'Связи (cs)'),
            (self.other_page, 'spz / content'), (self.graph_page, 'Граф связей'),
            (self.xml_page, 'XML'),
        ):
            self.advanced_tabs.add(frame, text=name)
        self.course_panel = CourseworkPanel(self.course_page, self)
        self.course_panel.pack(fill='both', expand=True)
        self._build_metadata_page()
        self._build_action_page()
        self._build_forms_page()
        self._build_matrix_page()
        self._build_diagram_page()
        self._build_record_page(self.param_page, 'Параметры', self._refresh_params, self.add_parameter, self.edit_parameter, self.delete_parameter)
        self._build_record_page(self.object_page, 'Объекты', self._refresh_objects, self.add_object, self.edit_object, self.delete_object)
        self._build_category_page()
        self._build_link_page()
        self._build_other_page()
        self._build_graph_page()
        self.xml_text = tk.Text(self.xml_page, wrap='none', font=('Consolas', 10),
                                state='disabled', bg=SURFACE, fg=INK)
        self.xml_text.pack(fill='both', expand=True)
        self.status = tk.StringVar(value='Готово · откройте .is2 или создайте проект')
        status_bar = ttk.Frame(self, padding=(12, 6))
        status_bar.pack(fill='x', side='bottom')
        ttk.Label(status_bar, textvariable=self.status, style='Muted.TLabel').pack(side='left')
        ttk.Label(status_bar, text='Ctrl+S · сохранить    Ctrl+Z · отменить    F1 · помощь',
                  style='Muted.TLabel').pack(side='right')
        self.bind_all('<F1>', lambda _event: self._show_shortcuts())

    def _show_shortcuts(self):
        messagebox.showinfo('Работа в PzKpfw',
            'Формирование СПД — схема, создание и изменение действий, свойства справа.\n'
            'Декомпозиция — табличное дерево тех же действий.\n'
            'Параметры и Объекты — редактирование данных модели.\n'
            'Спецификации — формы A, B, D, D1, D2.\n'
            'Матричная диаграмма — связи действий с параметрами; двойной щелчок по ячейке — редактирование.\n'
            'Дополнительно — паспорт, графы, XML, исследовательские средства.\n\n'
            'Ctrl+N — новый пустой проект, Ctrl+O — открыть, Ctrl+S — сохранить.\n'
            'Ctrl+Z / Ctrl+Y — история правок. В СПД: F2 — имя, Ctrl+Enter — применить свойства.',
            parent=self)

    def _show_export_menu(self):
        """Keep rarely used exports off the permanent primary toolbar."""
        menu = tk.Menu(self, tearoff=False)
        for label, command in (
            ('Комплект проекта (схемы, формы, проверка)…', self.course_panel._export_all),
            ('Схема СПД в SVG…', self.course_panel._export_svg),
            ('Спецификации в HTML…', lambda: self.export_document('specifications')),
            ('Матрица в CSV…', lambda: self.export_document('primary-matrix')),
            ('Отчёт в HTML…', lambda: self.export_document('report')),
        ):
            menu.add_command(label=label, command=command)
        try:
            x, y = self.winfo_pointerxy()
            menu.tk_popup(x, y)
        finally:
            menu.grab_release()

    def _show_page(self, page):
        """Navigate advanced pages without exposing seven extra top-level tabs."""
        if page in (self.metadata_page, self.diagram_page, self.concept_page,
                    self.link_page, self.other_page, self.graph_page, self.xml_page):
            self.notebook.select(self.service_page)
            self.advanced_tabs.select(page)
        else:
            self.notebook.select(page)

    def _set_enabled(self, enabled: bool):
        self.course_panel.set_editing_enabled(enabled)
        state = "normal" if enabled else "disabled"
        for page in (self.metadata_page, self.action_page, self.forms_page, self.diagram_page, self.param_page, self.object_page, self.concept_page, self.link_page, self.other_page, self.graph_page, self.xml_page):
            try:
                for child in page.winfo_children():
                    if isinstance(child, ttk.Frame):
                        for widget in child.winfo_children():
                            if isinstance(widget, ttk.Button):
                                widget.configure(state=state)
            except tk.TclError:
                pass

    def _build_metadata_page(self):
        bar = ttk.Frame(self.metadata_page, padding=6)
        bar.pack(fill="x")
        ttk.Button(bar, text="Изменить паспорт", command=self.edit_metadata).pack(side="left")
        ttk.Button(bar, text="Обновить", command=self._refresh_metadata).pack(side="left", padx=5)
        self.metadata_text = tk.Text(self.metadata_page, wrap="word", height=12, state="disabled")
        self.metadata_text.pack(fill="both", expand=True, padx=6, pady=(0, 6))
        ttk.Label(self.metadata_page, text="Неизвестные атрибуты project/user сохраняются.", padding=6).pack(anchor="w")

    def _build_forms_page(self):
        bar = ttk.Frame(self.forms_page, padding=6)
        bar.pack(fill="x")
        self.form_selection = tk.StringVar(value=FORM_NAMES["A"])
        self.form_combo = ttk.Combobox(bar, textvariable=self.form_selection, values=tuple(v for k,v in FORM_NAMES.items() if k != "M"), state="readonly", width=39)
        self.form_combo.pack(side="left")
        self.form_combo.bind("<<ComboboxSelected>>", lambda event: self._refresh_form())
        for form_key in ('A', 'B', 'D', 'D1', 'D2'):
            ttk.Button(bar, text='Форма ' + form_key,
                       command=lambda key=form_key: self._select_spec_form(key)).pack(side='left', padx=(6, 0))
        ttk.Button(bar, text="Обновить", command=self._refresh_form).pack(side="left", padx=4)
        ttk.Button(bar, text="Печатать все формы…", command=lambda: self.export_document('specifications')).pack(side="left", padx=4)
        ttk.Label(self.forms_page, text="Реконструкция по XML и исследованию ИС-2; соответствие оригиналу не проверено.", padding=(6, 3)).pack(anchor="w")
        container=ttk.Frame(self.forms_page, padding=6)
        container.pack(fill="both", expand=True)
        self.forms_tree=ttk.Treeview(container, show="headings")
        y=ttk.Scrollbar(container, orient="vertical", command=self.forms_tree.yview)
        x=ttk.Scrollbar(container, orient="horizontal", command=self.forms_tree.xview)
        self.forms_tree.configure(yscrollcommand=y.set,xscrollcommand=x.set)
        self.forms_tree.grid(row=0,column=0,sticky="nsew"); y.grid(row=0,column=1,sticky="ns"); x.grid(row=1,column=0,sticky="ew")
        container.columnconfigure(0,weight=1); container.rowconfigure(0,weight=1)
        self.form_status=tk.StringVar(value="Откройте проект и нажмите «Обновить».")
        ttk.Label(self.forms_page,textvariable=self.form_status,wraplength=1150,padding=6).pack(anchor="w")

    def _build_matrix_page(self):
        bar = ttk.Frame(self.matrix_page, padding=(8, 10))
        bar.pack(fill='x')
        ttk.Label(bar, text='Действия × параметры', font=('TkDefaultFont', 12, 'bold')).pack(side='left', padx=(0, 15))
        ttk.Button(bar, text='+ Связь…', command=lambda: self.edit_primary_link(False)).pack(side='left', padx=(0, 4))
        ttk.Button(bar, text='− Связь…', command=lambda: self.edit_primary_link(True)).pack(side='left', padx=(0, 4))
        ttk.Button(bar, text='Кратность…', command=self.edit_primary_link_power).pack(side='left', padx=(0, 4))
        ttk.Button(bar, text='CSV…', command=lambda: self.export_document('primary-matrix')).pack(side='left', padx=(0, 4))
        ttk.Button(bar, text='Обновить', command=self._refresh_matrix).pack(side='left')
        ttk.Label(self.matrix_page, text='Дважды нажмите на пересечение строки действия и столбца параметра, чтобы добавить или изменить связь.',
                  padding=(12, 0), style='Muted.TLabel').pack(anchor='w')
        box = ttk.Frame(self.matrix_page, padding=9)
        box.pack(fill='both', expand=True)
        self.matrix_tree = ttk.Treeview(box, show='headings', selectmode='browse')
        yy=ttk.Scrollbar(box, orient='vertical', command=self.matrix_tree.yview)
        xx=ttk.Scrollbar(box, orient='horizontal', command=self.matrix_tree.xview)
        self.matrix_tree.configure(yscrollcommand=yy.set, xscrollcommand=xx.set)
        self.matrix_tree.grid(row=0, column=0, sticky='nsew')
        yy.grid(row=0, column=1, sticky='ns'); xx.grid(row=1, column=0, sticky='ew')
        box.columnconfigure(0, weight=1); box.rowconfigure(0, weight=1)
        self.matrix_tree.bind('<Double-1>', self._edit_matrix_cell)
        self.matrix_status = tk.StringVar(value='Создайте или откройте проект.')
        ttk.Label(self.matrix_page, textvariable=self.matrix_status,
                  style='Muted.TLabel', padding=(12, 7)).pack(anchor='w')
        self._matrix_action_ids: list[str] = []
        self._matrix_parameter_ids: list[str] = []

    def _refresh_matrix(self):
        if self.doc is None:
            return
        try:
            from .gui_models import action_tree_rows
            from .specifications import _sort_number
            forms, warnings = project_forms(self.doc)
            headers, rows = forms['M']
            self._matrix_action_ids = [r.action_id for r in action_tree_rows(self.doc)]
            parameters = sorted(self.doc.params_node.findall('param'),
                                key=lambda n: (_sort_number(n.get('group')),
                                               _sort_number(n.get('number')),
                                               _sort_number(n.get('id'))))
            self._matrix_parameter_ids = [p.get('id', '') for p in parameters]
            if len(headers) > 300:
                self.matrix_status.set('Матрица очень широкая: используйте CSV-экспорт.')
                return
            cols = [f'm{i}' for i in range(len(headers))]
            self.matrix_tree.delete(*self.matrix_tree.get_children())
            self.matrix_tree.configure(columns=cols)
            for i, (key, caption) in enumerate(zip(cols, headers)):
                self.matrix_tree.heading(key, text=caption)
                self.matrix_tree.column(key, width=76 if i == 0 else 128 if i == 1 else 94,
                                        minwidth=58, stretch=False, anchor='center')
            for index, row in enumerate(rows):
                self.matrix_tree.insert('', 'end', iid=f'matrix{index}', values=row)
            self.matrix_status.set(f'{len(rows)} действий · {len(parameters)} параметров ·'
                                   ' * функция, + аргумент, . по умолчанию. '
                                   'Структурные символы реконструированы и требуют сверки с ИС-2.')
        except (ValueError, ProjectFormatError, KeyError) as exc:
            messagebox.showerror('Матричная диаграмма', str(exc), parent=self)

    def _edit_matrix_cell(self, event):
        if self.doc is None:
            return
        row = self.matrix_tree.identify_row(event.y)
        col = self.matrix_tree.identify_column(event.x)
        if not row or not col or int(col[1:]) < 3:
            return
        try:
            idx = int(row.removeprefix('matrix'))
            pidx = int(col[1:]) - 3
            aid = self._matrix_action_ids[idx]
            pid = self._matrix_parameter_ids[pidx]
            code = self.doc.action(aid)
            if code.get('type') != '0':
                messagebox.showinfo('Матричная диаграмма', 'Функции и аргументы можно назначать только элементарным действиям.', parent=self)
                return
            from .specifications import primary_links
            existing = [(mark, power) for a, p, mark, power in primary_links(self.doc)[0]
                        if a == aid and p == pid]
            if len(existing) > 1:
                messagebox.showinfo('Матричная диаграмма', 'В ячейке несколько записей. Используйте команды «Связь» и «Кратность».', parent=self)
                return
            old_mark, old_power = existing[0] if existing else ('+', '1')
            if old_mark not in ('*', '+', '.'):
                messagebox.showwarning('Матричная диаграмма', 'Роль не распознана — правка заблокирована.', parent=self)
                return
            dialog = RecordDialog(self, 'Связь действия и параметра', [
                ('marker', 'Роль связи', old_mark, ('*', '+', '.')),
                ('power', 'Кратность', old_power, None),
                ('operation', 'Действие', 'Изменить' if existing else 'Добавить',
                 ('Изменить', 'Удалить') if existing else ('Добавить',)),
            ])
            self.wait_window(dialog)
            if dialog.result is None:
                return
            values = dialog.result
            # Run the edit against an isolated clone: never partially rewrite an XML document.
            trial = self.doc.clone()
            if existing:
                if values['operation'] == 'Удалить' or values['marker'] != old_mark:
                    remove_primary_link(trial, aid, pid, old_mark)
            if values['operation'] != 'Удалить':
                if existing and values['marker'] == old_mark:
                    set_primary_link_power(trial, aid, pid, old_mark, values['power'])
                else:
                    add_primary_link(trial, aid, pid, values['marker'], power=values['power'])
            self.doc = trial
            self._mark_dirty('Изменена ячейка матричной диаграммы')
            self.refresh_all()
        except (ValueError, KeyError, IndexError, ProjectFormatError) as exc:
            messagebox.showerror('Матрица', str(exc), parent=self)

    def _select_spec_form(self, key):
        self.form_selection.set(FORM_NAMES[key])
        self._refresh_form()

    def edit_primary_link(self, remove):
        if self.doc is None: return
        fields=[("action", "ID элементарного действия", "", None),
                ("parameter", "ID параметра", "", None),
                ("marker", "Роль: * функция, + аргумент, . по умолчанию", "+", ("*", "+", "."))]
        if not remove:
            fields.append(("power", "Кратность (записывается как @power)", "1", None))
        dialog=RecordDialog(self,"Удалить связь" if remove else "Добавить связь",fields)
        self.wait_window(dialog)
        if dialog.result is None: return
        data=dialog.result
        try:
            if remove:
                remove_primary_link(self.doc,data["action"],data["parameter"],data["marker"])
            else:
                add_primary_link(self.doc,data["action"],data["parameter"],data["marker"],power=data["power"])
            self._mark_dirty("Удалена связь действия и параметра" if remove else "Добавлена связь действия и параметра")
            self.refresh_all()
            self._refresh_form()
        except (ValueError, KeyError, ProjectFormatError) as exc:
            messagebox.showerror("Связь действия и параметра",str(exc),parent=self)

    def edit_primary_link_power(self):
        if self.doc is None: return
        fields = [("action", "ID действия", "", None),
                  ("parameter", "ID параметра", "", None),
                  ("marker", "Роль", "+", ("*", "+", ".")),
                  ("power", "Новая кратность @power", "1", None)]
        dialog = RecordDialog(self, "Изменение кратности связи", fields)
        self.wait_window(dialog)
        if dialog.result is None: return
        try:
            d = dialog.result
            set_primary_link_power(self.doc, d["action"], d["parameter"], d["marker"], d["power"])
            self._mark_dirty("Изменена кратность связи действия и параметра")
            self.refresh_all()
        except (ValueError, KeyError, ProjectFormatError) as exc:
            messagebox.showerror("Кратность связи", str(exc), parent=self)

    def _refresh_form(self):
        if self.doc is None:
            return
        try:
            forms,warnings=project_forms(self.doc)
            key=next((k for k,v in FORM_NAMES.items() if v==self.form_selection.get()),"A")
            headers,rows=forms[key]
            if len(headers)>300:
                self.form_status.set("Слишком много столбцов для просмотра. Используйте HTML-экспорт.")
                return
            self.forms_tree.delete(*self.forms_tree.get_children())
            cols=[f"c{i}" for i in range(len(headers))]
            self.forms_tree.configure(columns=cols)
            for name,title in zip(cols,headers):
                self.forms_tree.heading(name,text=title)
                self.forms_tree.column(name,width=180 if len(headers)<12 else 100,minwidth=50,stretch=False)
            for row in rows:
                self.forms_tree.insert("", "end", values=row)
            self.form_status.set(f"Строк: {len(rows)}. " + " ".join(warnings))
        except (ValueError, ProjectFormatError, KeyError) as exc:
            messagebox.showerror("Формы",str(exc),parent=self)

    def _build_action_page(self):
        bar = ttk.Frame(self.action_page, padding=6)
        bar.pack(fill="x")
        for text, command in (("Новый корень", self.add_root_action), ("Добавить дочерний", self.add_child_action), ("↑", lambda: self.move_action(-1)), ("↓", lambda: self.move_action(1)), ("Изменить", self.edit_action), ("Удалить", self.delete_action), ("Обновить", self._refresh_actions)):
            ttk.Button(bar, text=text, command=command).pack(side="left", padx=(0, 5))
        ttk.Button(bar, text="Преобразовать…", command=self.convert_selected_action).pack(side="left", padx=(0, 5))
        ttk.Button(bar, text="Вставить до…", command=lambda: self.insert_selected_action(False)).pack(side="left", padx=(0, 5))
        ttk.Button(bar, text="Вставить после…", command=lambda: self.insert_selected_action(True)).pack(side="left", padx=(0, 5))
        split = ttk.Panedwindow(self.action_page, orient="horizontal")
        split.pack(fill="both", expand=True, padx=6, pady=(0, 6))
        left = ttk.Frame(split)
        right = ttk.Frame(split, padding=12)
        split.add(left, weight=3)
        split.add(right, weight=2)
        self.action_tree = ttk.Treeview(left, columns=("type", "level"), show="tree headings", selectmode="browse")
        self.action_tree.heading("#0", text="Действие")
        self.action_tree.heading("type", text="Тип")
        self.action_tree.heading("level", text="Уровень")
        self.action_tree.column("type", width=70, anchor="center")
        self.action_tree.column("level", width=80, anchor="center")
        y = ttk.Scrollbar(left, orient="vertical", command=self.action_tree.yview)
        self.action_tree.configure(yscrollcommand=y.set)
        self.action_tree.pack(side="left", fill="both", expand=True)
        y.pack(side="right", fill="y")
        self.action_tree.bind("<<TreeviewSelect>>", self._show_action_details)
        self.action_tree.bind("<<TreeviewSelect>>", self._on_tree_selection_changed, add="+")
        ttk.Label(right, text="Выбранное действие", font=("TkDefaultFont", 11, "bold")).pack(anchor="w")
        self.action_details = tk.Text(right, wrap="word", height=20, state="disabled")
        self.action_details.pack(fill="both", expand=True, pady=(8, 0))

    def move_action(self, direction):
        if self.doc is None:
            return
        ident = self._selected_id(self.action_tree)
        if not ident:
            messagebox.showinfo("Порядок действий", "Выберите дочернее действие.", parent=self)
            return
        parents = [n.get("afe1") for n in self.doc.links if n.get("type") == "2" and n.get("afe2") == ident]
        if len(parents) != 1:
            messagebox.showinfo("Порядок действий", "Выберите действие с одним родителем; корневые действия не переставляются.", parent=self)
            return
        try:
            order = self.doc.sibling_order(parents[0])
            index = order.index(ident)
            target = index + direction
            if not 0 <= target < len(order):
                return
            order[index], order[target] = order[target], order[index]
            self.doc.reorder_children(parents[0], order)
            self._mark_dirty(f"Изменён порядок действия {ident}")
            self.refresh_all()
            self.action_tree.selection_set(ident)
            self.action_tree.see(ident)
        except (ValueError, ProjectFormatError) as exc:
            messagebox.showerror("Порядок действий", str(exc), parent=self)

    def _build_diagram_page(self):
        bar = ttk.Frame(self.diagram_page, padding=6)
        bar.pack(fill="x")
        ttk.Button(bar, text="Обновить схему", command=self._refresh_diagram).pack(side="left")
        ttk.Button(bar, text="Изменить выбранное действие", command=self.edit_action).pack(side="left", padx=5)
        ttk.Label(bar, text="Сплошная стрелка — состав (type=2); пунктир — порядок соседей (type=3).", padding=(8, 0)).pack(side="left")
        holder = ttk.Frame(self.diagram_page)
        holder.pack(fill="both", expand=True, padx=6, pady=(0, 6))
        self.diagram_canvas = tk.Canvas(holder, background="white", highlightthickness=0,
                                        xscrollincrement=30, yscrollincrement=30)
        xscroll = ttk.Scrollbar(holder, orient="horizontal", command=self.diagram_canvas.xview)
        yscroll = ttk.Scrollbar(holder, orient="vertical", command=self.diagram_canvas.yview)
        self.diagram_canvas.configure(xscrollcommand=xscroll.set, yscrollcommand=yscroll.set)
        self.diagram_canvas.grid(row=0, column=0, sticky="nsew")
        yscroll.grid(row=0, column=1, sticky="ns")
        xscroll.grid(row=1, column=0, sticky="ew")
        holder.rowconfigure(0, weight=1)
        holder.columnconfigure(0, weight=1)
        self.diagram_canvas.bind("<Button-1>", self._diagram_click)
        self.diagram_canvas.bind("<Double-Button-1>", self._diagram_double_click)

    def _refresh_diagram(self):
        if self.doc is None:
            self.diagram_canvas.delete("all")
            self.diagram_canvas.configure(scrollregion=(0, 0, 800, 600))
            return
        canvas = self.diagram_canvas
        canvas.delete("all")
        rows, positions, composition_edges, sequence_edges = action_diagram_layout(self.doc)
        node_width, node_height = 190, 62
        # Draw edges first so that node boxes remain visually on top.
        for parent_id, child_id in composition_edges:
            px, py = positions[parent_id]
            cx, cy = positions[child_id]
            canvas.create_line(px + node_width, py + node_height / 2, cx, cy + node_height / 2,
                               arrow="last", width=2, fill="#334155", tags=("edge", "composition"))
        for current_id, next_id in sequence_edges:
            ax, ay = positions[current_id]
            bx, by = positions[next_id]
            canvas.create_line(ax + node_width / 2, ay + node_height, bx + node_width / 2, by,
                               arrow="last", width=2, dash=(6, 4), fill="#2563eb",
                               tags=("edge", "sequence"))
        nodes = {node.get("id", ""): node for node in self.doc.actions}
        selected = self._selected_id(self.action_tree) if hasattr(self, "action_tree") else None
        for row in rows:
            x, y = positions[row.action_id]
            node = nodes[row.action_id]
            title = node.get("name", "") or "(без названия)"
            subtitle = f"ID {row.action_id}   type={node.get('type', '?')}   level={node.get('level', '?')}"
            tags = ("node", f"action:{row.action_id}")
            is_selected = row.action_id == selected
            outline = "#1d4ed8" if is_selected else "#475569"
            width = 3 if is_selected else 1
            canvas.create_rectangle(x, y, x + node_width, y + node_height,
                                    fill="#eff6ff" if is_selected else "#f8fafc",
                                    outline=outline, width=width, tags=tags)
            canvas.create_text(x + 9, y + 8, anchor="nw", width=node_width - 18,
                               text=title, font=("TkDefaultFont", 10, "bold"), fill="#0f172a", tags=tags)
            canvas.create_text(x + 9, y + 36, anchor="nw", text=subtitle,
                               font=("TkDefaultFont", 8), fill="#475569", tags=tags)
        max_x = max((x for x, _ in positions.values()), default=0) + node_width + 80
        max_y = max((y for _, y in positions.values()), default=0) + node_height + 80
        canvas.configure(scrollregion=(0, 0, max(800, max_x), max(600, max_y)))
        if not rows:
            canvas.create_text(30, 30, anchor="nw", text="В проекте пока нет действий.",
                               font=("TkDefaultFont", 12), fill="#475569")

    def _diagram_click(self, event):
        canvas = self.diagram_canvas
        item = canvas.find_withtag("current")
        if not item:
            return None
        for tag in canvas.gettags(item[0]):
            if tag.startswith("action:"):
                ident = tag.split(":", 1)[1]
                if self.action_tree.exists(ident):
                    self.action_tree.selection_set(ident)
                    self.action_tree.see(ident)
                    self.status.set(f"Выбрано действие {ident}")
                    return ident
                break
        return None

    def _diagram_double_click(self, event):
        ident = self._diagram_click(event)
        if ident is not None:
            self.edit_action()

    def _build_record_page(self, page, title, refresh, add, edit, delete):
        bar = ttk.Frame(page, padding=6)
        bar.pack(fill="x")
        for text, command in (("Добавить", add), ("Изменить", edit), ("Удалить", delete), ("Обновить", refresh)):
            ttk.Button(bar, text=text, command=command).pack(side="left", padx=(0, 5))
        tree = ttk.Treeview(page, show="headings", selectmode="browse")
        tree.pack(fill="both", expand=True, padx=6, pady=(0, 6))
        if title == "Параметры":
            columns = ("id", "name", "group", "codingType", "number", "sign", "object")
        else:
            columns = ("id", "name", "attributes")
        tree["columns"] = columns
        captions = {"id": "ID", "name": "Наименование", "group": "Группа",
                    "codingType": "Тип кодирования", "number": "Номер", "sign": "Обозначение",
                    "object": "Объект", "attributes": "Атрибуты XML"}
        for column in columns:
            tree.heading(column, text=captions.get(column, column))
            tree.column(column, width=(270 if column == "name" else 130) if column != "attributes" else 500, anchor="w")
        if title == "Параметры":
            self.param_tree = tree
            ttk.Button(bar, text="Доп. XML…", command=self.edit_parameter_advanced).pack(side="left", padx=(6, 0))
            ttk.Button(bar, text="Назначить объект…", command=self.assign_parameter_object).pack(side="left", padx=(6, 0))
            ttk.Button(bar, text="Снять объект", command=self.clear_parameter_object).pack(side="left", padx=(4, 0))
            tree.bind("<<TreeviewSelect>>", self._on_tree_selection_changed, add="+")
        else:
            self.object_tree = tree
            tree.bind("<<TreeviewSelect>>", self._on_tree_selection_changed, add="+")

    def _build_category_page(self):
        bar = ttk.Frame(self.concept_page, padding=6)
        bar.pack(fill="x")
        for text, command in (
            ("Добавить категорию", self.add_category),
            ("Изменить", self.edit_category),
            ("Доп. атрибуты…", self.edit_category_attributes),
            ("Удалить", self.delete_category),
            ("Групповое изменение…", self.bulk_edit_categories),
            ("Обзор ConceptModel…", self.show_concept_catalog),
            ("Обновить", self._refresh_categories),
        ):
            ttk.Button(bar, text=text, command=command).pack(side="left", padx=(0, 5))
        filters = ttk.Frame(self.concept_page, padding=(6, 0, 6, 4))
        filters.pack(fill="x")
        ttk.Label(filters, text="Поиск:").pack(side="left")
        self.concept_search_var = tk.StringVar(value="")
        concept_search = ttk.Entry(filters, textvariable=self.concept_search_var, width=26)
        concept_search.pack(side="left", padx=(4, 12))
        concept_search.bind("<KeyRelease>", lambda _e: self._refresh_categories())
        ttk.Label(filters, text="Класс:").pack(side="left")
        self.concept_class_filter = tk.StringVar(value="Все")
        class_filter = ttk.Combobox(
            filters, textvariable=self.concept_class_filter, state="readonly", width=12,
            values=("Все", "S", "P", "Z", "K", "O", "R", "C"),
        )
        class_filter.pack(side="left", padx=4)
        class_filter.bind("<<ComboboxSelected>>", lambda _e: self._refresh_categories())
        ttk.Label(filters, text="Группа:").pack(side="left", padx=(8, 0))
        self.concept_group_filter = tk.StringVar(value="Все")
        self.concept_group_combo = ttk.Combobox(filters, textvariable=self.concept_group_filter,
                                                state="readonly", width=9, values=("Все",))
        self.concept_group_combo.pack(side="left", padx=4)
        self.concept_group_combo.bind("<<ComboboxSelected>>", lambda _e: self._refresh_categories())
        self.concept_summary_var = tk.StringVar(value="ConceptModel ещё не загружен")
        ttk.Label(self.concept_page, textvariable=self.concept_summary_var, padding=(8, 2)).pack(anchor="w")
        self.category_tree = ttk.Treeview(
            self.concept_page,
            columns=("id", "name", "class", "group", "number", "status", "codingType", "autoRange"),
            show="headings", selectmode="extended",
        )
        for c in self.category_tree["columns"]:
            self.category_tree.heading(c, text={"id":"ID", "name":"Название", "class":"Класс", "group":"Группа", "number":"Номер", "status":"Статус", "codingType":"CodingType", "autoRange":"AutoRange"}.get(c, c))
            self.category_tree.column(c, width=130 if c == "name" else 85, anchor="w" if c == "name" else "center")
        self.category_tree.pack(fill="both", expand=True, padx=6, pady=(0, 6))
        self.category_tree.bind("<Double-1>", lambda _e: self.edit_category())
        self.category_tree.bind("<<TreeviewSelect>>", self._on_tree_selection_changed, add="+")
        ttk.Label(
            self.concept_page,
            text="Классы S/P/Z/K/O/R/C. Можно выбрать несколько категорий для группового изменения group и number; неизвестные атрибуты сохраняются.",
            padding=6,
        ).pack(anchor="w")

    def _build_link_page(self):
        bar = ttk.Frame(self.link_page, padding=6)
        bar.pack(fill="x")
        for text, command in (("Добавить связь", self.add_concept_link), ("Изменить", self.edit_concept_link), ("Доп. атрибуты…", self.edit_concept_link_attributes), ("Удалить", self.delete_concept_link), ("Пересчитать AutoRange", self.recompute_auto_ranges), ("Обновить", self._refresh_links)):
            ttk.Button(bar, text=text, command=command).pack(side="left", padx=(0, 5))
        self.link_tree = ttk.Treeview(self.link_page, columns=("id", "type", "label", "e1", "e2", "e3", "range"), show="headings", selectmode="browse")
        labels = {"id":"ID", "type":"Тип", "label":"Связь", "e1":"E1", "e2":"E2", "e3":"E3", "range":"Range"}
        for c in self.link_tree["columns"]:
            self.link_tree.heading(c, text=labels[c])
            self.link_tree.column(c, width=100 if c != "label" else 200, anchor="w")
        self.link_tree.pack(fill="both", expand=True, padx=6, pady=(0, 6))
        self.link_tree.bind("<<TreeviewSelect>>", self._on_tree_selection_changed, add="+")

    def _build_other_page(self):
        bar = ttk.Frame(self.other_page, padding=6)
        bar.pack(fill="x")
        for text, command in (("Добавить AElement", self.add_spz_element),
                              ("Изменить", self.edit_spz_element),
                              ("Удалить", self.delete_spz_element),
                              ("Обновить", self._refresh_other)):
            ttk.Button(bar, text=text, command=command).pack(side="left", padx=(0, 5))
        split = ttk.Panedwindow(self.other_page, orient="vertical")
        split.pack(fill="both", expand=True, padx=6, pady=(0, 6))
        upper = ttk.Frame(split)
        lower = ttk.Frame(split)
        split.add(upper, weight=3)
        split.add(lower, weight=2)
        ttk.Label(upper, text="ConceptModel / spz / elemets — AElement", padding=(2, 2)).pack(anchor="w")
        self.spz_tree = ttk.Treeview(
            upper, columns=("id", "name", "type", "status", "formalization", "level", "number", "symbol"),
            show="headings", selectmode="browse", height=8,
        )
        labels = {"id": "ID", "name": "Название", "type": "Type", "status": "Status",
                  "formalization": "Formalization", "level": "Level", "number": "Number", "symbol": "Symbol"}
        for col in self.spz_tree["columns"]:
            self.spz_tree.heading(col, text=labels[col])
            self.spz_tree.column(col, width=170 if col == "name" else 105, anchor="w" if col == "name" else "center")
        self.spz_tree.pack(fill="both", expand=True)
        self.spz_tree.bind("<Double-1>", lambda _e: self.edit_spz_element())
        self.spz_tree.bind("<<TreeviewSelect>>", self._on_tree_selection_changed, add="+")

        self.dynamic_tabs = ttk.Notebook(lower)
        self.dynamic_tabs.pack(fill="both", expand=True)
        self.spz_links_page = ttk.Frame(self.dynamic_tabs)
        self.content_page = ttk.Frame(self.dynamic_tabs)
        self.dynamic_tabs.add(self.spz_links_page, text="spz / links")
        self.dynamic_tabs.add(self.content_page, text="content")
        spz_link_bar = ttk.Frame(self.spz_links_page, padding=(2, 2))
        spz_link_bar.pack(fill="x")
        ttk.Button(spz_link_bar, text="Добавить…", command=self.add_spz_link).pack(side="left", padx=(0, 4))
        ttk.Button(spz_link_bar, text="Изменить endpoints…", command=self.edit_spz_link).pack(side="left", padx=(0, 4))
        ttk.Button(spz_link_bar, text="Удалить", command=self.delete_spz_link).pack(side="left")
        ttk.Label(spz_link_bar,
                  text="e1/e2/e3 — AIElement из spz/elemets; 0 = пустой endpoint.",
                  padding=(8, 0)).pack(side="left")
        self.spz_links_tree = ttk.Treeview(
            self.spz_links_page, columns=("index", "tag", "e1", "e2", "e3", "children", "attributes"),
            show="headings", selectmode="browse", height=5,
        )
        spz_labels = {"index": "№", "tag": "XML-узел", "e1": "E1", "e2": "E2", "e3": "E3",
                      "children": "Вложено", "attributes": "Атрибуты"}
        for col in self.spz_links_tree["columns"]:
            self.spz_links_tree.heading(col, text=spz_labels[col])
            self.spz_links_tree.column(col, width=75 if col in {"index", "e1", "e2", "e3", "children"} else (110 if col == "tag" else 280), anchor="w")
        self.spz_links_tree.pack(fill="both", expand=True, padx=2, pady=(0, 3))
        self.spz_links_tree.bind("<<TreeviewSelect>>", self._show_spz_link_detail)
        self.spz_links_tree.bind("<<TreeviewSelect>>", self._on_tree_selection_changed, add="+")
        self.spz_links_tree.bind("<Double-1>", lambda _e: self.edit_spz_link())
        self.spz_link_detail = tk.Text(self.spz_links_page, wrap="none", height=3, state="disabled", font=("Consolas", 8))
        self.spz_link_detail.pack(fill="x", padx=2, pady=(0, 2))

        content_bar = ttk.Frame(self.content_page, padding=(2, 2))
        content_bar.pack(fill="x")
        ttk.Button(content_bar, text="Добавить связь…", command=self.add_content_link).pack(side="left", padx=(0, 4))
        ttk.Button(content_bar, text="Изменить…", command=self.edit_content_record).pack(side="left", padx=(0, 4))
        ttk.Button(content_bar, text="Удалить", command=self.delete_content_link).pack(side="left")
        ttk.Label(content_bar,
                  text="AEContentLink type=4: e1 = действие (AFElement), e2 = категория (AIElement).",
                  padding=(8, 0)).pack(side="left")
        self.content_tree = ttk.Treeview(
            self.content_page, columns=("index", "tag", "e1", "e2", "char", "power", "children", "attributes"),
            show="headings", selectmode="browse", height=5,
        )
        content_labels = {"index": "№", "tag": "XML-узел", "e1": "E1", "e2": "E2", "char": "Char", "power": "Power",
                          "children": "Вложено", "attributes": "Атрибуты"}
        for col in self.content_tree["columns"]:
            self.content_tree.heading(col, text=content_labels[col])
            self.content_tree.column(col, width=75 if col in {"index", "e1", "e2", "char", "power", "children"} else (110 if col == "tag" else 260), anchor="w")
        self.content_tree.pack(fill="both", expand=True, padx=2, pady=(0, 3))
        self.content_tree.bind("<<TreeviewSelect>>", self._on_tree_selection_changed, add="+")
        self.content_tree.bind("<<TreeviewSelect>>", self._show_content_detail)
        self.content_tree.bind("<Double-1>", lambda _e: self.edit_content_record())
        self.content_detail = tk.Text(self.content_page, wrap="none", height=3, state="disabled", font=("Consolas", 8))
        self.content_detail.pack(fill="x", padx=2, pady=(0, 2))

    def _build_graph_page(self):
        bar = ttk.Frame(self.graph_page, padding=6)
        bar.pack(fill="x")
        ttk.Label(bar, text="Тип:").pack(side="left")
        self.graph_filter_var = tk.StringVar(value="Все")
        self.graph_filter_combo = ttk.Combobox(
            bar, textvariable=self.graph_filter_var, state="readonly", width=24,
            values=("Все", "SCBinaryLink (cs)", "AIEBinaryLink (spz)", "AEContentLink (content)", "Parameter → Object"),
        )
        self.graph_filter_combo.pack(side="left", padx=(4, 8))
        self.graph_filter_combo.bind("<<ComboboxSelected>>", lambda _e: self._refresh_graph())
        ttk.Label(bar, text="Поиск:").pack(side="left")
        self.graph_search_var = tk.StringVar(value="")
        search = ttk.Entry(bar, textvariable=self.graph_search_var, width=22)
        search.pack(side="left", padx=4)
        search.bind("<Return>", lambda _e: self._refresh_graph())
        ttk.Button(bar, text="Показать", command=self._refresh_graph).pack(side="left", padx=(2, 6))
        ttk.Button(bar, text="Сбросить", command=self._reset_graph_filter).pack(side="left")
        ttk.Button(bar, text="Развернуть всё", command=self._expand_all_graph_groups).pack(side="left", padx=(8, 0))

        edit_bar = ttk.Frame(self.graph_page, padding=(6, 0, 6, 4))
        edit_bar.pack(fill="x")
        ttk.Label(edit_bar, text="Новая связь:").pack(side="left")
        self.graph_new_kind = tk.StringVar(value="AEContentLink (content)")
        ttk.Combobox(
            edit_bar, textvariable=self.graph_new_kind, state="readonly", width=25,
            values=("SCBinaryLink (cs)", "AIEBinaryLink (spz)", "AEContentLink (content)"),
        ).pack(side="left", padx=(4, 6))
        ttk.Button(edit_bar, text="＋ Создать на графе", command=self.graph_add_relation).pack(side="left", padx=2)
        self.graph_edit_button = ttk.Button(edit_bar, text="Изменить выбранную", command=self.graph_edit_relation, state="disabled")
        self.graph_edit_button.pack(side="left", padx=2)
        self.graph_delete_button = ttk.Button(edit_bar, text="Удалить выбранную", command=self.graph_delete_relation, state="disabled")
        self.graph_delete_button.pack(side="left", padx=2)
        ttk.Separator(edit_bar, orient="vertical").pack(side="left", fill="y", padx=7)
        ttk.Button(edit_bar, text="−", width=3, command=lambda: self._graph_zoom_step(0.8)).pack(side="left", padx=1)
        ttk.Button(edit_bar, text="＋", width=3, command=lambda: self._graph_zoom_step(1.25)).pack(side="left", padx=1)
        ttk.Button(edit_bar, text="Автораскладка", command=self._graph_auto_layout).pack(side="left", padx=3)
        ttk.Button(edit_bar, text="Вписать", command=self._graph_fit).pack(side="left", padx=3)
        self.graph_zoom_label = ttk.Label(edit_bar, text="100%")
        self.graph_zoom_label.pack(side="left", padx=(2, 0))
        self.graph_layout_hint_var = tk.StringVar(value="Группы связей: cs · spz · content")
        ttk.Label(edit_bar, textvariable=self.graph_layout_hint_var).pack(side="right", padx=(8, 2))

        self.graph_summary_var = tk.StringVar(value="Граф ещё не построен")
        ttk.Label(self.graph_page, textvariable=self.graph_summary_var, padding=(8, 0)).pack(anchor="w")
        split = ttk.Panedwindow(self.graph_page, orient="vertical")
        split.pack(fill="both", expand=True, padx=6, pady=6)
        canvas_holder = ttk.Frame(split)
        detail_holder = ttk.Frame(split)
        split.add(canvas_holder, weight=5)
        split.add(detail_holder, weight=1)
        self.graph_canvas = tk.Canvas(
            canvas_holder, background="white", highlightthickness=0,
            xscrollincrement=30, yscrollincrement=30,
        )
        xscroll = ttk.Scrollbar(canvas_holder, orient="horizontal", command=self.graph_canvas.xview)
        yscroll = ttk.Scrollbar(canvas_holder, orient="vertical", command=self.graph_canvas.yview)
        self.graph_canvas.configure(xscrollcommand=xscroll.set, yscrollcommand=yscroll.set)
        self.graph_canvas.grid(row=0, column=0, sticky="nsew")
        yscroll.grid(row=0, column=1, sticky="ns")
        xscroll.grid(row=1, column=0, sticky="ew")
        canvas_holder.rowconfigure(0, weight=1)
        canvas_holder.columnconfigure(0, weight=1)
        self.graph_canvas.bind("<ButtonPress-1>", self._graph_press)
        self.graph_canvas.bind("<B1-Motion>", self._graph_motion)
        self.graph_canvas.bind("<ButtonRelease-1>", self._graph_release)
        self.graph_canvas.bind("<Double-Button-1>", self._graph_double_click)
        self.graph_canvas.bind("<ButtonPress-2>", lambda e: self.graph_canvas.scan_mark(e.x, e.y))
        self.graph_canvas.bind("<B2-Motion>", lambda e: self.graph_canvas.scan_dragto(e.x, e.y, gain=1))
        self.graph_canvas.bind("<Control-MouseWheel>", self._graph_wheel_zoom)
        self.graph_canvas.bind("<Control-Button-4>", lambda e: self._graph_zoom_step(1.15))
        self.graph_canvas.bind("<Control-Button-5>", lambda e: self._graph_zoom_step(0.87))
        ttk.Label(detail_holder, text="Сведения о выбранном узле", padding=(2, 4)).pack(anchor="w")
        self.graph_detail = tk.Text(detail_holder, wrap="word", height=7, state="disabled", font=("Consolas", 9))
        self.graph_detail.pack(fill="both", expand=True)
        self.graph_nodes_by_key: dict[str, dict] = {}

    def _capture_editor_state(self) -> dict:
        selections = {}
        mapping = (
            ("action", "action_tree"), ("parameter", "param_tree"),
            ("object", "object_tree"), ("category", "category_tree"),
            ("cs_link", "link_tree"), ("spz_element", "spz_tree"),
            ("spz_link", "spz_links_tree"), ("content_link", "content_tree"),
        )
        for key, attr in mapping:
            tree = getattr(self, attr, None)
            if tree is not None:
                selected = tree.selection()
                if selected:
                    selections[key] = str(selected[0])
        if self.graph_selected_key:
            selections["graph"] = self.graph_selected_key
        for group_key in self.graph_collapsed_groups:
            safe_group = "".join(ch if ch.isalnum() else "_" for ch in group_key.lower())
            selections[f"cg_{safe_group}"] = "1"
        if hasattr(self, "dynamic_tabs"):
            try:
                selections["dynamic_tab"] = str(self.dynamic_tabs.index(self.dynamic_tabs.select()))
            except tk.TclError:
                pass
        try:
            active_tab = int(self.notebook.index(self.notebook.select()))
        except (tk.TclError, ValueError):
            active_tab = 0
        return {
            "active_tab": active_tab,
            "selections": selections,
            "window_geometry": self.geometry(),
            "graph_filter": self.graph_filter_var.get() if hasattr(self, "graph_filter_var") else "Все",
            "graph_search": self.graph_search_var.get() if hasattr(self, "graph_search_var") else "",
            "dynamic_tab": int(self.dynamic_tabs.index(self.dynamic_tabs.select())) if hasattr(self, "dynamic_tabs") else 0,
        }

    def _load_graph_view_state(self, project_path: Path) -> str | None:
        """Load presentation/editor state from sidecar, never from .is2 XML."""
        self.graph_positions.clear()
        self.graph_zoom = 1.0
        self.graph_collapsed_groups.clear()
        self._pending_editor_state = {}
        try:
            valid_keys = {node["key"] for node in build_relationship_graph(self.doc)["nodes"]} if self.doc else set()
            state = load_view_state(project_path, valid_keys=valid_keys)
            self.graph_positions = {key: (float(value[0]), float(value[1])) for key, value in state["positions"].items()}
            self.graph_zoom = float(state["zoom"])
            selections = state.get("selections", {})
            canonical_groups = (
                "action", "category", "spz_element", "parameter", "object",
                "relation:scbinarylink", "relation:aie_binary_link",
                "relation:ae_content_link", "relation:parameter_object", "relation",
            )
            self.graph_collapsed_groups = {
                group for group in canonical_groups
                if selections.get("cg_" + "".join(ch if ch.isalnum() else "_" for ch in group.lower())) == "1"
            }
            self._pending_editor_state = state
            if hasattr(self, "graph_filter_var"):
                self.graph_filter_var.set(state.get("graph_filter", "Все"))
                self.graph_search_var.set(state.get("graph_search", ""))
            geometry = state.get("window_geometry")
            if geometry:
                try:
                    self.geometry(geometry)
                except tk.TclError:
                    pass
            return None
        except ViewStateError as exc:
            return str(exc)

    def _restore_editor_state(self) -> None:
        state = self._pending_editor_state or {}
        selections = state.get("selections", {})
        mapping = (
            ("action", "action_tree"), ("parameter", "param_tree"),
            ("object", "object_tree"), ("category", "category_tree"),
            ("cs_link", "link_tree"), ("spz_element", "spz_tree"),
            ("spz_link", "spz_links_tree"), ("content_link", "content_tree"),
        )
        for key, attr in mapping:
            tree = getattr(self, attr, None)
            ident = selections.get(key)
            if tree is not None and ident is not None and tree.exists(str(ident)):
                tree.selection_set(str(ident))
                tree.see(str(ident))
        graph_key = selections.get("graph")
        if graph_key in getattr(self, "graph_nodes_by_key", {}):
            self._graph_select_node(graph_key)
        dynamic_tab = selections.get("dynamic_tab")
        if dynamic_tab is not None and hasattr(self, "dynamic_tabs"):
            try:
                tab_index = int(dynamic_tab)
                if 0 <= tab_index < len(self.dynamic_tabs.tabs()):
                    self.dynamic_tabs.select(tab_index)
            except (ValueError, tk.TclError):
                pass
        active_tab = state.get("active_tab", 0)
        try:
            if 0 <= int(active_tab) < len(self.notebook.tabs()):
                self.notebook.select(int(active_tab))
        except (tk.TclError, TypeError, ValueError):
            pass
        self._pending_editor_state = {}

    def _save_graph_view_state(self, *, silent: bool = True) -> bool:
        if self.doc is None or self.path is None:
            return False
        try:
            valid_keys = {node["key"] for node in build_relationship_graph(self.doc)["nodes"]}
            positions = {key: value for key, value in self.graph_positions.items() if key in valid_keys}
            state = self._capture_editor_state()
            save_view_state(
                self.path, positions=positions, zoom=self.graph_zoom,
                active_tab=state["active_tab"], selections=state["selections"],
                window_geometry=state["window_geometry"], graph_filter=state["graph_filter"],
                graph_search=state["graph_search"],
            )
            return True
        except Exception as exc:
            if not silent:
                messagebox.showwarning("Состояние редактора", f"Не удалось сохранить настройки редактора отдельно от .is2:\n{exc}", parent=self)
            else:
                self.status.set(f"Не удалось сохранить sidecar редактора: {exc}")
            return False

    def _on_notebook_tab_changed(self, _event=None):
        if self.notebook.select() == str(self.forms_page):
            self._refresh_form()
        if self.notebook.select() == str(self.matrix_page):
            self._refresh_matrix()
        if self.doc is not None and self.path is not None:
            self._save_graph_view_state()

    def _on_tree_selection_changed(self, _event=None):
        """Keep the table and the visual editor focused on the same action."""
        if self.doc is not None:
            selected = self._selected_id(self.action_tree)
            if selected and self.course_panel.selected_id != selected:
                self.course_panel.select_action(selected)
        if self.doc is not None and self.path is not None:
            self._save_graph_view_state()

    def _graph_auto_layout(self):
        if self.doc is None:
            return
        graph = build_relationship_graph(self.doc)
        self.graph_positions = automatic_relationship_layout(graph)
        self.graph_selected_key = None
        self._refresh_graph()
        self._graph_fit()
        self._save_graph_view_state()
        self.status.set("Выполнена автоматическая раскладка графа; координаты сохранены отдельно от .is2")

    def _toggle_graph_group(self, group_key: str):
        """Collapse/expand a graph column without changing the native project."""
        if group_key in self.graph_collapsed_groups:
            self.graph_collapsed_groups.remove(group_key)
        else:
            self.graph_collapsed_groups.add(group_key)
            if self.graph_selected_key:
                node = self.graph_nodes_by_key.get(self.graph_selected_key)
                if node is not None:
                    node_group = (f"relation:{node.get('relation_kind', '')}" if node.get("kind") == "relation" else node.get("kind"))
                    if node_group == group_key:
                        self.graph_selected_key = None
        self._refresh_graph()
        self._save_graph_view_state()

    def _expand_all_graph_groups(self):
        self.graph_collapsed_groups.clear()
        self._refresh_graph()
        self._save_graph_view_state()

    def _reset_graph_filter(self):
        self.graph_filter_var.set("Все")
        self.graph_search_var.set("")
        self._refresh_graph()

    def _graph_default_layout(self, nodes):
        """Create a readable view with a separate column per relation family."""
        columns = {
            "action": (20, "ДЕЙСТВИЯ · AFElement", "#eaf2ff", "#2455a4"),
            "category": (370, "КАТЕГОРИИ · SubjectCategory", "#eaf8ef", "#28734a"),
            "spz_element": (720, "ЭЛЕМЕНТЫ · spz/AElement", "#fff6e7", "#996018"),
            "parameter": (1070, "ПАРАМЕТРЫ · PrimaryModel", "#e0f2fe", "#0369a1"),
            "object": (1430, "ОБЪЕКТЫ · PrimaryModel", "#fef3c7", "#a16207"),
            "relation:scbinarylink": (1790, "SCBinaryLink · cs", "#f2edff", "#6941a5"),
            "relation:aie_binary_link": (2150, "AIEBinaryLink · spz", "#e6fffb", "#0f766e"),
            "relation:ae_content_link": (2510, "AEContentLink · content", "#f5f0ff", "#7c3aed"),
            "relation:parameter_object": (2870, "Parameter → Object", "#ecfccb", "#4d7c0f"),
            "relation": (3230, "НЕИЗВЕСТНЫЕ ЗАПИСИ", "#f1f5f9", "#64748b"),
        }
        grouped = {key: [] for key in columns}
        for node in nodes:
            kind = node["kind"]
            if kind == "relation":
                group_key = f"relation:{node.get('relation_kind', '')}"
                if group_key not in columns:
                    group_key = "relation"
            else:
                group_key = kind if kind in columns else "relation"
            grouped[group_key].append(node)
        positions = {}
        top, row_step = 70, 78
        for group_key, items in grouped.items():
            items.sort(key=lambda n: (
                int(n.get("record_index", 0)) if n.get("kind") == "relation" else (0 if str(n.get("id", "")).isdigit() else 1),
                int(n.get("id", "0")) if n.get("kind") != "relation" and str(n.get("id", "")).isdigit() else str(n.get("id", "")).casefold(),
            ))
            for index, node in enumerate(items):
                positions[node["key"]] = (columns[group_key][0], top + index * row_step)
        return columns, grouped, positions

    def _refresh_graph(self):
        canvas = getattr(self, "graph_canvas", None)
        if canvas is None:
            return
        canvas.delete("all")
        self.graph_nodes_by_key = {}
        self.graph_item_ids = {}
        if self.doc is None:
            canvas.configure(scrollregion=(0, 0, 800, 480))
            self.graph_summary_var.set("Файл не открыт")
            self._set_inspector_text(self.graph_detail, "Откройте проект для построения графа.")
            self._update_graph_edit_controls()
            return

        kind_map = {"Все": "all", "SCBinaryLink (cs)": "scbinarylink", "AIEBinaryLink (spz)": "aie_binary_link", "AEContentLink (content)": "ae_content_link", "Parameter → Object": "parameter_object"}
        graph = build_relationship_graph(self.doc)
        visible = filter_relationship_graph(graph, relation_kind=kind_map.get(self.graph_filter_var.get(), "all"), query=self.graph_search_var.get())
        nodes, edges = visible["nodes"], visible["edges"]
        self.graph_nodes_by_key = {node["key"]: node for node in nodes}
        columns, grouped, defaults = self._graph_default_layout(nodes)
        for key, position in defaults.items():
            self.graph_positions.setdefault(key, position)
        # Drop stale keys so a removed link cannot leave phantom layout data.
        all_graph_keys = {node["key"] for node in graph["nodes"]}
        self.graph_positions = {key: value for key, value in self.graph_positions.items() if key in all_graph_keys}
        zoom = self.graph_zoom
        node_width, node_height = 280 * zoom, 58 * zoom
        scale = lambda v: v * zoom
        colors = {"scbinarylink": "#64748b", "aie_binary_link": "#0f766e", "ae_content_link": "#7c3aed", "parameter_object": "#4d7c0f"}
        node_groups = {}
        for group_key, group_nodes in grouped.items():
            for group_node in group_nodes:
                node_groups[group_node["key"]] = group_key
        # Edges are hidden if either endpoint column is collapsed.
        for edge in edges:
            relation_key, target_key = edge["relation_key"], edge.get("target_key")
            relation_pos = self.graph_positions.get(relation_key)
            target_pos = self.graph_positions.get(target_key)
            relation_group = node_groups.get(relation_key)
            target_group = node_groups.get(target_key)
            if (relation_pos is None or target_pos is None or
                    relation_group in self.graph_collapsed_groups or target_group in self.graph_collapsed_groups):
                continue
            relation_node = self.graph_nodes_by_key.get(relation_key, {})
            color = colors.get(relation_node.get("relation_kind"), "#64748b")
            x1, y1 = relation_pos
            x2, y2 = target_pos
            start = (scale(x2 + 280), scale(y2 + 29))
            end = (scale(x1), scale(y1 + 29))
            canvas.create_line(*start, *end, fill=color, width=max(1, 1.5 * zoom), tags=("graph-edge",))
            mid_x, mid_y = (start[0] + end[0]) / 2, (start[1] + end[1]) / 2
            canvas.create_text(mid_x, mid_y - 7 * zoom, text=edge["slot"], fill=color,
                               font=("TkDefaultFont", max(7, int(8 * zoom)), "bold"), tags=("graph-edge-label",))
        visible_positions = []
        for kind, (x, heading, fill, outline) in columns.items():
            x_scaled = scale(x)
            collapsed = kind in self.graph_collapsed_groups
            marker = "▸" if collapsed else "▾"
            heading_item = canvas.create_text(
                x_scaled, scale(28), anchor="nw",
                text=f"{marker} {heading} ({len(grouped[kind])})",
                font=("TkDefaultFont", max(7, int(9 * zoom)), "bold"), fill=outline,
                tags=("graph-group-header", f"graph-group:{kind}"),
            )
            canvas.tag_bind(heading_item, "<Button-1>", lambda event, group=kind: self._toggle_graph_group(group))
            if collapsed:
                continue
            for node in grouped[kind]:
                px, py = self.graph_positions[node["key"]]
                x0, y0 = scale(px), scale(py)
                visible_positions.append((px, py))
                tags = ("graph-node", f"graph-key:{node['key']}")
                selected = node["key"] == self.graph_selected_key
                rect = canvas.create_rectangle(
                    x0, y0, x0 + node_width, y0 + node_height, fill=fill,
                    outline="#d97706" if selected else outline,
                    width=max(1, 3 * zoom if selected else 1.4 * zoom), tags=tags,
                )
                self.graph_item_ids[node["key"]] = rect
                canvas.create_text(x0 + 9 * zoom, y0 + 7 * zoom, anchor="nw", width=node_width - 18 * zoom,
                                   text=node.get("label", node["key"]),
                                   font=("TkDefaultFont", max(7, int(9 * zoom)), "bold"), fill="#18212f", tags=tags)
                canvas.create_text(x0 + 9 * zoom, y0 + 34 * zoom, anchor="nw", width=node_width - 18 * zoom,
                                   text=node.get("detail", ""),
                                   font=("TkDefaultFont", max(6, int(8 * zoom))), fill="#475569", tags=tags)

        max_x = max((px + 310 for px, _py in visible_positions), default=1380)
        max_y = max((py + 100 for _px, py in visible_positions), default=480)
        canvas.configure(scrollregion=(0, 0, max(800, scale(max_x)), max(480, scale(max_y))))
        self.graph_zoom_label.configure(text=f"{int(zoom * 100)}%")
        summary, all_summary = visible["summary"], graph["summary"]
        relation_groups = all_summary.get("relations_by_kind", {})
        group_summary = " · ".join(
            f"{label} {relation_groups.get(kind, 0)}"
            for kind, label in (("scbinarylink", "cs"), ("aie_binary_link", "spz"), ("ae_content_link", "content"))
        )
        self.graph_layout_hint_var.set(f"Группы: {group_summary or 'нет записей'}")
        self.graph_summary_var.set(
            f"Показано: {summary['relation_count']} связей, {summary['endpoint_count']} endpoint-ов; "
            f"всего записей связей/привязок: {all_summary['relation_node_count']}. "
            f"Неразрешённых ссылок: {len(graph['dangling_references'])}; "
            f"непрозрачных записей: {all_summary['opaque_record_count']}. "
            "Перетаскивайте узлы; Ctrl+колесо — масштаб; средняя кнопка — панорама. "
            "Семейства связей показаны отдельными колонками; вид хранится отдельно от .is2."
        )
        if not nodes:
            canvas.create_text(30, 45, anchor="nw", text="По заданному фильтру узлы не найдены.", font=("TkDefaultFont", 11), fill="#475569")
        elif not edges:
            canvas.create_text(30, 45, anchor="nw", text="Записи связей не найдены. Изолированные элементы показаны в своих колонках.", font=("TkDefaultFont", 10), fill="#64748b")
        details = "Выберите узел. Двойной щелчок открывает его таблицу; связь можно изменить или удалить кнопками выше."
        if graph["dangling_references"]:
            details += "\n\nНеразрешённые endpoint-ы:\n" + "\n".join(
                f"{item['relation_kind']}[{item['record_index']}].{item['slot']} → {item['endpoint_id']} ({item['expected_domain']})"
                for item in graph["dangling_references"][:30]
            )
        self._set_inspector_text(self.graph_detail, details)
        self._update_graph_edit_controls()

    def _update_graph_edit_controls(self):
        node = self.graph_nodes_by_key.get(self.graph_selected_key) if self.graph_selected_key else None
        is_relation = bool(node and node.get("kind") == "relation")
        if hasattr(self, "graph_edit_button"):
            self.graph_edit_button.configure(state="normal" if is_relation else "disabled")
            self.graph_delete_button.configure(state="normal" if is_relation else "disabled")

    def _graph_select_node(self, node_key):
        if node_key not in self.graph_nodes_by_key:
            self.graph_selected_key = None
            self._update_graph_edit_controls()
            return
        self.graph_selected_key = node_key
        for key, item in self.graph_item_ids.items():
            node = self.graph_nodes_by_key[key]
            color = {"action": "#2455a4", "category": "#28734a", "spz_element": "#996018", "parameter": "#0369a1", "object": "#a16207", "relation": "#6941a5"}.get(node["kind"], "#64748b")
            self.graph_canvas.itemconfigure(item, outline="#d97706" if key == node_key else color,
                                            width=3 if key == node_key else 1.4)
        node = self.graph_nodes_by_key[node_key]
        self._set_inspector_text(self.graph_detail, json.dumps(node, ensure_ascii=False, indent=2))
        self.status.set(f"Граф: выбран узел {node.get('label', node_key)}")
        self._update_graph_edit_controls()
        if self.path is not None:
            self._save_graph_view_state()

    def _graph_node_key_at(self, event):
        x, y = self.graph_canvas.canvasx(event.x), self.graph_canvas.canvasy(event.y)
        found = self.graph_canvas.find_overlapping(x - 1, y - 1, x + 1, y + 1)
        for item in reversed(found):
            for tag in self.graph_canvas.gettags(item):
                if tag.startswith("graph-key:"):
                    return tag.split(":", 1)[1]
        return None

    def _graph_press(self, event):
        self.graph_canvas.focus_set()
        key = self._graph_node_key_at(event)
        if key:
            self._graph_select_node(key)
            pos = self.graph_positions.get(key, (0.0, 0.0))
            self.graph_drag = {
                "key": key,
                "start_x": self.graph_canvas.canvasx(event.x) / self.graph_zoom,
                "start_y": self.graph_canvas.canvasy(event.y) / self.graph_zoom,
                "origin": pos,
                "moved": False,
            }
        else:
            self.graph_drag = None
        return "break"

    def _graph_motion(self, event):
        drag = self.graph_drag
        if not drag:
            return
        x = self.graph_canvas.canvasx(event.x) / self.graph_zoom
        y = self.graph_canvas.canvasy(event.y) / self.graph_zoom
        dx, dy = x - drag["start_x"], y - drag["start_y"]
        if abs(dx) + abs(dy) < 1.5 and not drag["moved"]:
            return
        drag["moved"] = True
        ox, oy = drag["origin"]
        self.graph_positions[drag["key"]] = (max(0.0, ox + dx), max(45.0, oy + dy))
        self._refresh_graph()

    def _graph_release(self, _event):
        drag = self.graph_drag
        self.graph_drag = None
        if drag and drag.get("moved"):
            self._save_graph_view_state()
            self.status.set("Положение узла изменено (только sidecar представления, XML проекта не менялся)")
        return "break"

    def _graph_double_click(self, _event):
        key = self.graph_selected_key
        node = self.graph_nodes_by_key.get(key) if key else None
        if not node:
            return
        if node.get("kind") == "relation":
            self.graph_edit_relation()
        else:
            self._navigate_graph_node(node)

    def _navigate_graph_node(self, node):
        kind = node.get("kind")
        ident = str(node.get("id", ""))
        if kind == "action" and self.action_tree.exists(ident):
            self.notebook.select(self.action_page); self.action_tree.selection_set(ident); self.action_tree.see(ident)
        elif kind == "category" and self.category_tree.exists(ident):
            self._show_page(self.concept_page); self.category_tree.selection_set(ident); self.category_tree.see(ident)
        elif kind == "spz_element" and self.spz_tree.exists(ident):
            self._show_page(self.other_page); self.spz_tree.selection_set(ident); self.spz_tree.see(ident)
        elif kind == "parameter" and self.param_tree.exists(ident):
            self._show_page(self.param_page); self.param_tree.selection_set(ident); self.param_tree.see(ident)
        elif kind == "object" and self.object_tree.exists(ident):
            self._show_page(self.object_page); self.object_tree.selection_set(ident); self.object_tree.see(ident)
        elif kind == "relation":
            relation_kind = node.get("relation_kind"); index = int(node.get("record_index", -1))
            if relation_kind == "scbinarylink":
                link_id = str(node.get("attributes", {}).get("id", ""))
                if self.link_tree.exists(link_id):
                    self._show_page(self.link_page); self.link_tree.selection_set(link_id); self.link_tree.see(link_id)
            elif relation_kind == "aie_binary_link" and self.spz_links_tree.exists(str(index)):
                self._show_page(self.other_page); self.dynamic_tabs.select(self.spz_links_page); self.spz_links_tree.selection_set(str(index)); self.spz_links_tree.see(str(index))
            elif relation_kind == "ae_content_link" and self.content_tree.exists(str(index)):
                self._show_page(self.other_page); self.dynamic_tabs.select(self.content_page); self.content_tree.selection_set(str(index)); self.content_tree.see(str(index))

    def _graph_zoom_step(self, factor):
        self.graph_zoom = min(2.5, max(0.5, self.graph_zoom * factor))
        self._refresh_graph()
        self._save_graph_view_state()

    def _graph_wheel_zoom(self, event):
        self._graph_zoom_step(1.15 if event.delta > 0 else 0.87)
        return "break"

    def _graph_fit(self):
        """Fit the current user layout into the visible canvas without resetting it."""
        if self.doc is None:
            self.graph_zoom = 1.0
            return
        self.graph_canvas.update_idletasks()
        width = max(240, self.graph_canvas.winfo_width() - 36)
        height = max(180, self.graph_canvas.winfo_height() - 36)
        max_x = max((x + 300 for x, _y in self.graph_positions.values()), default=1400.0)
        max_y = max((y + 90 for _x, y in self.graph_positions.values()), default=480.0)
        self.graph_zoom = min(2.5, max(0.5, min(width / max_x, height / max_y)))
        self._refresh_graph()
        self.graph_canvas.xview_moveto(0)
        self.graph_canvas.yview_moveto(0)
        self._save_graph_view_state()

    def _graph_kind_selected(self):
        return self.graph_new_kind.get().split(" ", 1)[0]

    def graph_add_relation(self):
        if self.doc is None:
            return
        kind_label = self.graph_new_kind.get()
        selected = self.graph_nodes_by_key.get(self.graph_selected_key) if self.graph_selected_key else None
        try:
            if kind_label.startswith("SCBinaryLink"):
                ids = [n.get("id", "") for n in self.doc.concept_structure.categories if n.get("id")]
                if len(ids) < 2:
                    raise ValueError("Для SCBinaryLink нужны минимум две категории ConceptModel.")
                selected_id = str(selected.get("id")) if selected and selected.get("kind") == "category" else ids[0]
                fields = [
                    ("type", "Тип (1=порядок, 2=состав, 3=расположение)", "2", ("1", "2", "3")),
                    ("e1", "E1", selected_id, tuple(["0"] + ids)),
                    ("e2", "E2", ids[1] if ids[1] != selected_id else ids[0], tuple(["0"] + ids)),
                    ("e3", "E3", "0", tuple(["0"] + ids)),
                    ("name", "Название", "", None), ("range", "Range (пусто = native default)", "", None),
                ]
                dialog = RecordDialog(self, "Создать SCBinaryLink из графа", fields); self.wait_window(dialog)
                if dialog.result is None: return
                d = dialog.result
                ident = self.doc.concept_structure.add_link(int(d["type"]), e1=d["e1"], e2=d["e2"], e3=d["e3"], name=d["name"], range_value=int(d["range"]) if d["range"].strip() else None)
                new_key = f"relation:scbinarylink:{ident}:{len(self.doc.concept_structure.links)-1}"
            elif kind_label.startswith("AIEBinaryLink"):
                ids = [str(n.get("id")) for n in self.doc.dynamic_structure.elements if n.get("id")]
                if not ids: raise ValueError("Сначала создайте хотя бы один spz AElement.")
                prefill = str(selected.get("id")) if selected and selected.get("kind") == "spz_element" else ids[0]
                choices = tuple(["0"] + ids)
                fields = [(slot, slot.upper() + " (0 = null)", prefill if slot == "e1" else "0", choices) for slot in ("e1", "e2", "e3")]
                fields += [("name", "Name", "", None), ("type", "Type", "0", None), ("status", "Status", "0", None), ("formalization", "Formalization", "0", None), ("level", "Level", "0", None), ("number", "Number", "0", None), ("symbol", "Symbol (uint16)", "0", None)]
                dialog = RecordDialog(self, "Создать AIEBinaryLink из графа", fields); self.wait_window(dialog)
                if dialog.result is None: return
                d = dialog.result
                self.doc.dynamic_structure.add_spz_link(e1=d["e1"], e2=d["e2"], e3=d["e3"], name=d["name"], type=int(d["type"]), status=int(d["status"]), formalization=int(d["formalization"]), level=int(d["level"]), number=int(d["number"]), symbol=int(d["symbol"]))
                index = len(self.doc.dynamic_structure.links) - 1
                new_key = f"relation:aie_binary_link:{index}"
            else:
                actions = [str(n.get("id")) for n in self.doc.actions if n.get("id")]
                categories = [str(n.get("id")) for n in self.doc.concept_structure.categories if n.get("id")]
                if not actions or not categories: raise ValueError("Для AEContentLink нужны действие и категория ConceptModel.")
                e1_default = str(selected.get("id")) if selected and selected.get("kind") == "action" else actions[0]
                e2_default = str(selected.get("id")) if selected and selected.get("kind") == "category" else categories[0]
                fields = [("e1", "E1 — AFElement action", e1_default, tuple(actions)), ("e2", "E2 — AIElement category", e2_default, tuple(categories)), ("char", "Char (int8)", "0", None), ("power", "Power (int32)", "1", None)]
                dialog = RecordDialog(self, "Создать AEContentLink из графа", fields); self.wait_window(dialog)
                if dialog.result is None: return
                d = dialog.result
                index = self.doc.dynamic_structure.add_content_link(d["e1"], d["e2"], char=int(d["char"]), power=int(d["power"]), duplicate="reject")
                new_key = f"relation:ae_content_link:{index}"
            self._mark_dirty(f"Создана связь через граф: {kind_label}")
            self.graph_selected_key = new_key
            self.refresh_all()
            self._graph_select_node(new_key)
            self._save_graph_view_state()
        except Exception as exc:
            messagebox.showerror("Создание связи на графе", str(exc), parent=self)

    def graph_edit_relation(self):
        if self.doc is None: return
        node = self.graph_nodes_by_key.get(self.graph_selected_key) if self.graph_selected_key else None
        if not node or node.get("kind") != "relation":
            messagebox.showinfo("Граф связей", "Выберите узел записи связи.", parent=self); return
        kind, index = node.get("relation_kind"), int(node.get("record_index", -1))
        try:
            if kind == "parameter_object":
                parameter_id = str(node.get("attributes", {}).get("parameter_id", ""))
                current = self.doc.parameter(parameter_id)
                objects = [obj.get("id", "") for obj in self.doc.objects_node if obj.get("id")]
                if not objects:
                    raise ValueError("В проекте нет объектов PrimaryModel.")
                current_id = current.get("o", "")
                fields = [("object_id", "Объект", current_id if current_id in objects else objects[0], tuple(objects))]
                dialog = RecordDialog(self, f"Привязка Parameter {parameter_id} → Object", fields)
                self.wait_window(dialog)
                if dialog.result is None:
                    return
                self.doc.set_parameter_object(parameter_id, dialog.result["object_id"])
                new_key = f"relation:parameter_object:{parameter_id}:{index}"
            elif kind == "scbinarylink":
                ident = str(node.get("attributes", {}).get("id", "")); current = self.doc.concept_structure.link(ident)
                ids = [n.get("id", "") for n in self.doc.concept_structure.categories if n.get("id")]
                fields = [("type", "Тип", current.get("type", "2"), ("1", "2", "3")), ("e1", "E1", current.get("e1", "0"), tuple(["0"] + ids)), ("e2", "E2", current.get("e2", "0"), tuple(["0"] + ids)), ("e3", "E3", current.get("e3", "0"), tuple(["0"] + ids)), ("name", "Название", current.get("name", ""), None), ("range", "Range", current.get("range", "99"), None)]
                dialog = RecordDialog(self, f"SCBinaryLink {ident}", fields); self.wait_window(dialog)
                if dialog.result is None: return
                d = dialog.result
                self.doc.concept_structure.update_link(ident, type=int(d["type"]), e1=d["e1"], e2=d["e2"], e3=d["e3"], name=d["name"], range=int(d["range"]))
                new_key = self.graph_selected_key
            elif kind == "aie_binary_link":
                current = self.doc.dynamic_structure.links[index]
                if current.tag != "AElement" or any(current.get(k) is None for k in ("e1", "e2", "e3")):
                    raise ValueError("Непрозрачная запись защищена от изменения.")
                ids = [str(n.get("id")) for n in self.doc.dynamic_structure.elements if n.get("id")]; choices = tuple(["0"] + ids)
                fields = [(slot, slot.upper(), current.get(slot, "0"), choices) for slot in ("e1", "e2", "e3")]
                fields += [("name", "Name", current.get("name", ""), None)] + [(k, k, current.get(k, "0"), None) for k in ("type", "status", "formalization", "level", "number", "symbol")]
                dialog = RecordDialog(self, f"AIEBinaryLink spz/links[{index+1}]", fields); self.wait_window(dialog)
                if dialog.result is None: return
                d = dialog.result; changes = {k: (v if k == "name" else int(v)) for k, v in d.items() if v != current.get(k, "0" if k != "name" else "")}
                self.doc.dynamic_structure.update_spz_link(index, **changes); new_key = self.graph_selected_key
            elif kind == "ae_content_link":
                current = self.doc.dynamic_structure.content_records[index]
                if current.tag != "AElement" or current.get("type") != "4": raise ValueError("Непрозрачная или неподдерживаемая запись защищена от изменения.")
                actions = [str(n.get("id")) for n in self.doc.actions if n.get("id")]; categories = [str(n.get("id")) for n in self.doc.concept_structure.categories if n.get("id")]
                fields = [("e1", "E1 — AFElement", current.get("e1", ""), tuple(actions)), ("e2", "E2 — AIElement", current.get("e2", ""), tuple(categories)), ("char", "Char (int8)", current.get("char", "0"), None), ("power", "Power (int32)", current.get("power", "1"), None)]
                dialog = RecordDialog(self, f"AEContentLink content[{index+1}]", fields); self.wait_window(dialog)
                if dialog.result is None: return
                d = dialog.result; self.doc.dynamic_structure.update_content_record(index, e1=d["e1"], e2=d["e2"], char=int(d["char"]), power=int(d["power"])); new_key = self.graph_selected_key
            else:
                raise ValueError(f"Неизвестный тип связи: {kind}")
            self._mark_dirty(f"Изменена связь через граф: {kind}")
            self.refresh_all()
            if new_key in self.graph_nodes_by_key: self._graph_select_node(new_key)
        except Exception as exc:
            messagebox.showerror("Редактирование связи на графе", str(exc), parent=self)

    def graph_delete_relation(self):
        if self.doc is None: return
        node = self.graph_nodes_by_key.get(self.graph_selected_key) if self.graph_selected_key else None
        if not node or node.get("kind") != "relation":
            messagebox.showinfo("Граф связей", "Выберите узел записи связи.", parent=self); return
        kind, index = node.get("relation_kind"), int(node.get("record_index", -1))
        if not messagebox.askyesno("Удаление связи", f"Удалить выбранную запись {kind} [{index+1}]?", parent=self): return
        try:
            if kind == "parameter_object":
                parameter_id = str(node.get("attributes", {}).get("parameter_id", ""))
                self.doc.set_parameter_object(parameter_id, None)
            elif kind == "scbinarylink":
                ident = str(node.get("attributes", {}).get("id", "")); self.doc.concept_structure.delete_link(ident)
            elif kind == "aie_binary_link": self.doc.dynamic_structure.delete_spz_link(index)
            elif kind == "ae_content_link": self.doc.dynamic_structure.delete_content_link(index)
            else: raise ValueError(f"Неизвестный тип связи: {kind}")
            self._mark_dirty(f"Удалена связь через граф: {kind} [{index+1}]")
            self.graph_selected_key = None
            self.refresh_all()
            self._save_graph_view_state()
        except Exception as exc:
            messagebox.showerror("Удаление связи на графе", str(exc), parent=self)

    def _graph_click(self, event):
        """Compatibility wrapper retained for smoke tests and older bindings."""
        key = self._graph_node_key_at(event)
        if key:
            self._graph_select_node(key)
        return key

    @staticmethod
    def _set_inspector_text(widget: tk.Text, value: str):
        widget.configure(state="normal")
        widget.delete("1.0", "end")
        widget.insert("1.0", value)
        widget.configure(state="disabled")

    def _show_spz_link_detail(self, _event=None):
        if self.doc is None:
            return
        selected = self.spz_links_tree.selection()
        if not selected:
            return
        try:
            index = int(selected[0])
            node = self.doc.dynamic_structure.links[index]
            self._set_inspector_text(self.spz_link_detail, ET.tostring(node, encoding="unicode"))
        except (ValueError, IndexError):
            return

    def _show_content_detail(self, _event=None):
        if self.doc is None:
            return
        selected = self.content_tree.selection()
        if not selected:
            return
        try:
            index = int(selected[0])
            node = self.doc.dynamic_structure.content_records[index]
            self._set_inspector_text(self.content_detail, ET.tostring(node, encoding="unicode"))
        except (ValueError, IndexError):
            return

    def edit_spz_link(self):
        if self.doc is None:
            return
        selected = self.spz_links_tree.selection()
        if not selected:
            messagebox.showinfo("Выбор связи", "Сначала выберите запись в таблице spz/links.", parent=self)
            return
        try:
            index = int(selected[0])
            node = self.doc.dynamic_structure.links[index]
            ids = sorted(
                (str(n.get("id")) for n in self.doc.dynamic_structure.elements if n.get("id")),
                key=lambda x: (0, int(x)) if x.isdigit() else (1, x.casefold()),
            )
            choices = tuple(["0"] + ids)
            fields = [
                (key, f"{key.upper()} — ID AIElement (0 = нет)", node.get(key, "0"), choices)
                for key in ("e1", "e2", "e3")
            ]
            fields.extend([
                ("name", "Name", node.get("name", ""), None),
                ("type", "Type (signed int32)", node.get("type", "0"), None),
                ("status", "Status (signed int32)", node.get("status", "0"), None),
                ("formalization", "Formalization (signed int32)", node.get("formalization", "0"), None),
                ("level", "Level (signed int32)", node.get("level", "0"), None),
                ("number", "Number (signed int32)", node.get("number", "0"), None),
                ("symbol", "Symbol (uint16)", node.get("symbol", "0"), None),
            ])
            dialog = RecordDialog(self, f"spz/links — запись {index + 1}", fields)
            self.wait_window(dialog)
            if dialog.result is None:
                return
            changes = {}
            for key, value in dialog.result.items():
                if value != node.get(key, "0" if key != "name" else ""):
                    changes[key] = value if key == "name" else (0 if value.strip() == "" else int(value))
            if not changes:
                return
            self.doc.dynamic_structure.update_spz_link(index, **changes)
            self._mark_dirty(f"Изменена AIEBinaryLink spz/links[{index + 1}]")
            self.refresh_all()
            self.spz_links_tree.selection_set(str(index))
        except Exception as exc:
            messagebox.showerror("Редактирование spz/links", str(exc), parent=self)

    def add_spz_link(self):
        if self.doc is None:
            return
        ids = sorted((str(n.get("id")) for n in self.doc.dynamic_structure.elements if n.get("id")), key=lambda x: (0, int(x)) if x.isdigit() else (1, x.casefold()))
        choices = tuple(["0"] + ids)
        fields = [
            ("e1", "E1 — AIElement (0 = null)", "0", choices),
            ("e2", "E2 — AIElement (0 = null)", "0", choices),
            ("e3", "E3 — AIElement (0 = null)", "0", choices),
            ("name", "Name", "", None),
            ("type", "Type (AElement)", "0", None),
            ("status", "Status", "0", None),
            ("formalization", "Formalization", "0", None),
            ("level", "Level", "0", None),
            ("number", "Number", "0", None),
            ("symbol", "Symbol (uint16)", "0", None),
        ]
        dialog = RecordDialog(self, "Новая AIEBinaryLink", fields)
        self.wait_window(dialog)
        if dialog.result is None:
            return
        try:
            d = dialog.result
            ident = self.doc.dynamic_structure.add_spz_link(
                e1=d["e1"], e2=d["e2"], e3=d["e3"], name=d["name"],
                type=int(d["type"]), status=int(d["status"]),
                formalization=int(d["formalization"]), level=int(d["level"]),
                number=int(d["number"]), symbol=int(d["symbol"]),
            )
            self._mark_dirty(f"Создана spz-связь {ident}")
            self.refresh_all()
            self.spz_links_tree.selection_set(str(len(self.doc.dynamic_structure.links) - 1))
        except Exception as exc:
            messagebox.showerror("AIEBinaryLink", str(exc), parent=self)

    def delete_spz_link(self):
        if self.doc is None:
            return
        selected = self.spz_links_tree.selection()
        if not selected:
            return messagebox.showinfo("spz/links", "Выберите связь.", parent=self)
        index = int(selected[0])
        if not messagebox.askyesno("Удаление spz-связи", f"Удалить запись spz/links[{index + 1}]?", parent=self):
            return
        try:
            self.doc.dynamic_structure.delete_spz_link(index)
            self._mark_dirty(f"Удалена spz-связь {index + 1}")
            self.refresh_all()
        except Exception as exc:
            messagebox.showerror("spz/links", str(exc), parent=self)

    def add_content_link(self):
        if self.doc is None:
            return
        actions = sorted((str(n.get("id")) for n in self.doc.actions if n.get("id")), key=lambda x: (0, int(x)) if x.isdigit() else (1, x.casefold()))
        categories = sorted((str(n.get("id")) for n in self.doc.concept_structure.categories if n.get("id")), key=lambda x: (0, int(x)) if x.isdigit() else (1, x.casefold()))
        if not actions or not categories:
            return messagebox.showinfo("AEContentLink", "Для создания связи нужны хотя бы одно действие и одна категория ConceptModel/cs.", parent=self)
        fields = [
            ("e1", "E1 — действие AFElement", actions[0], tuple(actions)),
            ("e2", "E2 — категория AIElement", categories[0], tuple(categories)),
            ("char", "Char (signed 8-bit; 0 = native default)", "0", None),
            ("power", "Power (signed int32)", "1", None),
        ]
        dialog = RecordDialog(self, "Новая AEContentLink (type 4)", fields)
        self.wait_window(dialog)
        if dialog.result is None:
            return
        try:
            d = dialog.result
            index = self.doc.dynamic_structure.add_content_link(
                d["e1"], d["e2"], char=int(d["char"]), power=int(d["power"]),
                duplicate="reuse",
            )
            self._mark_dirty(f"Создана AEContentLink content[{index + 1}]")
            self.refresh_all()
            self.content_tree.selection_set(str(index))
        except Exception as exc:
            messagebox.showerror("AEContentLink", str(exc), parent=self)

    def delete_content_link(self):
        if self.doc is None:
            return
        selected = self.content_tree.selection()
        if not selected:
            return messagebox.showinfo("ConceptModel/content", "Выберите связь.", parent=self)
        index = int(selected[0])
        if not messagebox.askyesno("Удаление AEContentLink", f"Удалить запись content[{index + 1}]?", parent=self):
            return
        try:
            self.doc.dynamic_structure.delete_content_link(index)
            self._mark_dirty(f"Удалена AEContentLink content[{index + 1}]")
            self.refresh_all()
        except Exception as exc:
            messagebox.showerror("AEContentLink", str(exc), parent=self)

    def edit_content_record(self):
        if self.doc is None:
            return
        selected = self.content_tree.selection()
        if not selected:
            messagebox.showinfo("Выбор записи", "Сначала выберите запись в ConceptModel/content.", parent=self)
            return
        try:
            index = int(selected[0])
            node = self.doc.dynamic_structure.content_records[index]
            action_ids = [str(n.get("id")) for n in self.doc.actions if n.get("id")]
            category_ids = [str(n.get("id")) for n in self.doc.concept_structure.categories if n.get("id")]
            e1_values = list(dict.fromkeys(action_ids + ([node.get("e1")] if node.get("e1") else [])))
            e2_values = list(dict.fromkeys(category_ids + ([node.get("e2")] if node.get("e2") else [])))
            fields = [
                ("e1", "E1 — AFElement action", node.get("e1", action_ids[0] if action_ids else ""), tuple(e1_values)),
                ("e2", "E2 — AIElement category", node.get("e2", category_ids[0] if category_ids else ""), tuple(e2_values)),
                ("char", "Char (signed 8-bit)", node.get("char", "0"), None),
                ("power", "Power (signed 32-bit)", node.get("power", "1"), None),
            ]
            dialog = RecordDialog(self, f"AEContentLink — запись {index + 1}", fields)
            self.wait_window(dialog)
            if dialog.result is None:
                return
            changes = {}
            for key, value in dialog.result.items():
                if value != node.get(key, ""):
                    changes[key] = int(value)
            if not changes:
                return
            self.doc.dynamic_structure.update_content_record(index, **changes)
            self._mark_dirty(f"Изменена AEContentLink content[{index + 1}]")
            self.refresh_all()
            self.content_tree.selection_set(str(index))
        except Exception as exc:
            messagebox.showerror("Редактирование AEContentLink", str(exc), parent=self)

    def add_spz_element(self):
        if self.doc is None:
            return
        next_id = 1
        spz = self.doc.dynamic_structure.spz_node
        if spz is not None:
            try:
                next_id = int(spz.get("last_id", "0")) + 1
            except ValueError:
                pass
        fields = [
            ("name", "Название", f"PZ_{next_id}", None),
            ("type", "Type", "0", None),
            ("status", "Status", "0", None),
            ("formalization", "Formalization", "0", None),
            ("level", "Level", "1", None),
            ("number", "Number", str(next_id), None),
            ("symbol", "Symbol (0..65535)", "99", None),
        ]
        dialog = RecordDialog(self, "Новый spz AElement", fields)
        self.wait_window(dialog)
        if dialog.result is None:
            return
        try:
            d = dialog.result
            ident = self.doc.dynamic_structure.add_element(
                d["name"], type=int(d["type"]), status=int(d["status"]),
                formalization=int(d["formalization"]), level=int(d["level"]),
                number=int(d["number"]), symbol=int(d["symbol"]),
            )
            self._mark_dirty(f"Создан spz AElement {ident}")
            self.refresh_all()
        except Exception as exc:
            messagebox.showerror("spz AElement", str(exc), parent=self)

    def edit_spz_element(self):
        if self.doc is None:
            return
        ident = self._selected_id(self.spz_tree)
        if not ident:
            messagebox.showinfo("Выбор записи", "Сначала выберите AElement.", parent=self)
            return
        try:
            node = self.doc.dynamic_structure.element(ident)
            fields = [
                ("name", "Название", node.get("name", ""), None),
                ("type", "Type", node.get("type", "0"), None),
                ("status", "Status", node.get("status", "0"), None),
                ("formalization", "Formalization", node.get("formalization", "0"), None),
                ("level", "Level", node.get("level", "1"), None),
                ("number", "Number", node.get("number", ident), None),
                ("symbol", "Symbol (0..65535)", node.get("symbol", "99"), None),
            ]
            dialog = RecordDialog(self, f"spz AElement {ident}", fields)
            self.wait_window(dialog)
            if dialog.result is None:
                return
            d = dialog.result
            self.doc.dynamic_structure.update_element(
                ident, name=d["name"], type=int(d["type"]), status=int(d["status"]),
                formalization=int(d["formalization"]), level=int(d["level"]),
                number=int(d["number"]), symbol=int(d["symbol"]),
            )
            self._mark_dirty(f"Изменён spz AElement {ident}")
            self.refresh_all()
        except Exception as exc:
            messagebox.showerror("spz AElement", str(exc), parent=self)

    def delete_spz_element(self):
        if self.doc is None:
            return
        ident = self._selected_id(self.spz_tree)
        if not ident:
            messagebox.showinfo("Выбор записи", "Сначала выберите AElement.", parent=self)
            return
        touching = [n for n in self.doc.dynamic_structure.links if ident in {n.get("e1"), n.get("e2"), n.get("e3")}]
        cascade_links = False
        if touching:
            cascade_links = messagebox.askyesno("Удалить AElement", f"AElement {ident} используется в {len(touching)} spz-связях. Удалить также эти связи?\n\n{self._dependency_note(self._dependency_entry('spz_element', ident))}", parent=self)
            if not cascade_links: return
        elif not messagebox.askyesno("Удалить AElement", f"Удалить AElement {ident}?\n\n{self._dependency_note(self._dependency_entry('spz_element', ident))}", parent=self):
            return
        try:
            self.doc.dynamic_structure.delete_element(ident, cascade_links=cascade_links)
            self._mark_dirty(f"Удалён spz AElement {ident}")
            self.refresh_all()
        except Exception as exc:
            messagebox.showerror("spz AElement", str(exc), parent=self)

    def _document_snapshot(self) -> bytes | None:
        if self.doc is None:
            return None
        # ElementTree serializes comments and processing instructions because the
        # parser was created with insert_comments/insert_pis enabled.
        return ET.tostring(self.doc.root, encoding="utf-8", short_empty_elements=True)

    @staticmethod
    def _fingerprint(snapshot: bytes | None) -> str | None:
        return hashlib.sha256(snapshot).hexdigest() if snapshot is not None else None

    def _reset_history(self, *, saved: bool) -> None:
        self.history.clear()
        snapshot = self._document_snapshot()
        self._last_history_snapshot = snapshot
        self._saved_fingerprint = self._fingerprint(snapshot) if saved else None
        self.dirty = not saved
        self._update_history_controls()

    def _update_history_controls(self) -> None:
        can_undo = self.doc is not None and self.history.can_undo
        can_redo = self.doc is not None and self.history.can_redo
        if hasattr(self, "undo_button"):
            self.undo_button.configure(state="normal" if can_undo else "disabled")
            self.redo_button.configure(state="normal" if can_redo else "disabled")
        if hasattr(self, "edit_menu"):
            undo_label = self.history.undo_label
            redo_label = self.history.redo_label
            self.edit_menu.entryconfigure(0, state="normal" if can_undo else "disabled",
                                          label=(f"Отменить: {undo_label}" if can_undo else "Отменить"))
            self.edit_menu.entryconfigure(1, state="normal" if can_redo else "disabled",
                                          label=(f"Повторить: {redo_label}" if can_redo else "Повторить"))
        self._refresh_history_window()

    def show_history(self):
        """Show the undo/redo timeline and a detailed operation journal."""
        if self.history_window is not None and self.history_window.winfo_exists():
            self.history_window.deiconify()
            self.history_window.lift()
            self._refresh_history_window()
            return
        window = tk.Toplevel(self)
        window.title("История изменений — PzKpfw")
        window.geometry("900x520")
        self.history_window = window
        ttk.Label(window, text="История текущей сессии документа. Снимки остаются в памяти; журнал содержит только метаданные.", padding=8).pack(anchor="w")
        tabs = ttk.Notebook(window)
        tabs.pack(fill="both", expand=True, padx=8, pady=4)
        timeline_page = ttk.Frame(tabs, padding=4)
        journal_page = ttk.Frame(tabs, padding=4)
        tabs.add(timeline_page, text="Undo / Redo")
        tabs.add(journal_page, text="Журнал операций")

        tree = ttk.Treeview(timeline_page, columns=("stack", "index", "operation", "when", "size"), show="headings", selectmode="browse")
        for key, title, width in (("stack", "Стек", 105), ("index", "№", 45), ("operation", "Операция", 390), ("when", "Время", 190), ("size", "Снимок", 90)):
            tree.heading(key, text=title)
            tree.column(key, width=width, anchor="w" if key in {"operation", "when"} else "center")
        tree.pack(fill="both", expand=True)
        tree.bind("<<TreeviewSelect>>", self._history_selection_changed)
        self.history_tree = tree

        journal = ttk.Treeview(journal_page, columns=("seq", "when", "action", "operation", "details"), show="headings")
        for key, title, width in (("seq", "№", 55), ("when", "Время UTC", 190), ("action", "Действие", 100), ("operation", "Операция", 245), ("details", "Подробности", 420)):
            journal.heading(key, text=title)
            journal.column(key, width=width, anchor="w" if key not in {"seq"} else "center")
        journal.pack(fill="both", expand=True)
        self.history_journal_tree = journal

        buttons = ttk.Frame(window, padding=8)
        buttons.pack(fill="x")
        ttk.Button(buttons, text="↶ Отменить", command=self.undo).pack(side="left")
        ttk.Button(buttons, text="↷ Повторить", command=self.redo).pack(side="left", padx=6)
        self.history_jump_button = ttk.Button(buttons, text="Перейти к состоянию…", command=self._jump_history_selection, state="disabled")
        self.history_jump_button.pack(side="left", padx=6)
        ttk.Button(buttons, text="Экспорт журнала…", command=self.export_history_journal).pack(side="left", padx=6)
        ttk.Button(buttons, text="Закрыть", command=window.destroy).pack(side="right")
        window.bind("<Escape>", lambda _e: window.destroy())
        window.protocol("WM_DELETE_WINDOW", window.destroy)
        window.bind("<Destroy>", self._history_window_destroyed, add="+")
        self._refresh_history_window()

    def export_history_journal(self):
        if not self.history.journal:
            messagebox.showinfo("Журнал операций", "В журнале пока нет записей.", parent=self)
            return
        target = filedialog.asksaveasfilename(parent=self, title="Экспорт журнала операций", defaultextension=".json", filetypes=[("JSON", "*.json")])
        if not target:
            return
        payload = {
            "schema_version": 1,
            "project": str(self.path) if self.path else None,
            "events": [event.as_dict() for event in self.history.journal],
        }
        try:
            Path(target).write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
            messagebox.showinfo("Журнал операций", f"Журнал сохранён: {target}", parent=self)
        except Exception as exc:
            messagebox.showerror("Экспорт журнала", str(exc), parent=self)

    def _history_window_destroyed(self, event):
        if event.widget is self.history_window:
            self.history_window = None
            self.history_tree = None
            self.history_journal_tree = None
            self.history_jump_button = None

    def _refresh_history_window(self):
        tree = self.history_tree
        journal = self.history_journal_tree
        if tree is None and journal is None:
            return
        try:
            if tree is not None:
                selected = tree.selection()
                selected_iid = selected[0] if selected else None
                tree.delete(*tree.get_children())
                tree.insert("", "end", iid="current", values=("Текущее", "—", "Текущее состояние документа", "—", "—"))
                for stack, label, ordinal in self.history.timeline:
                    info = self.history.entry_info(stack, ordinal) or {}
                    created = str(info.get("created_at", "")).replace("T", " ").replace("Z", " UTC")
                    size = info.get("compressed_size", 0)
                    tree.insert("", "end", iid=f"{stack}:{ordinal}", values=(
                        "До операции" if stack == "undo" else "После операции", ordinal, label,
                        created, f"{size} B" if size else "—",
                    ))
                if selected_iid and tree.exists(selected_iid):
                    tree.selection_set(selected_iid)
                else:
                    tree.selection_set("current")
                self._history_selection_changed()
            if journal is not None:
                journal.delete(*journal.get_children())
                for event in self.history.journal:
                    details = "; ".join(event.details)
                    if event.state_sha256:
                        details = (details + " · " if details else "") + "SHA256 " + event.state_sha256[:12]
                    journal.insert("", "end", values=(event.sequence, event.timestamp, event.action, event.label, details))
                children = journal.get_children()
                if children:
                    journal.see(children[-1])
        except tk.TclError:
            self.history_tree = None
            self.history_journal_tree = None

    def _history_selection_changed(self, _event=None):
        tree = self.history_tree
        button = getattr(self, "history_jump_button", None)
        if tree is None or button is None:
            return
        selected = tree.selection()
        if not selected or selected[0] == "current":
            button.configure(state="disabled", text="Перейти к состоянию…")
            return
        stack = selected[0].split(":", 1)[0]
        if stack == "undo":
            button.configure(state="normal", text="Перейти до операции")
        elif stack == "redo":
            button.configure(state="normal", text="Перейти после операции")
        else:
            button.configure(state="disabled", text="Перейти к состоянию…")

    def _jump_history_selection(self):
        if self.doc is None or self.history_tree is None:
            return
        selected = self.history_tree.selection()
        if not selected or selected[0] == "current":
            return
        try:
            stack, ordinal_text = selected[0].split(":", 1)
            ordinal = int(ordinal_text)
            current = self._document_snapshot() or b""
            snapshot, labels = self.history.jump_to(current, stack=stack, ordinal=ordinal)
            label = " → ".join(labels)
            operation = "Переход к состоянию до операции" if stack == "undo" else "Переход к состоянию после операции"
            self._restore_history_snapshot(snapshot, label, operation)
        except Exception as exc:
            messagebox.showerror("История действий", str(exc), parent=self)

    def _commit_link_repairs_batch(self, replacements: dict[str, str], clears: list[str]) -> dict:
        """Apply a validated multi-endpoint repair as one undoable transaction."""
        if self.doc is None:
            raise ValueError("Сначала откройте проект")
        repaired, report = apply_link_repairs(self.doc, replacements, clears=clears)
        repaired.source_path = self.doc.source_path
        self.doc = repaired
        operations = [f"{selector}: {target}" for selector, target in replacements.items()]
        operations.extend(f"{selector}: снятие" for selector in clears)
        self._mark_dirty(f"Пакет восстановления ссылок ({len(operations)} операций)", operation_group=operations)
        self.refresh_all()
        if self.path is not None:
            self._save_graph_view_state()
        return report

    def _commit_link_repair(self, selector: str, *, target_id: str | None = None, clear: bool = False) -> dict:
        if clear == (target_id is not None):
            raise ValueError("Выберите либо целевой ID, либо разрешённое снятие endpoint-а")
        return self._commit_link_repairs_batch({} if clear else {selector: str(target_id)}, [selector] if clear else [])

    def show_link_repair_dialog(self):
        if self.doc is None:
            return
        issues = link_integrity_report(self.doc)["issues"]
        if not issues:
            messagebox.showinfo("Исправление ссылок", "Неразрешённых типизированных ссылок не обнаружено.", parent=self)
            return

        dialog = tk.Toplevel(self)
        dialog.title("Диагностика и пакетное восстановление ссылок")
        dialog.geometry("980x650")
        dialog.minsize(780, 520)
        dialog.transient(self)
        outer = ttk.Frame(dialog, padding=10)
        outer.pack(fill="both", expand=True)
        ttk.Label(
            outer,
            text=(f"Найдено неразрешённых endpoint-ов: {len(issues)}. "
                  "Соберите пакет исправлений, проверьте его и примените одной операцией. "
                  "PzKpfw не угадывает исходные ID."),
            wraplength=900,
        ).pack(anchor="w", pady=(0, 8))

        tree = ttk.Treeview(outer, columns=("selector", "old", "domain", "policy"), show="headings", height=10)
        for key, title, width in (
            ("selector", "Запись / поле", 255), ("old", "Повреждённый ID", 125),
            ("domain", "Ожидаемый тип объекта", 245), ("policy", "Снятие", 145),
        ):
            tree.heading(key, text=title)
            tree.column(key, width=width, anchor="w")
        tree.pack(fill="both", expand=True)
        by_selector = {item["selector"]: item for item in issues}
        replacements: dict[str, str] = {}
        clears: set[str] = set()
        prepared: dict[str, object] = {}

        controls = ttk.LabelFrame(outer, text="Подготовка исправления выбранного endpoint-а", padding=8)
        controls.pack(fill="x", pady=(8, 0))
        ttk.Label(controls, text="Новый ID:").grid(row=0, column=0, sticky="w")
        target_var = tk.StringVar(value="")
        target_combo = ttk.Combobox(controls, textvariable=target_var, state="readonly", width=28, values=())
        target_combo.grid(row=0, column=1, sticky="w", padx=6)
        policy_var = tk.StringVar(value="Выберите повреждённую ссылку выше.")
        ttk.Label(controls, textvariable=policy_var, wraplength=820).grid(row=1, column=0, columnspan=4, sticky="w", pady=(5, 0))

        queued = ttk.LabelFrame(outer, text="Пакет исправлений — все операции будут одной записью Undo", padding=6)
        queued.pack(fill="both", expand=True, pady=(8, 0))
        staged_tree = ttk.Treeview(queued, columns=("selector", "operation", "target"), show="headings", height=5)
        for key, title, width in (("selector", "Endpoint", 390), ("operation", "Операция", 150), ("target", "Новый ID", 140)):
            staged_tree.heading(key, text=title)
            staged_tree.column(key, width=width, anchor="w")
        staged_tree.pack(fill="both", expand=True)

        action_bar = ttk.Frame(outer)
        action_bar.pack(fill="x", pady=(8, 0))
        add_button = ttk.Button(action_bar, text="Добавить переназначение", state="disabled")
        clear_button = ttk.Button(action_bar, text="Добавить снятие", state="disabled")
        preview_button = ttk.Button(action_bar, text="Предпросмотр пакета", state="disabled")
        apply_button = ttk.Button(action_bar, text="Применить пакет", state="disabled")
        add_button.pack(side="left")
        clear_button.pack(side="left", padx=5)
        preview_button.pack(side="left", padx=(12, 5))
        apply_button.pack(side="left")
        ttk.Button(action_bar, text="Закрыть", command=dialog.destroy).pack(side="right")

        def render_queue():
            staged_tree.delete(*staged_tree.get_children(""))
            for selector, target in replacements.items():
                staged_tree.insert("", "end", iid=selector, values=(selector, "Переназначить", target))
            for selector in sorted(clears):
                staged_tree.insert("", "end", iid=selector, values=(selector, "Снять endpoint", "—"))
            prepared.clear()
            preview_button.configure(state="normal" if replacements or clears else "disabled")
            apply_button.configure(state="disabled")

        def update_selection(_event=None):
            selection = tree.selection()
            if not selection:
                target_combo.configure(values=())
                target_var.set("")
                add_button.configure(state="disabled")
                clear_button.configure(state="disabled")
                return
            selector = selection[0]
            item = by_selector.get(selector)
            if not item:
                return
            targets = available_repair_targets(self.doc, item["expected_domain"])
            target_combo.configure(values=targets)
            target_var.set("")
            add_button.configure(state="normal" if targets else "disabled")
            clear_button.configure(state="normal" if item["can_clear"] else "disabled")
            policy_var.set(item["clear_reason"] + f" Доступно целевых ID: {len(targets)}.")

        def stage_remap():
            selection = tree.selection()
            target = target_var.get().strip()
            if not selection or not target:
                messagebox.showwarning("Пакет исправлений", "Выберите endpoint и существующий ID.", parent=dialog)
                return
            selector = selection[0]
            replacements[selector] = target
            clears.discard(selector)
            render_queue()

        def stage_clear():
            selection = tree.selection()
            if not selection:
                return
            selector = selection[0]
            item = by_selector.get(selector)
            if not item or not item["can_clear"]:
                return
            replacements.pop(selector, None)
            clears.add(selector)
            render_queue()

        def preview_batch():
            try:
                candidate, result = apply_link_repairs(self.doc, replacements, clears=sorted(clears))
                if candidate.semantic_snapshot() == self.doc.semantic_snapshot():
                    raise ValueError("Пакет не изменяет документ")
                prepared["source"] = self._document_snapshot()
                prepared["report"] = result
                lines = [
                    f"Исправлений в пакете: {result['summary']['applied_count']}",
                    f"Осталось неразрешённых endpoint-ов: {result['summary']['remaining_dangling_count']}",
                    f"Ошибок глубокой проверки: {result['summary']['validation_issue_count']}",
                    "",
                ]
                for item in result["applied"]:
                    new_value = item["new_id"] if item["new_id"] is not None else "снятие"
                    lines.append(f"{item['selector']}: {item['old_id']} → {new_value}")
                messagebox.showinfo("Предварительный просмотр пакета", "\n".join(lines), parent=dialog)
                apply_button.configure(state="normal" if result["summary"]["validation_issue_count"] == 0 else "disabled")
            except Exception as exc:
                prepared.clear()
                apply_button.configure(state="disabled")
                messagebox.showerror("Пакет исправлений отклонён", str(exc), parent=dialog)

        def apply_batch():
            if not prepared or prepared.get("source") != self._document_snapshot():
                messagebox.showwarning("Пакет исправлений", "Сначала выполните предварительный просмотр пакета.", parent=dialog)
                return
            result = prepared.get("report")
            if not isinstance(result, dict):
                return
            count = result["summary"]["applied_count"]
            if not messagebox.askyesno(
                "Применить пакет",
                f"Применить {count} исправлений одной операцией?\n\n"
                "Документ изменится только в памяти редактора. Файл на диске не перезаписывается.",
                parent=dialog,
            ):
                return
            try:
                self._commit_link_repairs_batch(replacements, sorted(clears))
                self.status.set(f"Пакет исправлений применён: {count} операций")
                dialog.destroy()
            except Exception as exc:
                messagebox.showerror("Пакет исправлений", str(exc), parent=dialog)

        add_button.configure(command=stage_remap)
        clear_button.configure(command=stage_clear)
        preview_button.configure(command=preview_batch)
        apply_button.configure(command=apply_batch)
        tree.bind("<<TreeviewSelect>>", update_selection)
        for item in issues:
            selector = item["selector"]
            tree.insert("", "end", iid=selector, values=(
                selector, item["endpoint_id"], item["expected_domain_label"],
                "Разрешено" if item["can_clear"] else "Запрещено",
            ))
        if issues:
            tree.selection_set(issues[0]["selector"])
            update_selection()
        dialog.grab_set()

    def show_project_diff(self):
        """Compare the open in-memory project with an older reference project."""
        if self.doc is None:
            return
        reference_name = filedialog.askopenfilename(
            parent=self, title="Выберите старую версию проекта для сравнения",
            filetypes=[("IS-2 project", "*.is2 *.xml"), ("All files", "*.*")],
        )
        if not reference_name:
            return
        try:
            reference = ProjectDocument.load(reference_name)
            diff = compare_documents(reference, self.doc)
        except Exception as exc:
            messagebox.showerror("Сравнение проектов", str(exc), parent=self)
            return
        if not diff.operations:
            messagebox.showinfo("Сравнение проектов", "Семантических различий не обнаружено.", parent=self)
            self.status.set("Сравнение версий: различий нет")
            return

        dialog = tk.Toplevel(self)
        dialog.title("Сравнение версий .is2 — выборочное восстановление")
        dialog.geometry("1160x700")
        dialog.minsize(900, 540)
        dialog.transient(self)
        summary = diff.summary
        ttk.Label(
            dialog,
            text=(f"Старая версия: {Path(reference_name).name}    |    "
                  f"Текущая: {self.path.name if self.path else 'несохранённый проект'}\n"
                  f"Всего изменений: {summary['total']} · удалено: {summary['removed_in_current']} · "
                  f"добавлено: {summary['added_in_current']} · атрибуты: {summary['modified_attributes']} · "
                  f"текст: {summary['modified_text']} · неоднозначных: {summary['ambiguous']}"),
            padding=8, justify="left",
        ).pack(fill="x")
        if diff.warnings:
            warning = ttk.Label(dialog, text="⚠ " + " ".join(diff.warnings), foreground="#9a3412", padding=(8, 0, 8, 6), wraplength=1080)
            warning.pack(fill="x")

        split = ttk.Panedwindow(dialog, orient="vertical")
        split.pack(fill="both", expand=True, padx=8, pady=6)
        table_frame = ttk.Frame(split)
        detail_frame = ttk.Frame(split)
        split.add(table_frame, weight=4)
        split.add(detail_frame, weight=2)
        columns = ("kind", "path", "description", "reference", "current", "risk")
        tree = ttk.Treeview(table_frame, columns=columns, show="headings", selectmode="extended")
        headings = {
            "kind": "Изменение", "path": "XML-путь", "description": "Описание",
            "reference": "Старая версия", "current": "Текущая версия", "risk": "Сопоставление",
        }
        widths = {"kind": 150, "path": 300, "description": 260, "reference": 150, "current": 150, "risk": 130}
        for column in columns:
            tree.heading(column, text=headings[column])
            tree.column(column, width=widths[column], stretch=column in {"path", "description"})
        yscroll = ttk.Scrollbar(table_frame, orient="vertical", command=tree.yview)
        xscroll = ttk.Scrollbar(table_frame, orient="horizontal", command=tree.xview)
        tree.configure(yscrollcommand=yscroll.set, xscrollcommand=xscroll.set)
        tree.grid(row=0, column=0, sticky="nsew")
        yscroll.grid(row=0, column=1, sticky="ns")
        xscroll.grid(row=1, column=0, sticky="ew")
        table_frame.rowconfigure(0, weight=1); table_frame.columnconfigure(0, weight=1)

        kind_labels = {
            "removed": "Удалено в текущей",
            "added": "Добавлено в текущей",
            "modified_attribute": "Изменён атрибут",
            "modified_text": "Изменён текст",
        }
        operations = {item.operation_id: item for item in diff.operations}
        for operation in diff.operations:
            old_value = operation.reference_value
            new_value = operation.current_value
            old_display = "∅" if old_value is None else str(old_value).replace("\n", " ")[:140]
            new_display = "∅" if new_value is None else str(new_value).replace("\n", " ")[:140]
            if operation.kind == "removed":
                old_display, new_display = f"XML-фрагмент <{operation.tag}>", "отсутствует"
            elif operation.kind == "added":
                old_display, new_display = "отсутствует", f"XML-фрагмент <{operation.tag}>"
            tree.insert("", "end", iid=operation.operation_id, values=(
                kind_labels.get(operation.kind, operation.kind),
                operation.path and "/" + "/".join(
                    f"{part['tag']}[@{part['key_attribute']}={part['key_value']}]" if "key_attribute" in part
                    else f"{part['tag']}[{part['index']}]" for part in operation.path
                ) or "/project",
                operation.description, old_display, new_display,
                "ПОЗИЦИОННО" if operation.ambiguous else ("Восстановимо" if operation.can_restore else "Только просмотр"),
            ))
        detail = tk.Text(detail_frame, height=8, wrap="word", font=("Consolas", 9), state="disabled")
        detail.pack(fill="both", expand=True)

        def show_detail(_event=None):
            chosen = tree.selection()
            payload = [operations[item].as_dict(include_fragment=True) for item in chosen if item in operations]
            detail.configure(state="normal")
            detail.delete("1.0", "end")
            detail.insert("1.0", json.dumps(payload, ensure_ascii=False, indent=2))
            detail.configure(state="disabled")

        tree.bind("<<TreeviewSelect>>", show_detail)

        controls = ttk.Frame(dialog, padding=8)
        controls.pack(fill="x")
        allow_ambiguous = tk.BooleanVar(value=False)
        revert_additions = tk.BooleanVar(value=False)
        include_related = tk.BooleanVar(value=False)
        ttk.Checkbutton(controls, text="Разрешить позиционное восстановление неоднозначных узлов", variable=allow_ambiguous).pack(side="left")
        ttk.Checkbutton(controls, text="Удалять добавленные узлы", variable=revert_additions).pack(side="left", padx=(12, 0))
        ttk.Checkbutton(controls, text="Включать связанные записи", variable=include_related).pack(side="left", padx=(12, 0))

        def select_safe():
            safe = [item.operation_id for item in diff.operations if item.can_restore and not item.ambiguous]
            tree.selection_set(safe)
            if safe:
                tree.see(safe[0])

        def restore_selected():
            selected = list(tree.selection())
            if not selected:
                messagebox.showinfo("Выборочное восстановление", "Выберите одну или несколько строк.", parent=dialog)
                return
            bundle_report = None
            effective_selection = selected
            try:
                if include_related.get():
                    effective_selection, bundle_report = expand_related_restore_bundle(
                        reference, self.doc, selected,
                    )
            except Exception as exc:
                messagebox.showerror("Анализ связанных записей", str(exc), parent=dialog)
                return
            added_count = len(effective_selection) - len(selected)
            question = (
                f"Применить {len(effective_selection)} операций к текущему проекту?"
                + (f"\n\nАвтоматически включено связанных операций: {added_count}." if added_count else "")
                + "\n\nИзменится только документ в памяти. Запись в .is2 выполняется отдельно кнопкой «Сохранить»."
            )
            if not messagebox.askyesno("Подтверждение восстановления", question, parent=dialog):
                return
            try:
                candidate, report = apply_selected_restores(
                    reference, self.doc, effective_selection,
                    allow_ambiguous=allow_ambiguous.get(),
                    revert_additions=revert_additions.get(),
                )
                candidate.source_path = str(self.path) if self.path else None
                self.doc = candidate
                labels = [operations[item].description for item in effective_selection]
                self._mark_dirty(
                    f"Восстановлено из {Path(reference_name).name}: {len(effective_selection)} изменений",
                    operation_group=labels,
                )
                self.refresh_all()
                dialog.destroy()
                validation_note = (
                    "Проверка структуры: PASS"
                    if report["validation_issue_count_after"] == 0
                    else f"Новых ошибок не добавлено; прежних замечаний остаётся: {report['validation_issue_count_after']}"
                )
                bundle_note = f"\nСвязанных операций включено автоматически: {added_count}." if bundle_report else ""
                if bundle_report and bundle_report.get("warnings"):
                    bundle_note += "\nВнимание: есть непрозрачные записи; проверьте их вручную."
                messagebox.showinfo(
                    "Выборочное восстановление",
                    f"Восстановлено операций: {report['restored_count']}{bundle_note}\n"
                    f"{validation_note}\nПроверка XML writer: PASS\n\n"
                    "Изменения находятся в памяти. Сохраните проект, чтобы записать результат в отдельный .is2 файл.",
                    parent=self,
                )
            except Exception as exc:
                messagebox.showerror("Восстановление заблокировано", str(exc), parent=dialog)

        ttk.Button(controls, text="Выбрать безопасные", command=select_safe).pack(side="right", padx=(6, 0))
        ttk.Button(controls, text="Восстановить выбранное", command=restore_selected).pack(side="right", padx=(6, 0))
        ttk.Button(controls, text="Закрыть", command=dialog.destroy).pack(side="right", padx=(6, 0))
        dialog.bind("<Escape>", lambda _event: dialog.destroy())
        dialog.grab_set()
        self.status.set(f"Сравнение версий: {summary['total']} изменений")

    def show_relationship_graph_diff(self):
        """Open a side-by-side visual comparison of recovered relationship graphs."""
        if self.doc is None:
            return
        reference_name = filedialog.askopenfilename(
            parent=self, title="Выберите версию проекта для сравнения графов",
            filetypes=[("IS-2 project", "*.is2 *.xml"), ("All files", "*.*")],
        )
        if not reference_name:
            return
        try:
            reference = ProjectDocument.load(reference_name)
            old_graph = build_relationship_graph(reference)
            new_graph = build_relationship_graph(self.doc)
            report = compare_relationship_graphs(reference, self.doc)
        except Exception as exc:
            messagebox.showerror("Сравнение графов", str(exc), parent=self)
            return

        dialog = tk.Toplevel(self)
        dialog.title("Сопоставление графов связей — PzKpfw")
        dialog.geometry("1420x820")
        dialog.minsize(1000, 620)
        dialog.transient(self)
        summary = report["summary"]
        ttk.Label(
            dialog,
            text=(f"Добавлено узлов: {summary['added_nodes']} · удалено: {summary['removed_nodes']} · "
                  f"изменено: {summary['changed_nodes']} · новых связей: {summary['added_edges']} · "
                  f"удалено связей: {summary['removed_edges']} · перенаправлено конечных точек: {summary['rewired_edges']}"),
            padding=8, justify="left",
        ).pack(fill="x")
        if report["warnings"]:
            ttk.Label(dialog, text="⚠ " + " ".join(report["warnings"]), foreground="#9a3412",
                      wraplength=1360, padding=(8, 0, 8, 6)).pack(fill="x")

        changed_old = {item["key"] for item in report["changed_nodes"]}
        changed_new = set(changed_old)
        removed_nodes = {item["key"] for item in report["removed_nodes"]}
        added_nodes = {item["key"] for item in report["added_nodes"]}
        removed_edges = {item["key"] for item in report["removed_edges"]}
        added_edges = {item["key"] for item in report["added_edges"]}
        rewired_edges = {item["key"] for item in report["rewired_edges"]}

        pane = ttk.Panedwindow(dialog, orient="horizontal")
        pane.pack(fill="both", expand=True, padx=8, pady=6)
        palettes = {
            "action": "#dbeafe", "category": "#dcfce7", "spz_element": "#fef3c7",
            "parameter": "#ede9fe", "object": "#fae8ff", "relation": "#e5e7eb",
        }

        def add_graph_panel(title: str, graph: dict, side: str):
            frame = ttk.Frame(pane)
            pane.add(frame, weight=1)
            ttk.Label(frame, text=title, font=("TkDefaultFont", 10, "bold"), padding=5).pack(anchor="w")
            holder = ttk.Frame(frame)
            holder.pack(fill="both", expand=True)
            canvas = tk.Canvas(holder, background="#ffffff", highlightthickness=1, highlightbackground="#cbd5e1")
            sx = ttk.Scrollbar(holder, orient="horizontal", command=canvas.xview)
            sy = ttk.Scrollbar(holder, orient="vertical", command=canvas.yview)
            canvas.configure(xscrollcommand=sx.set, yscrollcommand=sy.set)
            canvas.grid(row=0, column=0, sticky="nsew")
            sy.grid(row=0, column=1, sticky="ns")
            sx.grid(row=1, column=0, sticky="ew")
            holder.rowconfigure(0, weight=1); holder.columnconfigure(0, weight=1)

            domain_x = {"action": 110, "category": 300, "spz_element": 490,
                        "parameter": 300, "object": 490, "relation": 760}
            grouped = {}
            for node in graph["nodes"]:
                grouped.setdefault(node.get("kind", "relation"), []).append(node)
            positions = {}
            max_rows = 1
            for domain, nodes in grouped.items():
                nodes.sort(key=lambda item: (str(item.get("label", "")).casefold(), item.get("key", "")))
                max_rows = max(max_rows, len(nodes))
                for index, node in enumerate(nodes):
                    positions[node["key"]] = (domain_x.get(domain, 760), 40 + index * 52)
            height = max(600, 90 + max_rows * 52)
            canvas.configure(scrollregion=(0, 0, 980, height))

            edge_by_key = {edge["key"]: edge for edge in graph["edges"]}
            for edge in graph["edges"]:
                source = positions.get(edge.get("relation_key"))
                target = positions.get(edge.get("target_key"))
                if source is None:
                    continue
                sx0, sy0 = source[0], source[1]
                if target is None:
                    tx0, ty0 = 920, sy0
                else:
                    tx0, ty0 = target
                color = "#64748b"
                if edge["key"] in rewired_edges:
                    color = "#d97706"
                elif side == "reference" and edge["key"] in removed_edges:
                    color = "#dc2626"
                elif side == "current" and edge["key"] in added_edges:
                    color = "#16a34a"
                canvas.create_line(sx0 - 62, sy0 + 15, tx0 + 62, ty0 + 15, fill=color, width=1.5)
                if target is None:
                    canvas.create_text(920, sy0 + 15, text=f"? {edge.get('endpoint_id', '')}", fill="#b91c1c", anchor="w")

            for node in graph["nodes"]:
                x, y = positions[node["key"]]
                kind = node.get("kind", "relation")
                width = 168 if kind == "relation" else 142
                fill = palettes.get(kind, "#e5e7eb")
                if side == "reference" and node["key"] in removed_nodes:
                    fill = "#fecaca"
                elif side == "current" and node["key"] in added_nodes:
                    fill = "#bbf7d0"
                elif node["key"] in changed_old:
                    fill = "#fed7aa"
                canvas.create_rectangle(x - width / 2, y, x + width / 2, y + 32,
                                        fill=fill, outline="#475569", width=1)
                label = str(node.get("label", node["key"]))
                if len(label) > (24 if kind == "relation" else 21):
                    label = label[:(21 if kind == "relation" else 18)] + "…"
                canvas.create_text(x, y + 16, text=label, font=("TkDefaultFont", 8), width=width - 8)
            return frame

        add_graph_panel(f"СТАРАЯ ВЕРСИЯ · {Path(reference_name).name}", old_graph, "reference")
        add_graph_panel(f"ТЕКУЩАЯ ВЕРСИЯ · {self.path.name if self.path else 'без файла'}", new_graph, "current")

        footer = ttk.Frame(dialog, padding=8)
        footer.pack(fill="x")
        details = (
            "Оранжевый — изменённый узел/конечная точка; красный — удалённое из текущей версии; "
            "зелёный — добавленное в текущей версии. Рёбра показывают слоты конечных точек и не задают "
            "дополнительную семантику направления.\n"
            + "\n".join(report["warnings"])
        )
        ttk.Label(footer, text=details, wraplength=1200, justify="left").pack(side="left", fill="x", expand=True)
        ttk.Button(footer, text="Закрыть", command=dialog.destroy).pack(side="right")
        self.status.set("Сравнение графов связей завершено")

    def show_three_way_merge(self):
        """Resolve a three-way merge against the open local project."""
        if self.doc is None:
            return
        base_name = filedialog.askopenfilename(
            parent=self, title="Выберите общий базовый проект",
            filetypes=[("IS-2 project", "*.is2 *.xml"), ("All files", "*.*")],
        )
        if not base_name:
            return
        theirs_name = filedialog.askopenfilename(
            parent=self, title="Выберите входящую версию проекта",
            filetypes=[("IS-2 project", "*.is2 *.xml"), ("All files", "*.*")],
        )
        if not theirs_name:
            return
        try:
            base = ProjectDocument.load(base_name)
            theirs = ProjectDocument.load(theirs_name)
            preview, report = merge_documents(base, self.doc, theirs)
        except Exception as exc:
            messagebox.showerror("Трёхстороннее объединение", str(exc), parent=self)
            return

        dialog = tk.Toplevel(self)
        dialog.title("Трёхстороннее объединение .is2")
        dialog.geometry("1120x700")
        dialog.minsize(860, 520)
        dialog.transient(self)
        ttk.Label(
            dialog,
            text=(f"База: {Path(base_name).name} · локальная версия: {self.path.name if self.path else 'без файла'} · "
                  f"входящая: {Path(theirs_name).name}\n"
                  f"Конфликтов: {report['conflict_count']} · не разрешено: {report['unresolved_conflict_count']}"),
            padding=8, justify="left",
        ).pack(fill="x")
        ttk.Label(dialog,
                  text="Независимые изменения объединяются автоматически. Неразрешённые конфликты сохраняют локальное значение в предварительном просмотре и блокируют применение.",
                  foreground="#9a3412", wraplength=1060, padding=(8, 0, 8, 6)).pack(fill="x")

        split = ttk.Panedwindow(dialog, orient="vertical")
        split.pack(fill="both", expand=True, padx=8, pady=6)
        list_frame = ttk.Frame(split)
        detail_frame = ttk.Frame(split)
        split.add(list_frame, weight=4)
        split.add(detail_frame, weight=2)
        columns = ("kind", "path", "field", "resolution")
        tree = ttk.Treeview(list_frame, columns=columns, show="headings", selectmode="browse")
        headings = {"kind": "Конфликт", "path": "XML-путь", "field": "Поле", "resolution": "Решение"}
        widths = {"kind": 180, "path": 490, "field": 150, "resolution": 150}
        for column in columns:
            tree.heading(column, text=headings[column])
            tree.column(column, width=widths[column], stretch=column == "path")
        ys = ttk.Scrollbar(list_frame, orient="vertical", command=tree.yview)
        tree.configure(yscrollcommand=ys.set)
        tree.grid(row=0, column=0, sticky="nsew"); ys.grid(row=0, column=1, sticky="ns")
        list_frame.rowconfigure(0, weight=1); list_frame.columnconfigure(0, weight=1)
        detail = tk.Text(detail_frame, height=10, wrap="word", font=("Consolas", 9), state="disabled")
        detail.pack(fill="both", expand=True)
        conflicts = {item["conflict_id"]: item for item in report["conflicts"]}
        resolutions: dict[str, str] = {}
        for conflict in report["conflicts"]:
            tree.insert("", "end", iid=conflict["conflict_id"], values=(
                conflict["kind"], conflict["path"], conflict.get("field") or "—", "Не разрешено",
            ))

        def show_conflict(_event=None):
            chosen = tree.selection()
            payload = conflicts.get(chosen[0]) if chosen else None
            detail.configure(state="normal")
            detail.delete("1.0", "end")
            if payload:
                detail.insert("1.0", json.dumps({
                    "base": payload["base"], "ours": payload["ours"], "theirs": payload["theirs"],
                    "description": payload["description"],
                }, ensure_ascii=False, indent=2))
            detail.configure(state="disabled")
        tree.bind("<<TreeviewSelect>>", show_conflict)

        choice_bar = ttk.Frame(dialog, padding=(8, 0, 8, 8))
        choice_bar.pack(fill="x")
        def set_choice(choice: str):
            chosen = tree.selection()
            if not chosen:
                return
            conflict_id = chosen[0]
            resolutions[conflict_id] = choice
            values = list(tree.item(conflict_id, "values"))
            values[-1] = {"ours": "Локальная", "theirs": "Входящая", "base": "Базовая"}[choice]
            tree.item(conflict_id, values=values)

        ttk.Button(choice_bar, text="Оставить локальную", command=lambda: set_choice("ours")).pack(side="left")
        ttk.Button(choice_bar, text="Принять входящую", command=lambda: set_choice("theirs")).pack(side="left", padx=6)
        ttk.Button(choice_bar, text="Вернуться к базе", command=lambda: set_choice("base")).pack(side="left")

        actions = ttk.Frame(dialog, padding=8)
        actions.pack(fill="x")
        def apply_merge():
            try:
                candidate, merge_report = merge_documents(base, self.doc, theirs, resolutions=resolutions)
                if not merge_report["ready_to_write"]:
                    unresolved = [item["conflict_id"] for item in merge_report["conflicts"] if item["resolution"] is None]
                    messagebox.showwarning(
                        "Есть неразрешённые конфликты",
                        "Перед применением выберите сторону для каждого конфликта: " + ", ".join(unresolved),
                        parent=dialog,
                    )
                    return
                candidate.source_path = str(self.path) if self.path else None
                self.doc = candidate
                self._mark_dirty(
                    f"Объединены версии {Path(base_name).name} и {Path(theirs_name).name}",
                    operation_group=[f"Разрешён конфликт {key}: {value}" for key, value in resolutions.items()],
                )
                self.refresh_all()
                dialog.destroy()
                messagebox.showinfo(
                    "Объединение завершено",
                    f"Конфликтов разрешено: {merge_report['conflict_count']}\n"
                    f"Проверка структуры: PASS\nПроверка XML writer: PASS\n\n"
                    "Изменения находятся в памяти. Сохраните проект отдельно, чтобы записать результат.",
                    parent=self,
                )
            except Exception as exc:
                messagebox.showerror("Объединение заблокировано", str(exc), parent=dialog)
        ttk.Button(actions, text="Применить объединение", command=apply_merge).pack(side="right")
        ttk.Button(actions, text="Закрыть", command=dialog.destroy).pack(side="right", padx=(0, 6))
        if report["conflicts"]:
            tree.selection_set(report["conflicts"][0]["conflict_id"])
            show_conflict()
        self.status.set(f"Предварительный просмотр объединения: {report['conflict_count']} конфликтов")
        dialog.bind("<Escape>", lambda _event: dialog.destroy())
        dialog.grab_set()

    def show_dependency_audit(self):
        if self.doc is None:
            return
        report = dependency_report(self.doc)
        lines = [f"Узлов проекта: {report['entity_count']}", f"Известных ссылок: {report['reference_count']}", f"Неразрешённых ссылок: {report['dangling_count']}", f"Непрозрачных записей: {report['opaque_count']}", ""]
        for item in report["entities"]:
            if item["references"] or item["opaque_risk"]:
                risk = "BLOCKED/UNKNOWN" if item["opaque_risk"] else "REFERENCED"
                lines.append(f"{item['domain']} #{item['id']} — {item['label']} [{risk}]")
                for reference in item["references"]:
                    lines.append(f"  • {reference['relation_kind']}[{reference['record_index']}].{reference['slot']}")
                if item["opaque_risk"]:
                    lines.append("  • Есть непрозрачные записи: операция требует дополнительной проверки")
                else:
                    lines.append("  • Удаление возможно только через проверенный каскад, если модель подтвердит его безопасность")
        if len(lines) == 5:
            lines.append("Видимых зависимостей не найдено.")
        dialog = tk.Toplevel(self); dialog.title("Аудит зависимостей проекта"); dialog.geometry("760x520")
        text = tk.Text(dialog, wrap="none", font=("Consolas", 9)); text.pack(fill="both", expand=True, padx=8, pady=8)
        text.insert("1.0", "\n".join(lines)); text.configure(state="disabled")
        ttk.Button(dialog, text="Закрыть", command=dialog.destroy).pack(anchor="e", padx=8, pady=(0, 8))

    def _set_title(self):
        name = self.path.name if self.path else "без проекта"
        dirty = " *" if self.dirty else ""
        self.title(f"PzKpfw — {name}{dirty}")
        self.file_label.configure(text=str(self.path) if self.path else "Файл не открыт")

    def _mark_dirty(self, message="Изменения не сохранены", *, operation_group=None):
        current = self._document_snapshot()
        previous = self._last_history_snapshot
        if current is not None:
            if previous is not None:
                if operation_group:
                    self.history.record_group(previous, current, operation_group, title=message)
                else:
                    self.history.record(previous, current, message)
            self._last_history_snapshot = current
            current_fingerprint = self._fingerprint(current)
            self.dirty = self._saved_fingerprint is None or current_fingerprint != self._saved_fingerprint
        else:
            self.dirty = False
        self.status.set(message)
        self._set_title()
        self._update_history_controls()

    def _restore_history_snapshot(self, snapshot: bytes, label: str, operation: str) -> None:
        current_path = str(self.path) if self.path else None
        restored = ProjectDocument.from_bytes(snapshot)
        restored.source_path = current_path
        self.doc = restored
        self._last_history_snapshot = snapshot
        self.dirty = self._saved_fingerprint is None or self._fingerprint(snapshot) != self._saved_fingerprint
        self.refresh_all()
        self.status.set(f"{operation}: {label}")
        self._set_title()
        self._update_history_controls()

    def undo(self):
        if self.doc is None:
            return
        current = self._document_snapshot()
        result = self.history.undo(current or b"")
        if result is None:
            return
        snapshot, label = result
        self._restore_history_snapshot(snapshot, label, "Отменено")

    def redo(self):
        if self.doc is None:
            return
        current = self._document_snapshot()
        result = self.history.redo(current or b"")
        if result is None:
            return
        snapshot, label = result
        self._restore_history_snapshot(snapshot, label, "Повторено")

    def _history_shortcut_is_for_text_editor(self, widget) -> bool:
        if isinstance(widget, tk.Text):
            try:
                return str(widget.cget("state")) != "disabled"
            except tk.TclError:
                return True
        return isinstance(widget, (tk.Entry, ttk.Entry, ttk.Combobox, ttk.Spinbox))

    def _undo_shortcut(self, event=None):
        widget = getattr(event, "widget", None)
        if self._history_shortcut_is_for_text_editor(widget):
            return None  # Keep native text-edit undo inside active text fields/dialogs.
        self.undo()
        return "break"

    def _redo_shortcut(self, event=None):
        widget = getattr(event, "widget", None)
        if self._history_shortcut_is_for_text_editor(widget):
            return None
        self.redo()
        return "break"

    def _ask_discard(self) -> bool:
        return not self.dirty or messagebox.askyesno("Несохранённые изменения", "Сохранить изменения перед продолжением?", parent=self)

    def new_coursework(self):
        """Create a coursework-ready XML scaffold with one coded root action."""
        if self.dirty and not self._save_prompt():
            return
        dialog = RecordDialog(self, "Новый проект с главным действием", [
            ("name", "Название проекта", "Новый проект", None),
            ("root", "Главное действие", "Проектировочный расчёт", None),
            ("author", "Автор", "", None),
            ("symbol", "Код действий (один символ)", "z", None),
        ])
        self.wait_window(dialog)
        if dialog.result is None:
            return
        try:
            d = dialog.result
            self.doc = create_course_project(d["name"], d["root"], author=d["author"], symbol=d["symbol"])
            self.path = None
            self.graph_positions.clear(); self.graph_selected_key = None; self.graph_zoom = 1.0
            self.course_panel.focus_id = None; self.course_panel.selected_id = '1'; self.course_panel.depth_limit = 2
            self._reset_history(saved=False)
            self.refresh_all()
            self._set_enabled(True)
            self.notebook.select(self.course_page)
            self.after_idle(self.course_panel._fit_scene)
            self._set_title()
            self.status.set("Проект создан. Добавляйте действия, параметры и сохраняйте .is2 через Ctrl+S")
        except Exception as exc:
            messagebox.showerror("Новый проект", str(exc), parent=self)

    def new_project(self):
        if self.dirty and not self._save_prompt():
            return
        fields = [
            ("project_name", "Название проекта", "Новый проект", None),
            ("project_info", "Описание проекта", "", None),
            ("user_name", "Пользователь", "", None),
            ("user_info", "Информация о пользователе", "", None),
        ]
        dialog = RecordDialog(self, "Создать новый проект IS-2", fields)
        self.wait_window(dialog)
        if dialog.result is None:
            return
        try:
            values = dialog.result
            self.doc = ProjectDocument.new_empty(
                values["project_name"], info=values["project_info"],
                user_name=values["user_name"], user_info=values["user_info"],
            )
            self.path = None
            self.graph_positions.clear(); self.graph_selected_key = None; self.graph_zoom = 1.0
            self._reset_history(saved=False)
            self.refresh_all()
            self._set_enabled(True)
            self._set_title()
            self.status.set("Создан новый проект. Используйте «Сохранить как…» для записи .is2")
        except Exception as exc:
            messagebox.showerror("Новый проект", str(exc), parent=self)

    def open_file(self):
        target = filedialog.askopenfilename(parent=self, title="Открыть проект IS-2", filetypes=[("IS-2 project", "*.is2 *.xml"), ("All files", "*.*")])
        if not target:
            return
        if self.dirty and not self._save_prompt():
            return
        try:
            doc = ProjectDocument.load(target)
            self.doc = doc
            self.path = Path(target)
            self.graph_selected_key = None
            view_warning = self._load_graph_view_state(self.path)
            self._reset_history(saved=True)
            self.history.note("open", "Проект открыт", details=[str(self.path)], state=self._document_snapshot())
            self.refresh_all()
            self._restore_editor_state()
            self._set_enabled(True)
            if self.notebook.select() == str(self.course_page):
                self.after_idle(self.course_panel._fit_scene)
            issues = doc.validate()
            status_text = f"Открыт: {self.path.name} — {len(doc.actions)} действий, {len(doc.concept_structure.categories)} категорий; замечаний: {len(issues)}"
            if view_warning:
                status_text += f"; настройки графа не загружены: {view_warning}"
            self.status.set(status_text)
            self._set_title()
        except Exception as exc:
            messagebox.showerror("Ошибка открытия", str(exc), parent=self)

    def _save_prompt(self) -> bool:
        answer = messagebox.askyesnocancel("Несохранённые изменения", "Сохранить изменения?", parent=self)
        if answer is None:
            return False
        if answer:
            return self.save()
        return True

    def save(self):
        if self.doc is None:
            return False
        if self.path is None:
            return self.save_as()
        issues = self.doc.validate()
        if issues:
            messagebox.showerror("Проверка не пройдена", "Сохранение остановлено:\n\n" + "\n".join(issues[:30]), parent=self)
            return False
        try:
            backup_info = None
            current_bytes = self.path.read_bytes() if self.path.exists() else None
            new_bytes = self.doc.to_bytes()
            if current_bytes is not None and current_bytes != new_bytes:
                backup_info = create_project_backup(self.path)
            self.doc.save(self.path)
            snapshot = self._document_snapshot()
            self.history.note(
                "save", "Проект сохранён",
                details=[str(self.path)] + ([f"backup={backup_info.path}"] if backup_info else []),
                state=snapshot,
            )
            self._last_history_snapshot = snapshot
            self._saved_fingerprint = self._fingerprint(snapshot)
            self.dirty = False
            self._update_history_controls()
            self.refresh_all()
            self._save_graph_view_state()
            suffix = f"; резервная копия: {backup_info.path.name}" if backup_info else ""
            self.status.set(f"Сохранено: {self.path}{suffix}")
            self._set_title()
            return True
        except Exception as exc:
            messagebox.showerror("Ошибка сохранения", str(exc), parent=self)
            return False

    def save_as(self):
        if self.doc is None:
            return False
        target = filedialog.asksaveasfilename(parent=self, title="Сохранить проект", defaultextension=".is2", filetypes=[("IS-2 project", "*.is2"), ("XML", "*.xml")])
        if not target:
            return False
        previous = self.path
        self.path = Path(target)
        if not self.save():
            self.path = previous
            self._set_title()
            return False
        return True

    def show_backups(self):
        if self.path is None or not self.path.exists():
            messagebox.showinfo("Резервные копии", "Сначала сохраните проект в файл .is2.", parent=self)
            return
        records = list_project_backups(self.path)
        window = tk.Toplevel(self)
        window.title(f"Резервные копии — {self.path.name}")
        window.geometry("900x430")
        window.transient(self)
        ttk.Label(window, text="Резервные копии хранятся отдельно от .is2 в .pzkpfw-backups. Восстановление текущего файла сначала создаёт rollback-копию.", padding=8, wraplength=850).pack(anchor="w")
        tree = ttk.Treeview(window, columns=("created", "size", "valid", "hash"), show="headings", selectmode="browse")
        for key, title, width in (("created", "Создана (UTC)", 220), ("size", "Размер", 90), ("valid", "XML", 90), ("hash", "SHA-256", 420)):
            tree.heading(key, text=title); tree.column(key, width=width, anchor="w")
        tree.pack(fill="both", expand=True, padx=8, pady=6)
        by_iid = {}
        for index, record in enumerate(records):
            iid = str(index)
            by_iid[iid] = record
            tree.insert("", "end", iid=iid, values=(record.created_at, f"{record.size_bytes} B", "PASS" if record.valid_xml else "INVALID", record.sha256))
        if records:
            tree.selection_set("0")
        buttons = ttk.Frame(window, padding=8); buttons.pack(fill="x")
        backup_button = ttk.Button(buttons, text="Создать резервную копию сейчас")
        backup_button.pack(side="left")
        restore_button = ttk.Button(buttons, text="Восстановить выбранную копию", state="normal" if records else "disabled")
        restore_button.pack(side="left", padx=6)
        ttk.Button(buttons, text="Закрыть", command=window.destroy).pack(side="right")

        def refresh_backup_rows():
            nonlocal records
            records = list_project_backups(self.path)
            by_iid.clear()
            tree.delete(*tree.get_children(""))
            for index, record in enumerate(records):
                iid = str(index)
                by_iid[iid] = record
                tree.insert("", "end", iid=iid, values=(record.created_at, f"{record.size_bytes} B", "PASS" if record.valid_xml else "INVALID", record.sha256))
            if records:
                tree.selection_set("0")
            restore_button.configure(state="normal" if records else "disabled")

        def create_backup_now():
            try:
                info = create_project_backup(self.path)
                self.history.note("backup", "Создана резервная копия", details=[str(info.path), info.sha256], state=self._document_snapshot())
                self._refresh_history_window()
                refresh_backup_rows()
                messagebox.showinfo("Резервная копия", f"Копия проверена и сохранена:\n{info.path}", parent=window)
            except Exception as exc:
                messagebox.showerror("Резервная копия", str(exc), parent=window)

        def restore_selected():
            selection = tree.selection()
            if not selection:
                return
            record = by_iid[selection[0]]
            if not record.valid_xml:
                messagebox.showerror("Восстановление", "Эта резервная копия не прошла проверку XML.", parent=window)
                return
            if self.dirty:
                answer = messagebox.askyesnocancel("Несохранённые изменения", "Сохранить текущие изменения перед восстановлением?", parent=window)
                if answer is None:
                    return
                if answer and not self.save():
                    return
            if not messagebox.askyesno(
                "Подтверждение восстановления",
                f"Заменить текущий проект копией от {record.created_at}?\\n\\n"
                "Текущий файл будет автоматически сохранён в отдельную rollback-копию.",
                parent=window,
            ):
                return
            try:
                restored_path, rollback = restore_project_backup(record.path, self.path, overwrite=True, backup_existing=True)
                self.doc = ProjectDocument.load(restored_path)
                self.history.clear()
                snapshot = self._document_snapshot()
                self._last_history_snapshot = snapshot
                self._saved_fingerprint = self._fingerprint(snapshot)
                self.dirty = False
                self.history.note("restore", "Проект восстановлен из резервной копии", details=[str(record.path), f"rollback={rollback.path if rollback else ''}"], state=snapshot)
                self.refresh_all()
                self._restore_editor_state()
                self._save_graph_view_state()
                self._set_title()
                self.status.set(f"Восстановлено из {record.path.name}; rollback: {rollback.path.name if rollback else 'не создавался'}")
                self._update_history_controls()
                window.destroy()
                messagebox.showinfo("Восстановление завершено", f"Проект восстановлен.\\nRollback-копия: {rollback.path if rollback else 'не требовалась'}", parent=self)
            except Exception as exc:
                messagebox.showerror("Ошибка восстановления", str(exc), parent=window)

        backup_button.configure(command=create_backup_now)
        restore_button.configure(command=restore_selected)
        tree.bind("<<TreeviewSelect>>", lambda _e: restore_button.configure(state="normal" if tree.selection() else "disabled"))
        window.grab_set()

    def validate_project(self):
        if self.doc is None:
            return
        issues = self.doc.validate()
        if issues:
            messagebox.showwarning("Проверка проекта", "Найдены проблемы:\n\n" + "\n".join(issues[:40]), parent=self)
            self.status.set(f"Проверка: {len(issues)} проблем")
        else:
            messagebox.showinfo("Проверка проекта", "Структура проекта корректна.", parent=self)
            self.status.set("Проверка: PASS")

    def check_compatibility(self):
        if self.doc is None:
            return
        report = audit_document(self.doc)
        lines = [
            f"Формат: {report['format']}",
            f"Native envelope: {report['native_envelope']}",
            f"Проверка структуры: {report['structural_validation']}",
            f"Сохранение XML без потери дерева: {report['writer_semantic_roundtrip']}",
            f"Повторная сериализация стабильна: {report['writer_idempotent_roundtrip']}",
            f"Проверка повторно открытого XML: {report['writer_reopened_validation']}",
            f"Endpoint-ов в графе: {report['relationship_graph_summary']['endpoint_count']}; неразрешённых: {report['relationship_graph_summary']['dangling_endpoint_count']}",
            f"PzKpfw-разметка в файл не добавляется: {not report['pzkpfw_private_markup_added']}",
            f"ModuleParams / Module: {report['module_params_module_count']}",
            f"Оригинальная ИС-2 (Windows runtime): {report['original_is2_runtime_acceptance']}",
        ]
        if report["runtime_risk_notes"]:
            lines.extend(["", "Замечания:", *report["runtime_risk_notes"]])
        lines.extend(["", report["runtime_note"]])
        if all(report[key] == "PASS" for key in ("native_envelope", "structural_validation", "writer_semantic_roundtrip", "writer_idempotent_roundtrip", "writer_reopened_validation")):
            messagebox.showinfo("Совместимость с ИС-2", "\n".join(lines), parent=self)
            self.status.set("Совместимость: XML writer PASS; оригинальный runtime не проверен")
        else:
            messagebox.showwarning("Совместимость с ИС-2", "\n".join(lines), parent=self)
            self.status.set("Совместимость: найдены структурные проблемы")

    def refresh_all(self):
        if self.doc is None:
            return
        self._refresh_metadata()
        self._refresh_actions()
        self.course_panel.refresh()
        self._refresh_matrix()
        self._refresh_diagram()
        self._refresh_params()
        self._refresh_objects()
        self._refresh_categories()
        self._refresh_links()
        self._refresh_other()
        self._refresh_graph()
        xml = ET.tostring(self.doc.root, encoding="unicode")
        self.xml_text.configure(state="normal")
        self.xml_text.delete("1.0", "end")
        self.xml_text.insert("1.0", xml)
        self.xml_text.configure(state="disabled")

    def _refresh_metadata(self):
        if self.doc is None:
            self.metadata_text.configure(state="normal")
            self.metadata_text.delete("1.0", "end")
            self.metadata_text.configure(state="disabled")
            return
        user = self.doc.user_node
        data = {
            "project": dict(self.doc.root.attrib),
            "user": dict(user.attrib) if user is not None else {},
        }
        self.metadata_text.configure(state="normal")
        self.metadata_text.delete("1.0", "end")
        self.metadata_text.insert("1.0", json.dumps(data, ensure_ascii=False, indent=2))
        self.metadata_text.configure(state="disabled")

    def edit_metadata(self):
        if self.doc is None:
            return
        user = self.doc.user_node
        fields = [
            ("project_name", "Название проекта", self.doc.root.get("name", ""), None),
            ("project_info", "Описание проекта", self.doc.root.get("info", ""), None),
            ("user_name", "Пользователь", user.get("name", "") if user is not None else "", None),
            ("user_info", "Информация о пользователе", user.get("info", "") if user is not None else "", None),
        ]
        dialog = RecordDialog(self, "Паспорт проекта", fields)
        self.wait_window(dialog)
        if dialog.result is None:
            return
        try:
            values = dialog.result
            self.doc.update_project_metadata(name=values["project_name"], info=values["project_info"])
            self.doc.update_user_metadata(name=values["user_name"], info=values["user_info"])
            self._mark_dirty("Изменён паспорт проекта")
            self._refresh_metadata()
        except Exception as exc:
            messagebox.showerror("Паспорт проекта", str(exc), parent=self)

    def _refresh_actions(self):
        if self.doc is None:
            return
        self.action_tree.delete(*self.action_tree.get_children())
        nodes = {n.get("id", ""): n for n in self.doc.actions}
        for row in action_tree_rows(self.doc):
            parent = row.parent_id if row.parent_id in nodes else ""
            n = nodes[row.action_id]
            self.action_tree.insert(parent, "end", iid=row.action_id, text=row.label,
                                    values=(TYPE_LABELS.get(n.get("type", ""), n.get("type", "")), n.get("level", "")))
        for item in self.action_tree.get_children(""):
            self.action_tree.item(item, open=True)

    def _selected_id(self, tree) -> str | None:
        selection = tree.selection()
        return selection[0] if selection else None

    def _show_action_details(self, _event=None):
        if self.doc is None:
            return
        ident = self._selected_id(self.action_tree)
        if not ident:
            return
        node = self.doc.action(ident)
        parent = next((n.get("afe1") for n in self.doc.links if n.get("type") == "2" and n.get("afe2") == ident), "—")
        details = {**node.attrib, "parent_id": parent, "alternatives": [a.get("text", "") for a in node.findall("alts")]}
        self.action_details.configure(state="normal")
        self.action_details.delete("1.0", "end")
        self.action_details.insert("1.0", json.dumps(details, ensure_ascii=False, indent=2))
        self.action_details.configure(state="disabled")

    def _refresh_params(self):
        if self.doc is None:
            return
        self.param_tree.delete(*self.param_tree.get_children())
        for node in self.doc.params_node.findall("param"):
            self.param_tree.insert("", "end", iid=node.get("id", ""), values=tuple(node.get(k, "") for k in ("id", "name", "group", "codingType", "number", "sign", "o")))

    def _refresh_objects(self):
        if self.doc is None:
            return
        self.object_tree.delete(*self.object_tree.get_children())
        for node in list(self.doc.objects_node):
            self.object_tree.insert("", "end", iid=node.get("id", ""), values=(node.get("id", ""), node.get("name", ""), json.dumps(node.attrib, ensure_ascii=False)))

    def _refresh_categories(self):
        if self.doc is None:
            return
        selected = set(self.category_tree.selection()) if self.category_tree.selection() else set()
        self.category_tree.delete(*self.category_tree.get_children())
        records = self.doc.concept_structure.category_records()
        search = self.concept_search_var.get().strip().casefold() if hasattr(self, "concept_search_var") else ""
        class_filter = self.concept_class_filter.get() if hasattr(self, "concept_class_filter") else "Все"
        available_groups = sorted({record.group for record in records})
        group_values = ("Все", *(str(value) for value in available_groups))
        if hasattr(self, "concept_group_combo"):
            current_group = self.concept_group_filter.get()
            self.concept_group_combo.configure(values=group_values)
            if current_group not in group_values:
                self.concept_group_filter.set("Все")
        group_filter = self.concept_group_filter.get() if hasattr(self, "concept_group_filter") else "Все"
        for record in records:
            if class_filter != "Все" and record.class_char != class_filter:
                continue
            if group_filter != "Все" and str(record.group) != group_filter:
                continue
            haystack = f"{record.id} {record.name} {record.class_char} {record.class_label} {record.group} {record.number}".casefold()
            if search and search not in haystack:
                continue
            self.category_tree.insert("", "end", iid=record.id, values=(record.id, record.name, f"{record.class_char} — {record.class_label}", record.group, record.number, record.status, record.coding_type, int(record.auto_range)))
        visible = set(self.category_tree.get_children(""))
        keep = [ident for ident in selected if ident in visible]
        if keep:
            self.category_tree.selection_set(keep)
        report = self.doc.concept_structure.catalog_report()
        duplicate_count = len(report["duplicate_numbers"])
        self.concept_summary_var.set(
            f"Категорий: {report['category_count']} · классов: {report['class_count']} · групп: {report['group_count']} · "
            f"связей cs: {report['link_count']} · повторяющихся номеров: {duplicate_count} · показано: {len(visible)}"
        )

    def _refresh_links(self):
        if self.doc is None:
            return
        self.link_tree.delete(*self.link_tree.get_children())
        for record in self.doc.concept_structure.link_records():
            self.link_tree.insert("", "end", iid=record.id, values=(record.id, record.type, record.label, record.e1, record.e2, record.e3, record.range))

    def _refresh_other(self):
        if self.doc is None:
            return
        structure = self.doc.dynamic_structure
        for tree in (self.spz_tree, self.spz_links_tree, self.content_tree):
            tree.delete(*tree.get_children())
        try:
            for record in structure.records():
                self.spz_tree.insert("", "end", iid=record.id, values=(
                    record.id, record.name, record.type, record.status,
                    record.formalization, record.level, record.number, record.symbol,
                ))
            for record in structure.spz_link_records():
                attrs = json.dumps(record.raw_attributes, ensure_ascii=False, separators=(",", ":"))
                self.spz_links_tree.insert("", "end", iid=str(record.index), values=(
                    record.index + 1, record.tag,
                    "" if record.e1 is None else record.e1,
                    "" if record.e2 is None else record.e2,
                    "" if record.e3 is None else record.e3,
                    record.opaque_child_count, attrs,
                ))
            for record in structure.content_link_records():
                attrs = json.dumps(record.raw_attributes, ensure_ascii=False, separators=(",", ":"))
                self.content_tree.insert("", "end", iid=str(record.index), values=(
                    record.index + 1, record.tag,
                    "" if record.e1 is None else record.e1,
                    "" if record.e2 is None else record.e2,
                    "" if record.char is None else record.char,
                    "" if record.power is None else record.power,
                    record.opaque_child_count, attrs,
                ))
            self.status.set(
                f"spz: {len(structure.elements)} AElement, {len(structure.links)} links; "
                f"content: {len(structure.content_records)} AEContentLink "
                "(создание / изменение / удаление доступны)"
            )
        except Exception as exc:
            self.status.set(f"spz/content read warning: {exc}")
        self._set_inspector_text(self.spz_link_detail, "Выберите запись, чтобы увидеть исходный XML.")
        self._set_inspector_text(self.content_detail, "Выберите запись, чтобы увидеть исходный XML.")

    def _selected_attrs(self, tree, parent: ET.Element, tag: str | None = None):
        ident = self._selected_id(tree)
        if not ident:
            messagebox.showinfo("Выбор записи", "Сначала выберите запись.", parent=self)
            return None, None
        candidates = list(parent) if tag is None else parent.findall(tag)
        node = next((n for n in candidates if n.get("id") == ident), None)
        return ident, node

    def _edit_json_record(self, title, current: dict[str, str]) -> dict[str, str] | None:
        dialog = JsonAttributesDialog(self, title, current)
        self.wait_window(dialog)
        return dialog.result

    def add_parameter(self):
        if self.doc is None: return
        attrs = self._edit_json_record("Новый параметр — атрибуты", {"name":"", "group":"0", "codingType":"1", "number":"1", "sign":""})
        if attrs is None: return
        try:
            ident = self.doc.add_parameter(attrs)
            self._mark_dirty(f"Создан параметр {ident}")
            self.refresh_all()
        except Exception as exc: messagebox.showerror("Параметр", str(exc), parent=self)

    def edit_parameter(self):
        if self.doc is None: return
        ident, node = self._selected_attrs(self.param_tree, self.doc.params_node, "param")
        if node is None: return
        object_options = tuple(["нет"] + [n.get("id", "") for n in self.doc.objects_node])
        current_object = node.get("o", "") if node.get("o", "") in object_options else "нет"
        dialog = RecordDialog(self, f"Параметр {ident}", [
            ("name", "Наименование", node.get("name", ""), None),
            ("group", "Группа", node.get("group", "0"), None),
            ("number", "Номер", node.get("number", "1"), None),
            ("codingType", "Тип кодирования (XML)", node.get("codingType", "1"), None),
            ("sign", "Обозначение", node.get("sign", ""), None),
            ("o", "Объект (ID)", current_object, object_options),
        ])
        self.wait_window(dialog)
        if dialog.result is None: return
        data = dialog.result
        if not data["number"].isdigit() or not data["group"].isdigit():
            messagebox.showerror("Параметр", "Группа и номер должны быть целыми неотрицательными числами", parent=self)
            return
        try:
            changes = {key: value for key, value in data.items() if key != "o"}
            self.doc.update_parameter(ident, **changes)
            self.doc.set_parameter_object(ident, None if data["o"] == "нет" else data["o"])
            self._mark_dirty(f"Изменён параметр {ident}")
            self.refresh_all()
            self.param_tree.selection_set(ident)
        except Exception as exc: messagebox.showerror("Параметр", str(exc), parent=self)

    def edit_parameter_advanced(self):
        """Keep editing of unknown native attributes available without changing them by default."""
        if self.doc is None: return
        ident, node = self._selected_attrs(self.param_tree, self.doc.params_node, "param")
        if node is None: return
        attrs = dict(node.attrib); attrs.pop("id", None)
        changed = self._edit_json_record(f"Дополнительные XML-атрибуты параметра {ident}", attrs)
        if changed is None: return
        try:
            self.doc.update_parameter(ident, **{k: (v if v != "" else None) for k,v in changed.items() if k != "id"})
            for k in set(attrs) - set(changed): self.doc.update_parameter(ident, **{k: None})
            self._mark_dirty(f"Изменены XML-атрибуты параметра {ident}"); self.refresh_all()
            self.param_tree.selection_set(ident)
        except Exception as exc: messagebox.showerror("Параметр", str(exc), parent=self)

    def assign_parameter_object(self):
        if self.doc is None:
            return
        parameter_id = self._selected_id(self.param_tree)
        if not parameter_id:
            messagebox.showinfo("Привязка параметра", "Выберите параметр.", parent=self)
            return
        objects = list(self.doc.objects_node)
        if not objects:
            messagebox.showinfo("Привязка параметра", "В проекте нет объектов. Сначала создайте объект.", parent=self)
            return
        choices = tuple(node.get("id", "") for node in objects if node.get("id"))
        current = self.doc.parameter(parameter_id).get("o", "")
        fields = [("object_id", "Объект", current if current in choices else choices[0], choices)]
        dialog = RecordDialog(self, f"Назначить объект параметру {parameter_id}", fields)
        self.wait_window(dialog)
        if dialog.result is None:
            return
        try:
            self.doc.set_parameter_object(parameter_id, dialog.result["object_id"])
            self._mark_dirty(f"Параметру {parameter_id} назначен объект {dialog.result['object_id']}")
            self.refresh_all()
            self.param_tree.selection_set(parameter_id)
        except Exception as exc:
            messagebox.showerror("Привязка параметра", str(exc), parent=self)

    def clear_parameter_object(self):
        if self.doc is None:
            return
        parameter_id = self._selected_id(self.param_tree)
        if not parameter_id:
            messagebox.showinfo("Привязка параметра", "Выберите параметр.", parent=self)
            return
        current = self.doc.parameter(parameter_id).get("o")
        if current in (None, "", "0"):
            self.status.set(f"У параметра {parameter_id} нет назначенного объекта")
            return
        self.doc.set_parameter_object(parameter_id, None)
        self._mark_dirty(f"Снята привязка объекта у параметра {parameter_id}")
        self.refresh_all()
        self.param_tree.selection_set(parameter_id)

    def delete_parameter(self):
        if self.doc is None: return
        ident, node = self._selected_attrs(self.param_tree, self.doc.params_node, "param")
        if node is None: return
        content_node = self.doc.root.find("models/ConceptModel/content")
        content_count = len(list(content_node)) if content_node is not None else 0
        if content_count:
            messagebox.showwarning(
                "Проверка зависимостей — удаление заблокировано",
                f"Параметр {ident} нельзя безопасно удалить: ConceptModel/content содержит {content_count} записей, "
                "а связь этих записей с параметрами не подтверждена. Никаких изменений не внесено.",
                parent=self,
            )
            return
        if not messagebox.askyesno("Удаление параметра", f"Удалить параметр {ident}?\n\nПроверка: зависимые content-записи отсутствуют.", parent=self): return
        try:
            self.doc.delete_parameter(ident); self._mark_dirty(f"Удалён параметр {ident}"); self.refresh_all()
        except Exception as exc: messagebox.showerror("Параметр", str(exc), parent=self)

    def add_object(self):
        if self.doc is None: return
        attrs = self._edit_json_record("Новый объект — атрибуты", {"name":"Новый объект"})
        if attrs is None: return
        name = attrs.pop("name", "")
        try:
            ident = self.doc.add_object(name, attributes=attrs)
            self._mark_dirty(f"Создан объект {ident}"); self.refresh_all()
        except Exception as exc: messagebox.showerror("Объект", str(exc), parent=self)

    def edit_object(self):
        if self.doc is None: return
        ident, node = self._selected_attrs(self.object_tree, self.doc.objects_node)
        if node is None: return
        attrs = dict(node.attrib); attrs.pop("id", None)
        changed = self._edit_json_record(f"Объект {ident}", attrs)
        if changed is None: return
        try:
            self.doc.update_object(ident, **{k: (v if v != "" else None) for k,v in changed.items() if k != "id"})
            for k in set(attrs) - set(changed): self.doc.update_object(ident, **{k: None})
            self._mark_dirty(f"Изменён объект {ident}"); self.refresh_all()
        except Exception as exc: messagebox.showerror("Объект", str(exc), parent=self)

    def _dependency_entry(self, domain: str, ident: str) -> dict | None:
        if self.doc is None:
            return None
        return next((item for item in dependency_report(self.doc)["entities"]
                     if item.get("domain") == domain and str(item.get("id")) == str(ident)), None)

    @staticmethod
    def _dependency_note(entry: dict | None) -> str:
        if not entry:
            return "Известных ссылок не найдено."
        parts = [f"Известных ссылок: {entry.get('reference_count', 0)}."]
        if entry.get("opaque_risk"):
            parts.append("Есть непрозрачные записи; автоматическое каскадирование небезопасно.")
        for ref in entry.get("references", []):
            parts.append(f"  • {ref.get('relation_kind')}[{ref.get('record_index')}].{ref.get('slot')}")
        return "\n".join(parts)

    def delete_object(self):
        if self.doc is None:
            return
        ident, node = self._selected_attrs(self.object_tree, self.doc.objects_node)
        if node is None:
            return
        references = self.doc.parameter_object_references(ident)
        if references:
            ids = ", ".join(parameter_id for parameter_id, _ in references)
            answer = messagebox.askyesno(
                "Удаление объекта с зависимостями",
                f"Объект {ident} назначен параметрам: {ids}.\n\n"
                "Удалить объект и снять атрибут @o у перечисленных параметров?\n"
                "Операция будет одной записью Undo.", parent=self,
            )
            if not answer:
                return
        elif not messagebox.askyesno("Удаление объекта", f"Удалить объект {ident}?\n\nИзвестных привязок параметров нет.", parent=self):
            return
        try:
            self.doc.delete_object(ident, clear_parameter_references=bool(references))
            self._mark_dirty(f"Удалён объект {ident}" + (f"; очищено привязок: {len(references)}" if references else ""))
            self.refresh_all()
        except Exception as exc:
            messagebox.showerror("Объект", str(exc), parent=self)

    def convert_selected_action(self):
        if self.doc is None: return
        ident = self._selected_id(self.action_tree)
        if not ident:
            messagebox.showinfo("Действия", "Выберите действие в дереве.", parent=self)
            return
        fields = [("kind", "Новый тип", "sequence", ("elementary", "alternative", "sequence", "iteration")),
                  ("replace", "Удалить прежних потомков?", "Нет", ("Нет", "Да")),
                  ("content", "Удалить связи ConceptModel/content?", "Нет", ("Нет", "Да"))]
        dialog = RecordDialog(self, "Преобразование действия " + ident, fields)
        self.wait_window(dialog)
        if dialog.result is None: return
        d = dialog.result
        destructive = d['replace'] == 'Да' or d['content'] == 'Да'
        if destructive and not messagebox.askyesno("Подтверждение удаления",
                "Потомки и/или межмодельные связи могут быть необратимо удалены из сохранённого файла. Продолжить?",
                parent=self):
            return
        try:
            convert_action(self.doc, ident, d['kind'],
                           replace_children=d['replace'] == 'Да', drop_content=d['content'] == 'Да')
            self._mark_dirty("Преобразовано действие " + ident)
            self.refresh_all()
        except (ValueError, KeyError, ProjectFormatError) as exc:
            messagebox.showerror("Преобразование действия", str(exc), parent=self)

    def insert_selected_action(self, after):
        if self.doc is None: return
        ident = self._selected_id(self.action_tree)
        if not ident:
            messagebox.showinfo("Действия", "Выберите дочернее действие в дереве.", parent=self)
            return
        dialog = RecordDialog(self, "Вставка действия", [("name", "Название нового действия", "Новое действие", None)])
        self.wait_window(dialog)
        if dialog.result is None: return
        try:
            insert_sibling(self.doc, ident, after=after, name=dialog.result['name'])
            self._mark_dirty("Добавлено соседнее действие")
            self.refresh_all()
        except (ValueError, KeyError, ProjectFormatError) as exc:
            messagebox.showerror("Вставка действия", str(exc), parent=self)

    def add_root_action(self): self._action_add(parent_id=None)
    def add_child_action(self):
        if self.doc is None: return
        parent = self._selected_id(self.action_tree)
        if not parent:
            messagebox.showinfo("Действие", "Выберите родительское действие.", parent=self); return
        self._action_add(parent_id=parent)

    def _action_add(self, parent_id):
        if self.doc is None: return
        fields = [("name", "Название", "Новое действие", None), ("type", "Тип", "0", ("0","1","2","3")), ("formalization", "Формализация", "0", None), ("status", "Статус", "0", None), ("mark", "Метка", "", None), ("symbol", "Символ", "", None), ("level", "Уровень", "", None), ("number", "Номер", "", None)]
        dialog = RecordDialog(self, "Новое действие", fields); self.wait_window(dialog)
        if dialog.result is None: return
        data = dialog.result
        try:
            ident = self.doc.add_action(data["name"], action_type=data["type"], formalization=data["formalization"], status=data["status"], mark=data["mark"], symbol=data["symbol"] or None, level=data["level"] or None, number=data["number"] or None, parent_id=parent_id)
            self._mark_dirty(f"Создано действие {ident}"); self.refresh_all()
            self.action_tree.selection_set(ident); self.action_tree.see(ident)
        except Exception as exc: messagebox.showerror("Действие", str(exc), parent=self)

    def edit_action(self):
        if self.doc is None: return
        ident = self._selected_id(self.action_tree)
        if not ident: return messagebox.showinfo("Действие", "Выберите действие.", parent=self)
        node = self.doc.action(ident)
        # Structural type changes must go through the conversion command,
        # otherwise a raw @type update would not create/remove the native links.
        keys = ("name", "formalization", "mark", "symbol", "status", "level", "number")
        fields = [(k, k, node.get(k, ""), None) for k in keys]
        dialog = RecordDialog(self, f"Действие {ident}", fields); self.wait_window(dialog)
        if dialog.result is None: return
        try:
            self.doc.update_action(ident, **{k: (v if v != "" else None) for k,v in dialog.result.items()})
            self._mark_dirty(f"Изменено действие {ident}"); self.refresh_all(); self.action_tree.selection_set(ident)
        except Exception as exc: messagebox.showerror("Действие", str(exc), parent=self)

    def delete_action(self):
        if self.doc is None:
            return
        ident = self._selected_id(self.action_tree)
        if not ident:
            return messagebox.showinfo("Действие", "Выберите действие.", parent=self)
        subtree: set[str] = set()
        stack = [ident]
        while stack:
            current = stack.pop()
            if current in subtree:
                continue
            subtree.add(current)
            stack.extend(self.doc.composition_children(current))
        children = self.doc.composition_children(ident)
        cascade = False
        if children:
            cascade = messagebox.askyesno(
                "Удаление поддерева",
                f"Действие {ident} имеет дочерние элементы (всего в поддереве: {len(subtree) - 1}). "
                f"Удалить всё поддерево?\n\n{self._dependency_note(self._dependency_entry('action', ident))}",
                parent=self,
            )
            if not cascade:
                return
        content_node = self.doc.root.find("models/ConceptModel/content")
        content_records = list(content_node) if content_node is not None else []
        content_refs = [n for n in content_records if n.get("e1") in subtree]
        cascade_content = False
        if content_refs:
            cascade_content = messagebox.askyesno(
                "Удаление зависимостей",
                f"С действиями поддерева связано {len(content_refs)} AEContentLink. Удалить и эти связи?\n\n"
                f"{self._dependency_note(self._dependency_entry('action', ident))}",
                parent=self,
            )
            if not cascade_content:
                return
        if not children and not content_refs and not messagebox.askyesno(
            "Удаление действия", f"Удалить действие {ident}?\n\n{self._dependency_note(self._dependency_entry('action', ident))}", parent=self
        ):
            return
        try:
            self.doc.delete_action(ident, cascade=cascade, cascade_content=cascade_content)
            self._mark_dirty(f"Удалено действие {ident}")
            self.refresh_all()
        except Exception as exc:
            messagebox.showerror("Действие", str(exc), parent=self)

    def add_category(self):
        if self.doc is None: return
        fields = [("name", "Название", "Новая категория", None), ("class", "Класс (1=S…7=C)", "1", tuple(str(x) for x in range(1,8))), ("group", "Группа", "-1", None), ("number", "Номер", "-1", None), ("status", "Статус", "0", None), ("autoRange", "AutoRange (0/1)", "1", ("0","1")), ("codingType", "CodingType", "1", None)]
        dialog=RecordDialog(self,"Новая SubjectCategory (pk)",fields); self.wait_window(dialog)
        if dialog.result is None: return
        d=dialog.result
        try:
            ident=self.doc.concept_structure.add_category(d["name"],class_id=int(d["class"]),group=int(d["group"]),number=int(d["number"]),status=int(d["status"]),auto_range=d["autoRange"]=="1",coding_type=int(d["codingType"]))
            self._mark_dirty(f"Создана категория {ident}"); self.refresh_all(); self.category_tree.selection_set(ident)
        except Exception as exc: messagebox.showerror("Категория",str(exc),parent=self)

    def bulk_edit_categories(self):
        if self.doc is None:
            return
        selected = set(self.category_tree.selection())
        if not selected:
            messagebox.showinfo("ConceptModel", "Выберите одну или несколько категорий (Ctrl/Shift для множественного выбора).", parent=self)
            return
        ordered_ids = [ident for ident in self.category_tree.get_children("") if ident in selected]
        current_groups = {self.doc.concept_structure.category(ident).get("group", "-1") for ident in ordered_ids}
        initial_group = next(iter(current_groups)) if len(current_groups) == 1 else "-1"
        fields = [
            ("group", "Новое значение group", initial_group, None),
            ("start_number", "Начальный number (пусто = сохранить прежние)", "", None),
        ]
        dialog = RecordDialog(self, f"Групповое редактирование ({len(ordered_ids)} катег.)", fields)
        self.wait_window(dialog)
        if dialog.result is None:
            return
        try:
            group_value = int(dialog.result["group"])
            start_text = dialog.result["start_number"].strip()
            start_number = int(start_text) if start_text else None
            updates = {}
            for offset, ident in enumerate(ordered_ids):
                changes = {"group": group_value}
                if start_number is not None:
                    changes["number"] = start_number + offset
                updates[ident] = changes
            changed = self.doc.concept_structure.update_categories(updates)
            if not changed:
                self.status.set("Групповое редактирование: значения не изменились")
                return
            self._mark_dirty(
                f"Групповое редактирование ConceptModel: {len(changed)} категорий",
                operation_group=tuple(f"Категория {ident}: group/number" for ident in changed),
            )
            self.refresh_all()
            if changed:
                self.category_tree.selection_set(*changed)
        except Exception as exc:
            messagebox.showerror("Групповое редактирование ConceptModel", str(exc), parent=self)

    def show_concept_catalog(self):
        if self.doc is None:
            return
        catalog = self.doc.concept_structure.catalog_report()
        dynamic = self.doc.dynamic_structure.inspection()
        report = {
            "ConceptModel/cs": catalog,
            "ConceptModel/spz": {
                "elements": len(dynamic.get("a_elements", [])),
                "links": len(dynamic.get("spz_links", [])),
                "validation_issues": dynamic.get("validation_issues", []),
            },
            "ConceptModel/content": {
                "records": len(dynamic.get("content_records", [])),
            },
            "project_validation": self.doc.validate(deep=True),
            "note": "Сводка read-only; неизвестные ветви XML не изменяются.",
        }
        dialog = tk.Toplevel(self)
        dialog.title("Обзор ConceptModel — PzKpfw")
        dialog.geometry("820x560")
        text = tk.Text(dialog, wrap="none", font=("Consolas", 9))
        text.pack(fill="both", expand=True, padx=8, pady=8)
        text.insert("1.0", json.dumps(report, ensure_ascii=False, indent=2))
        text.configure(state="disabled")
        ttk.Button(dialog, text="Закрыть", command=dialog.destroy).pack(anchor="e", padx=8, pady=(0, 8))

    def edit_category(self):
        if self.doc is None: return
        selected = self.category_tree.selection()
        if not selected: return messagebox.showinfo("Категория","Выберите категорию.",parent=self)
        if len(selected) != 1: return messagebox.showinfo("Категория","Для индивидуального редактирования выберите ровно одну категорию. Для нескольких используйте «Групповое изменение». ",parent=self)
        ident = selected[0]
        n=self.doc.concept_structure.category(ident)
        fields=[(k,k,n.get(k,""), tuple(str(x) for x in range(1,8)) if k=="class" else (("0","1") if k=="autoRange" else None)) for k in ("name","class","group","number","status","autoRange","codingType")]
        dialog=RecordDialog(self,f"Категория {ident}",fields); self.wait_window(dialog)
        if dialog.result is None: return
        d=dialog.result
        try:
            self.doc.concept_structure.update_category(ident,**{"class":int(d["class"]),"group":int(d["group"]),"number":int(d["number"]),"status":int(d["status"]),"autoRange":d["autoRange"],"codingType":int(d["codingType"]),"name":d["name"]})
            self._mark_dirty(f"Изменена категория {ident}"); self.refresh_all(); self.category_tree.selection_set(ident)
        except Exception as exc: messagebox.showerror("Категория",str(exc),parent=self)

    def edit_category_attributes(self):
        if self.doc is None:
            return
        selected = self.category_tree.selection()
        if len(selected) != 1:
            messagebox.showinfo("Дополнительные атрибуты", "Выберите ровно одну категорию.", parent=self)
            return
        ident = selected[0]
        node = self.doc.concept_structure.category(ident)
        attributes = {key: value for key, value in node.attrib.items() if key != "id"}
        dialog = JsonAttributesDialog(self, f"XML-атрибуты SubjectCategory #{ident}", attributes)
        self.wait_window(dialog)
        if dialog.result is None:
            return
        try:
            self.doc.concept_structure.set_category_attributes(ident, dialog.result)
            self._mark_dirty(f"Изменены XML-атрибуты категории {ident}")
            self.refresh_all()
            self.category_tree.selection_set(ident)
        except Exception as exc:
            messagebox.showerror("Дополнительные атрибуты", str(exc), parent=self)

    def edit_concept_link_attributes(self):
        if self.doc is None:
            return
        ident = self._selected_id(self.link_tree)
        if not ident:
            messagebox.showinfo("Дополнительные атрибуты", "Выберите связь ConceptModel/cs.", parent=self)
            return
        node = self.doc.concept_structure.link(ident)
        attributes = {key: value for key, value in node.attrib.items() if key != "id"}
        dialog = JsonAttributesDialog(self, f"XML-атрибуты SCBinaryLink #{ident}", attributes)
        self.wait_window(dialog)
        if dialog.result is None:
            return
        try:
            self.doc.concept_structure.set_link_attributes(ident, dialog.result)
            self._mark_dirty(f"Изменены XML-атрибуты SCBinaryLink {ident}")
            self.refresh_all()
            self.link_tree.selection_set(ident)
        except Exception as exc:
            messagebox.showerror("Дополнительные атрибуты", str(exc), parent=self)

    def delete_category(self):
        if self.doc is None: return
        selected = self.category_tree.selection()
        if not selected: return messagebox.showinfo("Категория","Выберите категорию.",parent=self)
        if len(selected) != 1: return messagebox.showinfo("Категория","Удаляйте категории по одной: у каждой собственный набор зависимостей и каскадных последствий.",parent=self)
        ident = selected[0]
        count=sum(ident in {n.get("e1"),n.get("e2"),n.get("e3")} for n in self.doc.concept_structure.links)
        content_node = self.doc.root.find("models/ConceptModel/content")
        content_count = sum(n.get("e2") == ident for n in (list(content_node) if content_node is not None else []))
        cascade=False
        cascade_content=False
        if count:
            cascade=messagebox.askyesno("Удаление категории",f"Категория используется в {count} SCBinaryLink. Удалить также эти связи?\n\n{self._dependency_note(self._dependency_entry('category', ident))}",parent=self)
            if not cascade: return
        if content_count:
            cascade_content=messagebox.askyesno("Удаление категории",f"Категория используется в {content_count} AEContentLink. Удалить также эти связи?\n\n{self._dependency_note(self._dependency_entry('category', ident))}",parent=self)
            if not cascade_content: return
        if not count and not content_count and not messagebox.askyesno("Удаление категории",f"Удалить категорию {ident}?\n\n{self._dependency_note(self._dependency_entry('category', ident))}",parent=self): return
        try:
            self.doc.concept_structure.delete_category(ident,cascade_links=cascade,cascade_content_links=cascade_content)
            self._mark_dirty(f"Удалена категория {ident}"); self.refresh_all()
        except Exception as exc: messagebox.showerror("Категория",str(exc),parent=self)

    def add_concept_link(self):
        if self.doc is None: return
        ids=[n.get("id","") for n in self.doc.concept_structure.categories]
        if not ids: return messagebox.showinfo("Связь","Сначала создайте категории.",parent=self)
        fields=[("type","Тип связи","2",("1","2","3")),("e1","E1 (0 = null)",ids[0],tuple(["0"]+ids)),("e2","E2 (0 = null)",ids[0],tuple(["0"]+ids)),("e3","E3 (0 = null)","0",tuple(["0"]+ids)),("name","Название","",None),("range","Range (пусто = default)","",None)]
        dialog=RecordDialog(self,"Новая SCBinaryLink",fields); self.wait_window(dialog)
        if dialog.result is None: return
        d=dialog.result
        try:
            ident=self.doc.concept_structure.add_link(int(d["type"]),e1=d["e1"],e2=d["e2"],e3=d["e3"],name=d["name"],range_value=int(d["range"]) if d["range"].strip() else None)
            self._mark_dirty(f"Создана связь {ident}"); self.refresh_all(); self.link_tree.selection_set(ident)
        except Exception as exc: messagebox.showerror("Связь",str(exc),parent=self)

    def edit_concept_link(self):
        if self.doc is None: return
        ident=self._selected_id(self.link_tree)
        if not ident: return messagebox.showinfo("Связь","Выберите связь.",parent=self)
        n=self.doc.concept_structure.link(ident); ids=[x.get("id","") for x in self.doc.concept_structure.categories]
        fields=[("type","Тип",n.get("type","1"),("1","2","3")),("e1","E1",n.get("e1","0"),tuple(["0"]+ids)),("e2","E2",n.get("e2","0"),tuple(["0"]+ids)),("e3","E3",n.get("e3","0"),tuple(["0"]+ids)),("name","Название",n.get("name",""),None),("range","Range",n.get("range","99"),None)]
        dialog=RecordDialog(self,f"Связь {ident}",fields); self.wait_window(dialog)
        if dialog.result is None: return
        d=dialog.result
        try:
            self.doc.concept_structure.update_link(ident,type=int(d["type"]),e1=d["e1"],e2=d["e2"],e3=d["e3"],name=d["name"],range=int(d["range"]))
            self._mark_dirty(f"Изменена связь {ident}"); self.refresh_all(); self.link_tree.selection_set(ident)
        except Exception as exc: messagebox.showerror("Связь",str(exc),parent=self)

    def delete_concept_link(self):
        if self.doc is None: return
        ident=self._selected_id(self.link_tree)
        if not ident: return messagebox.showinfo("Связь","Выберите связь.",parent=self)
        if not messagebox.askyesno("Удаление связи",f"Удалить связь {ident}?",parent=self): return
        self.doc.concept_structure.delete_link(ident); self._mark_dirty(f"Удалена связь {ident}"); self.refresh_all()

    def recompute_auto_ranges(self):
        if self.doc is None: return
        changed=self.doc.concept_structure.recompute_auto_ranges()
        count=sum(len(x) for x in changed.values())
        self._mark_dirty(f"Пересчитан AutoRange: {count} связей в {len(changed)} группах"); self.refresh_all()
        messagebox.showinfo("AutoRange",f"Обновлено связей: {count}\nКатегорий: {len(changed)}",parent=self)

    def _about(self):
        """Show the product logo independently from the taskbar application icon."""
        window = tk.Toplevel(self)
        window.title('О PzKpfw')
        window.resizable(False, False)
        window.transient(self)
        window.iconphoto(True, self._app_icon_image) if self._app_icon_image is not None else None
        body = ttk.Frame(window, padding=22)
        body.pack(fill='both', expand=True)
        try:
            path = Path(__file__).resolve().parent / 'assets' / 'pzkpfw_logo_about.png'
            window._brand_logo = tk.PhotoImage(file=str(path))
            ttk.Label(body, image=window._brand_logo).pack(pady=(0, 12))
        except (OSError, tk.TclError):
            pass
        ttk.Label(body, text='PzKpfw', font=('TkDefaultFont', 18, 'bold')).pack()
        ttk.Label(body, text='Редактор проектов .is2', style='Muted.TLabel').pack(pady=(0, 12))
        explanation = ('Независимый редактор моделей ИС-2: СПД, декомпозиция, '
                       'параметры, объекты, спецификации и матричные формы.\n\n'
                       'Сохранение и проверка XML, резервные копии и история правок. '
                       'Совместимость с исходной Windows-программой ИС-2 '
                       'ещё не подтверждена для всех проектов.')
        ttk.Label(body, text=explanation, wraplength=410, justify='center').pack()
        ttk.Button(body, text='Закрыть', command=window.destroy).pack(pady=(16, 0))
        window.bind('<Escape>', lambda _event: window.destroy())
        window.grab_set()
        window.focus_set()

    def _quit(self):
        if self.dirty and not self._save_prompt():
            return
        self._save_graph_view_state()
        self.destroy()


def main(argv: list[str] | None = None) -> int:
    argv = list(sys.argv[1:] if argv is None else argv)
    app = Is2Studio()
    if argv:
        try:
            app.doc = ProjectDocument.load(argv[0])
            app.path = Path(argv[0])
            view_warning = app._load_graph_view_state(app.path)
            app._reset_history(saved=True)
            app.refresh_all()
            app._restore_editor_state()
            app._set_enabled(True)
            app._set_title()
            app.status.set(f"Открыт: {app.path.name}" + (f"; настройки графа не загружены: {view_warning}" if view_warning else ""))
        except Exception as exc:
            messagebox.showerror("Ошибка открытия", str(exc), parent=app)
    app.mainloop()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
