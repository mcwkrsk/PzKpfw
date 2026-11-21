import json
import unittest

from is2_re.assistant import (
    AssistantExecutionError,
    AssistantProtocolError,
    execute_plan,
    parse_plan_json,
)
from is2_re.coursework import create_course_project


def plan_payload(operations):
    return json.dumps({
        "protocol_version": 1,
        "summary": "Подготовить расчет",
        "assumptions": ["Исходные данные проверит пользователь"],
        "questions": [],
        "operations": operations,
        "sources": [{"title": "Детали машин", "locator": "таблица 6.15"}],
        "manual_checks": ["Сверить коэффициенты с методичкой"],
    }, ensure_ascii=False)


class AssistantProtocolTests(unittest.TestCase):
    def test_new_action_and_parameter_can_be_referenced_by_operation_id(self):
        document = create_course_project("Курсовая", "Расчет передачи")
        plan = parse_plan_json(plan_payload([
            {
                "operation_id": "action-contact",
                "type": "add_action",
                "arguments": {
                    "name": "Определить контактное напряжение",
                    "action_type": 0,
                    "parent_id": "1",
                },
            },
            {
                "operation_id": "parameter-sigma-h",
                "type": "add_parameter",
                "arguments": {"attributes": {"name": "Контактное напряжение", "sign": "sigmaH"}},
            },
            {
                "type": "set_action_formula",
                "arguments": {
                    "action_operation_id": "action-contact",
                    "expression": "sigmaH = ...",
                    "reference": "формула (7.6)",
                },
            },
            {
                "type": "add_action_parameter_link",
                "arguments": {
                    "action_operation_id": "action-contact",
                    "parameter_operation_id": "parameter-sigma-h",
                    "role": "function",
                },
            },
        ]))

        result = execute_plan(document, plan)

        self.assertTrue(result.has_changes)
        self.assertEqual(len(result.applied_operations), 4)

    def test_rejects_unknown_top_level_and_operation_fields(self):
        with self.assertRaisesRegex(AssistantProtocolError, "unknown field"):
            parse_plan_json(json.dumps({
                "protocol_version": 1, "summary": "x", "operations": [], "prompt": "ignored?"
            }))
        with self.assertRaisesRegex(AssistantProtocolError, "unknown field"):
            parse_plan_json(plan_payload([{
                "type": "add_object", "arguments": {"name": "Вал", "command": "whoami"}
            }]))

    def test_rejects_unknown_operation_and_duplicate_ids(self):
        with self.assertRaisesRegex(AssistantProtocolError, "unsupported"):
            parse_plan_json(plan_payload([{"type": "run_command", "arguments": {}}]))
        operations = [
            {"operation_id": "same", "type": "add_object", "arguments": {"name": "Вал"}},
            {"operation_id": "same", "type": "add_object", "arguments": {"name": "Колесо"}},
        ]
        with self.assertRaisesRegex(AssistantProtocolError, "duplicate operation_id"):
            parse_plan_json(plan_payload(operations))

    def test_rejects_managed_ids_and_non_integer_protocol_version(self):
        payload = json.loads(plan_payload([]))
        payload["protocol_version"] = 1.0
        with self.assertRaisesRegex(AssistantProtocolError, "protocol_version"):
            parse_plan_json(json.dumps(payload))
        with self.assertRaisesRegex(AssistantProtocolError, "managed field"):
            parse_plan_json(plan_payload([{
                "type": "add_object",
                "arguments": {"name": "Вал", "attributes": {"id": "50"}},
            }]))

    def test_executor_refuses_unanswered_questions(self):
        document = create_course_project("Курсовая", "Расчет передачи")
        payload = json.loads(plan_payload([]))
        payload["questions"] = ["Какой материал колеса?"]
        plan = parse_plan_json(json.dumps(payload, ensure_ascii=False))
        with self.assertRaisesRegex(AssistantExecutionError, "unanswered"):
            execute_plan(document, plan)

    def test_executes_four_operations_atomically_on_clone(self):
        document = create_course_project("Курсовая", "Расчет передачи")
        source_before = document.to_bytes()
        plan = parse_plan_json(plan_payload([
            {"operation_id": "object", "type": "add_object", "arguments": {
                "name": "Цилиндрическая передача", "attributes": {"kind": "gear"}
            }},
            {"operation_id": "action", "type": "add_action", "arguments": {
                "name": "Определить межосевое расстояние", "action_type": 0, "parent_id": "1"
            }},
            {"operation_id": "parameter", "type": "add_parameter", "arguments": {
                "attributes": {"name": "Передаточное отношение", "sign": "u", "value": "3.15"}
            }},
            {"operation_id": "update", "type": "update_parameter", "arguments": {
                "parameter_id": "1", "changes": {"value": "3.2", "unit": "1"}
            }},
        ]))

        result = execute_plan(document, plan)

        self.assertEqual(document.to_bytes(), source_before)
        self.assertEqual(len(document.objects_node.findall("object")), 0)
        self.assertEqual(len(result.candidate.objects_node.findall("object")), 1)
        self.assertEqual(result.candidate.parameter("1").get("value"), "3.2")
        self.assertEqual(len(result.applied_operations), 4)
        self.assertTrue(result.has_changes)
        self.assertEqual(result.validation_issues_after, ())
        self.assertTrue(result.writer_preflight["semantic_preserved"])
        self.assertTrue(result.writer_preflight["writer_idempotent"])

    def test_failed_operation_leaves_source_unchanged(self):
        document = create_course_project("Курсовая", "Расчет передачи")
        source_before = document.to_bytes()
        plan = parse_plan_json(plan_payload([
            {"type": "add_object", "arguments": {"name": "Вал"}},
            {"operation_id": "bad-update", "type": "update_parameter", "arguments": {
                "parameter_id": "999", "changes": {"value": "10"}
            }},
        ]))

        with self.assertRaisesRegex(AssistantExecutionError, "bad-update"):
            execute_plan(document, plan)

        self.assertEqual(document.to_bytes(), source_before)
        self.assertEqual(len(document.objects_node.findall("object")), 0)

    def test_parameter_can_reference_object_created_earlier_in_plan(self):
        document = create_course_project("Курсовая", "Расчет передачи")
        plan = parse_plan_json(plan_payload([
            {"operation_id": "new-object", "type": "add_object", "arguments": {"name": "Вал"}},
            {"type": "add_parameter", "arguments": {
                "object_operation_id": "new-object",
                "attributes": {"name": "Диаметр", "sign": "d"},
            }},
        ]))
        result = execute_plan(document, plan)
        self.assertEqual(result.candidate.parameter("1").get("o"), "1")

    def test_forward_operation_reference_is_atomic_error(self):
        document = create_course_project("Курсовая", "Расчет передачи")
        before = document.to_bytes()
        plan = parse_plan_json(plan_payload([
            {"type": "add_parameter", "arguments": {
                "object_operation_id": "later-object",
                "attributes": {"name": "Диаметр"},
            }},
            {"operation_id": "later-object", "type": "add_object", "arguments": {"name": "Вал"}},
        ]))
        with self.assertRaisesRegex(AssistantExecutionError, "has not produced"):
            execute_plan(document, plan)
        self.assertEqual(document.to_bytes(), before)

    def test_action_can_be_child_of_action_created_earlier(self):
        document = create_course_project("Курсовая", "Расчет передачи")
        plan = parse_plan_json(plan_payload([
            {"operation_id": "parent", "type": "add_action", "arguments": {
                "name": "Расчет", "action_type": 2, "parent_id": "1",
            }},
            {"type": "add_action", "arguments": {
                "name": "Шаг расчета", "action_type": 0, "parent_operation_id": "parent",
            }},
        ]))
        result = execute_plan(document, plan)
        self.assertEqual(result.candidate.composition_children("1"), ["2"])
        self.assertEqual(result.candidate.composition_children("2"), ["3"])

    def test_rename_object_is_previewed_and_applied_on_clone(self):
        document = create_course_project("Курсовая", "Расчет передачи")
        object_id = document.add_object("Старое название")
        source_before = document.to_bytes()
        plan = parse_plan_json(plan_payload([{
            "operation_id": "rename",
            "type": "rename_object",
            "arguments": {"object_id": object_id, "name": "Зубчатая передача"},
        }]))

        result = execute_plan(document, plan)

        self.assertEqual(document.to_bytes(), source_before)
        self.assertEqual(document.object(object_id).get("name"), "Старое название")
        self.assertEqual(result.candidate.object(object_id).get("name"), "Зубчатая передача")
        self.assertIn("переименован", result.applied_operations[0].description)

    def test_rename_object_rejects_missing_target_atomically(self):
        document = create_course_project("Курсовая", "Расчет передачи")
        before = document.to_bytes()
        plan = parse_plan_json(plan_payload([{
            "operation_id": "missing-object",
            "type": "rename_object",
            "arguments": {"object_id": "999", "name": "Новое название"},
        }]))

        with self.assertRaisesRegex(AssistantExecutionError, "missing-object"):
            execute_plan(document, plan)
        self.assertEqual(document.to_bytes(), before)

    def test_rename_object_rejects_empty_name_and_extra_fields(self):
        with self.assertRaisesRegex(AssistantProtocolError, "must not be empty"):
            parse_plan_json(plan_payload([{
                "type": "rename_object",
                "arguments": {"object_id": "1", "name": "   "},
            }]))
        with self.assertRaisesRegex(AssistantProtocolError, "unknown field"):
            parse_plan_json(plan_payload([{
                "type": "rename_object",
                "arguments": {"object_id": "1", "name": "Вал", "xml": "raw"},
            }]))

    def test_set_action_formula_updates_only_clone_and_sets_analytical_type(self):
        document = create_course_project("Курсовая", "Расчет передачи")
        action_id = document.add_action(
            "Расчет напряжения, sigmaFmax",
            action_type=0,
            formalization=1,
            parent_id="1",
        )
        source_before = document.to_bytes()
        plan = parse_plan_json(plan_payload([{
            "operation_id": "formula",
            "type": "set_action_formula",
            "arguments": {
                "action_id": action_id,
                "expression": "sigmaFmax = sigmaF*T1max/T1 <= sigmaFPmax",
                "reference": "6.23",
            },
        }]))

        result = execute_plan(document, plan)
        changed = result.candidate.action(action_id)

        self.assertEqual(document.to_bytes(), source_before)
        self.assertEqual(changed.get("formalization"), "0")
        self.assertEqual(
            changed.get("mark"),
            "sigmaFmax = sigmaF*T1max/T1 <= sigmaFPmax (6.23)",
        )

    def test_set_action_formula_rejects_composite_action_atomically(self):
        document = create_course_project("Курсовая", "Расчет передачи")
        before = document.to_bytes()
        plan = parse_plan_json(plan_payload([{
            "operation_id": "bad-formula",
            "type": "set_action_formula",
            "arguments": {"action_id": "1", "expression": "x = 1", "reference": "пример"},
        }]))

        with self.assertRaisesRegex(AssistantExecutionError, "elementary action"):
            execute_plan(document, plan)
        self.assertEqual(document.to_bytes(), before)

    def test_set_action_formula_requires_expression_and_reference(self):
        with self.assertRaisesRegex(AssistantProtocolError, "missing field"):
            parse_plan_json(plan_payload([{
                "type": "set_action_formula",
                "arguments": {"action_id": "2", "expression": "x = 1"},
            }]))

    def test_add_action_parameter_link_creates_safe_matrix_record(self):
        document = create_course_project("Курсовая", "Расчет передачи")
        action_id = document.add_action("Расчет результата, y", action_type=0, parent_id="1")
        parameter_id = document.add_parameter({"name": "Результат", "sign": "y"})
        before = document.to_bytes()
        plan = parse_plan_json(plan_payload([{
            "operation_id": "function-link",
            "type": "add_action_parameter_link",
            "arguments": {
                "action_id": action_id,
                "parameter_id": parameter_id,
                "role": "function",
            },
        }]))

        result = execute_plan(document, plan)
        rows = list(result.candidate.root.findall("./models/primaryModel/matrix/AElement"))

        self.assertEqual(document.to_bytes(), before)
        self.assertEqual(len(rows), 1)
        self.assertEqual(rows[0].get("e1"), action_id)
        self.assertEqual(rows[0].get("e2"), parameter_id)
        self.assertEqual(rows[0].get("char"), str(ord("*")))
        self.assertEqual(rows[0].get("power"), "1")

    def test_add_action_parameter_link_rejects_duplicate_atomically(self):
        document = create_course_project("Курсовая", "Расчет передачи")
        action_id = document.add_action("Расчет результата, y", action_type=0, parent_id="1")
        parameter_id = document.add_parameter({"name": "Результат", "sign": "y"})
        operations = [{
            "type": "add_action_parameter_link",
            "arguments": {
                "action_id": action_id,
                "parameter_id": parameter_id,
                "role": "function",
            },
        }] * 2
        before = document.to_bytes()

        with self.assertRaisesRegex(AssistantExecutionError, "already|существует"):
            execute_plan(document, parse_plan_json(plan_payload(operations)))
        self.assertEqual(document.to_bytes(), before)

    def test_add_action_parameter_link_rejects_unknown_role(self):
        with self.assertRaisesRegex(AssistantProtocolError, "role must be"):
            parse_plan_json(plan_payload([{
                "type": "add_action_parameter_link",
                "arguments": {"action_id": "2", "parameter_id": "1", "role": "raw"},
            }]))

    def test_renumber_actions_assigns_depth_global_codes_on_clone(self):
        document = create_course_project("Курсовая", "Расчет передачи")
        first = document.add_action("Первый шаг", action_type=0, parent_id="1")
        second = document.add_action("Второй шаг", action_type=0, parent_id="1")
        before = document.to_bytes()
        plan = parse_plan_json(plan_payload([{
            "operation_id": "renumber",
            "type": "renumber_actions",
            "arguments": {"symbol": "z"},
        }]))

        result = execute_plan(document, plan)

        self.assertEqual(document.to_bytes(), before)
        self.assertIsNone(document.action(first).get("level"))
        self.assertEqual(result.candidate.action("1").get("level"), "1")
        self.assertEqual(result.candidate.action(first).get("level"), "2")
        self.assertEqual(result.candidate.action(first).get("number"), "1")
        self.assertEqual(result.candidate.action(second).get("number"), "2")

    def test_renumber_actions_rejects_invalid_symbol_before_execution(self):
        with self.assertRaisesRegex(AssistantProtocolError, "symbol"):
            parse_plan_json(plan_payload([{
                "type": "renumber_actions",
                "arguments": {"symbol": "zz"},
            }]))


if __name__ == "__main__":
    unittest.main()
