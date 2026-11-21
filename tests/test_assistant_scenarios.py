import json
import unittest
from pathlib import Path

from is2_re.assistant import AssignmentInput, CourseworkAssignment, build_assignment_plan, execute_plan
from is2_re.coursework import create_course_project


FIXTURES = Path(__file__).parent / "fixtures" / "assistant"


class AssistantControlScenarioTests(unittest.TestCase):
    def assert_writer_preflight_ok(self, result):
        self.assertTrue(result.writer_preflight["xml_reopens"])
        self.assertTrue(result.writer_preflight["semantic_preserved"])
        self.assertTrue(result.writer_preflight["writer_idempotent"])
        self.assertEqual(result.writer_preflight["validation_issues"], [])

    def _run_scenario(self, filename: str):
        payload = json.loads((FIXTURES / filename).read_text(encoding="utf-8"))
        definition = payload["assignment"]
        assignment = CourseworkAssignment(
            title=definition["title"],
            transmission_kind=definition["transmission_kind"],
            calculation_mode=definition["calculation_mode"],
            parent_action_id=definition["parent_action_id"],
            inputs=tuple(AssignmentInput(**item) for item in definition["inputs"]),
            perform_calculations=True,
        )
        document = create_course_project("Контрольный проект", "Расчёт передачи")
        plan = build_assignment_plan(document, assignment)
        result = execute_plan(document, plan)
        return payload, plan, result

    def test_design_scenario_matches_expected_results(self):
        payload, _plan, result = self._run_scenario("cylindrical_design.json")
        by_sign = {
            node.get("sign"): node.get("value")
            for node in result.candidate.params_node.findall("param")
        }

        for symbol, expected in payload["expected_parameters"].items():
            self.assertEqual(by_sign.get(symbol), expected, symbol)
        self.assertEqual(result.validation_issues_after, ())
        self.assert_writer_preflight_ok(result)

    def test_verification_scenario_matches_expected_results(self):
        payload, plan, result = self._run_scenario("cylindrical_verification.json")
        by_sign = {
            node.get("sign"): node.get("value")
            for node in result.candidate.params_node.findall("param")
        }

        for symbol, expected in payload["expected_parameters"].items():
            self.assertEqual(by_sign.get(symbol), expected, symbol)
        self.assertTrue(any(payload["expected_check_text"] in item for item in plan.manual_checks))
        self.assertEqual(result.validation_issues_after, ())
        self.assert_writer_preflight_ok(result)


if __name__ == "__main__":
    unittest.main()
