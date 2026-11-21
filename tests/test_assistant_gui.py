import json
import queue
import unittest
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import MagicMock, patch

from is2_re.assistant import (
    CancellationToken,
    ModelPlanResult,
    ModelProviderError,
    execute_plan,
    parse_plan_json,
)
from is2_re.assistant_gui import (
    AssistantDialog,
    calculation_rows,
    clarification_answers_template,
    result_summary,
)
from is2_re.assistant_gui import git_status_rows
from is2_re.coursework import create_course_project
from is2_re.gui import Is2Studio
from is2_re.git_support import GitChange, GitStatus


class AssistantGuiTests(unittest.TestCase):
    def test_clarification_questions_become_editable_answer_template(self):
        text = clarification_answers_template(("Какова цель?", "Какой модуль?"))
        self.assertIn("1. Какова цель?\nОтвет: ", text)
        self.assertIn("2. Какой модуль?\nОтвет: ", text)

    def _result(self):
        document = create_course_project("Курсовая", "Расчет передачи")
        plan = parse_plan_json(json.dumps({
            "protocol_version": 1,
            "summary": "Добавить объект",
            "operations": [{
                "type": "add_object",
                "arguments": {"name": "Передача"},
            }],
        }, ensure_ascii=False))
        return document, execute_plan(document, plan)

    def test_result_summary_is_safe_presentation_projection(self):
        _document, result = self._result()
        summary = result_summary(result)
        self.assertEqual(summary["operation_count"], 1)
        self.assertGreater(summary["change_count"], 0)
        self.assertEqual(summary["validation_issue_count"], 0)
        self.assertTrue(summary["writer_ok"])

    def test_commit_replaces_document_as_one_history_group(self):
        document, result = self._result()
        app = SimpleNamespace(
            doc=document,
            path=Path("C:/projects/example.is2"),
            _mark_dirty=MagicMock(),
            refresh_all=MagicMock(),
        )

        with patch("is2_re.gui.append_audit_record") as append_audit:
            Is2Studio._apply_assistant_result(app, result)

        self.assertIs(app.doc, result.candidate)
        self.assertEqual(app.doc.source_path, "C:\\projects\\example.is2")
        app._mark_dirty.assert_called_once_with(
            "Ассистент: Добавить объект",
            operation_group=["Добавлен объект «Передача»"],
        )
        app.refresh_all.assert_called_once_with()
        append_audit.assert_called_once_with(result)

    def test_saved_project_is_backed_up_before_assistant_result_is_applied(self):
        document, result = self._result()
        backup = SimpleNamespace(
            path=Path("C:/projects/.pzkpfw-backups/example/backup.is2.bak"),
            sha256="abc123",
        )
        app = SimpleNamespace(
            doc=document,
            path=Path("C:/projects/example.is2"),
            history=MagicMock(),
            status=MagicMock(),
            _document_snapshot=MagicMock(return_value=b"snapshot"),
            _mark_dirty=MagicMock(),
            refresh_all=MagicMock(),
        )

        with (
            patch("is2_re.gui.Path.is_file", return_value=True),
            patch("is2_re.gui.create_project_backup", return_value=backup) as create_backup,
            patch("is2_re.gui.append_audit_record"),
        ):
            Is2Studio._apply_assistant_result(app, result)

        create_backup.assert_called_once_with(Path("C:/projects/example.is2"))
        app.history.note.assert_called_once()
        self.assertIs(app.doc, result.candidate)
        app.status.set.assert_called_once_with(
            "Изменения ассистента применены; резервная копия: backup.is2.bak"
        )

    def test_calculation_rows_only_show_local_calculated_parameters(self):
        document = create_course_project("Курсовая", "Расчет передачи")
        plan = parse_plan_json(json.dumps({
            "protocol_version": 1,
            "summary": "Расчет",
            "operations": [
                {"operation_id": "calculated-parameter-1", "type": "add_parameter", "arguments": {
                    "attributes": {"name": "Окружная сила", "sign": "Ft", "value": "1200", "unit": "Н"},
                }},
                {"operation_id": "manual-parameter", "type": "add_parameter", "arguments": {
                    "attributes": {"name": "Исходное", "sign": "x", "value": "1"},
                }},
            ],
        }, ensure_ascii=False))
        result = execute_plan(document, plan)
        rows = calculation_rows(result)
        self.assertEqual(len(rows), 1)
        self.assertEqual(rows[0][1], "Ft")
        self.assertIn("6.16", rows[0][4])

    def test_contact_check_rows_show_exact_formula_sources(self):
        document = create_course_project("Курсовая", "Расчет передачи")
        plan = parse_plan_json(json.dumps({
            "protocol_version": 1,
            "summary": "Контактная проверка",
            "operations": [
                {
                    "operation_id": f"calculated-parameter-{index}",
                    "type": "add_parameter",
                    "arguments": {"attributes": {
                        "name": symbol,
                        "sign": symbol,
                        "value": "1",
                        "unit": "-",
                    }},
                }
                for index, symbol in enumerate(
                    (
                        "sigmaH_613", "wHt_614", "KHv_615", "wHv_616",
                        "sigmaF_617", "wFt_618", "KFalpha_619", "KFv_620", "wFv_621",
                        "sigmaHmax_622",
                    ),
                    start=1,
                )
            ],
        }, ensure_ascii=False))
        result = execute_plan(document, plan)

        rows = calculation_rows(result)

        self.assertEqual([row[4] for row in rows], [
            "формула (6.13), стр. 53",
            "формула (6.14), стр. 54",
            "формула (6.15), стр. 54",
            "формула (6.16), стр. 55",
            "формула (6.17), стр. 56",
            "формула (6.18), стр. 56",
            "формула (6.19), стр. 56",
            "формула (6.20), стр. 56",
            "формула (6.21), стр. 56",
            "формула (6.22), стр. 56",
        ])

    def test_model_worker_returns_verified_preview_without_using_tk(self):
        document = create_course_project("Курсовая", "Главное действие")
        plan = parse_plan_json(json.dumps({
            "protocol_version": 1,
            "summary": "Добавить объект",
            "operations": [{"type": "add_object", "arguments": {"name": "Передача"}}],
        }, ensure_ascii=False))

        class Provider:
            def generate_plan(self, request, *, cancellation=None):
                return ModelPlanResult(plan, "test", "test-model", "response-1")

        target = SimpleNamespace(document=document, model_results=queue.Queue())
        before = document.semantic_snapshot()

        AssistantDialog._model_request_worker(
            target,
            Provider(),
            "Добавь объект",
            CancellationToken(),
        )

        kind, preview = target.model_results.get_nowait()
        self.assertEqual(kind, "ok")
        self.assertEqual(document.semantic_snapshot(), before)
        self.assertTrue(preview.execution_result.has_changes)

    def test_model_worker_reports_provider_error_to_ui_queue(self):
        class Provider:
            def generate_plan(self, request, *, cancellation=None):
                raise ModelProviderError("service unavailable")

        target = SimpleNamespace(
            document=create_course_project("Курсовая", "Главное действие"),
            model_results=queue.Queue(),
        )
        AssistantDialog._model_request_worker(
            target,
            Provider(),
            "Запрос",
            CancellationToken(),
        )

        kind, error = target.model_results.get_nowait()
        self.assertEqual(kind, "error")
        self.assertIsInstance(error, ModelProviderError)

    def test_model_worker_wraps_unexpected_failure(self):
        class Provider:
            def generate_plan(self, request, *, cancellation=None):
                raise RuntimeError("boom")

        target = SimpleNamespace(
            document=create_course_project("Курсовая", "Главное действие"),
            model_results=queue.Queue(),
        )
        AssistantDialog._model_request_worker(
            target,
            Provider(),
            "Запрос",
            CancellationToken(),
        )

        kind, error = target.model_results.get_nowait()
        self.assertEqual(kind, "error")
        self.assertIsInstance(error, ModelProviderError)
        self.assertIn("unexpected provider failure", str(error))

    def test_git_status_rows_mark_excluded_files(self):
        status = GitStatus(
            root=Path("C:/projects/example"),
            branch="main",
            upstream=None,
            ahead=0,
            behind=0,
            changes=(
                GitChange("src/app.py", " ", "M", False),
                GitChange(".env", "?", "?", True, "файл окружения"),
            ),
        )

        rows = git_status_rows(status)

        self.assertEqual(rows[0], (" M", "src/app.py", "Можно включить"))
        self.assertIn("Исключён", rows[1][2])


if __name__ == "__main__":
    unittest.main()
