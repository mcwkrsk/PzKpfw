"""Tkinter desktop editor for IS-2 projects.

The UI edits the recovered primary model and ConceptModel/cs branches. The
spz/content branches remain visible as preserved, read-only XML until their
full edit contracts are reconstructed.
"""
from __future__ import annotations

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
        self.title("IS-2 Studio — редактор проектов .is2")
        self.geometry("1320x820")
        self.minsize(1000, 650)
        self.doc: ProjectDocument | None = None
        self.path: Path | None = None
        self.dirty = False
        self._build_menu()
        self._build_layout()
        self._set_enabled(False)
        self.protocol("WM_DELETE_WINDOW", self._quit)
        self._set_title()

    def _build_menu(self):
        menu = tk.Menu(self)
        file_menu = tk.Menu(menu, tearoff=False)
        file_menu.add_command(label="Новый проект…", accelerator="Ctrl+N", command=self.new_project)
        file_menu.add_command(label="Открыть…", accelerator="Ctrl+O", command=self.open_file)
        file_menu.add_command(label="Сохранить", accelerator="Ctrl+S", command=self.save)
        file_menu.add_command(label="Сохранить как…", command=self.save_as)
        file_menu.add_separator()
        file_menu.add_command(label="Выход", command=self._quit)
        menu.add_cascade(label="Файл", menu=file_menu)
        project_menu = tk.Menu(menu, tearoff=False)
        project_menu.add_command(label="Проверить проект", command=self.validate_project)
        project_menu.add_command(label="Обновить представления", command=self.refresh_all)
        menu.add_cascade(label="Проект", menu=project_menu)
        help_menu = tk.Menu(menu, tearoff=False)
        help_menu.add_command(label="О программе", command=self._about)
        menu.add_cascade(label="Справка", menu=help_menu)
        self.config(menu=menu)
        self.bind_all("<Control-n>", lambda _e: self.new_project())
        self.bind_all("<Control-o>", lambda _e: self.open_file())
        self.bind_all("<Control-s>", lambda _e: self.save())

    def _build_layout(self):
        toolbar = ttk.Frame(self, padding=(8, 6))
        toolbar.pack(fill="x")
        ttk.Button(toolbar, text="Новый", command=self.new_project).pack(side="left")
        ttk.Button(toolbar, text="Открыть", command=self.open_file).pack(side="left", padx=(5, 0))
        ttk.Button(toolbar, text="Сохранить", command=self.save).pack(side="left", padx=5)
        ttk.Button(toolbar, text="Проверить", command=self.validate_project).pack(side="left")
        self.file_label = ttk.Label(toolbar, text="Файл не открыт")
        self.file_label.pack(side="right")
        self.notebook = ttk.Notebook(self)
        self.notebook.pack(fill="both", expand=True, padx=8, pady=(0, 8))
        self.action_page = ttk.Frame(self.notebook)
        self.diagram_page = ttk.Frame(self.notebook)
        self.param_page = ttk.Frame(self.notebook)
        self.object_page = ttk.Frame(self.notebook)
        self.concept_page = ttk.Frame(self.notebook)
        self.link_page = ttk.Frame(self.notebook)
        self.other_page = ttk.Frame(self.notebook)
        self.xml_page = ttk.Frame(self.notebook)
        self.metadata_page = ttk.Frame(self.notebook)
        self.notebook.add(self.metadata_page, text="Паспорт проекта")
        self.notebook.add(self.action_page, text="Декомпозиция")
        self.notebook.add(self.diagram_page, text="Схема spd")
        self.notebook.add(self.param_page, text="Параметры")
        self.notebook.add(self.object_page, text="Объекты")
        self.notebook.add(self.concept_page, text="Категории (cs)")
        self.notebook.add(self.link_page, text="Связи (cs)")
        self.notebook.add(self.other_page, text="spz / content")
        self.notebook.add(self.xml_page, text="XML")
        self._build_metadata_page()
        self._build_action_page()
        self._build_diagram_page()
        self._build_record_page(self.param_page, "Параметры", self._refresh_params, self.add_parameter, self.edit_parameter, self.delete_parameter)
        self._build_record_page(self.object_page, "Объекты", self._refresh_objects, self.add_object, self.edit_object, self.delete_object)
        self._build_category_page()
        self._build_link_page()
        self._build_other_page()
        self.xml_text = tk.Text(self.xml_page, wrap="none", font=("Consolas", 10), state="disabled")
        self.xml_text.pack(fill="both", expand=True)
        self.status = tk.StringVar(value="Готово")
        ttk.Label(self, textvariable=self.status, relief="sunken", anchor="w", padding=(8, 4)).pack(fill="x", side="bottom")

    def _set_enabled(self, enabled: bool):
        state = "normal" if enabled else "disabled"
        for page in (self.metadata_page, self.action_page, self.diagram_page, self.param_page, self.object_page, self.concept_page, self.link_page, self.other_page, self.xml_page):
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

    def _build_action_page(self):
        bar = ttk.Frame(self.action_page, padding=6)
        bar.pack(fill="x")
        for text, command in (("Новый корень", self.add_root_action), ("Добавить дочерний", self.add_child_action), ("Изменить", self.edit_action), ("Удалить", self.delete_action), ("Обновить", self._refresh_actions)):
            ttk.Button(bar, text=text, command=command).pack(side="left", padx=(0, 5))
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
        ttk.Label(right, text="Выбранное действие", font=("TkDefaultFont", 11, "bold")).pack(anchor="w")
        self.action_details = tk.Text(right, wrap="word", height=20, state="disabled")
        self.action_details.pack(fill="both", expand=True, pady=(8, 0))

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
            columns = ("id", "name", "group", "codingType", "number", "sign")
        else:
            columns = ("id", "name", "attributes")
        tree["columns"] = columns
        for column in columns:
            tree.heading(column, text=column)
            tree.column(column, width=140 if column != "attributes" else 500, anchor="w")
        if title == "Параметры":
            self.param_tree = tree
        else:
            self.object_tree = tree

    def _build_category_page(self):
        bar = ttk.Frame(self.concept_page, padding=6)
        bar.pack(fill="x")
        for text, command in (("Добавить категорию", self.add_category), ("Изменить", self.edit_category), ("Удалить", self.delete_category), ("Обновить", self._refresh_categories)):
            ttk.Button(bar, text=text, command=command).pack(side="left", padx=(0, 5))
        self.category_tree = ttk.Treeview(self.concept_page, columns=("id", "name", "class", "group", "number", "status", "codingType", "autoRange"), show="headings", selectmode="browse")
        for c in self.category_tree["columns"]:
            self.category_tree.heading(c, text={"id":"ID", "name":"Название", "class":"Класс", "group":"Группа", "number":"Номер", "status":"Статус", "codingType":"CodingType", "autoRange":"AutoRange"}.get(c, c))
            self.category_tree.column(c, width=130 if c == "name" else 85, anchor="w" if c == "name" else "center")
        self.category_tree.pack(fill="both", expand=True, padx=6, pady=(0, 6))
        ttk.Label(self.concept_page, text="Классы S/P/Z/K/O/R/C. В оригинале это pk; написание elemets сохранено.", padding=6).pack(anchor="w")

    def _build_link_page(self):
        bar = ttk.Frame(self.link_page, padding=6)
        bar.pack(fill="x")
        for text, command in (("Добавить связь", self.add_concept_link), ("Изменить", self.edit_concept_link), ("Удалить", self.delete_concept_link), ("Пересчитать AutoRange", self.recompute_auto_ranges), ("Обновить", self._refresh_links)):
            ttk.Button(bar, text=text, command=command).pack(side="left", padx=(0, 5))
        self.link_tree = ttk.Treeview(self.link_page, columns=("id", "type", "label", "e1", "e2", "e3", "range"), show="headings", selectmode="browse")
        labels = {"id":"ID", "type":"Тип", "label":"Связь", "e1":"E1", "e2":"E2", "e3":"E3", "range":"Range"}
        for c in self.link_tree["columns"]:
            self.link_tree.heading(c, text=labels[c])
            self.link_tree.column(c, width=100 if c != "label" else 200, anchor="w")
        self.link_tree.pack(fill="both", expand=True, padx=6, pady=(0, 6))

    def _build_other_page(self):
        self.other_text = tk.Text(self.other_page, wrap="word", state="disabled")
        self.other_text.pack(fill="both", expand=True, padx=6, pady=6)

    def _set_title(self):
        name = self.path.name if self.path else "без проекта"
        dirty = " *" if self.dirty else ""
        self.title(f"IS-2 Studio — {name}{dirty}")
        self.file_label.configure(text=str(self.path) if self.path else "Файл не открыт")

    def _mark_dirty(self, message="Изменения не сохранены"):
        self.dirty = True
        self.status.set(message)
        self._set_title()

    def _ask_discard(self) -> bool:
        return not self.dirty or messagebox.askyesno("Несохранённые изменения", "Сохранить изменения перед продолжением?", parent=self)

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
            self.dirty = True
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
            self.dirty = False
            self.refresh_all()
            self._set_enabled(True)
            issues = doc.validate()
            self.status.set(f"Открыт: {self.path.name} — {len(doc.actions)} действий, {len(doc.concept_structure.categories)} категорий; замечаний: {len(issues)}")
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
            return self.save_as()
        issues = self.doc.validate()
        if issues:
            messagebox.showerror("Проверка не пройдена", "Сохранение остановлено:\n\n" + "\n".join(issues[:30]), parent=self)
            return False
        try:
            self.doc.save(self.path)
            self.dirty = False
            self.refresh_all()
            self.status.set(f"Сохранено: {self.path}")
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

    def refresh_all(self):
        if self.doc is None:
            return
        self._refresh_metadata()
        self._refresh_actions()
        self._refresh_diagram()
        self._refresh_params()
        self._refresh_objects()
        self._refresh_categories()
        self._refresh_links()
        self._refresh_other()
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
                                    values=(n.get("type", ""), n.get("level", "")))
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
            self.param_tree.insert("", "end", iid=node.get("id", ""), values=tuple(node.get(k, "") for k in ("id", "name", "group", "codingType", "number", "sign")))

    def _refresh_objects(self):
        if self.doc is None:
            return
        self.object_tree.delete(*self.object_tree.get_children())
        for node in list(self.doc.objects_node):
            self.object_tree.insert("", "end", iid=node.get("id", ""), values=(node.get("id", ""), node.get("name", ""), json.dumps(node.attrib, ensure_ascii=False)))

    def _refresh_categories(self):
        if self.doc is None:
            return
        self.category_tree.delete(*self.category_tree.get_children())
        for record in self.doc.concept_structure.category_records():
            self.category_tree.insert("", "end", iid=record.id, values=(record.id, record.name, f"{record.class_char} — {record.class_label}", record.group, record.number, record.status, record.coding_type, int(record.auto_range)))

    def _refresh_links(self):
        if self.doc is None:
            return
        self.link_tree.delete(*self.link_tree.get_children())
        for record in self.doc.concept_structure.link_records():
            self.link_tree.insert("", "end", iid=record.id, values=(record.id, record.type, record.label, record.e1, record.e2, record.e3, record.range))

    def _refresh_other(self):
        cm = self.doc.root.find("models/ConceptModel")
        spz = cm.find("spz") if cm is not None else None
        content = cm.find("content") if cm is not None else None
        info = {
            "spz_elemets": len(spz.findall("./elemets/*")) if spz is not None else 0,
            "spz_links": len(spz.findall("./links/*")) if spz is not None else 0,
            "content_records": len(content) if content is not None else 0,
            "note": "Эти разделы сохраняются без изменений. Редактирование появится после восстановления их отдельных ABI/схем.",
        }
        self.other_text.configure(state="normal")
        self.other_text.delete("1.0", "end")
        self.other_text.insert("1.0", json.dumps(info, ensure_ascii=False, indent=2))
        self.other_text.configure(state="disabled")

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
        attrs = dict(node.attrib); attrs.pop("id", None)
        changed = self._edit_json_record(f"Параметр {ident}", attrs)
        if changed is None: return
        try:
            self.doc.update_parameter(ident, **{k: (v if v != "" else None) for k,v in changed.items() if k != "id"})
            for k in set(attrs) - set(changed): self.doc.update_parameter(ident, **{k: None})
            self._mark_dirty(f"Изменён параметр {ident}"); self.refresh_all()
        except Exception as exc: messagebox.showerror("Параметр", str(exc), parent=self)

    def delete_parameter(self):
        if self.doc is None: return
        ident, node = self._selected_attrs(self.param_tree, self.doc.params_node, "param")
        if node is None or not messagebox.askyesno("Удаление параметра", f"Удалить параметр {ident}?", parent=self): return
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

    def delete_object(self):
        if self.doc is None: return
        ident, node = self._selected_attrs(self.object_tree, self.doc.objects_node)
        if node is None or not messagebox.askyesno("Удаление объекта", f"Удалить объект {ident}?", parent=self): return
        try:
            self.doc.delete_object(ident, allow_unknown_references=False); self._mark_dirty(f"Удалён объект {ident}"); self.refresh_all()
        except Exception as exc: messagebox.showerror("Объект", str(exc), parent=self)

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
        keys = ("name", "type", "formalization", "mark", "symbol", "status", "level", "number")
        fields = [(k, k, node.get(k, ""), ("0","1","2","3") if k == "type" else None) for k in keys]
        dialog = RecordDialog(self, f"Действие {ident}", fields); self.wait_window(dialog)
        if dialog.result is None: return
        try:
            self.doc.update_action(ident, **{k: (v if v != "" else None) for k,v in dialog.result.items()})
            self._mark_dirty(f"Изменено действие {ident}"); self.refresh_all(); self.action_tree.selection_set(ident)
        except Exception as exc: messagebox.showerror("Действие", str(exc), parent=self)

    def delete_action(self):
        if self.doc is None: return
        ident = self._selected_id(self.action_tree)
        if not ident: return messagebox.showinfo("Действие", "Выберите действие.", parent=self)
        children = self.doc.composition_children(ident)
        cascade = False
        if children:
            cascade = messagebox.askyesno("Удаление поддерева", f"Действие {ident} имеет {len(children)} дочерних элементов. Удалить всё поддерево?", parent=self)
            if not cascade: return
        elif not messagebox.askyesno("Удаление действия", f"Удалить действие {ident}?", parent=self): return
        try:
            self.doc.delete_action(ident, cascade=cascade)
            self._mark_dirty(f"Удалено действие {ident}"); self.refresh_all()
        except Exception as exc: messagebox.showerror("Действие", str(exc), parent=self)

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

    def edit_category(self):
        if self.doc is None: return
        ident=self._selected_id(self.category_tree)
        if not ident: return messagebox.showinfo("Категория","Выберите категорию.",parent=self)
        n=self.doc.concept_structure.category(ident)
        fields=[(k,k,n.get(k,""), tuple(str(x) for x in range(1,8)) if k=="class" else (("0","1") if k=="autoRange" else None)) for k in ("name","class","group","number","status","autoRange","codingType")]
        dialog=RecordDialog(self,f"Категория {ident}",fields); self.wait_window(dialog)
        if dialog.result is None: return
        d=dialog.result
        try:
            self.doc.concept_structure.update_category(ident,**{"class":int(d["class"]),"group":int(d["group"]),"number":int(d["number"]),"status":int(d["status"]),"autoRange":d["autoRange"],"codingType":int(d["codingType"]),"name":d["name"]})
            self._mark_dirty(f"Изменена категория {ident}"); self.refresh_all(); self.category_tree.selection_set(ident)
        except Exception as exc: messagebox.showerror("Категория",str(exc),parent=self)

    def delete_category(self):
        if self.doc is None: return
        ident=self._selected_id(self.category_tree)
        if not ident: return messagebox.showinfo("Категория","Выберите категорию.",parent=self)
        count=sum(ident in {n.get("e1"),n.get("e2"),n.get("e3")} for n in self.doc.concept_structure.links)
        cascade=False
        if count:
            cascade=messagebox.askyesno("Удаление категории",f"Категория используется в {count} связях. Удалить также эти связи?",parent=self)
            if not cascade: return
        elif not messagebox.askyesno("Удаление категории",f"Удалить категорию {ident}?",parent=self): return
        try:
            self.doc.concept_structure.delete_category(ident,cascade_links=cascade)
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
        messagebox.showinfo("О IS-2 Studio","IS-2 Studio — независимый редактор проектов .is2.\n\nПоддерживается редактирование primaryModel/spd, params, objects и ConceptModel/cs. Есть древовидная и графическая схемы spd. Разделы spz/content пока открываются только для просмотра и сохраняются без потери XML.",parent=self)

    def _quit(self):
        if self.dirty and not self._save_prompt(): return
        self.destroy()


def main(argv: list[str] | None = None) -> int:
    argv = list(sys.argv[1:] if argv is None else argv)
    app = Is2Studio()
    if argv:
        try:
            app.doc = ProjectDocument.load(argv[0])
            app.path = Path(argv[0])
            app.refresh_all()
            app._set_enabled(True)
            app._set_title()
            app.status.set(f"Открыт: {app.path.name}")
        except Exception as exc:
            messagebox.showerror("Ошибка открытия", str(exc), parent=app)
    app.mainloop()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
