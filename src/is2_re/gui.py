"""Tkinter desktop editor for PzKpfw / IS-2 project files.

The UI edits the recovered primary model, ConceptModel/cs, scalar AElement
fields and conservatively decoded fields of existing dynamic relation records.
"""
from __future__ import annotations
from .i18n import (tr, tr_dynamic, available_languages, discover_languages, get_language, get_language_info, pack_errors, save_language_preference, user_locales_dir)

import hashlib
import json
import sys
import textwrap
import tkinter as tk
import tkinter.font as tkfont
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
from .action_input import KIND_LABELS, KIND_NAMES, encode_action_symbol, display_action_symbol
from .coursework import create_course_project
from .course_gui import CourseworkPanel
from .grid_tree import GridTreeview
from .decomposition_view import DecompositionPanel
from .button_notebook import ButtonNotebook
from .ui_resources import persistent_menu, canvas_tag_at
from .ui_performance import CoalescedCallback
from .focus_view import PackSnapshot
from .tooltips import ButtonTooltips
from .ui_theme import apply_theme, load_theme, save_theme, load_tooltips, save_tooltips, BACKGROUND, SURFACE, INK, MUTED, BORDER, PRIMARY, PALETTES
from .feature_audit import feature_audit
from .matrix_view import grouped_matrix, cell_description, inferred_structural_marks, matrix_context
from .matrix_canvas import MatrixCanvas, wheel_steps
from . import __version__
from .ui_icons import make_history_icon
from .parameter_dialog import ParameterDialog, group_label


class RecordDialog(tk.Toplevel):
    def __init__(self, master, title: str, fields: list[tuple[str, str, str, tuple[str, ...] | None]]):
        super().__init__(master)
        self.title(tr(title))
        self.resizable(True, False)
        self.result = None
        self.vars: dict[str, tk.StringVar] = {}
        self._choice_reverse: dict[str, dict[str, str]] = {}
        body = ttk.Frame(self, padding=12)
        body.grid(row=0, column=0, sticky="nsew")
        for row, (key, label, value, choices) in enumerate(fields):
            ttk.Label(body, text=tr(label)).grid(row=row, column=0, sticky="w", padx=(0, 12), pady=4)
            var = tk.StringVar(value=tr(value) if choices and value in choices else value)
            self.vars[key] = var
            if choices:
                translated_choices = tuple(tr(choice) for choice in choices)
                self._choice_reverse[key] = {translated: original for original, translated in zip(choices, translated_choices)}
                widget = ttk.Combobox(body, textvariable=var, values=translated_choices, state="readonly", width=34)
            else:
                widget = ttk.Entry(body, textvariable=var, width=38)
            widget.grid(row=row, column=1, sticky="ew", pady=4)
        buttons = ttk.Frame(body)
        buttons.grid(row=len(fields), column=0, columnspan=2, sticky="e", pady=(10, 0))
        ttk.Button(buttons, text=tr("Отмена"), command=self.destroy).pack(side="right", padx=(6, 0))
        ttk.Button(buttons, text=tr("Применить"), command=self._accept).pack(side="right")
        body.columnconfigure(1, weight=1)
        self.transient(master)
        self.grab_set()
        self.bind("<Escape>", lambda _e: self.destroy())
        self.bind("<Return>", lambda _e: self._accept())
        self.wait_visibility()
        self.focus_set()

    def _accept(self):
        self.result = {
            key: self._choice_reverse.get(key, {}).get(var.get(), var.get())
            for key, var in self.vars.items()
        }
        self.destroy()


class ObjectDialog(RecordDialog):
    def __init__(self, master, name=None):
        super().__init__(master, 'Новый объект' if name is None else 'Изменить объект',
                         [('name', tr('Наименование объекта'), name or '', None)])

    def _accept(self):
        name = self.vars['name'].get().strip()
        if not name:
            messagebox.showerror(tr('Объект'), tr('Укажите наименование объекта.'), parent=self)
            return
        self.result = {'name': name}
        self.destroy()


class ReportOptionsDialog(tk.Toplevel):
    def __init__(self, master, topic):
        super().__init__(master)
        self.title(tr('Отчёт в DOCX'))
        self.result = None
        self.resizable(True, False)
        self.author = tk.StringVar(value='')
        self.group = tk.StringVar(value='ИДБ-24-17')
        self.topic = tk.StringVar(value=topic)
        self.sections = {key: tk.BooleanVar(value=True) for key in ('diagrams', 'forms', 'matrix', 'placeholders')}
        body = ttk.Frame(self, padding=14)
        body.grid(sticky='nsew')
        for row, (label, variable) in enumerate(((tr('ФИО'), self.author), (tr('Группа'), self.group), (tr('Тема'), self.topic))):
            ttk.Label(body, text=label).grid(row=row, column=0, sticky='w', padx=(0, 10), pady=4)
            ttk.Entry(body, textvariable=variable, width=52).grid(row=row, column=1, sticky='ew', pady=4)
        for row, (key, label) in enumerate((('diagrams', tr('Диаграммы декомпозиции')),
                                            ('forms', tr('Формы A, B, D, D1, D2')),
                                            ('matrix', tr('Матричная диаграмма')),
                                            ('placeholders', tr('Разделы для ручного заполнения'))), start=3):
            ttk.Checkbutton(body, text=label, variable=self.sections[key]).grid(row=row, column=0, columnspan=2, sticky='w', pady=3)
        ttk.Label(body, text=tr('ФИО можно оставить пустым. Таблицы будут редактируемыми.'), wraplength=440).grid(row=7, column=0, columnspan=2, sticky='w', pady=(8, 0))
        buttons = ttk.Frame(body)
        buttons.grid(row=8, column=0, columnspan=2, sticky='e', pady=(12, 0))
        ttk.Button(buttons, text=tr('Отмена'), command=self.destroy).pack(side='right', padx=(6, 0))
        ttk.Button(buttons, text=tr('Продолжить'), command=self._accept).pack(side='right')
        body.columnconfigure(1, weight=1)
        self.transient(master)
        self.grab_set()
        self.bind('<Escape>', lambda _e: self.destroy())
        self.wait_visibility()
        self.focus_set()

    def _accept(self):
        from .docx_report import ReportOptions
        self.result = ReportOptions(author=self.author.get(), group=self.group.get(), topic=self.topic.get(),
                                    **{key: var.get() for key, var in self.sections.items()})
        self.destroy()


class JsonAttributesDialog(tk.Toplevel):
    def __init__(self, master, title: str, attributes: dict[str, str]):
        super().__init__(master)
        self.title(title)
        self.geometry("560x420")
        self.result = None
        ttk.Label(self, text=tr("Атрибуты XML в формате JSON. Поле id менять нельзя."), padding=8).pack(anchor="w")
        self.text = tk.Text(self, wrap="none", undo=True)
        self.text.pack(fill="both", expand=True, padx=8)
        self.text.insert("1.0", json.dumps(attributes, ensure_ascii=False, indent=2))
        buttons = ttk.Frame(self, padding=8)
        buttons.pack(fill="x")
        ttk.Button(buttons, text=tr("Отмена"), command=self.destroy).pack(side="right", padx=(6, 0))
        ttk.Button(buttons, text=tr("Применить"), command=self._accept).pack(side="right")
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
            messagebox.showerror(tr("Некорректные атрибуты"), str(exc), parent=self)


class Is2Studio(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title(tr("PzKpfw — редактор проектов .is2"))
        self.geometry("1320x820")
        self.minsize(1050, 650)
        self._install_app_icon()
        self.theme_name = tk.StringVar(value=load_theme())
        self.language_code = tk.StringVar(value=get_language())
        self.tooltips_enabled = tk.BooleanVar(value=load_tooltips())
        self.tooltip_button_text = tk.StringVar(value=self._tooltip_label())
        apply_theme(self, self.theme_name.get())
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
        self._diagram_focus = None
        self._deferred_views = set()
        self.bind('<Escape>', self._escape_diagram_focus, add='+')
        self._build_menu()
        self._build_layout()
        self._apply_language_direction()
        self.button_tooltips = ButtonTooltips(self, self.tooltips_enabled, self.theme_name)
        apply_theme(self, self.theme_name.get())
        self.course_panel._draw()
        self.notebook.bind("<<NotebookTabChanged>>", self._on_notebook_tab_changed, add="+")
        self._set_enabled(False)
        self._on_notebook_tab_changed()
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
            messagebox.showinfo(tr("Экспорт"), tr("Сначала откройте проект."), parent=self)
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
            messagebox.showerror(tr("Ошибка экспорта"), str(exc), parent=self)
            return
        messagebox.showinfo(tr("Экспорт"), tr("Файл создан. Это справочный экспорт PzKpfw; соответствие формам ИС-2 не проверено."), parent=self)

    def export_docx_report(self):
        if self.doc is None:
            messagebox.showinfo(tr('Экспорт'), tr('Сначала откройте проект.'), parent=self)
            return
        dialog = ReportOptionsDialog(self, self.doc.root.get('name', ''))
        self.wait_window(dialog)
        if dialog.result is None:
            return
        destination = filedialog.asksaveasfilename(parent=self, title=tr('Сохранить отчёт'),
                                                    defaultextension='.docx', filetypes=[(tr('Документ Word'), '*.docx')])
        if not destination:
            return
        try:
            from .docx_report import write_docx_report
            write_docx_report(self.doc, destination, dialog.result, source_path=self.path)
        except (OSError, ValueError, RuntimeError, ProjectFormatError) as exc:
            messagebox.showerror(tr('Ошибка экспорта DOCX'), str(exc), parent=self)
            return
        messagebox.showinfo(tr('Экспорт DOCX'), tr('Отчёт создан. Проверьте схемы, формы и заполните оставленные разделы.'), parent=self)

    def _build_menu(self):
        menu = tk.Menu(self)
        file_menu = tk.Menu(menu, tearoff=False)
        file_menu.add_command(label=tr("Новый проект…"), accelerator="Ctrl+N", command=self.new_project)
        file_menu.add_command(label=tr("Новый проект с главным действием…"), command=self.new_coursework)
        file_menu.add_command(label=tr("Открыть…"), accelerator="Ctrl+O", command=self.open_file)
        file_menu.add_command(label=tr("Сохранить"), accelerator="Ctrl+S", command=self.save)
        file_menu.add_command(label=tr("Сохранить как…"), command=self.save_as)
        file_menu.add_command(label=tr("Резервные копии…"), command=self.show_backups)
        file_menu.add_separator()
        file_menu.add_command(label=tr("Экспорт обзора в HTML…"), command=lambda: self.export_document("report"))
        file_menu.add_command(label=tr("Отчёт в DOCX…"), command=self.export_docx_report)
        file_menu.add_command(label=tr("Экспорт схемы в SVG…"), command=lambda: self.export_document("diagram"))
        file_menu.add_command(label=tr("Экспорт таблицы связей в CSV…"), command=lambda: self.export_document("relations"))
        file_menu.add_command(label=tr("Экспорт матрицы состава в CSV…"), command=lambda: self.export_document("matrix"))
        file_menu.add_separator()
        file_menu.add_command(label=tr("Выход"), command=self._quit)
        menu.add_cascade(label=tr("Файл"), menu=file_menu)
        self.edit_menu = tk.Menu(menu, tearoff=False)
        self.edit_menu.add_command(label=tr("Отменить"), accelerator="Ctrl+Z", command=self.undo, state="disabled")
        self.edit_menu.add_command(label=tr("Повторить"), accelerator="Ctrl+Y", command=self.redo, state="disabled")
        self.edit_menu.add_separator()
        self.edit_menu.add_command(label=tr("История действий…"), command=self.show_history)
        menu.add_cascade(label=tr("Правка"), menu=self.edit_menu)
        project_menu = tk.Menu(menu, tearoff=False)
        project_menu.add_command(label=tr("Проверить проект"), command=self.validate_project)
        project_menu.add_command(label=tr("Проверить совместимость с ИС-2"), command=self.check_compatibility)
        project_menu.add_command(label=tr("Обзор возможностей и ограничений…"), command=self.show_feature_audit)
        project_menu.add_command(label=tr("Аудит зависимостей…"), command=self.show_dependency_audit)
        project_menu.add_command(label=tr("Исправление повреждённых ссылок…"), command=self.show_link_repair_dialog)
        project_menu.add_command(label=tr("Сравнить с другой версией…"), command=self.show_project_diff)
        project_menu.add_command(label=tr("Сравнить графы связей…"), command=self.show_relationship_graph_diff)
        project_menu.add_command(label=tr("Объединить три версии…"), command=self.show_three_way_merge)
        project_menu.add_command(label=tr("Обзор ConceptModel…"), command=self.show_concept_catalog)
        project_menu.add_command(label=tr("Обновить представления"), command=self.refresh_all)
        menu.add_cascade(label=tr("Проект"), menu=project_menu)
        appearance = tk.Menu(menu, tearoff=False)
        appearance.add_radiobutton(label=tr("Тёмная"), variable=self.theme_name, value="dark", command=self.change_theme)
        appearance.add_radiobutton(label=tr("Светлая"), variable=self.theme_name, value="light", command=self.change_theme)
        appearance.add_separator()
        self.language_menu = tk.Menu(appearance, tearoff=False)
        self._populate_language_menu()
        appearance.add_cascade(label=tr("Язык интерфейса"), menu=self.language_menu)
        menu.add_cascade(label=tr("Вид"), menu=appearance)
        help_menu = tk.Menu(menu, tearoff=False)
        help_menu.add_command(label=tr("О программе"), command=self._about)
        menu.add_cascade(label=tr("Справка"), menu=help_menu)
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
        # A compact textual identity gives the working area back to the editor.
        header = ttk.Frame(self, padding=(20, 13, 20, 8))
        header.pack(fill='x')
        brand = ttk.Frame(header)
        brand.pack(side='left')
        ttk.Label(brand, text='PzKpfw', style='AppTitle.TLabel').pack(side='left')
        ttk.Label(brand, text='()', style='AppAccent.TLabel').pack(side='left')
        ttk.Label(header, text=tr('// РЕДАКТОР МОДЕЛЕЙ ИС-2'),
                  style='Eyebrow.TLabel').pack(side='left', padx=(20, 0), pady=(4, 0))
        self.theme_button = ttk.Button(header, style='Quiet.TButton', command=self.toggle_theme)
        self.theme_button.pack(side='right')
        tooltip_button = ttk.Button(header, textvariable=self.tooltip_button_text,
                                    command=self.toggle_tooltips, style='Quiet.TButton')
        tooltip_button._tooltip_text = tr('Включить или выключить пояснения к кнопкам при наведении.')
        tooltip_button.pack(side='right', padx=(0, 8))
        self.tooltip_button = tooltip_button
        self.file_label = ttk.Label(header, text=tr('Файл не открыт'), style='Muted.TLabel')
        self.file_label.pack(side='right', padx=(0, 18))
        self._update_theme_button()

        ttk.Separator(self, orient='horizontal').pack(fill='x', padx=20, pady=(0, 2))
        toolbar = ttk.Frame(self, padding=(20, 9, 20, 10))
        toolbar.pack(fill='x')
        ttk.Button(toolbar, text=tr('+ Новый проект'), command=self.new_coursework,
                   style='Primary.TButton').pack(side='left')
        ttk.Button(toolbar, text=tr('Открыть .is2'), command=self.open_file).pack(side='left', padx=(7, 0))
        ttk.Button(toolbar, text=tr('Сохранить'), command=self.save).pack(side='left', padx=(7, 0))
        ttk.Separator(toolbar, orient='vertical').pack(side='left', fill='y', padx=12)
        self.undo_button = ttk.Button(toolbar, text=tr('Отменить'), compound='left', command=self.undo, state='disabled')
        self.undo_button.pack(side='left', padx=(0, 4))
        self.redo_button = ttk.Button(toolbar, text=tr('Повторить'), compound='left', command=self.redo, state='disabled')
        self.redo_button.pack(side='left')
        self._update_history_icons()
        ttk.Button(toolbar, text=tr('Проверить проект'), command=self.validate_project).pack(side='left', padx=(14, 0))
        ttk.Button(toolbar, text=tr('Экспорт…'), command=self._show_export_menu).pack(side='left', padx=(7, 0))

        nav = ttk.Frame(self, padding=(20, 0, 20, 5))
        nav.pack(fill='x')
        self.navigation_buttons = {}
        self.notebook = ttk.Notebook(self, style='Main.TNotebook')
        self.notebook.pack(fill='both', expand=True, padx=20, pady=(0, 6))
        self.course_page = ttk.Frame(self.notebook)    # kept as compatibility alias
        self.action_page = ttk.Frame(self.notebook)
        self.param_page = ttk.Frame(self.notebook)
        self.object_page = ttk.Frame(self.notebook)
        self.forms_page = ttk.Frame(self.notebook)
        self.matrix_page = ttk.Frame(self.notebook)
        self.service_page = ttk.Frame(self.notebook)
        for frame, name in (
            (self.course_page, tr('Формирование СПД')),
            (self.action_page, tr('Декомпозиция')),
            (self.param_page, tr('Параметры')),
            (self.object_page, tr('Объекты')),
            (self.forms_page, tr('Спецификации')),
            (self.matrix_page, tr('Матричная диаграмма')),
            (self.service_page, tr('Дополнительно')),
        ):
            self.notebook.add(frame, text=name)
            button = ttk.Button(nav, text=name, style='MainNav.TButton',
                                command=lambda page=frame: self.notebook.select(page))
            button.pack(side='left', padx=(0, 5))
            self.navigation_buttons[str(frame)] = button
        self.advanced_tabs = ButtonNotebook(self.service_page)
        self.advanced_tabs.pack(fill='both', expand=True, padx=5, pady=5)
        self.metadata_page = ttk.Frame(self.advanced_tabs)
        self.action_editor_page = ttk.Frame(self.advanced_tabs)
        self.diagram_page = ttk.Frame(self.advanced_tabs)
        self.concept_page = ttk.Frame(self.advanced_tabs)
        self.link_page = ttk.Frame(self.advanced_tabs)
        self.other_page = ttk.Frame(self.advanced_tabs)
        self.graph_page = ttk.Frame(self.advanced_tabs)
        self.xml_page = ttk.Frame(self.advanced_tabs)
        for frame, name in (
            (self.metadata_page, tr('Паспорт')), (self.action_editor_page, tr('Дерево и редактирование')),
            (self.diagram_page, tr('Техническая схема')),
            (self.concept_page, tr('Категории (cs)')), (self.link_page, tr('Связи (cs)')),
            (self.other_page, 'spz / content'), (self.graph_page, tr('Граф связей')),
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
        self.status = tk.StringVar(value=tr('Готово · откройте .is2 или создайте проект'))
        status_bar = ttk.Frame(self, padding=(12, 6))
        status_bar.pack(fill='x', side='bottom')
        ttk.Label(status_bar, textvariable=self.status, style='Muted.TLabel').pack(side='left')
        ttk.Label(status_bar, text=tr('Ctrl+S · сохранить    Ctrl+Z · отменить    F1 · помощь'),
                  style='Muted.TLabel').pack(side='right')
        self.bind_all('<F1>', lambda _event: self._show_shortcuts())

    def enter_diagram_focus(self, panel):
        """Hide chrome temporarily while keeping the existing diagram alive."""
        if self._diagram_focus is not None:
            return
        self.button_tooltips.hide()
        self._diagram_focus = panel
        self._focus_root_layout = PackSnapshot(self)
        self._focus_root_layout.hide_except({self.notebook})
        self.notebook.pack_configure(padx=0, pady=0)
        self._focus_menu = self.cget('menu')
        self.configure(menu='')
        panel.enter_focus_view()

    def exit_diagram_focus(self):
        panel = self._diagram_focus
        if panel is None:
            return
        self._diagram_focus = None
        self.configure(menu=self._focus_menu)
        self._focus_root_layout.restore()
        panel.exit_focus_view()

    def _escape_diagram_focus(self, _event=None):
        if self._diagram_focus is not None:
            self.exit_diagram_focus()
            return 'break'
        return None

    def _show_shortcuts(self):
        messagebox.showinfo(tr('Работа в PzKpfw'),
            tr('Формирование СПД — схема, создание и изменение действий, свойства справа.\n'
            'Декомпозиция — диаграмма и листы действий.\n'
            'Параметры и Объекты — редактирование данных модели.\n'
            'Спецификации — формы A, B, D, D1, D2.\n'
            'Матричная диаграмма — связи действий с параметрами; двойной щелчок по ячейке — редактирование.\n'
            'Дополнительно — дерево и редактирование действий, паспорт, графы, XML.\n\n'
            'Ctrl+N — новый пустой проект, Ctrl+O — открыть, Ctrl+S — сохранить.\n'
            'Ctrl+Z / Ctrl+Y — история правок. В СПД: F2 — имя, Ctrl+Enter — применить свойства.'),
            parent=self)

    def _show_export_menu(self):
        """Keep rarely used exports off the permanent primary toolbar."""
        menu = persistent_menu(self, '_export_popup', (
            (tr('Комплект проекта (схемы, формы, проверка)…'), self.course_panel._export_all),
            (tr('Отчёт в DOCX…'), self.export_docx_report),
            (tr('Схема СПД в SVG…'), self.course_panel._export_svg),
            (tr('Спецификации в HTML…'), lambda: self.export_document('specifications')),
            (tr('Матрица в CSV…'), lambda: self.export_document('primary-matrix')),
            (tr('Отчёт в HTML…'), lambda: self.export_document('report')),
        ))
        try:
            x, y = self.winfo_pointerxy()
            menu.tk_popup(x, y)
        finally:
            menu.grab_release()

    def _show_page(self, page):
        """Navigate advanced pages without exposing seven extra top-level tabs."""
        if page in (self.metadata_page, self.action_editor_page, self.diagram_page, self.concept_page,
                    self.link_page, self.other_page, self.graph_page, self.xml_page):
            self.notebook.select(self.service_page)
            self.advanced_tabs.select(page)
        else:
            self.notebook.select(page)

    def _set_enabled(self, enabled: bool):
        self.course_panel.set_editing_enabled(enabled)
        state = "normal" if enabled else "disabled"
        for page in (self.metadata_page, self.action_page, self.action_editor_page, self.forms_page, self.diagram_page, self.param_page, self.object_page, self.concept_page, self.link_page, self.other_page, self.graph_page, self.xml_page):
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
        ttk.Button(bar, text=tr("Изменить паспорт"), command=self.edit_metadata).pack(side="left")
        ttk.Button(bar, text=tr("Обновить"), command=self._refresh_metadata).pack(side="left", padx=5)
        self.metadata_text = tk.Text(self.metadata_page, wrap="word", height=12, state="disabled")
        self.metadata_text.pack(fill="both", expand=True, padx=6, pady=(0, 6))
        ttk.Label(self.metadata_page, text=tr("Неизвестные атрибуты project/user сохраняются."), padding=6).pack(anchor="w")

    def _build_forms_page(self):
        bar = ttk.Frame(self.forms_page, padding=6)
        bar.pack(fill="x")
        self.form_selection = tk.StringVar(value=FORM_NAMES["A"])
        self.form_combo = ttk.Combobox(bar, textvariable=self.form_selection, values=tuple(v for k,v in FORM_NAMES.items() if k != "M"), state="readonly", width=39)
        self.form_combo.pack(side="left")
        self.form_combo.bind("<<ComboboxSelected>>", lambda event: self._refresh_form())
        for form_key in ('A', 'B', 'D', 'D1', 'D2'):
            ttk.Button(bar, text=tr('Форма') + ' ' + form_key,
                       command=lambda key=form_key: self._select_spec_form(key)).pack(side='left', padx=(6, 0))
        ttk.Button(bar, text=tr("Обновить"), command=self._refresh_form).pack(side="left", padx=4)
        ttk.Button(bar, text=tr("Печатать все формы…"), command=lambda: self.export_document('specifications')).pack(side="left", padx=4)
        ttk.Label(self.forms_page, text=tr("Реконструкция по XML и исследованию ИС-2; соответствие оригиналу не проверено."), padding=(6, 3)).pack(anchor="w")
        container=ttk.Frame(self.forms_page, padding=6)
        container.pack(fill="both", expand=True)
        self.forms_tree=GridTreeview(container, show="headings")
        y=ttk.Scrollbar(container, orient="vertical", command=self.forms_tree.yview)
        x=ttk.Scrollbar(container, orient="horizontal", command=self.forms_tree.xview)
        self.forms_tree.configure(yscrollcommand=y.set,xscrollcommand=x.set)
        self.forms_tree.grid(row=0,column=0,sticky="nsew"); y.grid(row=0,column=1,sticky="ns"); x.grid(row=1,column=0,sticky="ew")
        container.columnconfigure(0,weight=1); container.rowconfigure(0,weight=1)
        self.form_cell_text = tk.StringVar(value=tr('Щёлкните по ячейке, чтобы увидеть её содержимое полностью.'))
        ttk.Label(self.forms_page, textvariable=self.form_cell_text, wraplength=1300, padding=(8, 4)).pack(anchor='w', fill='x')
        self.forms_tree.bind('<ButtonRelease-1>', self._show_form_cell, add='+')
        self.form_status=tk.StringVar(value=tr('Откройте проект и нажмите «Обновить».'))
        ttk.Label(self.forms_page,textvariable=self.form_status,wraplength=1150,padding=6).pack(anchor="w")

    def _build_matrix_page(self):
        bar = ttk.Frame(self.matrix_page, padding=(8, 10))
        bar.pack(fill='x')
        ttk.Label(bar, text=tr('Действия × параметры'), font=('TkDefaultFont', 12, 'bold')).pack(side='left', padx=(0, 15))
        ttk.Button(bar, text=tr('+ Связь…'), command=lambda: self.edit_primary_link(False)).pack(side='left', padx=(0, 4))
        ttk.Button(bar, text=tr('− Связь…'), command=lambda: self.edit_primary_link(True)).pack(side='left', padx=(0, 4))
        ttk.Button(bar, text=tr('Кратность…'), command=self.edit_primary_link_power).pack(side='left', padx=(0, 4))
        ttk.Button(bar, text='CSV…', command=lambda: self.export_document('primary-matrix')).pack(side='left', padx=(0, 4))
        ttk.Button(bar, text=tr('Обновить'), command=self._refresh_matrix).pack(side='left')
        self._matrix_zoom = 1.0
        self._matrix_zoom_text = tk.StringVar(value='100%')
        ttk.Button(bar, text='−', width=3, command=lambda: self._scale_matrix(-1)).pack(side='left', padx=(14, 2))
        ttk.Label(bar, textvariable=self._matrix_zoom_text, width=5, anchor='center').pack(side='left')
        ttk.Button(bar, text='+', width=3, command=lambda: self._scale_matrix(1)).pack(side='left', padx=(2, 0))
        ttk.Label(self.matrix_page, text=tr('Щелчок — выделить строку и столбец; двойной щелчок — изменить связь.'),
                  padding=(12, 0), style='Muted.TLabel').pack(anchor='w')
        box = ttk.Frame(self.matrix_page, padding=9)
        box.pack(fill='both', expand=True)
        self._matrix_font = tkfont.nametofont('TkDefaultFont').copy()
        self._matrix_heading_font = tkfont.nametofont('TkDefaultFont').copy()
        self._matrix_heading_font.configure(weight='bold')
        self._matrix_base_font_size = abs(int(self._matrix_font.cget('size')))
        self._matrix_group_labels = []
        self.matrix_group_header = tk.Canvas(box, height=25, highlightthickness=0)
        self.matrix_group_header._theme_course_canvas = True
        self.matrix_group_header.grid(row=0, column=0, sticky='ew')
        self.matrix_tree = MatrixCanvas(box, theme=self.theme_name.get, font=self._matrix_font,
                                        heading_font=self._matrix_heading_font,
                                        on_width_change=self._draw_matrix_groups)
        yy=ttk.Scrollbar(box, orient='vertical', command=self.matrix_tree.yview)
        xx=ttk.Scrollbar(box, orient='horizontal', command=self.matrix_tree.xview)
        self.matrix_tree.set_callbacks(lambda first, last: self._matrix_xscroll(xx, first, last),
                                       lambda first, last: self._matrix_yscroll(yy, first, last))
        self.matrix_tree.grid(row=1, column=0, sticky='nsew')
        yy.grid(row=1, column=1, sticky='ns'); xx.grid(row=2, column=0, sticky='ew')
        box.columnconfigure(0, weight=1); box.rowconfigure(1, weight=1)
        self.matrix_tree.bind('<Control-MouseWheel>', lambda e: self._scale_matrix(1 if e.delta > 0 else -1), add='+')
        self.matrix_tree.bind('<Control-Button-4>', lambda _e: self._scale_matrix(1), add='+')
        self.matrix_tree.bind('<Control-Button-5>', lambda _e: self._scale_matrix(-1), add='+')
        self.matrix_group_header.bind('<Configure>', lambda _e: self._draw_matrix_groups())
        self._apply_matrix_scale()
        self.matrix_tree.bind('<Double-1>', self._edit_matrix_cell)
        self._matrix_hover_job = None
        self._matrix_tooltip = None
        self._matrix_hover_cell = None
        self.matrix_tree.bind('<Motion>', self._matrix_motion, add='+')
        self.matrix_tree.bind('<Leave>', self._matrix_hide_tooltip, add='+')
        self.matrix_status = tk.StringVar(value=tr('Создайте или откройте проект.'))
        ttk.Label(self.matrix_page, textvariable=self.matrix_status,
                  style='Muted.TLabel', padding=(12, 7)).pack(anchor='w')
        self._matrix_action_ids: list[str] = []
        self._matrix_parameter_ids: list[str] = []
        self._matrix_context = None

    def _refresh_matrix(self):
        if hasattr(self, "_matrix_hover_job"):
            self._matrix_hide_tooltip()
        if self.doc is None:
            self._matrix_context = None
            self._matrix_group_labels = []
            self.matrix_tree.set_data([], [], [])
            self._draw_matrix_groups()
            return
        try:
            self._matrix_context = matrix_context(self.doc)
            headers, rows, self._matrix_parameter_ids, warnings = grouped_matrix(self.doc, context=self._matrix_context)
            self._matrix_action_ids = [r.action_id for r in action_tree_rows(self.doc)]
            if len(headers) > 300:
                self._matrix_group_labels = []
                self.matrix_tree.set_data([], [], [])
                self._draw_matrix_groups()
                self.matrix_status.set(tr('Матрица очень широкая: используйте CSV-экспорт.'))
                return
            self._matrix_group_labels = [caption.split('\n', 1)[0] for caption in headers[2:]]
            widths = [round((72 if i == 0 else 90 if i == 1 else 66) * self._matrix_zoom) for i in range(len(headers))]
            self.matrix_tree.set_data([caption.split('\n', 1)[-1] for caption in headers], rows, widths)
            self.matrix_tree._sync_scrollbars()
            self.matrix_status.set(tr('{actions} действий · {parameters} параметров · * функция, + аргумент, . значение по умолчанию. Неоднозначных записей: {ambiguous}. [ / ] — начало / конец последовательности; структурные отметки выводятся для отображения.').format(
                actions=len(rows), parameters=len(self._matrix_parameter_ids),
                ambiguous=sum(1 for w in warnings if w.startswith("Запись matrix"))))
            self.after_idle(self._draw_matrix_groups)
        except (ValueError, ProjectFormatError, KeyError) as exc:
            messagebox.showerror(tr('Матричная диаграмма'), str(exc), parent=self)

    def _matrix_xscroll(self, scrollbar, first, last):
        scrollbar.set(first, last)
        self.matrix_group_header.xview_moveto(float(first))
        if getattr(self, '_matrix_tooltip', None) is not None or getattr(self, '_matrix_hover_job', None) is not None:
            self._matrix_hide_tooltip()

    def _matrix_yscroll(self, scrollbar, first, last):
        scrollbar.set(first, last)
        if getattr(self, '_matrix_tooltip', None) is not None or getattr(self, '_matrix_hover_job', None) is not None:
            self._matrix_hide_tooltip()

    def _scale_matrix(self, direction):
        self._matrix_zoom = max(0.7, min(1.4, round(self._matrix_zoom + direction * 0.1, 1)))
        self._apply_matrix_scale()
        return 'break'

    def _apply_matrix_scale(self):
        size = max(7, round(self._matrix_base_font_size * self._matrix_zoom))
        self._matrix_font.configure(size=size)
        self._matrix_heading_font.configure(size=size)
        self._matrix_zoom_text.set(f'{round(self._matrix_zoom * 100)}%')
        widths = [max(40, round((72 if i == 0 else 90 if i == 1 else 66) * self._matrix_zoom))
                  for i in range(len(self.matrix_tree.headers))]
        self.matrix_tree.set_scale(widths, round(27 * self._matrix_zoom))
        self.matrix_tree._sync_scrollbars()
        self._draw_matrix_groups()

    def _draw_matrix_groups(self):
        canvas = self.matrix_group_header
        canvas.delete('all')
        widths = self.matrix_tree.widths
        if len(widths) < 2:
            return
        total = sum(widths)
        palette = PALETTES[self.theme_name.get()]
        canvas.configure(background=palette['field'], scrollregion=(0, 0, total, 25))
        x = widths[0] + widths[1]
        canvas.create_rectangle(0, 0, x, 25, fill=palette['surface'], outline=palette['border'])
        start = 0
        while start < len(self._matrix_group_labels):
            end = start + 1
            while end < len(self._matrix_group_labels) and self._matrix_group_labels[end] == self._matrix_group_labels[start]:
                end += 1
            width = sum(widths[2 + start:2 + end])
            canvas.create_rectangle(x, 0, x + width, 25, fill=palette['surface'], outline=palette['border'])
            canvas.create_text(x + width / 2, 12, text=self._matrix_group_labels[start],
                               fill=palette['ink'], font=self._matrix_heading_font, width=max(1, width - 6))
            x += width
            start = end
        canvas.xview_moveto(self.matrix_tree.xview()[0])

    def _matrix_hide_tooltip(self, _event=None):
        if self._matrix_hover_job is not None:
            self.after_cancel(self._matrix_hover_job)
            self._matrix_hover_job = None
        if self._matrix_tooltip is not None:
            self._matrix_tooltip.destroy()
            self._matrix_tooltip = None
        self._matrix_hover_cell = None

    def _matrix_motion(self, event):
        row = self.matrix_tree.identify_row(event.y)
        col = self.matrix_tree.identify_column(event.x)
        cell = (row, col)
        if cell == self._matrix_hover_cell:
            return
        self._matrix_hide_tooltip()
        if not row or not col or not row.startswith('matrix') or int(col[1:]) < 3:
            return
        self._matrix_hover_cell = cell
        def show():
            self._matrix_hover_job = None
            try:
                row_idx = int(row.removeprefix('matrix'))
                col_idx = int(col[1:])-3
                text = cell_description(self.doc, self._matrix_action_ids[row_idx], self._matrix_parameter_ids[col_idx], context=self._matrix_context)
                tip = tk.Toplevel(self)
                tip.wm_overrideredirect(True)
                tip.wm_geometry(f'+{event.x_root + 14}+{event.y_root + 18}')
                tk.Label(tip, text=text, justify='left', background='#303041', foreground='#ffffff',
                         padx=9, pady=7, wraplength=520, relief='solid', borderwidth=1).pack()
                self._matrix_tooltip = tip
            except (ValueError, KeyError, IndexError, tk.TclError):
                self._matrix_hover_cell = None
        self._matrix_hover_job = self.after(400, show)

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
                messagebox.showinfo(tr('Матричная диаграмма'), tr('Функции и аргументы можно назначать только элементарным действиям.'), parent=self)
                return
            from .specifications import primary_links
            existing = [(mark, power) for a, p, mark, power in primary_links(self.doc)[0]
                        if a == aid and p == pid]
            if len(existing) > 1:
                messagebox.showinfo(tr('Матричная диаграмма'), tr('В ячейке несколько записей. Используйте команды «Связь» и «Кратность».'), parent=self)
                return
            if not existing and (aid, pid) in inferred_structural_marks(self.doc):
                messagebox.showinfo(tr('Матричная диаграмма'), tr('Эта ячейка содержит только предполагаемый структурный знак (~). Он вычислен для просмотра и не является сохранённой связью; редактирование здесь недоступно.'), parent=self)
                return
            old_mark, old_power = existing[0] if existing else ('+', '1')
            if old_mark not in ('*', '+', '.'):
                messagebox.showwarning(tr('Матричная диаграмма'), tr('Роль не распознана — правка заблокирована.'), parent=self)
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
            messagebox.showerror(tr('Матрица'), str(exc), parent=self)

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
        dialog=RecordDialog(self, tr("Удалить связь") if remove else tr("Добавить связь"), fields)
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
            messagebox.showerror(tr("Связь действия и параметра"),str(exc),parent=self)

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
            messagebox.showerror(tr("Кратность связи"), str(exc), parent=self)

    def _refresh_form(self):
        if self.doc is None:
            return
        try:
            forms,warnings=project_forms(self.doc)
            key=next((k for k,v in FORM_NAMES.items() if v==self.form_selection.get()),"A")
            headers,rows=forms[key]
            if len(headers)>300:
                self.form_status.set(tr("Слишком много столбцов для просмотра. Используйте HTML-экспорт."))
                return
            self.forms_tree.delete(*self.forms_tree.get_children())
            cols=[f"c{i}" for i in range(len(headers))]
            self.forms_tree.configure(columns=cols)
            font = tkfont.nametofont('TkDefaultFont')
            for index, (name,title) in enumerate(zip(cols,headers)):
                self.forms_tree.heading(name,text=title)
                samples = (str(row[index]) for row in rows[:1000] if len(row) > index)
                content_width = max((font.measure(value.replace('\n', ' ')) for value in samples), default=0)
                width = min(600, max(90, font.measure(title) + 24, content_width + 24))
                self.forms_tree.column(name,width=width,minwidth=60,stretch=False)
            for row in rows:
                self.forms_tree.insert("", "end", values=row)
            self.form_status.set(f"Строк: {len(rows)}. " + " ".join(warnings))
            self.form_cell_text.set(tr('Щёлкните по ячейке, чтобы увидеть её содержимое полностью.'))
        except (ValueError, ProjectFormatError, KeyError) as exc:
            messagebox.showerror(tr("Формы"),str(exc),parent=self)

    def _show_form_cell(self, event):
        row = self.forms_tree.identify_row(event.y)
        col = self.forms_tree.identify_column(event.x)
        if not row or not col:
            return
        index = int(col[1:]) - 1
        values = self.forms_tree.item(row, 'values')
        if 0 <= index < len(values):
            heading = self.forms_tree.heading(f'#{index + 1}', 'text')
            self.form_cell_text.set(f'{heading}: {values[index]}')

    def _build_action_page(self):
        self.decomposition_panel = DecompositionPanel(self.action_page, self)
        self.decomposition_panel.pack(fill='both', expand=True)
        editor_page = self.action_editor_page
        bar = ttk.Frame(editor_page, padding=6)
        bar.pack(fill="x")
        for text, command in (("Новый корень", self.add_root_action), ("Добавить дочерний", self.add_child_action), ("↑", lambda: self.move_action(-1)), ("↓", lambda: self.move_action(1)), ("Изменить", self.edit_action), ("Удалить", self.delete_action), ("Обновить", self._refresh_actions)):
            ttk.Button(bar, text=tr(text), command=command).pack(side="left", padx=(0, 5))
        ttk.Button(bar, text=tr("Преобразовать…"), command=self.convert_selected_action).pack(side="left", padx=(0, 5))
        ttk.Button(bar, text=tr("Вставить до…"), command=lambda: self.insert_selected_action(False)).pack(side="left", padx=(0, 5))
        ttk.Button(bar, text=tr("Вставить после…"), command=lambda: self.insert_selected_action(True)).pack(side="left", padx=(0, 5))
        split = ttk.Panedwindow(editor_page, orient="horizontal")
        split.pack(fill="both", expand=True, padx=6, pady=(0, 6))
        left = ttk.Frame(split)
        right = ttk.Frame(split, padding=12)
        split.add(left, weight=3)
        split.add(right, weight=2)
        self.action_tree = GridTreeview(left, columns=("type", "level"), show="tree headings", selectmode="browse")
        self.action_tree.heading("#0", text=tr("Действие"))
        self.action_tree.heading("type", text=tr("Тип"))
        self.action_tree.heading("level", text=tr("Уровень"))
        self.action_tree.column("type", width=70, anchor="center")
        self.action_tree.column("level", width=80, anchor="center")
        y = ttk.Scrollbar(left, orient="vertical", command=self.action_tree.yview)
        self.action_tree.configure(yscrollcommand=y.set)
        self.action_tree.pack(side="left", fill="both", expand=True)
        y.pack(side="right", fill="y")
        self.action_tree.bind("<<TreeviewSelect>>", self._show_action_details)
        self.action_tree.bind("<<TreeviewSelect>>", self._on_tree_selection_changed, add="+")
        ttk.Label(right, text=tr("Выбранное действие"), font=("TkDefaultFont", 11, "bold")).pack(anchor="w")
        self.action_details = tk.Text(right, wrap="word", height=20, state="disabled")
        self.action_details.pack(fill="both", expand=True, pady=(8, 0))

    def move_action(self, direction):
        if self.doc is None:
            return
        ident = self._selected_id(self.action_tree)
        if not ident:
            messagebox.showinfo(tr("Порядок действий"), tr("Выберите дочернее действие."), parent=self)
            return
        parents = [n.get("afe1") for n in self.doc.links if n.get("type") == "2" and n.get("afe2") == ident]
        if len(parents) != 1:
            messagebox.showinfo(tr("Порядок действий"), tr("Выберите действие с одним родителем; корневые действия не переставляются."), parent=self)
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
            messagebox.showerror(tr("Порядок действий"), str(exc), parent=self)

    def _build_diagram_page(self):
        bar = ttk.Frame(self.diagram_page, padding=6)
        bar.pack(fill="x")
        ttk.Button(bar, text=tr("Обновить схему"), command=self._refresh_diagram).pack(side="left")
        ttk.Button(bar, text=tr("Изменить выбранное действие"), command=self.edit_action).pack(side="left", padx=5)
        self.diagram_zoom = 1.0
        ttk.Button(bar, text='−', width=3, command=lambda: self._diagram_scale(.8)).pack(side='left')
        ttk.Button(bar, text='+', width=3, command=lambda: self._diagram_scale(1.25)).pack(side='left', padx=3)
        ttk.Button(bar, text='100%', command=self._diagram_reset_zoom).pack(side='left')
        ttk.Label(bar, text=tr("Сплошная стрелка — состав (type=2); пунктир — порядок соседей (type=3)."), padding=(8, 0)).pack(side="left")
        holder = ttk.Frame(self.diagram_page)
        holder.pack(fill="both", expand=True, padx=6, pady=(0, 6))
        self.diagram_canvas = tk.Canvas(holder, background="white", highlightthickness=0,
                                        xscrollincrement=30, yscrollincrement=30)
        self.diagram_canvas.bind('<Map>', lambda _e: self._flush_deferred_view('diagram'), add='+')
        self._diagram_zoom_redraw = CoalescedCallback(self.diagram_canvas, self._refresh_diagram, interval_ms=30)
        self.diagram_canvas._theme_course_canvas = True
        self.diagram_caption = tk.StringVar(value=tr('Выберите действие для просмотра полного названия.'))
        ttk.Label(self.diagram_page, textvariable=self.diagram_caption, wraplength=1200, padding=(8, 2)).pack(anchor='w', fill='x')
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
        self.diagram_canvas.bind('<Control-MouseWheel>', self._diagram_wheel_zoom)
        self.diagram_canvas.bind('<Control-Button-4>', lambda _e: self._diagram_scale(1.08))
        self.diagram_canvas.bind('<Control-Button-5>', lambda _e: self._diagram_scale(1/1.08))
        self.diagram_canvas.bind('<ButtonPress-2>', lambda e: self.diagram_canvas.scan_mark(e.x, e.y))
        self.diagram_canvas.bind('<B2-Motion>', lambda e: self.diagram_canvas.scan_dragto(e.x, e.y, gain=1))

    def _diagram_scale(self, factor):
        self.diagram_zoom = max(.5, min(2.0, self.diagram_zoom * factor))
        self._diagram_zoom_redraw.request()
        return 'break'

    def _diagram_wheel_zoom(self, event):
        steps = wheel_steps(event.delta, self.diagram_canvas.tk.call('tk', 'windowingsystem'))
        if steps: self._diagram_scale(1.08 ** steps)
        return 'break'

    def _diagram_reset_zoom(self):
        self.diagram_zoom = 1.0
        self._refresh_diagram()

    def _refresh_diagram(self):
        if self.doc is None:
            self.diagram_canvas.delete("all")
            self.diagram_canvas.configure(scrollregion=(0, 0, 800, 600))
            return
        canvas = self.diagram_canvas
        canvas.delete("all")
        rows, positions, composition_edges, sequence_edges = action_diagram_layout(self.doc)
        zoom = self.diagram_zoom
        positions = {ident:(x*zoom, y*zoom) for ident,(x,y) in positions.items()}
        node_width, node_height = 250*zoom, 94*zoom
        palette = PALETTES[self.theme_name.get()]
        canvas.configure(background=palette['field'])
        # Draw edges first so that node boxes remain visually on top.
        for parent_id, child_id in composition_edges:
            px, py = positions[parent_id]
            cx, cy = positions[child_id]
            canvas.create_line(px + node_width, py + node_height / 2, cx, cy + node_height / 2,
                               arrow="last", width=max(1, 2*zoom), fill=palette['muted'], tags=("edge", "composition"))
        for current_id, next_id in sequence_edges:
            ax, ay = positions[current_id]
            bx, by = positions[next_id]
            canvas.create_line(ax + node_width / 2, ay + node_height, bx + node_width / 2, by,
                               arrow="last", width=max(1, 2*zoom), dash=(6, 4), fill=palette['accent'],
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
            outline = palette['primary'] if is_selected else palette['border']
            width = 3 if is_selected else 1
            canvas.create_rectangle(x, y, x + node_width, y + node_height,
                                    fill=palette['selected'] if is_selected else palette['surface'],
                                    outline=outline, width=width, tags=tags)
            title_lines = textwrap.wrap(title, width=32, max_lines=3, placeholder='…') or ['(без названия)']
            canvas.create_text(x + 9*zoom, y + 8*zoom, anchor="nw", width=node_width - 18*zoom,
                               text='\n'.join(title_lines), font=("TkDefaultFont", max(7,round(10*zoom)), "bold"), fill=palette['ink'], tags=tags)
            canvas.create_text(x + 9*zoom, y + 72*zoom, anchor="nw", text=subtitle,
                               font=("TkDefaultFont", max(6,round(8*zoom))), fill=palette['muted'], tags=tags)
        max_x = max((x for x, _ in positions.values()), default=0) + node_width + 80
        max_y = max((y for _, y in positions.values()), default=0) + node_height + 80
        canvas.configure(scrollregion=(0, 0, max(800, max_x), max(600, max_y)))
        if not rows:
            canvas.create_text(30, 30, anchor="nw", text=tr("В проекте пока нет действий."),
                               font=("TkDefaultFont", 12), fill=palette['muted'])

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
                    self.diagram_caption.set(f"{ident}: {self.doc.action(ident).get('name', '')}")
                    self.status.set(tr_dynamic(f"Выбрано действие {ident}"))
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
            ttk.Button(bar, text=tr(text), command=command).pack(side="left", padx=(0, 5))
        tree = GridTreeview(page, show="headings", selectmode="browse")
        tree.pack(fill="both", expand=True, padx=6, pady=(0, 6))
        if title == "Параметры":
            columns = ("row", "group", "codingType", "number", "object", "sign", "name", "id")
        else:
            columns = ("row", "id", "name", "attributes")
        tree["columns"] = columns
        captions = {"row": "№", "id": "ID", "name": "Наименование", "group": "Группа",
                    "codingType": "Тип кодирования", "number": "Номер", "sign": "Обозначение",
                    "object": "Объект", "attributes": "Атрибуты XML"}
        for column in columns:
            tree.heading(column, text=tr(captions.get(column, column)))
            width = {"row": 45, "group": 180, "codingType": 130, "number": 70,
                     "object": 180, "sign": 120, "name": 400, "id": 65, "attributes": 500}[column]
            tree.column(column, width=width, minwidth=40, stretch=column in ("name", "attributes"), anchor="w")
        if title == "Параметры":
            self.param_tree = tree
            ttk.Button(bar, text=tr("Доп. XML…"), command=self.edit_parameter_advanced).pack(side="left", padx=(6, 0))
            ttk.Button(bar, text=tr("Назначить объект…"), command=self.assign_parameter_object).pack(side="left", padx=(6, 0))
            ttk.Button(bar, text=tr("Снять объект"), command=self.clear_parameter_object).pack(side="left", padx=(4, 0))
            tree.bind("<<TreeviewSelect>>", self._on_tree_selection_changed, add="+")
            tree.bind('<Double-1>', lambda event: self._edit_record_at(tree, event, edit))
        else:
            self.object_tree = tree
            ttk.Button(bar, text=tr('Доп. XML…'), command=self.edit_object_advanced).pack(side='left', padx=(6, 0))
            tree.bind("<<TreeviewSelect>>", self._on_tree_selection_changed, add="+")
            tree.bind('<Double-1>', lambda event: self._edit_record_at(tree, event, edit))

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
            ttk.Button(bar, text=tr(text), command=command).pack(side="left", padx=(0, 5))
        filters = ttk.Frame(self.concept_page, padding=(6, 0, 6, 4))
        filters.pack(fill="x")
        ttk.Label(filters, text=tr("Поиск:")).pack(side="left")
        self.concept_search_var = tk.StringVar(value="")
        concept_search = ttk.Entry(filters, textvariable=self.concept_search_var, width=26)
        concept_search.pack(side="left", padx=(4, 12))
        concept_search.bind("<KeyRelease>", lambda _e: self._refresh_categories())
        ttk.Label(filters, text=tr("Класс:")).pack(side="left")
        all_label = tr("Все")
        self.concept_class_filter = tk.StringVar(value=all_label)
        class_filter = ttk.Combobox(
            filters, textvariable=self.concept_class_filter, state="readonly", width=12,
            values=(all_label, "S", "P", "Z", "K", "O", "R", "C"),
        )
        class_filter.pack(side="left", padx=4)
        class_filter.bind("<<ComboboxSelected>>", lambda _e: self._refresh_categories())
        ttk.Label(filters, text=tr("Группа:")).pack(side="left", padx=(8, 0))
        self.concept_group_filter = tk.StringVar(value=all_label)
        self.concept_group_combo = ttk.Combobox(filters, textvariable=self.concept_group_filter,
                                                state="readonly", width=9, values=(all_label,))
        self.concept_group_combo.pack(side="left", padx=4)
        self.concept_group_combo.bind("<<ComboboxSelected>>", lambda _e: self._refresh_categories())
        self.concept_summary_var = tk.StringVar(value=tr("ConceptModel ещё не загружен"))
        ttk.Label(self.concept_page, textvariable=self.concept_summary_var, padding=(8, 2)).pack(anchor="w")
        self.category_tree = GridTreeview(
            self.concept_page,
            columns=("id", "name", "class", "group", "number", "status", "codingType", "autoRange"),
            show="headings", selectmode="extended",
        )
        for c in self.category_tree["columns"]:
            self.category_tree.heading(c, text={"id":"ID", "name":tr("Название"), "class":tr("Класс"), "group":tr("Группа"), "number":tr("Номер"), "status":tr("Статус"), "codingType":"CodingType", "autoRange":"AutoRange"}.get(c, c))
            self.category_tree.column(c, width=130 if c == "name" else 85, anchor="w" if c == "name" else "center")
        self.category_tree.pack(fill="both", expand=True, padx=6, pady=(0, 6))
        self.category_tree.bind("<Double-1>", lambda _e: self.edit_category())
        self.category_tree.bind("<<TreeviewSelect>>", self._on_tree_selection_changed, add="+")
        ttk.Label(
            self.concept_page,
            text=tr("Классы S/P/Z/K/O/R/C. Можно выбрать несколько категорий для группового изменения group и number; неизвестные атрибуты сохраняются."),
            padding=6,
        ).pack(anchor="w")

    def _build_link_page(self):
        bar = ttk.Frame(self.link_page, padding=6)
        bar.pack(fill="x")
        for text, command in (("Добавить связь", self.add_concept_link), ("Изменить", self.edit_concept_link), ("Доп. атрибуты…", self.edit_concept_link_attributes), ("Удалить", self.delete_concept_link), ("Пересчитать AutoRange", self.recompute_auto_ranges), ("Обновить", self._refresh_links)):
            ttk.Button(bar, text=tr(text), command=command).pack(side="left", padx=(0, 5))
        self.concept_links_summary = tk.StringVar(value=tr('Откройте проект.'))
        ttk.Label(self.link_page, textvariable=self.concept_links_summary, padding=(8, 3)).pack(anchor='w')
        self.link_tree = GridTreeview(self.link_page, columns=("id", "type", "label", "e1", "e2", "e3", "range"), show="headings", selectmode="browse")
        labels = {"id":"ID", "type":tr("Тип"), "label":tr("Связь"), "e1":"E1", "e2":"E2", "e3":"E3", "range":"Range"}
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
            ttk.Button(bar, text=tr(text), command=command).pack(side="left", padx=(0, 5))
        self.dynamic_summary = tk.StringVar(value=tr('Откройте проект.'))
        ttk.Label(self.other_page, textvariable=self.dynamic_summary, padding=(8, 3)).pack(anchor='w')
        split = ttk.Panedwindow(self.other_page, orient="vertical")
        split.pack(fill="both", expand=True, padx=6, pady=(0, 6))
        upper = ttk.Frame(split)
        lower = ttk.Frame(split)
        split.add(upper, weight=3)
        split.add(lower, weight=2)
        ttk.Label(upper, text=tr("Структуры ConceptModel / spz / elements — AElement"), padding=(2, 2)).pack(anchor="w")
        self.spz_tree = GridTreeview(
            upper, columns=("id", "name", "type", "status", "formalization", "level", "number", "symbol"),
            show="headings", selectmode="browse", height=8,
        )
        labels = {"id": "ID", "name": tr("Название"), "type": "Type", "status": "Status",
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
        ttk.Button(spz_link_bar, text=tr("Добавить…"), command=self.add_spz_link).pack(side="left", padx=(0, 4))
        ttk.Button(spz_link_bar, text=tr("Изменить endpoints…"), command=self.edit_spz_link).pack(side="left", padx=(0, 4))
        ttk.Button(spz_link_bar, text=tr("Удалить"), command=self.delete_spz_link).pack(side="left")
        ttk.Label(spz_link_bar,
                  text=tr("e1/e2/e3 — AIElement из spz/elemets; 0 = пустой endpoint."),
                  padding=(8, 0)).pack(side="left")
        self.spz_links_tree = GridTreeview(
            self.spz_links_page, columns=("index", "tag", "e1", "e2", "e3", "children", "attributes"),
            show="headings", selectmode="browse", height=5,
        )
        spz_labels = {"index": "№", "tag": tr("XML-узел"), "e1": "E1", "e2": "E2", "e3": "E3",
                      "children": tr("Вложено"), "attributes": tr("Атрибуты")}
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
        ttk.Button(content_bar, text=tr("Добавить связь…"), command=self.add_content_link).pack(side="left", padx=(0, 4))
        ttk.Button(content_bar, text=tr("Изменить…"), command=self.edit_content_record).pack(side="left", padx=(0, 4))
        ttk.Button(content_bar, text=tr("Удалить"), command=self.delete_content_link).pack(side="left")
        ttk.Label(content_bar,
                  text=tr("AEContentLink type=4: e1 = действие (AFElement), e2 = категория (AIElement)."),
                  padding=(8, 0)).pack(side="left")
        self.content_tree = GridTreeview(
            self.content_page, columns=("index", "tag", "e1", "e2", "char", "power", "children", "attributes"),
            show="headings", selectmode="browse", height=5,
        )
        content_labels = {"index": "№", "tag": tr("XML-узел"), "e1": "E1", "e2": "E2", "char": "Char", "power": "Power",
                          "children": tr("Вложено"), "attributes": tr("Атрибуты")}
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
        ttk.Label(bar, text=tr("Тип:")).pack(side="left")
        self.graph_filter_var = tk.StringVar(value=tr("Все"))
        self.graph_filter_combo = ttk.Combobox(
            bar, textvariable=self.graph_filter_var, state="readonly", width=24,
            values=(tr("Все"), "SCBinaryLink (cs)", "AIEBinaryLink (spz)", "AEContentLink (content)", "Parameter → Object"),
        )
        self.graph_filter_combo.pack(side="left", padx=(4, 8))
        self.graph_filter_combo.bind("<<ComboboxSelected>>", lambda _e: self._refresh_graph())
        ttk.Label(bar, text=tr("Поиск:")).pack(side="left")
        self.graph_search_var = tk.StringVar(value="")
        search = ttk.Entry(bar, textvariable=self.graph_search_var, width=22)
        search.pack(side="left", padx=4)
        search.bind("<Return>", lambda _e: self._refresh_graph())
        ttk.Button(bar, text=tr("Показать"), command=self._refresh_graph).pack(side="left", padx=(2, 6))
        ttk.Button(bar, text=tr("Сбросить"), command=self._reset_graph_filter).pack(side="left")
        ttk.Button(bar, text=tr("Развернуть всё"), command=self._expand_all_graph_groups).pack(side="left", padx=(8, 0))

        edit_bar = ttk.Frame(self.graph_page, padding=(6, 0, 6, 4))
        edit_bar.pack(fill="x")
        ttk.Label(edit_bar, text=tr("Новая связь:")).pack(side="left")
        self.graph_new_kind = tk.StringVar(value="AEContentLink (content)")
        ttk.Combobox(
            edit_bar, textvariable=self.graph_new_kind, state="readonly", width=25,
            values=("SCBinaryLink (cs)", "AIEBinaryLink (spz)", "AEContentLink (content)"),
        ).pack(side="left", padx=(4, 6))
        ttk.Button(edit_bar, text=tr("＋ Создать на графе"), command=self.graph_add_relation).pack(side="left", padx=2)
        self.graph_edit_button = ttk.Button(edit_bar, text=tr("Изменить выбранную"), command=self.graph_edit_relation, state="disabled")
        self.graph_edit_button.pack(side="left", padx=2)
        self.graph_delete_button = ttk.Button(edit_bar, text=tr("Удалить выбранную"), command=self.graph_delete_relation, state="disabled")
        self.graph_delete_button.pack(side="left", padx=2)
        ttk.Separator(edit_bar, orient="vertical").pack(side="left", fill="y", padx=7)
        ttk.Button(edit_bar, text="−", width=3, command=lambda: self._graph_zoom_step(0.8)).pack(side="left", padx=1)
        ttk.Button(edit_bar, text="＋", width=3, command=lambda: self._graph_zoom_step(1.25)).pack(side="left", padx=1)
        ttk.Button(edit_bar, text=tr("Автораскладка"), command=self._graph_auto_layout).pack(side="left", padx=3)
        ttk.Button(edit_bar, text=tr("Вписать"), command=self._graph_fit).pack(side="left", padx=3)
        self.graph_zoom_label = ttk.Label(edit_bar, text="100%")
        self.graph_zoom_label.pack(side="left", padx=(2, 0))
        self.graph_layout_hint_var = tk.StringVar(value=tr("Группы связей: cs · spz · content"))
        ttk.Label(edit_bar, textvariable=self.graph_layout_hint_var).pack(side="right", padx=(8, 2))

        self.graph_summary_var = tk.StringVar(value=tr("Граф ещё не построен"))
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
        self._graph_drag_redraw = CoalescedCallback(self.graph_canvas, self._refresh_graph, interval_ms=25)
        self._graph_zoom_redraw = CoalescedCallback(self.graph_canvas, self._finish_graph_zoom, interval_ms=30)
        self.graph_canvas.bind('<Map>', lambda _e: self._flush_deferred_view('graph'), add='+')
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
        self.graph_canvas.bind("<Control-Button-4>", lambda e: self._graph_zoom_step(1.08))
        self.graph_canvas.bind("<Control-Button-5>", lambda e: self._graph_zoom_step(1/1.08))
        ttk.Label(detail_holder, text=tr("Сведения о выбранном узле"), padding=(2, 4)).pack(anchor="w")
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
                self.graph_filter_var.set(tr("Все") if state.get("graph_filter", "Все") == "Все" else state.get("graph_filter"))
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
                messagebox.showwarning(tr("Состояние редактора"), tr("Не удалось сохранить настройки редактора отдельно от .is2:\n{error}").format(error=exc), parent=self)
            else:
                self.status.set(tr_dynamic(f"Не удалось сохранить sidecar редактора: {exc}"))
            return False

    def _on_notebook_tab_changed(self, _event=None):
        selected = self.notebook.select()
        if self._diagram_focus is not None:
            focus_page = self.course_page if self._diagram_focus is self.course_panel else self.action_page
            if selected != str(focus_page):
                self.exit_diagram_focus()
        for page, button in self.navigation_buttons.items():
            button.state(['selected'] if page == selected else ['!selected'])
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
        self.graph_zoom = 1.0
        self._refresh_graph()
        self._save_graph_view_state()
        self.status.set(tr("Выполнена автоматическая раскладка графа; координаты сохранены отдельно от .is2"))

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
        self.graph_filter_var.set(tr("Все"))
        self.graph_search_var.set("")
        self._refresh_graph()

    def _graph_default_layout(self, nodes):
        """Create a readable view with a separate column per relation family."""
        columns = {
            "action": (20, tr("ДЕЙСТВИЯ · AFElement"), "#eaf2ff", "#2455a4"),
            "category": (370, tr("КАТЕГОРИИ · SubjectCategory"), "#eaf8ef", "#28734a"),
            "spz_element": (720, tr("ЭЛЕМЕНТЫ · spz/AElement"), "#fff6e7", "#996018"),
            "parameter": (1070, tr("ПАРАМЕТРЫ · PrimaryModel"), "#e0f2fe", "#0369a1"),
            "object": (1430, tr("ОБЪЕКТЫ · PrimaryModel"), "#fef3c7", "#a16207"),
            "relation:scbinarylink": (1790, "SCBinaryLink · cs", "#f2edff", "#6941a5"),
            "relation:aie_binary_link": (2150, "AIEBinaryLink · spz", "#e6fffb", "#0f766e"),
            "relation:ae_content_link": (2510, "AEContentLink · content", "#f5f0ff", "#7c3aed"),
            "relation:parameter_object": (2870, "Parameter → Object", "#ecfccb", "#4d7c0f"),
            "relation": (3230, tr("НЕИЗВЕСТНЫЕ ЗАПИСИ"), "#f1f5f9", "#64748b"),
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
        active_keys = [key for key, items in grouped.items() if items]
        columns = {key: (30 + 360 * i, *columns[key][1:]) for i, key in enumerate(active_keys)}
        grouped = {key: grouped[key] for key in active_keys}
        positions = {}
        top, row_step = 70, 108
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
            self.graph_summary_var.set(tr("Файл не открыт"))
            self._set_inspector_text(self.graph_detail, tr("Откройте проект для построения графа."))
            self._update_graph_edit_controls()
            return

        kind_map = {tr("Все"): "all", "SCBinaryLink (cs)": "scbinarylink", "AIEBinaryLink (spz)": "aie_binary_link", "AEContentLink (content)": "ae_content_link", "Parameter → Object": "parameter_object"}
        graph = build_relationship_graph(self.doc)
        visible = filter_relationship_graph(graph, relation_kind=kind_map.get(self.graph_filter_var.get(), "all"), query=self.graph_search_var.get())
        nodes, edges = visible["nodes"], visible["edges"]
        self.graph_nodes_by_key = {node["key"]: node for node in nodes}
        columns, grouped, defaults = self._graph_default_layout(nodes)
        for key, position in defaults.items():
            self.graph_positions.setdefault(key, position)
        # Existing saved layouts keep their coordinates; align headings with them.
        columns = {key: (min(self.graph_positions[n['key']][0] for n in grouped[key]), *config[1:])
                   for key, config in columns.items()}
        # Drop stale keys so a removed link cannot leave phantom layout data.
        all_graph_keys = {node["key"] for node in graph["nodes"]}
        self.graph_positions = {key: value for key, value in self.graph_positions.items() if key in all_graph_keys}
        zoom = self.graph_zoom
        node_width, node_height = 280 * zoom, 82 * zoom
        scale = lambda v: v * zoom
        palette = PALETTES[self.theme_name.get()]
        canvas.configure(background=palette['field'])
        dark = self.theme_name.get() == 'dark'
        colors = ({"scbinarylink": "#aebdd4", "aie_binary_link": "#6bd5c4", "ae_content_link": "#c0a5ff", "parameter_object": "#a6d27d"} if dark else
                  {"scbinarylink": "#64748b", "aie_binary_link": "#0f766e", "ae_content_link": "#7c3aed", "parameter_object": "#4d7c0f"})
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
            start = (scale(x2 + 280), scale(y2 + 41))
            end = (scale(x1), scale(y1 + 41))
            canvas.create_line(*start, *end, fill=color, width=max(1, 1.5 * zoom), tags=("graph-edge",))
            mid_x, mid_y = (start[0] + end[0]) / 2, (start[1] + end[1]) / 2
            canvas.create_text(mid_x, mid_y - 7 * zoom, text=edge["slot"], fill=color,
                               font=("TkDefaultFont", max(7, int(8 * zoom)), "bold"), tags=("graph-edge-label",))
        visible_positions = []
        for kind, (x, heading, fill, outline) in columns.items():
            if dark:
                fill, outline = '#262b3b', palette['accent']
            x_scaled = scale(x)
            collapsed = kind in self.graph_collapsed_groups
            marker = "▸" if collapsed else "▾"
            canvas.create_text(
                x_scaled, scale(28), anchor="nw",
                text=f"{marker} {heading} ({len(grouped[kind])})",
                font=("TkDefaultFont", max(7, int(9 * zoom)), "bold"), fill=outline,
                tags=("graph-group-header", f"graph-group:{kind}"),
            )
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
                title = '\n'.join(textwrap.wrap(node.get('label', node['key']), width=38, max_lines=2, placeholder='…'))
                detail = textwrap.shorten(node.get('detail', ''), width=48, placeholder='…')
                canvas.create_text(x0 + 9 * zoom, y0 + 7 * zoom, anchor="nw", width=node_width - 18 * zoom,
                                   text=title,
                                   font=("TkDefaultFont", max(7, int(10 * zoom)), "bold"), fill=palette['ink'] if dark else '#18212f', tags=tags)
                canvas.create_text(x0 + 9 * zoom, y0 + 59 * zoom, anchor="nw", width=node_width - 18 * zoom,
                                   text=detail,
                                   font=("TkDefaultFont", max(7, int(9 * zoom))), fill=palette['muted'] if dark else '#475569', tags=tags)

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
        self.graph_layout_hint_var.set(tr("Группы: {groups}").format(groups=group_summary or tr("нет записей")))
        self.graph_summary_var.set(
            tr("Показано: {relations} связей, {endpoints} endpoint-ов; всего записей связей/привязок: {total}. "
               "Неразрешённых ссылок: {dangling}; непрозрачных записей: {opaque}.").format(
                relations=summary['relation_count'], endpoints=summary['endpoint_count'],
                total=all_summary['relation_node_count'], dangling=len(graph['dangling_references']),
                opaque=all_summary['opaque_record_count']) + " " +
            tr("Перетаскивайте узлы; Ctrl+колесо — масштаб; средняя кнопка — панорама. "
               "Семейства связей показаны отдельными колонками; вид хранится отдельно от .is2.")
        )
        if not nodes:
            canvas.create_text(30, 45, anchor="nw", text=tr("По заданному фильтру узлы не найдены."), font=("TkDefaultFont", 11), fill=palette['muted'])
        elif not edges:
            canvas.create_text(30, 45, anchor="nw", text=tr("Записи связей не найдены. Изолированные элементы показаны в своих колонках."), font=("TkDefaultFont", 10), fill=palette['muted'])
        details = tr("Выберите узел. Двойной щелчок открывает его таблицу; связь можно изменить или удалить кнопками выше.")
        if graph["dangling_references"]:
            details += "\n\n" + tr("Неразрешённые endpoint-ы:") + "\n" + "\n".join(
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
        self.status.set(tr("Граф: выбран узел {label}").format(label=node.get('label', node_key)))
        self._update_graph_edit_controls()
        if self.path is not None:
            self._save_graph_view_state()

    def _graph_node_key_at(self, event):
        return canvas_tag_at(self.graph_canvas, event, 'graph-key:')

    def _graph_press(self, event):
        self.graph_canvas.focus_set()
        group = canvas_tag_at(self.graph_canvas, event, 'graph-group:')
        if group is not None:
            self.graph_drag = None
            self._toggle_graph_group(group)
            return 'break'
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
        self._graph_drag_redraw.request()

    def _graph_release(self, _event):
        drag = self.graph_drag
        self.graph_drag = None
        if drag and drag.get("moved"):
            self._graph_drag_redraw.cancel()
            self._refresh_graph()
            self._save_graph_view_state()
            self.status.set(tr("Положение узла изменено (только sidecar представления, XML проекта не менялся)"))
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
            self._show_page(self.action_editor_page); self.action_tree.selection_set(ident); self.action_tree.see(ident)
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
        self._graph_zoom_redraw.request()

    def _finish_graph_zoom(self):
        self._refresh_graph()
        self._save_graph_view_state()

    def _graph_wheel_zoom(self, event):
        steps = wheel_steps(event.delta, self.graph_canvas.tk.call('tk', 'windowingsystem'))
        if steps: self._graph_zoom_step(1.08 ** steps)
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
            messagebox.showerror(tr("Создание связи на графе"), str(exc), parent=self)

    def graph_edit_relation(self):
        if self.doc is None: return
        node = self.graph_nodes_by_key.get(self.graph_selected_key) if self.graph_selected_key else None
        if not node or node.get("kind") != "relation":
            messagebox.showinfo(tr("Граф связей"), tr("Выберите узел записи связи."), parent=self); return
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
                dialog = RecordDialog(self, tr("Привязка Parameter {parameter_id} → Object").format(parameter_id=parameter_id), fields)
                self.wait_window(dialog)
                if dialog.result is None:
                    return
                self.doc.set_parameter_object(parameter_id, dialog.result["object_id"])
                new_key = f"relation:parameter_object:{parameter_id}:{index}"
            elif kind == "scbinarylink":
                ident = str(node.get("attributes", {}).get("id", "")); current = self.doc.concept_structure.link(ident)
                ids = [n.get("id", "") for n in self.doc.concept_structure.categories if n.get("id")]
                fields = [("type", "Тип", current.get("type", "2"), ("1", "2", "3")), ("e1", "E1", current.get("e1", "0"), tuple(["0"] + ids)), ("e2", "E2", current.get("e2", "0"), tuple(["0"] + ids)), ("e3", "E3", current.get("e3", "0"), tuple(["0"] + ids)), ("name", "Название", current.get("name", ""), None), ("range", "Range", current.get("range", "99"), None)]
                dialog = RecordDialog(self, tr("Связь SCBinaryLink {ident}").format(ident=ident), fields); self.wait_window(dialog)
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
                dialog = RecordDialog(self, tr("Связь AIEBinaryLink spz/links[{index}]").format(index=index + 1), fields); self.wait_window(dialog)
                if dialog.result is None: return
                d = dialog.result; changes = {k: (v if k == "name" else int(v)) for k, v in d.items() if v != current.get(k, "0" if k != "name" else "")}
                self.doc.dynamic_structure.update_spz_link(index, **changes); new_key = self.graph_selected_key
            elif kind == "ae_content_link":
                current = self.doc.dynamic_structure.content_records[index]
                if current.tag != "AElement" or current.get("type") != "4": raise ValueError("Непрозрачная или неподдерживаемая запись защищена от изменения.")
                actions = [str(n.get("id")) for n in self.doc.actions if n.get("id")]; categories = [str(n.get("id")) for n in self.doc.concept_structure.categories if n.get("id")]
                fields = [("e1", "E1 — AFElement", current.get("e1", ""), tuple(actions)), ("e2", "E2 — AIElement", current.get("e2", ""), tuple(categories)), ("char", "Char (int8)", current.get("char", "0"), None), ("power", "Power (int32)", current.get("power", "1"), None)]
                dialog = RecordDialog(self, tr("Связь AEContentLink content[{index}]").format(index=index + 1), fields); self.wait_window(dialog)
                if dialog.result is None: return
                d = dialog.result; self.doc.dynamic_structure.update_content_record(index, e1=d["e1"], e2=d["e2"], char=int(d["char"]), power=int(d["power"])); new_key = self.graph_selected_key
            else:
                raise ValueError(f"Неизвестный тип связи: {kind}")
            self._mark_dirty(f"Изменена связь через граф: {kind}")
            self.refresh_all()
            if new_key in self.graph_nodes_by_key: self._graph_select_node(new_key)
        except Exception as exc:
            messagebox.showerror(tr("Редактирование связи на графе"), str(exc), parent=self)

    def graph_delete_relation(self):
        if self.doc is None: return
        node = self.graph_nodes_by_key.get(self.graph_selected_key) if self.graph_selected_key else None
        if not node or node.get("kind") != "relation":
            messagebox.showinfo(tr("Граф связей"), tr("Выберите узел записи связи."), parent=self); return
        kind, index = node.get("relation_kind"), int(node.get("record_index", -1))
        if not messagebox.askyesno(tr("Удаление связи"), tr("Удалить выбранную запись {kind} [{index}]?").format(kind=kind, index=index + 1), parent=self): return
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
            messagebox.showerror(tr("Удаление связи на графе"), str(exc), parent=self)

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
            messagebox.showinfo(tr("Выбор связи"), tr("Сначала выберите запись в таблице spz/links."), parent=self)
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
            dialog = RecordDialog(self, tr("spz/links — запись {index}").format(index=index + 1), fields)
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
            messagebox.showerror(tr("Редактирование spz/links"), str(exc), parent=self)

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
            return messagebox.showinfo("spz/links", tr("Выберите связь."), parent=self)
        index = int(selected[0])
        if not messagebox.askyesno(tr("Удаление spz-связи"), tr("Удалить запись spz/links[{index}]?").format(index=index + 1), parent=self):
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
            return messagebox.showinfo("AEContentLink", tr("Для создания связи нужны хотя бы одно действие и одна категория ConceptModel/cs."), parent=self)
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
            return messagebox.showinfo("ConceptModel/content", tr("Выберите связь."), parent=self)
        index = int(selected[0])
        if not messagebox.askyesno(tr("Удаление AEContentLink"), tr("Удалить запись content[{index}]?").format(index=index + 1), parent=self):
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
            messagebox.showinfo(tr("Выбор записи"), tr("Сначала выберите запись в ConceptModel/content."), parent=self)
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
            dialog = RecordDialog(self, tr("AEContentLink — запись {index}").format(index=index + 1), fields)
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
            messagebox.showerror(tr("Редактирование AEContentLink"), str(exc), parent=self)

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
            self._mark_dirty(f"Создан Элемент AElement в spz {ident}")
            self.refresh_all()
        except Exception as exc:
            messagebox.showerror("spz AElement", str(exc), parent=self)

    def edit_spz_element(self):
        if self.doc is None:
            return
        ident = self._selected_id(self.spz_tree)
        if not ident:
            messagebox.showinfo(tr("Выбор записи"), tr("Сначала выберите AElement."), parent=self)
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
            dialog = RecordDialog(self, tr("Элемент AElement в spz {ident}").format(ident=ident), fields)
            self.wait_window(dialog)
            if dialog.result is None:
                return
            d = dialog.result
            self.doc.dynamic_structure.update_element(
                ident, name=d["name"], type=int(d["type"]), status=int(d["status"]),
                formalization=int(d["formalization"]), level=int(d["level"]),
                number=int(d["number"]), symbol=int(d["symbol"]),
            )
            self._mark_dirty(f"Изменён Элемент AElement в spz {ident}")
            self.refresh_all()
        except Exception as exc:
            messagebox.showerror("spz AElement", str(exc), parent=self)

    def delete_spz_element(self):
        if self.doc is None:
            return
        ident = self._selected_id(self.spz_tree)
        if not ident:
            messagebox.showinfo(tr("Выбор записи"), tr("Сначала выберите AElement."), parent=self)
            return
        touching = [n for n in self.doc.dynamic_structure.links if ident in {n.get("e1"), n.get("e2"), n.get("e3")}]
        cascade_links = False
        if touching:
            cascade_links = messagebox.askyesno(tr("Удаление AElement"), tr("AElement {ident} используется в {count} spz-связях. Удалить также эти связи?\n\n{dependency_note}").format(ident=ident, count=len(touching), dependency_note=self._dependency_note(self._dependency_entry('spz_element', ident))), parent=self)
            if not cascade_links: return
        elif not messagebox.askyesno(tr("Удаление AElement"), tr("Удалить AElement {ident}?\n\n{dependency_note}").format(ident=ident, dependency_note=self._dependency_note(self._dependency_entry('spz_element', ident))), parent=self):
            return
        try:
            self.doc.dynamic_structure.delete_element(ident, cascade_links=cascade_links)
            self._mark_dirty(f"Удалён Элемент AElement в spz {ident}")
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
                                          label=(tr("Отменить: {label}").format(label=tr(undo_label)) if can_undo else tr("Отменить")))
            self.edit_menu.entryconfigure(1, state="normal" if can_redo else "disabled",
                                          label=(tr("Повторить: {label}").format(label=tr(redo_label)) if can_redo else tr("Повторить")))
        self._refresh_history_window()

    def show_history(self):
        """Show the undo/redo timeline and a detailed operation journal."""
        if self.history_window is not None and self.history_window.winfo_exists():
            self.history_window.deiconify()
            self.history_window.lift()
            self._refresh_history_window()
            return
        window = tk.Toplevel(self)
        window.title(tr("История изменений — PzKpfw"))
        window.geometry("900x520")
        self.history_window = window
        ttk.Label(window, text=tr("История текущей сессии документа. Снимки остаются в памяти; журнал содержит только метаданные."), padding=8).pack(anchor="w")
        tabs = ttk.Notebook(window)
        tabs.pack(fill="both", expand=True, padx=8, pady=4)
        timeline_page = ttk.Frame(tabs, padding=4)
        journal_page = ttk.Frame(tabs, padding=4)
        tabs.add(timeline_page, text=tr("Отменить / повторить"))
        tabs.add(journal_page, text=tr("Журнал операций"))

        tree = GridTreeview(timeline_page, columns=("stack", "index", "operation", "when", "size"), show="headings", selectmode="browse")
        for key, title, width in (("stack", "Стек", 105), ("index", "№", 45), ("operation", "Операция", 390), ("when", "Время", 190), ("size", "Снимок", 90)):
            tree.heading(key, text=tr(title))
            tree.column(key, width=width, anchor="w" if key in {"operation", "when"} else "center")
        tree.pack(fill="both", expand=True)
        tree.bind("<<TreeviewSelect>>", self._history_selection_changed)
        self.history_tree = tree

        journal = GridTreeview(journal_page, columns=("seq", "when", "action", "operation", "details"), show="headings")
        for key, title, width in (("seq", "№", 55), ("when", "Время UTC", 190), ("action", "Действие", 100), ("operation", "Операция", 245), ("details", "Подробности", 420)):
            journal.heading(key, text=tr(title))
            journal.column(key, width=width, anchor="w" if key not in {"seq"} else "center")
        journal.pack(fill="both", expand=True)
        self.history_journal_tree = journal

        buttons = ttk.Frame(window, padding=8)
        buttons.pack(fill="x")
        ttk.Button(buttons, text=tr("↶ Отменить"), command=self.undo).pack(side="left")
        ttk.Button(buttons, text=tr("↷ Повторить"), command=self.redo).pack(side="left", padx=6)
        self.history_jump_button = ttk.Button(buttons, text=tr("Перейти к состоянию…"), command=self._jump_history_selection, state="disabled")
        self.history_jump_button.pack(side="left", padx=6)
        ttk.Button(buttons, text=tr("Экспорт журнала…"), command=self.export_history_journal).pack(side="left", padx=6)
        ttk.Button(buttons, text=tr("Закрыть"), command=window.destroy).pack(side="right")
        window.bind("<Escape>", lambda _e: window.destroy())
        window.protocol("WM_DELETE_WINDOW", window.destroy)
        window.bind("<Destroy>", self._history_window_destroyed, add="+")
        self._refresh_history_window()

    def export_history_journal(self):
        if not self.history.journal:
            messagebox.showinfo(tr("Журнал операций"), tr("В журнале пока нет записей."), parent=self)
            return
        target = filedialog.asksaveasfilename(parent=self, title=tr("Экспорт журнала операций"), defaultextension=".json", filetypes=[("JSON", "*.json")])
        if not target:
            return
        payload = {
            "schema_version": 1,
            "project": str(self.path) if self.path else None,
            "events": [event.as_dict() for event in self.history.journal],
        }
        try:
            Path(target).write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
            messagebox.showinfo(tr("Журнал операций"), tr("Журнал сохранён: {path}").format(path=target), parent=self)
        except Exception as exc:
            messagebox.showerror(tr("Экспорт журнала"), str(exc), parent=self)

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
                tree.insert("", "end", iid="current", values=(tr("Текущее"), "—", tr("Текущее состояние документа"), "—", "—"))
                for stack, label, ordinal in self.history.timeline:
                    info = self.history.entry_info(stack, ordinal) or {}
                    created = str(info.get("created_at", "")).replace("T", " ").replace("Z", " UTC")
                    size = info.get("compressed_size", 0)
                    tree.insert("", "end", iid=f"{stack}:{ordinal}", values=(
                        tr("До операции") if stack == "undo" else tr("После операции"), ordinal, tr(label),
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
            button.configure(state="disabled", text=tr("Перейти к состоянию…"))
            return
        stack = selected[0].split(":", 1)[0]
        if stack == "undo":
            button.configure(state="normal", text=tr("Перейти до операции"))
        elif stack == "redo":
            button.configure(state="normal", text=tr("Перейти после операции"))
        else:
            button.configure(state="disabled", text=tr("Перейти к состоянию…"))

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
            operation = tr("Переход к состоянию до операции") if stack == "undo" else tr("Переход к состоянию после операции")
            self._restore_history_snapshot(snapshot, label, operation)
        except Exception as exc:
            messagebox.showerror(tr("История действий"), str(exc), parent=self)

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
            messagebox.showinfo(tr("Исправление ссылок"), tr("Неразрешённых типизированных ссылок не обнаружено."), parent=self)
            return

        dialog = tk.Toplevel(self)
        dialog.title(tr("Диагностика и пакетное восстановление ссылок"))
        dialog.geometry("980x650")
        dialog.minsize(780, 520)
        dialog.transient(self)
        outer = ttk.Frame(dialog, padding=10)
        outer.pack(fill="both", expand=True)
        ttk.Label(
            outer,
            text=tr("Найдены неразрешённые конечные точки: {count}. Сформируйте пакет исправлений, просмотрите его и примените одной операцией. PzKpfw не угадывает исходные ID.").format(count=len(issues)),
            wraplength=900,
        ).pack(anchor="w", pady=(0, 8))

        tree = GridTreeview(outer, columns=("selector", "old", "domain", "policy"), show="headings", height=10)
        for key, title, width in (
            ("selector", "Запись / поле", 255), ("old", "Повреждённый ID", 125),
            ("domain", "Ожидаемый тип объекта", 245), ("policy", "Снятие", 145),
        ):
            tree.heading(key, text=tr(title))
            tree.column(key, width=width, anchor="w")
        tree.pack(fill="both", expand=True)
        by_selector = {item["selector"]: item for item in issues}
        replacements: dict[str, str] = {}
        clears: set[str] = set()
        prepared: dict[str, object] = {}

        controls = ttk.LabelFrame(outer, text=tr("Подготовка исправления выбранного endpoint-а"), padding=8)
        controls.pack(fill="x", pady=(8, 0))
        ttk.Label(controls, text=tr("Новый ID:")).grid(row=0, column=0, sticky="w")
        target_var = tk.StringVar(value="")
        target_combo = ttk.Combobox(controls, textvariable=target_var, state="readonly", width=28, values=())
        target_combo.grid(row=0, column=1, sticky="w", padx=6)
        policy_var = tk.StringVar(value=tr("Выберите повреждённую ссылку выше."))
        ttk.Label(controls, textvariable=policy_var, wraplength=820).grid(row=1, column=0, columnspan=2, sticky="w", pady=(5, 0))

        queued = ttk.LabelFrame(outer, text=tr("Пакет исправлений — все операции будут одной записью Undo"), padding=6)
        queued.pack(fill="both", expand=True, pady=(8, 0))
        staged_tree = GridTreeview(queued, columns=("selector", "operation", "target"), show="headings", height=5)
        for key, title, width in (("selector", "Конечная точка", 390), ("operation", "Операция", 150), ("target", "Новый ID", 140)):
            staged_tree.heading(key, text=tr(title))
            staged_tree.column(key, width=width, anchor="w")
        staged_tree.pack(fill="both", expand=True)

        action_bar = ttk.Frame(outer)
        action_bar.pack(fill="x", pady=(8, 0))
        add_button = ttk.Button(action_bar, text=tr("Добавить переназначение"), state="disabled")
        clear_button = ttk.Button(action_bar, text=tr("Добавить снятие"), state="disabled")
        preview_button = ttk.Button(action_bar, text=tr("Предпросмотр пакета"), state="disabled")
        apply_button = ttk.Button(action_bar, text=tr("Применить пакет"), state="disabled")
        add_button.pack(side="left")
        clear_button.pack(side="left", padx=5)
        preview_button.pack(side="left", padx=(12, 5))
        apply_button.pack(side="left")
        ttk.Button(action_bar, text=tr("Закрыть"), command=dialog.destroy).pack(side="right")

        def render_queue():
            staged_tree.delete(*staged_tree.get_children(""))
            for selector, target in replacements.items():
                staged_tree.insert("", "end", iid=selector, values=(selector, tr("Переназначить"), target))
            for selector in sorted(clears):
                staged_tree.insert("", "end", iid=selector, values=(selector, tr("Снять endpoint"), "—"))
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
            policy_var.set(tr(item["clear_reason"]) + " " + tr("Доступно целевых ID: {count}.").format(count=len(targets)))

        def stage_remap():
            selection = tree.selection()
            target = target_var.get().strip()
            if not selection or not target:
                messagebox.showwarning(tr("Пакет исправлений"), tr("Выберите endpoint и существующий ID."), parent=dialog)
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
                    raise ValueError(tr("Пакет исправлений не изменяет документ."))
                prepared["source"] = self._document_snapshot()
                prepared["report"] = result
                lines = [
                    tr("Исправлений в пакете: {count}").format(count=result['summary']['applied_count']),
                    tr("Осталось неразрешённых endpoint-ов: {count}").format(count=result['summary']['remaining_dangling_count']),
                    tr("Ошибок глубокой проверки: {count}").format(count=result['summary']['validation_issue_count']),
                    "",
                ]
                for item in result["applied"]:
                    new_value = item["new_id"] if item["new_id"] is not None else tr("снятие")
                    lines.append(tr("{selector}: {old_id} → {new_id}").format(
                        selector=item['selector'], old_id=item['old_id'], new_id=new_value
                    ))
                messagebox.showinfo(tr("Предварительный просмотр пакета"), "\n".join(lines), parent=dialog)
                apply_button.configure(state="normal" if result["summary"]["validation_issue_count"] == 0 else "disabled")
            except Exception as exc:
                prepared.clear()
                apply_button.configure(state="disabled")
                messagebox.showerror(tr("Пакет исправлений отклонён"), str(exc), parent=dialog)

        def apply_batch():
            if not prepared or prepared.get("source") != self._document_snapshot():
                messagebox.showwarning(tr("Пакет исправлений"), tr("Сначала выполните предварительный просмотр пакета."), parent=dialog)
                return
            result = prepared.get("report")
            if not isinstance(result, dict):
                return
            count = result["summary"]["applied_count"]
            if not messagebox.askyesno(
                tr("Применить пакет"),
                tr("Применить {count} исправлений одной операцией?\n\nДокумент изменится только в памяти редактора. Файл на диске не перезаписывается.").format(count=count),
                parent=dialog,
            ):
                return
            try:
                self._commit_link_repairs_batch(replacements, sorted(clears))
                self.status.set(tr_dynamic(f"Пакет исправлений применён: {count} операций"))
                dialog.destroy()
            except Exception as exc:
                messagebox.showerror(tr("Пакет исправлений"), str(exc), parent=dialog)

        add_button.configure(command=stage_remap)
        clear_button.configure(command=stage_clear)
        preview_button.configure(command=preview_batch)
        apply_button.configure(command=apply_batch)
        tree.bind("<<TreeviewSelect>>", update_selection)
        for item in issues:
            selector = item["selector"]
            tree.insert("", "end", iid=selector, values=(
                selector, item["endpoint_id"], tr(item["expected_domain_label"]),
                tr("Разрешено") if item["can_clear"] else tr("Запрещено"),
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
            parent=self, title=tr("Выберите старую версию проекта для сравнения"),
            filetypes=[("IS-2 project", "*.is2 *.xml"), ("All files", "*.*")],
        )
        if not reference_name:
            return
        try:
            reference = ProjectDocument.load(reference_name)
            diff = compare_documents(reference, self.doc)
        except Exception as exc:
            messagebox.showerror(tr("Сравнение проектов"), str(exc), parent=self)
            return
        if not diff.operations:
            messagebox.showinfo(tr("Сравнение проектов"), tr("Семантических различий не обнаружено."), parent=self)
            self.status.set(tr("Сравнение версий: различий нет"))
            return

        dialog = tk.Toplevel(self)
        dialog.title(tr("Сравнение версий .is2 — выборочное восстановление"))
        dialog.geometry("1160x700")
        dialog.minsize(900, 540)
        dialog.transient(self)
        summary = diff.summary
        ttk.Label(
            dialog,
            text=tr("Сравниваемая версия: {reference}    |    Текущая: {current}\nИзменений: {total} · удалено: {removed} · добавлено: {added} · атрибуты: {attributes} · текст: {text} · неоднозначных: {ambiguous}").format(
                reference=Path(reference_name).name,
                current=self.path.name if self.path else tr("несохранённый проект"),
                total=summary['total'], removed=summary['removed_in_current'], added=summary['added_in_current'],
                attributes=summary['modified_attributes'], text=summary['modified_text'], ambiguous=summary['ambiguous']),
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
        tree = GridTreeview(table_frame, columns=columns, show="headings", selectmode="extended")
        headings = {
            "kind": tr("Изменение"), "path": tr("XML-путь"), "description": tr("Описание"),
            "reference": tr("Старая версия"), "current": tr("Текущая версия"), "risk": tr("Сопоставление"),
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
            "removed": tr("Удалено в текущей"),
            "added": tr("Добавлено в текущей"),
            "modified_attribute": tr("Изменён атрибут"),
            "modified_text": tr("Изменён текст"),
        }
        operations = {item.operation_id: item for item in diff.operations}
        for operation in diff.operations:
            old_value = operation.reference_value
            new_value = operation.current_value
            old_display = "∅" if old_value is None else str(old_value).replace("\n", " ")[:140]
            new_display = "∅" if new_value is None else str(new_value).replace("\n", " ")[:140]
            if operation.kind == "removed":
                old_display, new_display = tr("Фрагмент XML <{tag}>").format(tag=operation.tag), tr("отсутствует")
            elif operation.kind == "added":
                old_display, new_display = tr("отсутствует"), tr("Фрагмент XML <{tag}>").format(tag=operation.tag)
            tree.insert("", "end", iid=operation.operation_id, values=(
                kind_labels.get(operation.kind, operation.kind),
                operation.path and "/" + "/".join(
                    f"{part['tag']}[@{part['key_attribute']}={part['key_value']}]" if "key_attribute" in part
                    else f"{part['tag']}[{part['index']}]" for part in operation.path
                ) or "/project",
                operation.description, old_display, new_display,
                tr("ПОЗИЦИОННЫЙ") if operation.ambiguous else (tr("Можно восстановить") if operation.can_restore else tr("Только чтение")),
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
        ttk.Checkbutton(controls, text=tr("Разрешить позиционное восстановление неоднозначных узлов"), variable=allow_ambiguous).pack(side="left")
        ttk.Checkbutton(controls, text=tr("Удалять добавленные узлы"), variable=revert_additions).pack(side="left", padx=(12, 0))
        ttk.Checkbutton(controls, text=tr("Включать связанные записи"), variable=include_related).pack(side="left", padx=(12, 0))

        def select_safe():
            safe = [item.operation_id for item in diff.operations if item.can_restore and not item.ambiguous]
            tree.selection_set(safe)
            if safe:
                tree.see(safe[0])

        def restore_selected():
            selected = list(tree.selection())
            if not selected:
                messagebox.showinfo(tr("Выборочное восстановление"), tr("Выберите одну или несколько строк."), parent=dialog)
                return
            bundle_report = None
            effective_selection = selected
            try:
                if include_related.get():
                    effective_selection, bundle_report = expand_related_restore_bundle(
                        reference, self.doc, selected,
                    )
            except Exception as exc:
                messagebox.showerror(tr("Анализ связанных записей"), str(exc), parent=dialog)
                return
            added_count = len(effective_selection) - len(selected)
            question = (
                tr("Применить {count} операций к текущему проекту?").format(count=len(effective_selection))
                + ("\n\n" + tr("Автоматически включено связанных операций: {count}.").format(count=added_count) if added_count else "")
                + "\n\n" + tr("Изменится только документ в памяти. Запись в .is2 выполняется отдельно кнопкой «Сохранить».")
            )
            if not messagebox.askyesno(tr("Подтверждение восстановления"), question, parent=dialog):
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
                    tr("Проверка структуры: PASS")
                    if report["validation_issue_count_after"] == 0
                    else tr("Новых ошибок не добавлено; прежних замечаний остаётся: {count}").format(count=report['validation_issue_count_after'])
                )
                bundle_note = ("\n" + tr("Связанных операций включено автоматически: {count}.").format(count=added_count)) if bundle_report else ""
                if bundle_report and bundle_report.get("warnings"):
                    bundle_note += "\n" + tr("Внимание: есть непрозрачные записи; проверьте их вручную.")
                messagebox.showinfo(
                    tr("Выборочное восстановление"),
                    tr("Восстановлено операций: {count}{bundle_note}\n{validation_note}\nПроверка XML writer: PASS\n\nИзменения находятся в памяти. Сохраните проект, чтобы записать результат в отдельный .is2 файл.").format(
                        count=report['restored_count'], bundle_note=bundle_note, validation_note=validation_note
                    ),
                    parent=self,
                )
            except Exception as exc:
                messagebox.showerror(tr("Восстановление заблокировано"), str(exc), parent=dialog)

        ttk.Button(controls, text=tr("Выбрать безопасные"), command=select_safe).pack(side="right", padx=(6, 0))
        ttk.Button(controls, text=tr("Восстановить выбранное"), command=restore_selected).pack(side="right", padx=(6, 0))
        ttk.Button(controls, text=tr("Закрыть"), command=dialog.destroy).pack(side="right", padx=(6, 0))
        dialog.bind("<Escape>", lambda _event: dialog.destroy())
        dialog.grab_set()
        self.status.set(tr("Сравнение версий: {count} изменений").format(count=summary['total']))

    def show_relationship_graph_diff(self):
        """Open a side-by-side visual comparison of recovered relationship graphs."""
        if self.doc is None:
            return
        reference_name = filedialog.askopenfilename(
            parent=self, title=tr("Выберите версию проекта для сравнения графов"),
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
            messagebox.showerror(tr("Сравнение графов"), str(exc), parent=self)
            return

        dialog = tk.Toplevel(self)
        dialog.title(tr("Сопоставление графов связей — PzKpfw"))
        dialog.geometry("1420x820")
        dialog.minsize(1000, 620)
        dialog.transient(self)
        summary = report["summary"]
        ttk.Label(
            dialog,
            text=tr("Добавлено узлов: {added_nodes} · удалено: {removed_nodes} · изменено: {changed_nodes} · добавлено связей: {added_edges} · удалено связей: {removed_edges} · переназначено конечных точек: {rewired_edges}").format(**summary),
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

        add_graph_panel(tr("Старая версия · {name}").format(name=Path(reference_name).name), old_graph, "reference")
        add_graph_panel(tr("Текущая версия · {name}").format(name=self.path.name if self.path else tr("нет файла")), new_graph, "current")

        footer = ttk.Frame(dialog, padding=8)
        footer.pack(fill="x")
        details = (
            tr("Оранжевый — изменённый узел/конечная точка; красный — удалённое из текущей версии; зелёный — добавленное в текущей версии. Рёбра показывают слоты конечных точек и не задают дополнительную семантику направления.")
            + "\n" + "\n".join(report["warnings"])
        )
        ttk.Label(footer, text=details, wraplength=1200, justify="left").pack(side="left", fill="x", expand=True)
        ttk.Button(footer, text=tr("Закрыть"), command=dialog.destroy).pack(side="right")
        self.status.set(tr("Сравнение графов связей завершено"))

    def show_three_way_merge(self):
        """Resolve a three-way merge against the open local project."""
        if self.doc is None:
            return
        base_name = filedialog.askopenfilename(
            parent=self, title=tr("Выберите общий базовый проект"),
            filetypes=[("IS-2 project", "*.is2 *.xml"), ("All files", "*.*")],
        )
        if not base_name:
            return
        theirs_name = filedialog.askopenfilename(
            parent=self, title=tr("Выберите входящую версию проекта"),
            filetypes=[("IS-2 project", "*.is2 *.xml"), ("All files", "*.*")],
        )
        if not theirs_name:
            return
        try:
            base = ProjectDocument.load(base_name)
            theirs = ProjectDocument.load(theirs_name)
            preview, report = merge_documents(base, self.doc, theirs)
        except Exception as exc:
            messagebox.showerror(tr("Трёхстороннее объединение"), str(exc), parent=self)
            return

        dialog = tk.Toplevel(self)
        dialog.title(tr("Трёхстороннее объединение .is2"))
        dialog.geometry("1120x700")
        dialog.minsize(860, 520)
        dialog.transient(self)
        ttk.Label(
            dialog,
            text=tr("База: {base} · локальная версия: {local} · входящая версия: {incoming}\nКонфликтов: {conflicts} · неразрешённых: {unresolved}").format(
                base=Path(base_name).name, local=self.path.name if self.path else tr("нет файла"),
                incoming=Path(theirs_name).name, conflicts=report['conflict_count'], unresolved=report['unresolved_conflict_count']),
            padding=8, justify="left",
        ).pack(fill="x")
        ttk.Label(dialog,
                  text=tr("Независимые изменения объединяются автоматически. Неразрешённые конфликты сохраняют локальное значение в предварительном просмотре и блокируют применение."),
                  foreground="#9a3412", wraplength=1060, padding=(8, 0, 8, 6)).pack(fill="x")

        split = ttk.Panedwindow(dialog, orient="vertical")
        split.pack(fill="both", expand=True, padx=8, pady=6)
        list_frame = ttk.Frame(split)
        detail_frame = ttk.Frame(split)
        split.add(list_frame, weight=4)
        split.add(detail_frame, weight=2)
        columns = ("kind", "path", "field", "resolution")
        tree = GridTreeview(list_frame, columns=columns, show="headings", selectmode="browse")
        headings = {"kind": tr("Конфликт"), "path": tr("XML-путь"), "field": tr("Поле"), "resolution": tr("Решение")}
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
                conflict["kind"], conflict["path"], conflict.get("field") or "—", tr("Неразрешённое"),
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
            values[-1] = {"ours": tr("Локальная"), "theirs": tr("Входящая"), "base": tr("Базовая")}[choice]
            tree.item(conflict_id, values=values)

        ttk.Button(choice_bar, text=tr("Оставить локальную"), command=lambda: set_choice("ours")).pack(side="left")
        ttk.Button(choice_bar, text=tr("Принять входящую"), command=lambda: set_choice("theirs")).pack(side="left", padx=6)
        ttk.Button(choice_bar, text=tr("Вернуться к базе"), command=lambda: set_choice("base")).pack(side="left")

        actions = ttk.Frame(dialog, padding=8)
        actions.pack(fill="x")
        def apply_merge():
            try:
                candidate, merge_report = merge_documents(base, self.doc, theirs, resolutions=resolutions)
                if not merge_report["ready_to_write"]:
                    unresolved = [item["conflict_id"] for item in merge_report["conflicts"] if item["resolution"] is None]
                    messagebox.showwarning(
                        tr("Есть неразрешённые конфликты"),
                        tr("Перед применением выберите сторону для каждого конфликта: {conflicts}").format(conflicts=", ".join(unresolved)),
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
                    tr("Объединение завершено"),
                    tr("Конфликтов разрешено: {count}\nПроверка структуры: PASS\nПроверка XML writer: PASS\n\nИзменения находятся в памяти. Сохраните проект отдельно, чтобы записать результат.").format(count=merge_report['conflict_count']),
                    parent=self,
                )
            except Exception as exc:
                messagebox.showerror(tr("Объединение заблокировано"), str(exc), parent=dialog)
        ttk.Button(actions, text=tr("Применить объединение"), command=apply_merge).pack(side="right")
        ttk.Button(actions, text=tr("Закрыть"), command=dialog.destroy).pack(side="right", padx=(0, 6))
        if report["conflicts"]:
            tree.selection_set(report["conflicts"][0]["conflict_id"])
            show_conflict()
        self.status.set(tr("Предварительный просмотр объединения: {count} конфликтов").format(count=report['conflict_count']))
        dialog.bind("<Escape>", lambda _event: dialog.destroy())
        dialog.grab_set()

    def show_dependency_audit(self):
        if self.doc is None:
            return
        report = dependency_report(self.doc)
        lines = [
            tr("Узлов проекта: {count}").format(count=report['entity_count']),
            tr("Известных ссылок: {count}").format(count=report['reference_count']),
            tr("Неразрешённых ссылок: {count}").format(count=report['dangling_count']),
            tr("Непрозрачных записей: {count}").format(count=report['opaque_count']),
            "",
        ]
        for item in report["entities"]:
            if item["references"] or item["opaque_risk"]:
                risk = tr("ЗАБЛОКИРОВАНО/НЕИЗВЕСТНО") if item["opaque_risk"] else tr("ЕСТЬ ССЫЛКИ")
                domain_labels = {
                    "action": tr("Действие"), "category": tr("Категория"),
                    "spz_element": tr("Элемент spz"), "parameter": tr("Параметр"),
                    "object": tr("Объект"),
                }
                lines.append(f"{domain_labels.get(item['domain'], item['domain'])} #{item['id']} — {item['label']} [{risk}]")
                for reference in item["references"]:
                    lines.append(f"  • {reference['relation_kind']}[{reference['record_index']}].{reference['slot']}")
                if item["opaque_risk"]:
                    lines.append("  • " + tr("Есть непрозрачные записи: операция требует дополнительной проверки"))
                else:
                    lines.append("  • " + tr("Удаление возможно только через проверенный каскад, если модель подтвердит его безопасность"))
        if len(lines) == 5:
            lines.append(tr("Видимых зависимостей не найдено."))
        dialog = tk.Toplevel(self); dialog.title(tr("Аудит зависимостей проекта")); dialog.geometry("760x520")
        text = tk.Text(dialog, wrap="none", font=("Consolas", 9)); text.pack(fill="both", expand=True, padx=8, pady=8)
        text.insert("1.0", "\n".join(lines)); text.configure(state="disabled")
        ttk.Button(dialog, text=tr("Закрыть"), command=dialog.destroy).pack(anchor="e", padx=8, pady=(0, 8))

    def _set_title(self):
        name = self.path.name if self.path else "без проекта"
        dirty = " *" if self.dirty else ""
        self.title(f"PzKpfw — {name}{dirty}")
        self.file_label.configure(text=(self.path.name + dirty) if self.path else tr("Файл не открыт"))

    def _mark_dirty(self, message="Изменения не сохранены", *, operation_group=None):
        # Localize controlled status/history templates after their IDs and
        # counters have been formatted by the operation handler.
        message = tr_dynamic(message)
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
        self.status.set(f"{tr(operation)}: {label}")
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
        return not self.dirty or messagebox.askyesno(tr("Несохранённые изменения"), tr("Сохранить изменения перед продолжением?"), parent=self)

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
            self.status.set(tr("Проект создан. Добавляйте действия, параметры и сохраняйте .is2 через Ctrl+S"))
        except Exception as exc:
            messagebox.showerror(tr("Новый проект"), str(exc), parent=self)

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
            self.status.set(tr("Создан новый проект. Используйте «Сохранить как…» для записи .is2"))
        except Exception as exc:
            messagebox.showerror(tr("Новый проект"), str(exc), parent=self)

    def open_file(self):
        target = filedialog.askopenfilename(parent=self, title=tr("Открыть проект IS-2"), filetypes=[("IS-2 project", "*.is2 *.xml"), ("All files", "*.*")])
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
            status_text = tr_dynamic(
                f"Открыт: {self.path.name} — {len(doc.actions)} действий, "
                f"{len(doc.concept_structure.categories)} категорий; замечаний: {len(issues)}"
            )
            if view_warning:
                status_text += " · " + tr_dynamic(f"Настройки графа не загружены: {view_warning}")
            self.status.set(status_text)
            self._set_title()
        except Exception as exc:
            messagebox.showerror(tr("Ошибка открытия"), str(exc), parent=self)

    def _save_prompt(self) -> bool:
        answer = messagebox.askyesnocancel(tr("Несохранённые изменения"), tr("Сохранить изменения?"), parent=self)
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
            messagebox.showerror(tr("Проверка не пройдена"), tr("Сохранение остановлено:\n\n{issues}").format(issues="\n".join(issues[:30])), parent=self)
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
            status_text = tr_dynamic(f"Сохранено: {self.path}")
            if backup_info:
                status_text += tr_dynamic(f"; резервная копия: {backup_info.path.name}")
            self.status.set(status_text)
            self._set_title()
            return True
        except Exception as exc:
            messagebox.showerror(tr("Ошибка сохранения"), str(exc), parent=self)
            return False

    def save_as(self):
        if self.doc is None:
            return False
        target = filedialog.asksaveasfilename(parent=self, title=tr("Сохранить проект"), defaultextension=".is2", filetypes=[("IS-2 project", "*.is2"), ("XML", "*.xml")])
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
            messagebox.showinfo(tr("Резервные копии"), tr("Сначала сохраните проект в файл .is2."), parent=self)
            return
        records = list_project_backups(self.path)
        window = tk.Toplevel(self)
        window.title(f"Резервные копии — {self.path.name}")
        window.geometry("900x430")
        window.transient(self)
        ttk.Label(window, text=tr("Резервные копии хранятся отдельно от .is2 в .pzkpfw-backups. Восстановление текущего файла сначала создаёт rollback-копию."), padding=8, wraplength=850).pack(anchor="w")
        tree = GridTreeview(window, columns=("created", "size", "valid", "hash"), show="headings", selectmode="browse")
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
        backup_button = ttk.Button(buttons, text=tr("Создать резервную копию сейчас"))
        backup_button.pack(side="left")
        restore_button = ttk.Button(buttons, text=tr("Восстановить выбранную копию"), state="normal" if records else "disabled")
        restore_button.pack(side="left", padx=6)
        ttk.Button(buttons, text=tr("Закрыть"), command=window.destroy).pack(side="right")

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
                messagebox.showinfo(tr("Резервная копия"), tr("Копия проверена и сохранена:\n{path}").format(path=info.path), parent=window)
            except Exception as exc:
                messagebox.showerror(tr("Резервная копия"), str(exc), parent=window)

        def restore_selected():
            selection = tree.selection()
            if not selection:
                return
            record = by_iid[selection[0]]
            if not record.valid_xml:
                messagebox.showerror(tr("Восстановление"), tr("Эта резервная копия не прошла проверку XML."), parent=window)
                return
            if self.dirty:
                answer = messagebox.askyesnocancel(tr("Несохранённые изменения"), tr("Сохранить текущие изменения перед восстановлением?"), parent=window)
                if answer is None:
                    return
                if answer and not self.save():
                    return
            if not messagebox.askyesno(
                tr("Подтверждение восстановления"),
                tr("Заменить текущий проект копией от {created_at}?\n\nТекущий файл будет автоматически сохранён в отдельную rollback-копию.").format(created_at=record.created_at),
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
                self.status.set(tr("Восстановлено из {backup}; rollback: {rollback}").format(
                    backup=record.path.name,
                    rollback=rollback.path.name if rollback else tr("не создавался"),
                ))
                self._update_history_controls()
                window.destroy()
                messagebox.showinfo(
                    tr("Восстановление завершено"),
                    tr("Проект восстановлен.\nRollback-копия: {path}").format(
                        path=rollback.path if rollback else tr("не требовалась")
                    ), parent=self,
                )
            except Exception as exc:
                messagebox.showerror(tr("Ошибка восстановления"), str(exc), parent=window)

        backup_button.configure(command=create_backup_now)
        restore_button.configure(command=restore_selected)
        tree.bind("<<TreeviewSelect>>", lambda _e: restore_button.configure(state="normal" if tree.selection() else "disabled"))
        window.grab_set()

    def _update_history_icons(self):
        dark = self.theme_name.get() == 'dark'
        normal = '#f3f3f8' if dark else '#242536'
        disabled = '#aaaabd' if dark else '#65697d'
        # Keep references for Tk and use state-specific colours automatically.
        self._history_icons = [
            make_history_icon(self, normal), make_history_icon(self, disabled),
            make_history_icon(self, normal, redo=True), make_history_icon(self, disabled, redo=True),
        ]
        self.undo_button.configure(image=(self._history_icons[0], 'disabled', self._history_icons[1]))
        self.redo_button.configure(image=(self._history_icons[2], 'disabled', self._history_icons[3]))

    def _tooltip_label(self):
        return tr('Подсказки: вкл') if self.tooltips_enabled.get() else tr('Подсказки: выкл')

    def toggle_tooltips(self):
        enabled = not self.tooltips_enabled.get()
        self.tooltips_enabled.set(enabled)
        self.tooltip_button_text.set(self._tooltip_label())
        self.button_tooltips.hide()
        if not save_tooltips(enabled):
            messagebox.showwarning(tr('Настройки'), tr('Подсказки переключены, но сохранить настройку не удалось.'), parent=self)

    def _populate_language_menu(self):
        self.language_menu.delete(0, "end")
        for language in available_languages():
            self.language_menu.add_radiobutton(
                label=language.menu_label,
                variable=self.language_code,
                value=language.locale,
                command=lambda code=language.locale: self.change_language(code),
            )
        self.language_menu.add_separator()
        self.language_menu.add_command(label=tr("Открыть папку языков…"), command=self.open_language_folder)
        self.language_menu.add_command(label=tr("Обновить список языков"), command=self.refresh_language_menu)

    def refresh_language_menu(self):
        """Rescan external language folders without restarting the application."""
        discover_languages()
        if self.language_code.get() not in {item.locale for item in available_languages()}:
            self.language_code.set(get_language())
        self._populate_language_menu()
        errors = pack_errors()
        self.status.set(tr("Список языковых пакетов обновлён."))
        if errors:
            messagebox.showwarning(
                tr("Языковые пакеты"),
                tr("Некоторые языковые пакеты не загружены:") + "\n\n" + "\n".join(errors),
                parent=self,
            )

    def open_language_folder(self):
        """Open the per-user locale directory and place a non-loadable template inside it."""
        import os
        import shutil
        import subprocess
        folder = user_locales_dir()
        folder.mkdir(parents=True, exist_ok=True)
        source = Path(__file__).resolve().parent / "locales" / "_template"
        target = folder / "_template"
        target.mkdir(exist_ok=True)
        for name in ("language.json", "messages.json"):
            src = source / name
            dst = target / name
            if src.exists() and not dst.exists():
                shutil.copy2(src, dst)
        try:
            if sys.platform == "win32":
                os.startfile(str(folder))
            elif sys.platform == "darwin":
                subprocess.Popen(["open", str(folder)])
            else:
                subprocess.Popen(["xdg-open", str(folder)])
        except (OSError, AttributeError):
            messagebox.showinfo(tr("Папка языков"), str(folder), parent=self)

    def _apply_language_direction(self):
        """Apply basic right alignment for RTL packs (Tk has no full BiDi layout API)."""
        if get_language_info().direction != "rtl":
            return
        pending = list(self.winfo_children())
        while pending:
            widget = pending.pop()
            try:
                pending.extend(widget.winfo_children())
            except tk.TclError:
                pass
            try:
                options = set(widget.keys())
                if "justify" in options:
                    widget.configure(justify="right")
                if isinstance(widget, (tk.Entry, tk.Text)):
                    widget.configure(justify="right")
            except (tk.TclError, AttributeError):
                pass

    def change_language(self, locale: str):
        """Persist a language choice and offer a safe restart to rebuild all widgets."""
        previous = get_language()
        if locale == previous:
            return
        if self.dirty:
            save_choice = messagebox.askyesnocancel(
                tr("Смена языка"),
                tr("Сохранить изменения текущего проекта перед перезапуском? При ответе «Нет» несохранённые изменения будут потеряны."),
                parent=self,
            )
            if save_choice is None:
                self.language_code.set(previous)
                return
            if save_choice:
                self.save()
                if self.dirty:
                    self.language_code.set(previous)
                    return
        try:
            saved = save_language_preference(locale)
        except Exception as exc:
            self.language_code.set(previous)
            messagebox.showerror(tr("Язык интерфейса"), str(exc), parent=self)
            return
        if not saved:
            self.language_code.set(previous)
            messagebox.showwarning(
                tr("Настройки"),
                tr("Язык выбран, но сохранить настройку не удалось."),
                parent=self,
            )
            return
        restart = messagebox.askyesno(
            tr("Язык интерфейса"),
            tr("Язык сохранён. Перезапустить PzKpfw сейчас, чтобы применить его ко всем окнам?"),
            parent=self,
        )
        if restart:
            self._restart_application()
        else:
            messagebox.showinfo(
                tr("Язык интерфейса"),
                tr("Новый язык будет применён при следующем запуске программы."),
                parent=self,
            )

    def _restart_application(self):
        """Replace this process so module-level labels and all dialogs use the new locale."""
        import os
        if getattr(sys, "frozen", False):
            args = [sys.executable, *sys.argv[1:]]
        else:
            args = [sys.executable, "-m", "is2_re.gui", *sys.argv[1:]]
        os.execv(sys.executable, args)

    def _update_theme_button(self):
        self.theme_button.configure(text=('☼  ' + tr('Светлая')) if self.theme_name.get() == 'dark' else ('☾  ' + tr('Тёмная')))

    def toggle_theme(self):
        self.theme_name.set('light' if self.theme_name.get() == 'dark' else 'dark')
        self.change_theme()

    def change_theme(self):
        name = self.theme_name.get()
        apply_theme(self, name)
        self._update_theme_button()
        self._update_history_icons()
        self.course_panel._draw()
        self.decomposition_panel.draw()
        self._draw_matrix_groups()
        self.matrix_tree._schedule()
        self._refresh_diagram()
        self._refresh_graph()
        if not save_theme(name):
            messagebox.showwarning(tr("Настройки"), tr("Тема применена, но сохранить её для следующего запуска не удалось."), parent=self)

    def show_feature_audit(self):
        if self.doc is None:
            messagebox.showinfo(tr("Обзор возможностей"), tr("Сначала откройте проект."), parent=self)
            return
        report = feature_audit(self.doc)
        window = tk.Toplevel(self)
        window.title(tr("Возможности и ограничения проекта"))
        window.geometry("850x620")
        ttk.Label(window, text=tr("Аудит восстановленных функций"), font=("TkDefaultFont", 14, "bold"), padding=12).pack(anchor="w")
        ttk.Label(window, text=tr("Статус экспериментальных функций не означает полного соответствия ИС-2."), padding=(12, 0)).pack(anchor="w")
        frame = ttk.Frame(window, padding=12)
        frame.pack(fill="both", expand=True)
        scroll = ttk.Scrollbar(frame)
        scroll.pack(side="right", fill="y")
        text = tk.Text(frame, wrap="word", yscrollcommand=scroll.set)
        text.pack(fill="both", expand=True)
        scroll.config(command=text.yview)
        labels = {"implemented_tested_locally": tr("реализовано, проверено локально"), "partially_reconstructed": tr("частично восстановлено"), "experimental": tr("экспериментально"), "unknown": tr("не изучено"), "not_implemented": tr("не реализовано"), "not_tested": tr("не проверено")}
        lines = [tr("Проект: {project}").format(project=report['project']), tr("Действий: {actions}; параметров: {parameters}; записей матрицы: {matrix_records}").format(actions=report['action_count'], parameters=report['parameter_count'], matrix_records=report['matrix_record_count']), "", tr("ВОЗМОЖНОСТИ")]
        for item in report['capabilities']:
            lines.append(f"• {item['id']} — {labels.get(item['status'], item['status'])}\n  {tr(item['evidence'])}")
        lines += ["", tr("ДАННЫЕ ДЛЯ ДАЛЬНЕЙШЕЙ ПРОВЕРКИ")]
        for item in report['missing_reference_data']:
            lines.append(f"• {item['item']}: {tr(item['needed'])}")
        lines += ["", tr("Проверка оригинальной ИС-2: НЕ ВЫПОЛНЕНА.")]
        text.insert("1.0", "\n".join(lines))
        text.configure(state="disabled")
        ttk.Button(window, text=tr("Закрыть"), command=window.destroy).pack(anchor="e", padx=12, pady=(0,12))
        apply_theme(self, self.theme_name.get())

    def validate_project(self):
        if self.doc is None:
            return
        issues = self.doc.validate()
        if issues:
            messagebox.showwarning(tr("Проверка проекта"), tr("Найдены проблемы:\n\n{issues}").format(issues="\n".join(issues[:40])), parent=self)
            self.status.set(tr_dynamic(f"Проверка: {len(issues)} проблем"))
        else:
            messagebox.showinfo(tr("Проверка проекта"), tr("Структура проекта корректна."), parent=self)
            self.status.set(tr("Проверка: PASS"))

    def check_compatibility(self):
        if self.doc is None:
            return
        report = audit_document(self.doc)
        summary = report["relationship_graph_summary"]
        lines = [
            tr_dynamic(f"Формат: {tr(report['format'])}"),
            tr_dynamic(f"Нативная оболочка: {report['native_envelope']}"),
            tr_dynamic(f"Проверка структуры: {report['structural_validation']}"),
            tr_dynamic(f"Сохранение XML без потери дерева: {report['writer_semantic_roundtrip']}"),
            tr_dynamic(f"Повторная сериализация стабильна: {report['writer_idempotent_roundtrip']}"),
            tr_dynamic(f"Проверка повторно открытого XML: {report['writer_reopened_validation']}"),
            tr_dynamic(f"Endpoint-ов в графе: {summary['endpoint_count']}; неразрешённых: {summary['dangling_endpoint_count']}"),
            tr_dynamic(f"PzKpfw-разметка в файл не добавляется: {not report['pzkpfw_private_markup_added']}"),
            tr_dynamic(f"Количество записей ModuleParams / Module: {report['module_params_module_count']}"),
            tr_dynamic(f"Оригинальная ИС-2 (Windows runtime): {report['original_is2_runtime_acceptance']}"),
        ]
        if report["runtime_risk_notes"]:
            lines.extend(["", tr("Замечания:"), *(tr(note) for note in report["runtime_risk_notes"])])
        lines.extend(["", tr(report["runtime_note"])])
        if all(report[key] == "PASS" for key in ("native_envelope", "structural_validation", "writer_semantic_roundtrip", "writer_idempotent_roundtrip", "writer_reopened_validation")):
            messagebox.showinfo(tr("Совместимость с ИС-2"), "\n".join(lines), parent=self)
            self.status.set(tr("Совместимость: XML writer PASS; оригинальный runtime не проверен"))
        else:
            messagebox.showwarning(tr("Совместимость с ИС-2"), "\n".join(lines), parent=self)
            self.status.set(tr("Совместимость: найдены структурные проблемы"))

    def _refresh_or_defer(self, key, widget, callback):
        if widget.winfo_ismapped():
            self._deferred_views.discard(key)
            callback()
        else:
            self._deferred_views.add(key)

    def _flush_deferred_view(self, key):
        if key not in self._deferred_views:
            return
        self._deferred_views.discard(key)
        if self.doc is not None:
            {'diagram': self._refresh_diagram, 'graph': self._refresh_graph}[key]()

    def refresh_all(self):
        if self.doc is None:
            return
        self._refresh_metadata()
        self._refresh_actions()
        self.course_panel.refresh()
        self._refresh_matrix()
        self._refresh_or_defer('diagram', self.diagram_canvas, self._refresh_diagram)
        self._refresh_params()
        self._refresh_objects()
        self._refresh_categories()
        self._refresh_links()
        self._refresh_other()
        self._refresh_or_defer('graph', self.graph_canvas, self._refresh_graph)
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
            messagebox.showerror(tr("Паспорт проекта"), str(exc), parent=self)

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
        self.decomposition_panel.refresh()

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
        objects = {node.get('id', ''): node.get('name', '') for node in self.doc.objects_node}
        for row, node in enumerate(self.doc.params_node.findall("param"), start=1):
            ref = node.get('o', '')
            object_label = (f"{objects[ref]} (ID {ref})" if ref in objects else (f"Не найден (ID {ref})" if ref and ref != '0' else '—'))
            values = (row, group_label(node.get('group', '')), node.get('codingType', ''),
                      node.get('number', ''), object_label, node.get('sign', ''),
                      node.get('name', ''), node.get('id', ''))
            self.param_tree.insert("", "end", iid=node.get("id", ""), values=values)

    def _refresh_objects(self):
        if self.doc is None:
            return
        self.object_tree.delete(*self.object_tree.get_children())
        for row_number, node in enumerate(self.doc.objects_node, start=1):
            self.object_tree.insert("", "end", iid=node.get("id", ""), values=(row_number, node.get("id", ""), node.get("name", ""), json.dumps(node.attrib, ensure_ascii=False)))

    def _refresh_categories(self):
        if self.doc is None:
            return
        selected = set(self.category_tree.selection()) if self.category_tree.selection() else set()
        self.category_tree.delete(*self.category_tree.get_children())
        records = self.doc.concept_structure.category_records()
        search = self.concept_search_var.get().strip().casefold() if hasattr(self, "concept_search_var") else ""
        all_label = tr("Все")
        class_filter = self.concept_class_filter.get() if hasattr(self, "concept_class_filter") else all_label
        available_groups = sorted({record.group for record in records})
        group_values = (all_label, *(str(value) for value in available_groups))
        if hasattr(self, "concept_group_combo"):
            current_group = self.concept_group_filter.get()
            self.concept_group_combo.configure(values=group_values)
            if current_group not in group_values:
                self.concept_group_filter.set(all_label)
        group_filter = self.concept_group_filter.get() if hasattr(self, "concept_group_filter") else all_label
        for record in records:
            if class_filter != all_label and record.class_char != class_filter:
                continue
            if group_filter != all_label and str(record.group) != group_filter:
                continue
            haystack = f"{record.id} {record.name} {record.class_char} {record.class_label} {record.group} {record.number}".casefold()
            if search and search not in haystack:
                continue
            self.category_tree.insert("", "end", iid=record.id, values=(record.id, record.name, f"{record.class_char} — {tr(record.class_label)}", record.group, record.number, record.status, record.coding_type, int(record.auto_range)))
        visible = set(self.category_tree.get_children(""))
        keep = [ident for ident in selected if ident in visible]
        if keep:
            self.category_tree.selection_set(keep)
        report = self.doc.concept_structure.catalog_report()
        duplicate_count = len(report["duplicate_numbers"])
        summary = tr("Категорий: {categories} · классов: {classes} · групп: {groups} · связей cs: {links} · дублирующихся номеров: {duplicates} · показано: {shown}").format(
            categories=report['category_count'], classes=report['class_count'], groups=report['group_count'],
            links=report['link_count'], duplicates=duplicate_count, shown=len(visible),
        )
        if not records:
            summary += " " + tr("В проекте нет категорий cs; это допустимо.")
        elif not visible:
            summary += " " + tr("По выбранным фильтрам ничего не найдено.")
        self.concept_summary_var.set(summary)

    def _refresh_links(self):
        if self.doc is None:
            return
        self.link_tree.delete(*self.link_tree.get_children())
        records = self.doc.concept_structure.link_records()
        for record in records:
            self.link_tree.insert("", "end", iid=record.id, values=(record.id, record.type, record.label, record.e1, record.e2, record.e3, record.range))
        self.concept_links_summary.set(tr('Связей cs: {count}').format(count=len(records)) + (" · " + tr('В проекте нет связей cs; это допустимо.') if not records else ''))

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
            self.status.set(tr("spz: {elements} AElement, связей: {links}; content: {content} AEContentLink (создание / редактирование / удаление доступны)").format(
                elements=len(structure.elements), links=len(structure.links), content=len(structure.content_records)))
            self.dynamic_summary.set(tr("Элементов spz: {elements} · связей spz: {links} · связей content: {content}. Пустые разделы допустимы; проект может использовать только основную модель.").format(
                elements=len(structure.elements), links=len(structure.links), content=len(structure.content_records)))
        except Exception as exc:
            self.status.set(tr("Предупреждение чтения spz/content: {error}").format(error=exc))
            self.dynamic_summary.set(tr("Ошибка чтения spz/content: {error}").format(error=exc))
        self._set_inspector_text(self.spz_link_detail, tr("Выберите запись, чтобы увидеть исходный XML."))
        self._set_inspector_text(self.content_detail, tr("Выберите запись, чтобы увидеть исходный XML."))

    def _selected_attrs(self, tree, parent: ET.Element, tag: str | None = None):
        ident = self._selected_id(tree)
        if not ident:
            messagebox.showinfo(tr("Выбор записи"), tr("Сначала выберите запись."), parent=self)
            return None, None
        candidates = list(parent) if tag is None else parent.findall(tag)
        node = next((n for n in candidates if n.get("id") == ident), None)
        return ident, node

    def _edit_json_record(self, title, current: dict[str, str]) -> dict[str, str] | None:
        dialog = JsonAttributesDialog(self, title, current)
        self.wait_window(dialog)
        return dialog.result

    def _edit_record_at(self, tree, event, edit):
        ident = tree.identify_row(event.y)
        if ident:
            tree.selection_set(ident)
            edit()

    def add_parameter(self):
        if self.doc is None: return
        dialog = ParameterDialog(self, self.doc)
        self.wait_window(dialog)
        attrs = dialog.result
        if attrs is None: return
        if not attrs['o']: attrs.pop('o')
        try:
            ident = self.doc.add_parameter(attrs)
            self._mark_dirty(f"Создан параметр {ident}")
            self.refresh_all()
            self.param_tree.selection_set(ident)
            self.param_tree.see(ident)
        except Exception as exc: messagebox.showerror(tr("Параметр"), str(exc), parent=self)

    def edit_parameter(self):
        if self.doc is None: return
        ident, node = self._selected_attrs(self.param_tree, self.doc.params_node, "param")
        if node is None: return
        dialog = ParameterDialog(self, self.doc, node)
        self.wait_window(dialog)
        if dialog.result is None: return
        data = dialog.result
        try:
            defaults = {'group': '5', 'number': str(data['number']), 'codingType': '1', 'sign': '', 'name': ''}
            changes = {key: value for key, value in data.items() if key != 'o'
                       and value != node.get(key, defaults.get(key, ''))}
            current_object = node.get('o', '')
            object_changed = data['o'] != current_object and not (data['o'] == '' and current_object == '0')
            if object_changed and data['o']:
                self.doc.object(data['o'])
            self.doc.update_parameter(ident, **changes)
            if object_changed:
                self.doc.set_parameter_object(ident, data['o'] or None)
            self._mark_dirty(f"Изменён параметр {ident}")
            self.refresh_all()
            self.param_tree.selection_set(ident)
        except Exception as exc: messagebox.showerror(tr("Параметр"), str(exc), parent=self)

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
        except Exception as exc: messagebox.showerror(tr("Параметр"), str(exc), parent=self)

    def assign_parameter_object(self):
        if self.doc is None:
            return
        parameter_id = self._selected_id(self.param_tree)
        if not parameter_id:
            messagebox.showinfo(tr("Привязка параметра"), tr("Выберите параметр."), parent=self)
            return
        objects = list(self.doc.objects_node)
        if not objects:
            messagebox.showinfo(tr("Привязка параметра"), tr("В проекте нет объектов. Сначала создайте объект."), parent=self)
            return
        choices = tuple(node.get("id", "") for node in objects if node.get("id"))
        current = self.doc.parameter(parameter_id).get("o", "")
        fields = [("object_id", "Объект", current if current in choices else choices[0], choices)]
        dialog = RecordDialog(self, tr("Назначить объект параметру {parameter_id}").format(parameter_id=parameter_id), fields)
        self.wait_window(dialog)
        if dialog.result is None:
            return
        try:
            self.doc.set_parameter_object(parameter_id, dialog.result["object_id"])
            self._mark_dirty(f"Параметру {parameter_id} назначен объект {dialog.result['object_id']}")
            self.refresh_all()
            self.param_tree.selection_set(parameter_id)
        except Exception as exc:
            messagebox.showerror(tr("Привязка параметра"), str(exc), parent=self)

    def clear_parameter_object(self):
        if self.doc is None:
            return
        parameter_id = self._selected_id(self.param_tree)
        if not parameter_id:
            messagebox.showinfo(tr("Привязка параметра"), tr("Выберите параметр."), parent=self)
            return
        current = self.doc.parameter(parameter_id).get("o")
        if current in (None, "", "0"):
            self.status.set(tr_dynamic(f"У параметра {parameter_id} нет назначенного объекта"))
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
                tr("Проверка зависимостей — удаление заблокировано"),
                tr("Параметр {ident} нельзя безопасно удалить: ConceptModel/content содержит {count} записей, а связь этих записей с параметрами не подтверждена. Никаких изменений не внесено.").format(ident=ident, count=content_count),
                parent=self,
            )
            return
        if not messagebox.askyesno(tr("Удаление параметра"), tr("Удалить параметр {ident}?\n\nПроверка: зависимые content-записи отсутствуют.").format(ident=ident), parent=self): return
        try:
            self.doc.delete_parameter(ident); self._mark_dirty(f"Удалён параметр {ident}"); self.refresh_all()
        except Exception as exc: messagebox.showerror(tr("Параметр"), str(exc), parent=self)

    def add_object(self):
        if self.doc is None: return
        dialog = ObjectDialog(self)
        self.wait_window(dialog)
        if dialog.result is None: return
        try:
            ident = self.doc.add_object(dialog.result['name'])
            self._mark_dirty(f"Создан объект {ident}"); self.refresh_all()
            self.object_tree.selection_set(ident)
            self.object_tree.see(ident)
        except Exception as exc: messagebox.showerror(tr("Объект"), str(exc), parent=self)

    def edit_object(self):
        if self.doc is None: return
        ident, node = self._selected_attrs(self.object_tree, self.doc.objects_node)
        if node is None: return
        dialog = ObjectDialog(self, node.get('name', ''))
        self.wait_window(dialog)
        if dialog.result is None or dialog.result['name'] == node.get('name', ''): return
        try:
            self.doc.update_object(ident, name=dialog.result['name'])
            self._mark_dirty(f"Изменён объект {ident}"); self.refresh_all()
            self.object_tree.selection_set(ident)
            self.object_tree.see(ident)
        except Exception as exc: messagebox.showerror(tr("Объект"), str(exc), parent=self)

    def edit_object_advanced(self):
        if self.doc is None: return
        ident, node = self._selected_attrs(self.object_tree, self.doc.objects_node)
        if node is None: return
        attrs = dict(node.attrib); attrs.pop("id", None)
        changed = self._edit_json_record(f"Дополнительные XML-атрибуты объекта {ident}", attrs)
        if changed is None: return
        try:
            self.doc.update_object(ident, **{k: (v if v != "" else None) for k,v in changed.items() if k != "id"})
            for k in set(attrs) - set(changed): self.doc.update_object(ident, **{k: None})
            self._mark_dirty(f"Изменён объект {ident}"); self.refresh_all()
            self.object_tree.selection_set(ident)
            self.object_tree.see(ident)
        except Exception as exc: messagebox.showerror(tr("Объект"), str(exc), parent=self)

    def _dependency_entry(self, domain: str, ident: str) -> dict | None:
        if self.doc is None:
            return None
        return next((item for item in dependency_report(self.doc)["entities"]
                     if item.get("domain") == domain and str(item.get("id")) == str(ident)), None)

    @staticmethod
    def _dependency_note(entry: dict | None) -> str:
        if not entry:
            return tr("Известных ссылок не найдено.")
        parts = [tr("Известных ссылок: {count}.").format(count=entry.get('reference_count', 0))]
        if entry.get("opaque_risk"):
            parts.append(tr("Есть непрозрачные записи; автоматическое каскадирование небезопасно."))
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
                tr("Удаление объекта с зависимостями"),
                tr("Объект {ident} назначен параметрам: {ids}.\n\nУдалить объект и снять атрибут @o у перечисленных параметров?\nОперация будет одной записью Undo.").format(ident=ident, ids=ids), parent=self,
            )
            if not answer:
                return
        elif not messagebox.askyesno(tr("Удаление объекта"), tr("Удалить объект {ident}?\n\nИзвестных привязок параметров нет.").format(ident=ident), parent=self):
            return
        try:
            self.doc.delete_object(ident, clear_parameter_references=bool(references))
            self._mark_dirty(f"Удалён объект {ident}" + (f"; очищено привязок: {len(references)}" if references else ""))
            self.refresh_all()
        except Exception as exc:
            messagebox.showerror(tr("Объект"), str(exc), parent=self)

    def convert_selected_action(self, initial_kind=None):
        if self.doc is None: return
        ident = self._selected_id(self.action_tree)
        if not ident:
            messagebox.showinfo(tr("Действия"), tr("Выберите действие в дереве."), parent=self)
            return
        fields = [("kind", "Тип конструкции", KIND_NAMES.get(initial_kind, "Последовательность"), tuple(KIND_LABELS)),
                  ("replace", "Удалить прежних потомков?", "Нет", ("Нет", "Да")),
                  ("content", "Удалить связи ConceptModel/content?", "Нет", ("Нет", "Да"))]
        dialog = RecordDialog(self, tr("Преобразование действия {ident}").format(ident=ident), fields)
        self.wait_window(dialog)
        if dialog.result is None: return
        d = dialog.result
        destructive = d['replace'] == 'Да' or d['content'] == 'Да'
        if destructive and not messagebox.askyesno(tr("Подтверждение удаления"),
                tr("Потомки и/или межмодельные связи могут быть необратимо удалены из сохранённого файла. Продолжить?"),
                parent=self):
            return
        try:
            convert_action(self.doc, ident, KIND_LABELS[d['kind']],
                           replace_children=d['replace'] == 'Да', drop_content=d['content'] == 'Да')
            self._mark_dirty("Преобразовано действие " + ident)
            self.refresh_all()
        except (ValueError, KeyError, ProjectFormatError) as exc:
            messagebox.showerror(tr("Преобразование действия"), str(exc), parent=self)

    def insert_selected_action(self, after):
        if self.doc is None: return
        ident = self._selected_id(self.action_tree)
        if not ident:
            messagebox.showinfo(tr("Действия"), tr("Выберите дочернее действие в дереве."), parent=self)
            return
        dialog = RecordDialog(self, "Вставка действия", [("name", "Название нового действия", "Новое действие", None)])
        self.wait_window(dialog)
        if dialog.result is None: return
        try:
            insert_sibling(self.doc, ident, after=after, name=dialog.result['name'])
            self._mark_dirty("Добавлено соседнее действие")
            self.refresh_all()
        except (ValueError, KeyError, ProjectFormatError) as exc:
            messagebox.showerror(tr("Вставка действия"), str(exc), parent=self)

    def add_root_action(self): self._action_add(parent_id=None)
    def add_child_action(self):
        if self.doc is None: return
        parent = self._selected_id(self.action_tree)
        if not parent:
            messagebox.showinfo(tr("Действие"), tr("Выберите родительское действие."), parent=self); return
        self._action_add(parent_id=parent)

    def _action_add(self, parent_id):
        if self.doc is None: return
        fields = [
            ("name", "Название", "Новое действие", None),
            ("kind", "Тип конструкции", "Элементарное", tuple(KIND_LABELS)),
            ("formalization", "Формализация", "0", None), ("status", "Статус", "0", None),
            ("mark", "Метка", "", None), ("symbol", "Символ (например z или 122)", "", None),
            ("level", "Уровень", "", None), ("number", "Номер", "", None),
        ]
        dialog = RecordDialog(self, "Новое действие", fields); self.wait_window(dialog)
        if dialog.result is None: return
        data = dialog.result
        try:
            symbol = encode_action_symbol(data['symbol'])
            kind = KIND_LABELS[data['kind']]
            # Composite construction is performed on a clone so a failed
            # conversion cannot leave behind a partially created action.
            staged = self.doc.clone()
            ident = staged.add_action(data["name"], action_type='0', formalization=data["formalization"], status=data["status"], mark=data["mark"], symbol=symbol, level=data["level"] or None, number=data["number"] or None, parent_id=parent_id)
            if kind != 'elementary':
                convert_action(staged, ident, kind)
            self.doc.root = staged.root
            self._mark_dirty(f"Создано действие {ident}"); self.refresh_all()
            self.action_tree.selection_set(ident); self.action_tree.see(ident)
        except (ValueError, KeyError, ProjectFormatError) as exc: messagebox.showerror(tr("Действие"), str(exc), parent=self)

    def edit_action(self):
        if self.doc is None: return
        ident = self._selected_id(self.action_tree)
        if not ident: return messagebox.showinfo(tr("Действие"), tr("Выберите действие."), parent=self)
        node = self.doc.action(ident)
        # Structural type changes must go through the conversion command,
        # otherwise a raw @type update would not create/remove the native links.
        keys = ("name", "formalization", "mark", "symbol", "status", "level", "number")
        fields = [(k, "Символ (буква или код)" if k == "symbol" else k, display_action_symbol(node.get(k, "")) if k == "symbol" else node.get(k, ""), None) for k in keys]
        dialog = RecordDialog(self, tr("Действие {ident}").format(ident=ident), fields); self.wait_window(dialog)
        if dialog.result is None: return
        try:
            changes = {k: (v if v != "" else None) for k,v in dialog.result.items()}
            changes["symbol"] = encode_action_symbol(dialog.result["symbol"])
            self.doc.update_action(ident, **changes)
            self._mark_dirty(f"Изменено действие {ident}"); self.refresh_all(); self.action_tree.selection_set(ident)
        except Exception as exc: messagebox.showerror(tr("Действие"), str(exc), parent=self)

    def delete_action(self):
        if self.doc is None:
            return
        ident = self._selected_id(self.action_tree)
        if not ident:
            return messagebox.showinfo(tr("Действие"), tr("Выберите действие."), parent=self)
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
                tr("Удаление поддерева"),
                tr("Действие {ident} имеет дочерние элементы (всего в поддереве: {count}). Удалить всё поддерево?\n\n{dependency_note}").format(
                    ident=ident, count=len(subtree) - 1,
                    dependency_note=self._dependency_note(self._dependency_entry('action', ident)),
                ),
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
                tr("Удаление зависимостей"),
                tr("С действиями поддерева связано {count} AEContentLink. Удалить и эти связи?\n\n{dependency_note}").format(
                    count=len(content_refs), dependency_note=self._dependency_note(self._dependency_entry('action', ident)),
                ),
                parent=self,
            )
            if not cascade_content:
                return
        if not children and not content_refs and not messagebox.askyesno(
            tr("Удаление действия"), tr("Удалить действие {ident}?\n\n{dependency_note}").format(
                ident=ident, dependency_note=self._dependency_note(self._dependency_entry('action', ident)),
            ), parent=self
        ):
            return
        try:
            self.doc.delete_action(ident, cascade=cascade, cascade_content=cascade_content)
            self._mark_dirty(f"Удалено действие {ident}")
            self.refresh_all()
        except Exception as exc:
            messagebox.showerror(tr("Действие"), str(exc), parent=self)

    def add_category(self):
        if self.doc is None: return
        fields = [("name", "Название", "Новая категория", None), ("class", "Класс (1=S…7=C)", "1", tuple(str(x) for x in range(1,8))), ("group", "Группа", "-1", None), ("number", "Номер", "-1", None), ("status", "Статус", "0", None), ("autoRange", "AutoRange (0/1)", "1", ("0","1")), ("codingType", "CodingType", "1", None)]
        dialog=RecordDialog(self,"Новая SubjectCategory (pk)",fields); self.wait_window(dialog)
        if dialog.result is None: return
        d=dialog.result
        try:
            ident=self.doc.concept_structure.add_category(d["name"],class_id=int(d["class"]),group=int(d["group"]),number=int(d["number"]),status=int(d["status"]),auto_range=d["autoRange"]=="1",coding_type=int(d["codingType"]))
            self._mark_dirty(f"Создана категория {ident}"); self.refresh_all(); self.category_tree.selection_set(ident)
        except Exception as exc: messagebox.showerror(tr("Категория"),str(exc),parent=self)

    def bulk_edit_categories(self):
        if self.doc is None:
            return
        selected = set(self.category_tree.selection())
        if not selected:
            messagebox.showinfo("ConceptModel", tr("Выберите одну или несколько категорий (Ctrl/Shift для множественного выбора)."), parent=self)
            return
        ordered_ids = [ident for ident in self.category_tree.get_children("") if ident in selected]
        current_groups = {self.doc.concept_structure.category(ident).get("group", "-1") for ident in ordered_ids}
        initial_group = next(iter(current_groups)) if len(current_groups) == 1 else "-1"
        fields = [
            ("group", "Новое значение group", initial_group, None),
            ("start_number", "Начальный number (пусто = сохранить прежние)", "", None),
        ]
        dialog = RecordDialog(self, tr("Групповое редактирование ({count} катег.)").format(count=len(ordered_ids)), fields)
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
                self.status.set(tr("Групповое редактирование: значения не изменились"))
                return
            self._mark_dirty(
                f"Групповое редактирование ConceptModel: {len(changed)} категорий",
                operation_group=tuple(f"Категория {ident}: group/number" for ident in changed),
            )
            self.refresh_all()
            if changed:
                self.category_tree.selection_set(*changed)
        except Exception as exc:
            messagebox.showerror(tr("Групповое редактирование ConceptModel"), str(exc), parent=self)

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
        dialog.title(tr("Обзор ConceptModel — PzKpfw"))
        dialog.geometry("820x560")
        text = tk.Text(dialog, wrap="none", font=("Consolas", 9))
        text.pack(fill="both", expand=True, padx=8, pady=8)
        text.insert("1.0", json.dumps(report, ensure_ascii=False, indent=2))
        text.configure(state="disabled")
        ttk.Button(dialog, text=tr("Закрыть"), command=dialog.destroy).pack(anchor="e", padx=8, pady=(0, 8))

    def edit_category(self):
        if self.doc is None: return
        selected = self.category_tree.selection()
        if not selected: return messagebox.showinfo(tr("Категория"),tr("Выберите категорию."),parent=self)
        if len(selected) != 1: return messagebox.showinfo(tr("Категория"),tr("Для индивидуального редактирования выберите ровно одну категорию. Для нескольких используйте «Групповое изменение». "),parent=self)
        ident = selected[0]
        n=self.doc.concept_structure.category(ident)
        fields=[(k,k,n.get(k,""), tuple(str(x) for x in range(1,8)) if k=="class" else (("0","1") if k=="autoRange" else None)) for k in ("name","class","group","number","status","autoRange","codingType")]
        dialog=RecordDialog(self, tr("Категория {ident}").format(ident=ident), fields); self.wait_window(dialog)
        if dialog.result is None: return
        d=dialog.result
        try:
            self.doc.concept_structure.update_category(ident,**{"class":int(d["class"]),"group":int(d["group"]),"number":int(d["number"]),"status":int(d["status"]),"autoRange":d["autoRange"],"codingType":int(d["codingType"]),"name":d["name"]})
            self._mark_dirty(f"Изменена категория {ident}"); self.refresh_all(); self.category_tree.selection_set(ident)
        except Exception as exc: messagebox.showerror(tr("Категория"),str(exc),parent=self)

    def edit_category_attributes(self):
        if self.doc is None:
            return
        selected = self.category_tree.selection()
        if len(selected) != 1:
            messagebox.showinfo(tr("Дополнительные атрибуты"), tr("Выберите ровно одну категорию."), parent=self)
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
            messagebox.showerror(tr("Дополнительные атрибуты"), str(exc), parent=self)

    def edit_concept_link_attributes(self):
        if self.doc is None:
            return
        ident = self._selected_id(self.link_tree)
        if not ident:
            messagebox.showinfo(tr("Дополнительные атрибуты"), tr("Выберите связь ConceptModel/cs."), parent=self)
            return
        node = self.doc.concept_structure.link(ident)
        attributes = {key: value for key, value in node.attrib.items() if key != "id"}
        dialog = JsonAttributesDialog(self, f"XML-атрибуты SCBinaryLink #{ident}", attributes)
        self.wait_window(dialog)
        if dialog.result is None:
            return
        try:
            self.doc.concept_structure.set_link_attributes(ident, dialog.result)
            self._mark_dirty(f"Изменены XML-атрибуты Связь SCBinaryLink {ident}")
            self.refresh_all()
            self.link_tree.selection_set(ident)
        except Exception as exc:
            messagebox.showerror(tr("Дополнительные атрибуты"), str(exc), parent=self)

    def delete_category(self):
        if self.doc is None: return
        selected = self.category_tree.selection()
        if not selected: return messagebox.showinfo(tr("Категория"),tr("Выберите категорию."),parent=self)
        if len(selected) != 1: return messagebox.showinfo(tr("Категория"),tr("Удаляйте категории по одной: у каждой собственный набор зависимостей и каскадных последствий."),parent=self)
        ident = selected[0]
        count=sum(ident in {n.get("e1"),n.get("e2"),n.get("e3")} for n in self.doc.concept_structure.links)
        content_node = self.doc.root.find("models/ConceptModel/content")
        content_count = sum(n.get("e2") == ident for n in (list(content_node) if content_node is not None else []))
        cascade=False
        cascade_content=False
        if count:
            cascade=messagebox.askyesno(tr("Удаление категории"),tr("Категория используется в {count} SCBinaryLink. Удалить также эти связи?\n\n{dependency_note}").format(
                count=count, dependency_note=self._dependency_note(self._dependency_entry('category', ident)),
            ),parent=self)
            if not cascade: return
        if content_count:
            cascade_content=messagebox.askyesno(tr("Удаление категории"),tr("Категория используется в {count} AEContentLink. Удалить также эти связи?\n\n{dependency_note}").format(
                count=content_count, dependency_note=self._dependency_note(self._dependency_entry('category', ident)),
            ),parent=self)
            if not cascade_content: return
        if not count and not content_count and not messagebox.askyesno(tr("Удаление категории"),tr("Удалить категорию {ident}?\n\n{dependency_note}").format(
                ident=ident, dependency_note=self._dependency_note(self._dependency_entry('category', ident)),
            ),parent=self): return
        try:
            self.doc.concept_structure.delete_category(ident,cascade_links=cascade,cascade_content_links=cascade_content)
            self._mark_dirty(f"Удалена категория {ident}"); self.refresh_all()
        except Exception as exc: messagebox.showerror(tr("Категория"),str(exc),parent=self)

    def add_concept_link(self):
        if self.doc is None: return
        ids=[n.get("id","") for n in self.doc.concept_structure.categories]
        if not ids: return messagebox.showinfo(tr("Связь"),tr("Сначала создайте категории."),parent=self)
        fields=[("type","Тип связи","2",("1","2","3")),("e1","E1 (0 = null)",ids[0],tuple(["0"]+ids)),("e2","E2 (0 = null)",ids[0],tuple(["0"]+ids)),("e3","E3 (0 = null)","0",tuple(["0"]+ids)),("name","Название","",None),("range","Range (пусто = default)","",None)]
        dialog=RecordDialog(self,"Новая SCBinaryLink",fields); self.wait_window(dialog)
        if dialog.result is None: return
        d=dialog.result
        try:
            ident=self.doc.concept_structure.add_link(int(d["type"]),e1=d["e1"],e2=d["e2"],e3=d["e3"],name=d["name"],range_value=int(d["range"]) if d["range"].strip() else None)
            self._mark_dirty(f"Создана связь {ident}"); self.refresh_all(); self.link_tree.selection_set(ident)
        except Exception as exc: messagebox.showerror(tr("Связь"),str(exc),parent=self)

    def edit_concept_link(self):
        if self.doc is None: return
        ident=self._selected_id(self.link_tree)
        if not ident: return messagebox.showinfo(tr("Связь"),tr("Выберите связь."),parent=self)
        n=self.doc.concept_structure.link(ident); ids=[x.get("id","") for x in self.doc.concept_structure.categories]
        fields=[("type","Тип",n.get("type","1"),("1","2","3")),("e1","E1",n.get("e1","0"),tuple(["0"]+ids)),("e2","E2",n.get("e2","0"),tuple(["0"]+ids)),("e3","E3",n.get("e3","0"),tuple(["0"]+ids)),("name","Название",n.get("name",""),None),("range","Range",n.get("range","99"),None)]
        dialog=RecordDialog(self, tr("Связь {ident}").format(ident=ident), fields); self.wait_window(dialog)
        if dialog.result is None: return
        d=dialog.result
        try:
            self.doc.concept_structure.update_link(ident,type=int(d["type"]),e1=d["e1"],e2=d["e2"],e3=d["e3"],name=d["name"],range=int(d["range"]))
            self._mark_dirty(f"Изменена связь {ident}"); self.refresh_all(); self.link_tree.selection_set(ident)
        except Exception as exc: messagebox.showerror(tr("Связь"),str(exc),parent=self)

    def delete_concept_link(self):
        if self.doc is None: return
        ident=self._selected_id(self.link_tree)
        if not ident: return messagebox.showinfo(tr("Связь"),tr("Выберите связь."),parent=self)
        if not messagebox.askyesno(tr("Удаление связи"),f"Удалить связь {ident}?",parent=self): return
        self.doc.concept_structure.delete_link(ident); self._mark_dirty(f"Удалена связь {ident}"); self.refresh_all()

    def recompute_auto_ranges(self):
        if self.doc is None: return
        changed=self.doc.concept_structure.recompute_auto_ranges()
        count=sum(len(x) for x in changed.values())
        self._mark_dirty(f"Пересчитан AutoRange: {count} связей в {len(changed)} группах"); self.refresh_all()
        messagebox.showinfo("AutoRange", tr("Обновлено связей: {count}\nКатегорий: {categories}").format(count=count, categories=len(changed)), parent=self)

    def _about(self):
        """Show the product logo independently from the taskbar application icon."""
        window = tk.Toplevel(self)
        window.title(tr('О PzKpfw'))
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
        ttk.Label(body, text=f'PzKpfw {__version__}', font=('TkDefaultFont', 18, 'bold')).pack()
        ttk.Label(body, text=tr('Редактор проектов .is2'), style='Muted.TLabel').pack(pady=(0, 12))
        explanation = ('Независимый редактор моделей ИС-2: СПД, декомпозиция, '
                       'параметры, объекты, спецификации и матричные формы.\n\n'
                       'Сохранение и проверка XML, резервные копии и история правок. '
                       'Совместимость с исходной Windows-программой ИС-2 '
                       'ещё не подтверждена для всех проектов.')
        ttk.Label(body, text=explanation, wraplength=410, justify='center').pack()
        ttk.Button(body, text=tr('Закрыть'), command=window.destroy).pack(pady=(16, 0))
        window.bind('<Escape>', lambda _event: window.destroy())
        window.grab_set()
        window.focus_set()

    def _quit(self):
        if self.dirty and not self._save_prompt():
            return
        self._save_graph_view_state()
        self._matrix_hide_tooltip()
        self.button_tooltips.hide()
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
            app.status.set(f"{tr('Открыт')}: {app.path.name}" + (f"; {tr('настройки графа не загружены')}: {view_warning}" if view_warning else ""))
        except Exception as exc:
            messagebox.showerror(tr("Ошибка открытия"), str(exc), parent=app)
    app.mainloop()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
