import json
import unittest
from pathlib import Path

from is2_re.assistant import (
    AssistantExecutionError,
    AssistantProtocolError,
    execute_plan,
    load_plan_file,
)
from is2_re.coursework import create_course_project


PACKAGE = Path(__file__).parents[1] / "docs" / "is2_skill" / "v1"


class Is2SkillPackageTests(unittest.TestCase):
    def test_manifest_examples_match_current_protocol_and_executor(self):
        manifest = json.loads((PACKAGE / "test_cases.json").read_text(encoding="utf-8"))
        self.assertEqual(manifest["package_version"], 1)
        self.assertEqual(manifest["protocol_version"], 1)

        for case in manifest["cases"]:
            with self.subTest(file=case["file"]):
                path = PACKAGE / case["file"]
                document = create_course_project("Проверка набора инструкций", "Главное действие")
                if case["accepted"]:
                    plan = load_plan_file(path)
                    result = execute_plan(document, plan)
                    self.assertEqual(result.validation_issues_after, ())
                    self.assertTrue(result.writer_preflight["xml_reopens"])
                    self.assertTrue(result.writer_preflight["semantic_preserved"])
                    self.assertTrue(result.writer_preflight["writer_idempotent"])
                    continue

                expected_error = (
                    AssistantProtocolError if case["stage"] == "parse"
                    else AssistantExecutionError
                )
                with self.assertRaises(expected_error) as caught:
                    plan = load_plan_file(path)
                    if case["stage"] == "execute":
                        execute_plan(document, plan)
                self.assertIn(case["error_contains"], str(caught.exception))

    def test_schema_and_all_json_files_are_valid_json(self):
        schema = json.loads((PACKAGE / "protocol.schema.json").read_text(encoding="utf-8"))
        self.assertEqual(schema["properties"]["protocol_version"]["const"], 1)
        for path in PACKAGE.rglob("*.json"):
            with self.subTest(path=path.name):
                json.loads(path.read_text(encoding="utf-8"))


if __name__ == "__main__":
    unittest.main()

