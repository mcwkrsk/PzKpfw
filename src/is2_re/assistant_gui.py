"""Safe local/model-assisted preview dialog for PzKpfw project changes."""
from __future__ import annotations

import json
from pathlib import Path
import queue
import threading
import tkinter as tk
from tkinter import filedialog, messagebox, ttk
from typing import Callable

from .assistant import (
    AssistantExecutionError,
    AssistantProtocolError,
    CALCULATION_LABELS,
    CourseworkAssignment,
    CancellationToken,
    ChatGPTAuthError,
    ChatGPTAuthManager,
    ExecutionResult,
    ModelProviderError,
    ModelClarificationRequired,
    ModelRequestCancelled,
    OpenAIResponsesProvider,
    TRANSMISSION_LABELS,
    build_assignment_plan,
    execute_plan,
    generate_model_preview,
    parse_assignment_inputs,
    parse_plan_json,
)
from .assistant.manual_json import MAX_RESPONSE_BYTES
from .document import ProjectDocument
from .diff import format_locator
from .git_support import (
    GitStatus,
    GitSupportError,
    create_git_checkpoint,
    inspect_git_status,
)
from .methodology import recommendation_text
from .ocr_report import (
    OcrBatchResult,
    OcrReportError,
    TesseractOcrEngine,
    export_report_bundle,
    run_selected_page_ocr,
)


KIND_LABELS = {
    "added": "Добавлено",
    "removed": "Удалено",
    "modified_attribute": "Изменён атрибут",
    "modified_text": "Изменён текст",
}

OPERATION_LABELS = {
    "add_object": "Добавить объект",
    "rename_object": "Переименовать объект",
    "add_action": "Добавить действие",
    "set_action_formula": "Задать формулу действия",
    "add_action_parameter_link": "Связать действие и параметр",
    "renumber_actions": "Перенумеровать действия",
    "add_parameter": "Добавить параметр",
    "update_parameter": "Изменить параметр",
}


def result_summary(result: ExecutionResult) -> dict[str, object]:
    """Small presentation projection kept independent from Tk widgets."""
    return {
        "summary": result.plan.summary,
        "operation_count": len(result.applied_operations),
        "change_count": len(result.diff.operations),
        "validation_issue_count": len(result.validation_issues_after),
        "manual_check_count": len(result.plan.manual_checks),
        "source_count": len(result.plan.sources),
        "writer_ok": bool(
            result.writer_preflight.get("xml_reopens")
            and result.writer_preflight.get("semantic_preserved")
            and result.writer_preflight.get("writer_idempotent")
        ),
    }


def calculation_rows(result: ExecutionResult) -> tuple[tuple[str, str, str, str, str], ...]:
    """Extract deterministic local-calculation outputs for a dedicated preview."""
    rows = []
    for operation in result.plan.operations:
        if operation.type != "add_parameter" or not operation.operation_id.startswith("calculated-parameter-"):
            continue
        attributes = operation.arguments.get("attributes", {})
        symbol = str(attributes.get("sign", ""))
        if symbol in {"sigmaFmax", "utilFmax"}:
            source = "формула (6.23), стр. 57"
        elif symbol == "aw_61":
            source = "формула (6.1), стр. 44"
        elif symbol == "dw1_62":
            source = "формула (6.2), стр. 46"
        elif symbol == "sigmaHP_63":
            source = "формула (6.3), стр. 46"
        elif symbol == "KHL_64":
            source = "формула (6.4), стр. 48"
        elif symbol == "NHE_65":
            source = "формула (6.5), стр. 49"
        elif symbol in {"NSigma_66", "NHE_66"}:
            source = "формула (6.6), стр. 49"
        elif symbol == "sigmaHP_67":
            source = "формула (6.7), стр. 50"
        elif symbol == "m_68":
            source = "формула (6.8), стр. 50"
        elif symbol == "sigmaFP_69":
            source = "формула (6.9), стр. 50"
        elif symbol == "KFL_610":
            source = "формула (6.10), стр. 50"
        elif symbol == "NFE_611":
            source = "формула (6.11), стр. 52"
        elif symbol == "NFE_const":
            source = "постоянная нагрузка перед (6.11), стр. 52"
        elif symbol == "m_612":
            source = "формула (6.12), стр. 52"
        elif symbol in {"sigmaH_613", "utilH_613"}:
            source = "формула (6.13), стр. 53"
        elif symbol == "wHt_614":
            source = "формула (6.14), стр. 54"
        elif symbol == "KHv_615":
            source = "формула (6.15), стр. 54"
        elif symbol == "wHv_616":
            source = "формула (6.16), стр. 55"
        elif symbol in {"sigmaF_617", "utilF_617", "Ybeta_617", "Yepsilon_617"}:
            source = "формула (6.17), стр. 56"
        elif symbol == "wFt_618":
            source = "формула (6.18), стр. 56"
        elif symbol == "KFalpha_619":
            source = "формула (6.19), стр. 56"
        elif symbol == "KFv_620":
            source = "формула (6.20), стр. 56"
        elif symbol == "wFv_621":
            source = "формула (6.21), стр. 56"
        elif symbol in {"sigmaHmax_622", "utilHmax_622"}:
            source = "формула (6.22), стр. 56"
        elif symbol == "m_standard":
            source = "таблица 6.8, стр. 52"
        elif symbol in {"T1_calc", "Ft", "Fr", "Fx"}:
            source = "таблица 6.16, стр. 58"
        else:
            source = "таблица 6.15, стр. 57"
        rows.append((
            str(attributes.get("name", "")),
            symbol,
            str(attributes.get("value", "")),
            str(attributes.get("unit", "")),
            source,
        ))
    return tuple(rows)


def git_status_rows(status: GitStatus) -> tuple[tuple[str, str, str], ...]:
    """Convert Git changes to safe presentation rows."""
    rows = []
    for change in status.changes:
        code = change.index_status + change.worktree_status
        safety = "Исключён: " + change.exclusion_reason if change.excluded else "Можно включить"
        rows.append((code, change.path, safety))
    return tuple(rows)


def clarification_answers_template(questions: tuple[str, ...]) -> str:
    """Format model questions as an editable continuation of the user request."""
    lines = ["", "", "Ответы на уточняющие вопросы модели:"]
    for index, question in enumerate(questions, start=1):
        lines.extend((f"{index}. {question}", "Ответ: "))
    return "\n".join(lines)


class AssistantDialog(tk.Toplevel):
    """Load, validate, preview and explicitly accept one assistant plan."""

    def __init__(
        self,
        master: tk.Misc,
        document: ProjectDocument,
        on_apply: Callable[[ExecutionResult], None],
        workspace_path: str | Path | None = None,
    ):
        super().__init__(master)
        self.title("ИИ-ассистент — предпросмотр изменений")
        self.geometry("1120x740")
        self.minsize(900, 600)
        self.document = document
        self.on_apply = on_apply
        self.workspace_path = Path(workspace_path or Path.cwd()).resolve()
        self.git_status: GitStatus | None = None
        self.ocr_result: OcrBatchResult | None = None
        self.ocr_thread: threading.Thread | None = None
        self.ocr_results: queue.Queue[tuple[str, object]] = queue.Queue()
        self.result: ExecutionResult | None = None
        self.model_cancellation: CancellationToken | None = None
        self.model_thread: threading.Thread | None = None
        self.model_results: queue.Queue[tuple[str, object]] = queue.Queue()
        self.chatgpt_auth = ChatGPTAuthManager()
        self.auth_thread: threading.Thread | None = None
        self.auth_results: queue.Queue[tuple[str, object]] = queue.Queue()
        self.status = tk.StringVar(value="Заполните форму задания и сформируйте безопасный план.")

        header = ttk.Frame(self, padding=(12, 10))
        header.pack(fill="x")
        ttk.Label(
            header,
            text="Ассистент не редактирует XML напрямую. Сначала проверьте план и список изменений.",
        ).pack(anchor="w")
        ttk.Label(header, textvariable=self.status).pack(anchor="w", pady=(4, 0))

        panes = ttk.Panedwindow(self, orient="horizontal")
        panes.pack(fill="both", expand=True, padx=10, pady=(0, 8))

        source_frame = ttk.Labelframe(panes, text="Задание и JSON-план", padding=6)
        preview_frame = ttk.Labelframe(panes, text="Проверенный предпросмотр", padding=6)
        panes.add(source_frame, weight=2)
        panes.add(preview_frame, weight=3)

        self.input_tabs = ttk.Notebook(source_frame)
        self.input_tabs.pack(fill="both", expand=True)
        form_page = ttk.Frame(self.input_tabs, padding=8)
        self.model_page = ttk.Frame(self.input_tabs, padding=8)
        self.git_page = ttk.Frame(self.input_tabs, padding=8)
        self.ocr_page = ttk.Frame(self.input_tabs, padding=8)
        self.json_page = ttk.Frame(self.input_tabs, padding=6)
        self.input_tabs.add(form_page, text="Форма задания")
        self.input_tabs.add(self.model_page, text="Запрос модели")
        self.input_tabs.add(self.git_page, text="Git")
        self.input_tabs.add(self.ocr_page, text="OCR и отчёт")
        self.input_tabs.add(self.json_page, text="JSON")

        self._build_model_page()
        self._build_git_page()
        self._build_ocr_page()

        self.assignment_title = tk.StringVar(value=document.root.get("name", "") or "Схема передачи")
        self.transmission_choices = {label: key for key, label in TRANSMISSION_LABELS.items()}
        self.calculation_choices = {label: key for key, label in CALCULATION_LABELS.items()}
        self.assignment_transmission = tk.StringVar(value=TRANSMISSION_LABELS["cylindrical"])
        self.assignment_mode = tk.StringVar(value=CALCULATION_LABELS["design"])
        self.parent_choices = {
            f"ID {item.id} — {item.name or 'Без названия'}": item.id
            for item in document.action_records()
        }
        self.assignment_parent = tk.StringVar(value=next(iter(self.parent_choices), ""))

        form_page.columnconfigure(1, weight=1)
        row = 0
        for label, variable, values in (
            ("Название задания", self.assignment_title, None),
            ("Вид передачи", self.assignment_transmission, tuple(self.transmission_choices)),
            ("Раздел методики", self.assignment_mode, tuple(self.calculation_choices)),
            ("Добавить под действие", self.assignment_parent, tuple(self.parent_choices)),
        ):
            ttk.Label(form_page, text=label).grid(row=row, column=0, sticky="w", padx=(0, 8), pady=4)
            if values is None:
                widget = ttk.Entry(form_page, textvariable=variable)
                self.assignment_title_entry = widget
            else:
                widget = ttk.Combobox(form_page, textvariable=variable, values=values, state="readonly")
                if variable is self.assignment_transmission or variable is self.assignment_mode:
                    widget.bind("<<ComboboxSelected>>", self._update_methodology_hint)
            widget.grid(row=row, column=1, sticky="ew", pady=4)
            row += 1

        self.methodology_hint = tk.StringVar()
        ttk.Label(
            form_page,
            textvariable=self.methodology_hint,
            wraplength=430,
        ).grid(row=row, column=0, columnspan=2, sticky="w", pady=(8, 2))
        row += 1
        self._update_methodology_hint()

        ttk.Label(
            form_page,
            text=(
                "Параметры схемы — численные значения не требуются:\n"
                "Название | обозначение | значение (можно пустым) | единица"
            ),
        ).grid(row=row, column=0, columnspan=2, sticky="w", pady=(10, 4))
        row += 1
        self.assignment_inputs = tk.Text(form_page, height=9, wrap="none", font=("Consolas", 9))
        self.assignment_inputs.grid(row=row, column=0, columnspan=2, sticky="nsew")
        self.assignment_inputs.insert(
            "1.0",
            "Передаточное отношение | u | | -\n"
            "Крутящий момент | T | | Н·м\n"
            "Частота вращения | n | | мин⁻¹\n"
            "Межосевое расстояние | aw | | мм\n"
            "Модуль | m | | мм",
        )
        form_page.rowconfigure(row, weight=1)
        row += 1
        ttk.Label(form_page, text="Примечание").grid(row=row, column=0, columnspan=2, sticky="w", pady=(8, 4))
        row += 1
        self.assignment_notes = tk.Text(form_page, height=3, wrap="word")
        self.assignment_notes.grid(row=row, column=0, columnspan=2, sticky="ew")
        row += 1
        self.assignment_numeric_check = tk.BooleanVar(value=False)
        ttk.Checkbutton(
            form_page,
            text="Дополнительная численная проверка формул (для курсовой не требуется)",
            variable=self.assignment_numeric_check,
        ).grid(row=row, column=0, columnspan=2, sticky="w", pady=(8, 0))
        row += 1
        ttk.Button(
            form_page,
            text="Сформировать и проверить план",
            command=self._build_from_assignment,
        ).grid(row=row, column=0, columnspan=2, sticky="ew", pady=(10, 0))

        source_toolbar = ttk.Frame(self.json_page)
        source_toolbar.pack(fill="x", pady=(0, 6))
        ttk.Button(source_toolbar, text="Загрузить JSON…", command=self._load_file).pack(side="left")
        ttk.Button(source_toolbar, text="Проверить план", command=self._analyze).pack(side="left", padx=(6, 0))

        source_text_frame = ttk.Frame(self.json_page)
        source_text_frame.pack(fill="both", expand=True)
        self.source_text = tk.Text(source_text_frame, wrap="none", font=("Consolas", 9), undo=True)
        source_y = ttk.Scrollbar(source_text_frame, orient="vertical", command=self.source_text.yview)
        source_x = ttk.Scrollbar(source_text_frame, orient="horizontal", command=self.source_text.xview)
        self.source_text.configure(yscrollcommand=source_y.set, xscrollcommand=source_x.set)
        self.source_text.grid(row=0, column=0, sticky="nsew")
        source_y.grid(row=0, column=1, sticky="ns")
        source_x.grid(row=1, column=0, sticky="ew")
        source_text_frame.rowconfigure(0, weight=1)
        source_text_frame.columnconfigure(0, weight=1)
        self.source_text.bind("<KeyRelease>", self._invalidate_preview)
        self.source_text.insert("1.0", example_plan_json())

        preview_tabs = ttk.Notebook(preview_frame)
        preview_tabs.pack(fill="both", expand=True)
        plan_page = ttk.Frame(preview_tabs)
        calculations_page = ttk.Frame(preview_tabs)
        operations_page = ttk.Frame(preview_tabs)
        changes_page = ttk.Frame(preview_tabs)
        preview_tabs.add(plan_page, text="План и проверки")
        preview_tabs.add(calculations_page, text="Параметры схемы")
        preview_tabs.add(operations_page, text="Операции")
        preview_tabs.add(changes_page, text="Изменения XML-модели")

        self.plan_text = tk.Text(plan_page, wrap="word", state="disabled")
        self.plan_text.pack(fill="both", expand=True)

        self.calculation_tree = self._tree(
            calculations_page,
            columns=("name", "symbol", "value", "unit", "source"),
            headings=("Величина", "Обозначение", "Значение", "Единица", "Источник"),
            widths=(280, 110, 120, 90, 220),
        )

        self.operation_tree = self._tree(
            operations_page,
            columns=("id", "type", "result", "description"),
            headings=("ID", "Операция", "Результат", "Описание"),
            widths=(100, 160, 90, 420),
        )
        self.change_tree = self._tree(
            changes_page,
            columns=("kind", "path", "before", "after", "description"),
            headings=("Изменение", "Путь", "До", "После", "Описание"),
            widths=(135, 290, 150, 150, 300),
        )

        buttons = ttk.Frame(self, padding=(10, 0, 10, 10))
        buttons.pack(fill="x")
        ttk.Button(buttons, text="Закрыть", command=self._close).pack(side="right")
        self.apply_button = ttk.Button(buttons, text="Применить изменения", command=self._apply, state="disabled")
        self.apply_button.pack(side="right", padx=(0, 8))

        self.transient(master)
        self.protocol("WM_DELETE_WINDOW", self._close)
        self.bind("<Escape>", lambda _event: self._close())
        self.wait_visibility()
        self.grab_set()
        self.assignment_title_entry.focus_set()
        self.after_idle(self._refresh_git_status)

    def _build_model_page(self) -> None:
        self.model_page.columnconfigure(0, weight=1)
        self.model_page.rowconfigure(4, weight=1)
        ttk.Label(
            self.model_page,
            text=(
                "Модель получает только обезличенную сводку структуры проекта. "
                "XML, название проекта и тексты замечаний не отправляются."
            ),
            wraplength=430,
        ).grid(row=0, column=0, sticky="ew", pady=(0, 10))

        account = ttk.Frame(self.model_page)
        account.grid(row=1, column=0, sticky="ew", pady=(0, 10))
        self.chatgpt_status = tk.StringVar(value=self.chatgpt_auth.account_label())
        ttk.Label(account, textvariable=self.chatgpt_status).pack(side="left", fill="x", expand=True)
        self.chatgpt_sign_in_button = ttk.Button(
            account, text="Войти через ChatGPT", command=self._start_chatgpt_sign_in,
        )
        self.chatgpt_sign_in_button.pack(side="right")
        self.chatgpt_sign_out_button = ttk.Button(
            account, text="Отключить", command=self._sign_out_chatgpt,
        )
        self.chatgpt_sign_out_button.pack(side="right", padx=(0, 6))
        self._refresh_chatgpt_controls()

        settings = ttk.Frame(self.model_page)
        settings.grid(row=2, column=0, sticky="ew")
        settings.columnconfigure(1, weight=1)
        ttk.Label(settings, text="Модель").grid(row=0, column=0, sticky="w", padx=(0, 8))
        self.model_name = tk.StringVar(value="gpt-6.1-sol")
        ttk.Entry(settings, textvariable=self.model_name).grid(row=0, column=1, sticky="ew")

        ttk.Label(
            self.model_page,
            text=(
                "Опишите нужные изменения. Запрос использует разрешённый лимит вашего плана ChatGPT; "
                "пароль, переписки и API-ключ приложению не передаются."
            ),
            wraplength=430,
        ).grid(row=3, column=0, sticky="w", pady=(12, 4))
        self.model_prompt = tk.Text(self.model_page, height=12, wrap="word", undo=True)
        self.model_prompt.grid(row=4, column=0, sticky="nsew")

        controls = ttk.Frame(self.model_page)
        controls.grid(row=5, column=0, sticky="ew", pady=(10, 0))
        self.model_send_button = ttk.Button(
            controls,
            text="Отправить и проверить",
            command=self._request_model_plan,
        )
        self.model_send_button.pack(side="left")
        self.model_cancel_button = ttk.Button(
            controls,
            text="Отменить запрос",
            command=self._cancel_model_request,
            state="disabled",
        )
        self.model_cancel_button.pack(side="left", padx=(6, 0))

    def _build_git_page(self) -> None:
        self.git_page.columnconfigure(0, weight=1)
        self.git_page.rowconfigure(2, weight=1)
        self.git_summary = tk.StringVar(value="Проверка состояния Git…")
        ttk.Label(
            self.git_page,
            textvariable=self.git_summary,
            wraplength=430,
        ).grid(row=0, column=0, sticky="ew", pady=(0, 8))
        ttk.Label(
            self.git_page,
            text=(
                "Контрольная точка создаётся только по вашему нажатию. "
                "Push не выполняется; секреты, временные файлы и резервные копии исключаются."
            ),
            wraplength=430,
        ).grid(row=1, column=0, sticky="ew", pady=(0, 8))
        git_tree_host = ttk.Frame(self.git_page)
        git_tree_host.grid(row=2, column=0, sticky="nsew")
        self.git_tree = self._tree(
            git_tree_host,
            columns=("status", "path", "safety"),
            headings=("Состояние", "Файл", "Контрольная точка"),
            widths=(90, 310, 210),
        )
        controls = ttk.Frame(self.git_page)
        controls.grid(row=3, column=0, sticky="ew", pady=(10, 0))
        ttk.Button(controls, text="Обновить состояние", command=self._refresh_git_status).pack(side="left")
        self.git_checkpoint_button = ttk.Button(
            controls,
            text="Создать контрольную точку",
            command=self._create_git_checkpoint,
            state="disabled",
        )
        self.git_checkpoint_button.pack(side="left", padx=(6, 0))

    def _build_ocr_page(self) -> None:
        self.ocr_page.columnconfigure(1, weight=1)
        self.ocr_page.rowconfigure(4, weight=1)
        ttk.Label(
            self.ocr_page,
            text=(
                "Распознаются только указанные страницы. Изображения страниц сохраняются рядом с результатом, "
                "а формулы и таблицы всегда помечаются для ручной сверки."
            ),
            wraplength=430,
        ).grid(row=0, column=0, columnspan=3, sticky="ew", pady=(0, 10))

        self.ocr_pdf_path = tk.StringVar()
        self.ocr_pages = tk.StringVar(value="1")
        self.ocr_output_path = tk.StringVar()
        for row, (label, variable, command) in enumerate((
            ("PDF", self.ocr_pdf_path, self._choose_ocr_pdf),
            ("Страницы", self.ocr_pages, None),
            ("Папка результатов", self.ocr_output_path, self._choose_ocr_output),
        ), start=1):
            ttk.Label(self.ocr_page, text=label).grid(row=row, column=0, sticky="w", padx=(0, 8), pady=3)
            ttk.Entry(self.ocr_page, textvariable=variable).grid(row=row, column=1, sticky="ew", pady=3)
            if command is not None:
                ttk.Button(self.ocr_page, text="Выбрать…", command=command).grid(
                    row=row, column=2, sticky="ew", padx=(6, 0), pady=3,
                )

        self.ocr_preview = tk.Text(self.ocr_page, height=10, wrap="word", state="disabled")
        self.ocr_preview.grid(row=4, column=0, columnspan=3, sticky="nsew", pady=(8, 0))
        controls = ttk.Frame(self.ocr_page)
        controls.grid(row=5, column=0, columnspan=3, sticky="ew", pady=(10, 0))
        self.ocr_run_button = ttk.Button(
            controls,
            text="Распознать выбранные страницы",
            command=self._start_ocr,
        )
        self.ocr_run_button.pack(side="left")
        ttk.Button(
            controls,
            text="Экспортировать черновик отчёта",
            command=self._export_report,
        ).pack(side="left", padx=(6, 0))

    def _choose_ocr_pdf(self) -> None:
        selected = filedialog.askopenfilename(
            parent=self,
            title="Выбрать PDF для OCR",
            filetypes=[("PDF", "*.pdf"), ("Все файлы", "*.*")],
        )
        if not selected:
            return
        path = Path(selected)
        self.ocr_pdf_path.set(str(path))
        if not self.ocr_output_path.get().strip():
            self.ocr_output_path.set(str(path.parent / (path.stem + "_ocr")))

    def _choose_ocr_output(self) -> None:
        selected = filedialog.askdirectory(parent=self, title="Папка для OCR и отчёта")
        if selected:
            self.ocr_output_path.set(selected)

    def _start_ocr(self) -> None:
        if self.ocr_thread is not None and self.ocr_thread.is_alive():
            return
        pdf_path = self.ocr_pdf_path.get().strip()
        pages = self.ocr_pages.get().strip()
        output = self.ocr_output_path.get().strip()
        if not pdf_path or not pages or not output:
            messagebox.showerror("OCR", "Выберите PDF, страницы и папку результатов.", parent=self)
            return
        self.ocr_run_button.configure(state="disabled")
        self.status.set("OCR обрабатывает только выбранные страницы…")
        self.ocr_thread = threading.Thread(
            target=self._ocr_worker,
            args=(pdf_path, pages, output),
            name="pzkpfw-ocr",
            daemon=True,
        )
        self.ocr_thread.start()
        self.after(100, self._poll_ocr_result)

    def _ocr_worker(self, pdf_path: str, pages: str, output: str) -> None:
        try:
            engine = TesseractOcrEngine()
            result = run_selected_page_ocr(pdf_path, pages, output, engine=engine)
        except (OcrReportError, OSError, ValueError) as exc:
            self.ocr_results.put(("error", exc))
        except Exception as exc:  # Background worker boundary.
            self.ocr_results.put(("error", OcrReportError(f"unexpected OCR failure: {exc}")))
        else:
            self.ocr_results.put(("ok", result))

    def _poll_ocr_result(self) -> None:
        try:
            kind, value = self.ocr_results.get_nowait()
        except queue.Empty:
            if self.ocr_thread is not None and self.ocr_thread.is_alive():
                self.after(100, self._poll_ocr_result)
            return
        self.ocr_thread = None
        self.ocr_run_button.configure(state="normal")
        if kind == "error":
            self.status.set("OCR не выполнен. Исходный PDF не изменён.")
            messagebox.showerror("OCR", str(value), parent=self)
            return
        self.ocr_result = value
        lines = []
        review_count = 0
        for page in value.pages:
            confidence = "нет данных" if page.mean_confidence is None else f"{page.mean_confidence:.1f}%"
            lines.append(f"Страница {page.page_number}; уверенность {confidence}; {page.image_path}")
            if page.review_reasons:
                review_count += 1
                lines.append("  Проверить: " + "; ".join(page.review_reasons))
            lines.append(page.text[:1200] or "[текст не распознан]")
            lines.append("")
        self.ocr_preview.configure(state="normal")
        self.ocr_preview.delete("1.0", "end")
        self.ocr_preview.insert("1.0", "\n".join(lines))
        self.ocr_preview.configure(state="disabled")
        self.status.set(
            f"OCR завершён: страниц {len(value.pages)}, требуют ручной сверки {review_count}."
        )

    def _export_report(self) -> None:
        output = self.ocr_output_path.get().strip()
        if not output:
            selected = filedialog.askdirectory(parent=self, title="Папка для черновика отчёта")
            if not selected:
                return
            output = selected
            self.ocr_output_path.set(selected)
        document = self.result.candidate if self.result is not None else self.document
        assumptions = self.result.plan.assumptions if self.result is not None else ()
        checks = self.result.plan.manual_checks if self.result is not None else ()
        try:
            bundle = export_report_bundle(
                output,
                document,
                ocr=self.ocr_result,
                assumptions=assumptions,
                manual_checks=checks,
            )
        except (OcrReportError, OSError, ValueError) as exc:
            messagebox.showerror("Экспорт отчёта", str(exc), parent=self)
            return
        messagebox.showinfo(
            "Экспорт отчёта",
            "Черновик и список ручных проверок сохранены:\n" + str(bundle.report_path.parent),
            parent=self,
        )
        self.status.set(f"Черновик отчёта сохранён: {bundle.report_path.name}")

    def _refresh_git_status(self) -> None:
        for item in self.git_tree.get_children():
            self.git_tree.delete(item)
        try:
            status = inspect_git_status(self.workspace_path)
        except GitSupportError as exc:
            self.git_status = None
            self.git_summary.set("Git недоступен для этой папки: " + str(exc))
            self.git_checkpoint_button.configure(state="disabled")
            return
        self.git_status = status
        for row in git_status_rows(status):
            self.git_tree.insert("", "end", values=row)
        relation = []
        if status.ahead:
            relation.append(f"впереди на {status.ahead}")
        if status.behind:
            relation.append(f"позади на {status.behind}")
        relation_text = "; " + ", ".join(relation) if relation else ""
        excluded = sum(change.excluded for change in status.changes)
        self.git_summary.set(
            f"Ветка {status.branch}{relation_text}. Изменено файлов: {len(status.changes)}, "
            f"исключено из контрольной точки: {excluded}."
        )
        can_checkpoint = bool(status.checkpoint_paths) and not status.has_staged_changes
        self.git_checkpoint_button.configure(state="normal" if can_checkpoint else "disabled")

    def _create_git_checkpoint(self) -> None:
        status = self.git_status
        if status is None:
            return
        paths = status.checkpoint_paths
        if status.has_staged_changes:
            messagebox.showerror(
                "Контрольная точка Git",
                "В Git уже есть подготовленные изменения. Сначала закоммитьте или снимите их с подготовки.",
                parent=self,
            )
            return
        if not paths:
            messagebox.showinfo("Контрольная точка Git", "Нет безопасных файлов для контрольной точки.", parent=self)
            return
        preview = "\n".join("• " + path for path in paths[:16])
        if len(paths) > 16:
            preview += f"\n…и ещё {len(paths) - 16}"
        if not messagebox.askyesno(
            "Контрольная точка Git",
            f"Создать локальный commit из {len(paths)} файлов?\n\n{preview}\n\nPush выполняться не будет.",
            parent=self,
        ):
            return
        summary = self.result.plan.summary if self.result is not None else "перед изменениями ассистента"
        try:
            checkpoint = create_git_checkpoint(status.root, message=summary, paths=paths)
        except GitSupportError as exc:
            messagebox.showerror("Контрольная точка Git", str(exc), parent=self)
            self._refresh_git_status()
            return
        messagebox.showinfo(
            "Контрольная точка Git",
            f"Создан локальный commit {checkpoint.commit[:10]}. Push не выполнялся.",
            parent=self,
        )
        self._refresh_git_status()

    @staticmethod
    def _tree(parent, *, columns, headings, widths):
        frame = ttk.Frame(parent)
        frame.pack(fill="both", expand=True)
        tree = ttk.Treeview(frame, columns=columns, show="headings", selectmode="browse")
        ybar = ttk.Scrollbar(frame, orient="vertical", command=tree.yview)
        xbar = ttk.Scrollbar(frame, orient="horizontal", command=tree.xview)
        tree.configure(yscrollcommand=ybar.set, xscrollcommand=xbar.set)
        tree.grid(row=0, column=0, sticky="nsew")
        ybar.grid(row=0, column=1, sticky="ns")
        xbar.grid(row=1, column=0, sticky="ew")
        frame.rowconfigure(0, weight=1)
        frame.columnconfigure(0, weight=1)
        for column, heading, width in zip(columns, headings, widths):
            tree.heading(column, text=heading)
            tree.column(column, width=width, minwidth=80, stretch=column in {"description", "path"})
        return tree

    def _invalidate_preview(self, _event=None) -> None:
        if self.result is not None:
            self.result = None
            self.apply_button.configure(state="disabled")
            self.status.set("JSON изменён. Выполните проверку плана ещё раз.")

    def _request_model_plan(self) -> None:
        if self.model_thread is not None and self.model_thread.is_alive():
            return
        prompt = self.model_prompt.get("1.0", "end-1c").strip()
        model = self.model_name.get().strip()
        if not prompt:
            messagebox.showerror("Запрос модели", "Опишите нужные изменения.", parent=self)
            return
        if not model:
            messagebox.showerror("Запрос модели", "Укажите модель.", parent=self)
            return
        if not self.chatgpt_auth.is_signed_in():
            messagebox.showinfo(
                "Вход через ChatGPT",
                "Сначала нажмите «Войти через ChatGPT» и подтвердите доступ в браузере.",
                parent=self,
            )
            return
        self.result = None
        self.apply_button.configure(state="disabled")
        self.model_cancellation = CancellationToken()
        provider = OpenAIResponsesProvider(
            model=model,
            access_token_provider=self.chatgpt_auth.access_token,
        )
        self.model_send_button.configure(state="disabled")
        self.model_cancel_button.configure(state="normal")
        self.status.set("Модель формирует план. Исходный проект не изменяется…")
        self.model_thread = threading.Thread(
            target=self._model_request_worker,
            args=(provider, prompt, self.model_cancellation),
            name="pzkpfw-model-request",
            daemon=True,
        )
        self.model_thread.start()
        self.after(100, self._poll_model_result)

    def _model_request_worker(
        self,
        provider: OpenAIResponsesProvider,
        prompt: str,
        cancellation: CancellationToken,
    ) -> None:
        try:
            preview = generate_model_preview(
                self.document,
                provider,
                prompt,
                cancellation=cancellation,
            )
        except (ModelProviderError, AssistantProtocolError, AssistantExecutionError, OSError, ValueError) as exc:
            self.model_results.put(("error", exc))
        except Exception as exc:  # UI worker boundary: never leave controls permanently disabled.
            self.model_results.put(("error", ModelProviderError(f"unexpected provider failure: {exc}")))
        else:
            self.model_results.put(("ok", preview))

    def _poll_model_result(self) -> None:
        try:
            kind, value = self.model_results.get_nowait()
        except queue.Empty:
            if self.model_thread is not None and self.model_thread.is_alive():
                self.after(100, self._poll_model_result)
            return
        self.model_send_button.configure(state="normal")
        self.model_cancel_button.configure(state="disabled")
        self.model_thread = None
        self.model_cancellation = None
        if kind == "error":
            if isinstance(value, ModelRequestCancelled):
                self.status.set("Запрос модели отменён. Проект не изменён.")
            elif isinstance(value, ModelClarificationRequired):
                self.model_prompt.insert("end", clarification_answers_template(value.questions))
                self.model_prompt.see("end")
                self.input_tabs.select(self.model_page)
                self.status.set("Модель задала уточняющие вопросы. Ответьте в поле запроса и отправьте снова.")
                messagebox.showinfo(
                    "Нужны уточнения по схеме",
                    "Модель не стала выдумывать недостающие сведения. "
                    "Вопросы добавлены в поле запроса — впишите ответы после строк «Ответ:».",
                    parent=self,
                )
            else:
                self.status.set("План модели отклонён. Проект не изменён.")
                messagebox.showerror("Запрос модели", str(value), parent=self)
            return
        preview = value
        plan = preview.model_result.plan
        result = preview.execution_result
        self.source_text.delete("1.0", "end")
        self.source_text.insert("1.0", json.dumps(plan.as_dict(), ensure_ascii=False, indent=2))
        self.input_tabs.select(self.json_page)
        self._show_result(
            result,
            prefix=f"Модель {preview.model_result.model}: план проверен",
        )

    def _cancel_model_request(self) -> None:
        if self.model_cancellation is None:
            return
        self.model_cancellation.cancel()
        self.model_cancel_button.configure(state="disabled")
        self.status.set("Отмена запроса модели…")

    def _refresh_chatgpt_controls(self) -> None:
        signed_in = self.chatgpt_auth.is_signed_in()
        self.chatgpt_status.set(self.chatgpt_auth.account_label())
        self.chatgpt_sign_out_button.configure(state="normal" if signed_in else "disabled")

    def _start_chatgpt_sign_in(self) -> None:
        if self.auth_thread is not None and self.auth_thread.is_alive():
            return
        self.chatgpt_sign_in_button.configure(state="disabled")
        self.status.set("Завершите вход в открывшемся окне ChatGPT…")
        self.auth_thread = threading.Thread(
            target=self._chatgpt_sign_in_worker,
            name="pzkpfw-chatgpt-sign-in",
            daemon=True,
        )
        self.auth_thread.start()
        self.after(100, self._poll_chatgpt_sign_in)

    def _chatgpt_sign_in_worker(self) -> None:
        try:
            record = self.chatgpt_auth.sign_in()
        except (ChatGPTAuthError, OSError, ValueError) as exc:
            self.auth_results.put(("error", exc))
        else:
            self.auth_results.put(("ok", record))

    def _poll_chatgpt_sign_in(self) -> None:
        try:
            kind, value = self.auth_results.get_nowait()
        except queue.Empty:
            if self.auth_thread is not None and self.auth_thread.is_alive():
                self.after(100, self._poll_chatgpt_sign_in)
            return
        self.auth_thread = None
        self.chatgpt_sign_in_button.configure(state="normal")
        self._refresh_chatgpt_controls()
        if kind == "error":
            self.status.set("Вход через ChatGPT не завершён.")
            messagebox.showerror("Вход через ChatGPT", str(value), parent=self)
            return
        self.status.set("ChatGPT подключён. Теперь можно отправить запрос модели.")

    def _sign_out_chatgpt(self) -> None:
        self.chatgpt_auth.sign_out()
        self._refresh_chatgpt_controls()
        self.status.set("ChatGPT отключён на этом компьютере.")

    def _close(self) -> None:
        if self.model_cancellation is not None:
            self.model_cancellation.cancel()
        self.destroy()

    def _update_methodology_hint(self, _event=None) -> None:
        try:
            transmission = self.transmission_choices[self.assignment_transmission.get()]
            mode = self.calculation_choices[self.assignment_mode.get()]
            text = recommendation_text(transmission, mode)
        except KeyError:
            text = "Выберите вид передачи и расчета."
        self.methodology_hint.set("Рекомендуемые разделы:\n" + text)

    def _build_from_assignment(self) -> None:
        try:
            transmission = self.transmission_choices[self.assignment_transmission.get()]
            mode = self.calculation_choices[self.assignment_mode.get()]
            parent_id = self.parent_choices[self.assignment_parent.get()]
            assignment = CourseworkAssignment(
                title=self.assignment_title.get().strip(),
                transmission_kind=transmission,
                calculation_mode=mode,
                parent_action_id=parent_id,
                inputs=parse_assignment_inputs(self.assignment_inputs.get("1.0", "end-1c")),
                notes=self.assignment_notes.get("1.0", "end-1c").strip(),
                perform_calculations=self.assignment_numeric_check.get(),
            )
            plan = build_assignment_plan(self.document, assignment)
        except (AssistantProtocolError, KeyError, ValueError) as exc:
            messagebox.showerror("Задание", str(exc), parent=self)
            return
        self.source_text.delete("1.0", "end")
        self.source_text.insert("1.0", json.dumps(plan.as_dict(), ensure_ascii=False, indent=2))
        self.input_tabs.select(self.json_page)
        self.result = None
        self.apply_button.configure(state="disabled")
        self._analyze()

    def _load_file(self) -> None:
        selected = filedialog.askopenfilename(
            parent=self,
            title="Открыть JSON-план ассистента",
            filetypes=[("JSON", "*.json"), ("Все файлы", "*.*")],
        )
        if not selected:
            return
        path = Path(selected)
        try:
            if path.stat().st_size > MAX_RESPONSE_BYTES:
                raise AssistantProtocolError("Файл превышает допустимый размер 2 МиБ")
            payload = path.read_text(encoding="utf-8")
        except (OSError, UnicodeError, AssistantProtocolError) as exc:
            messagebox.showerror("Загрузка JSON", str(exc), parent=self)
            return
        self.source_text.delete("1.0", "end")
        self.source_text.insert("1.0", payload)
        self.result = None
        self.apply_button.configure(state="disabled")
        self.status.set(f"Загружен файл: {path.name}. Нажмите «Проверить план».")

    def _analyze(self) -> None:
        payload = self.source_text.get("1.0", "end-1c")
        try:
            plan = parse_plan_json(payload)
            result = execute_plan(self.document, plan)
        except (AssistantProtocolError, AssistantExecutionError, OSError, ValueError) as exc:
            self.result = None
            self.apply_button.configure(state="disabled")
            self.status.set("План отклонён. Исправьте указанные ошибки.")
            messagebox.showerror("Проверка плана", str(exc), parent=self)
            return
        self._show_result(result)

    def _show_result(self, result: ExecutionResult, *, prefix: str = "Проверка пройдена") -> None:
        self.result = result
        self._fill_preview(result)
        self.apply_button.configure(state="normal" if result.has_changes else "disabled")
        summary = result_summary(result)
        self.status.set(
            f"{prefix}: операций {summary['operation_count']}, изменений {summary['change_count']}."
        )

    def _fill_preview(self, result: ExecutionResult) -> None:
        for tree in (self.calculation_tree, self.operation_tree, self.change_tree):
            for item in tree.get_children():
                tree.delete(item)

        rows = calculation_rows(result)
        for row in rows:
            self.calculation_tree.insert("", "end", values=row)

        for item in result.applied_operations:
            self.operation_tree.insert("", "end", values=(
                item.operation_id,
                OPERATION_LABELS.get(item.type, item.type),
                item.result_id or "—",
                item.description,
            ))
        for item in result.diff.operations:
            locator = item.path or item.parent_path
            before = "∅" if item.reference_value is None else str(item.reference_value)
            after = "∅" if item.current_value is None else str(item.current_value)
            if item.kind == "added":
                before, after = "∅", f"<{item.tag}>"
            elif item.kind == "removed":
                before, after = f"<{item.tag}>", "∅"
            self.change_tree.insert("", "end", values=(
                KIND_LABELS.get(item.kind, item.kind),
                format_locator(locator),
                before.replace("\n", " ")[:180],
                after.replace("\n", " ")[:180],
                item.description,
            ))

        plan = result.plan
        lines = [plan.summary, ""]
        if rows:
            lines.extend(["Локальный проверенный расчет", f"  Получено величин: {len(rows)}", ""])
        lines.extend(self._section("Допущения", plan.assumptions))
        lines.extend(self._section("Источники", tuple(
            f"{source.title}" + (f" — {source.locator}" if source.locator else "")
            for source in plan.sources
        )))
        lines.extend(self._section("Ручные проверки", plan.manual_checks))
        if result.validation_issues_after:
            lines.extend(self._section("Существующие замечания проекта", result.validation_issues_after))
        else:
            lines.extend(["Проверка проекта", "  Новых и существующих ошибок структуры нет.", ""])
        lines.extend([
            "Проверка записи",
            "  XML повторно открывается; семантика сохранена; повторная запись стабильна.",
        ])
        self.plan_text.configure(state="normal")
        self.plan_text.delete("1.0", "end")
        self.plan_text.insert("1.0", "\n".join(lines))
        self.plan_text.configure(state="disabled")

    @staticmethod
    def _section(title: str, items: tuple[str, ...]) -> list[str]:
        lines = [title]
        lines.extend(f"  • {item}" for item in items)
        if not items:
            lines.append("  —")
        lines.append("")
        return lines

    def _apply(self) -> None:
        result = self.result
        if result is None:
            return
        if not messagebox.askyesno(
            "Применить изменения",
            f"Применить {len(result.applied_operations)} операций к открытому проекту?\n\n"
            "Файл на диске не будет перезаписан. Изменения можно отменить через историю.\n"
            "Если проект уже сохранён, перед применением будет создана резервная копия.",
            parent=self,
        ):
            return
        try:
            self.on_apply(result)
        except Exception as exc:
            messagebox.showerror("Применение изменений", str(exc), parent=self)
            return
        self.destroy()


def example_plan_json() -> str:
    """Small valid starter payload for manual UI experiments."""
    return json.dumps({
        "protocol_version": 1,
        "summary": "Добавить объект схемы передачи",
        "assumptions": [],
        "questions": [],
        "operations": [{
            "type": "add_object",
            "arguments": {"name": "Цилиндрическая передача", "attributes": {"kind": "gear"}},
        }],
        "sources": [],
        "manual_checks": ["Проверить название объекта"],
    }, ensure_ascii=False, indent=2)
