import json
import tempfile
import unittest
from datetime import datetime, timezone
from pathlib import Path

from is2_re.assistant import (
    append_audit_record,
    build_audit_record,
    execute_plan,
    parse_plan_json,
)
from is2_re.coursework import create_course_project


class AssistantAuditTests(unittest.TestCase):
    def _result(self):
        document = create_course_project("Секретный проект", "Закрытая работа")
        plan = parse_plan_json(json.dumps({
            "protocol_version": 1,
            "summary": "Не сохранять это описание",
            "operations": [{
                "type": "add_object",
                "arguments": {"name": "Конфиденциальное имя"},
            }],
        }, ensure_ascii=False))
        return execute_plan(document, plan)

    def test_record_contains_only_safe_aggregate_metadata(self):
        record = build_audit_record(
            self._result(),
            timestamp=datetime(2026, 11, 11, 9, 30, tzinfo=timezone.utc),
        )
        encoded = json.dumps(record, ensure_ascii=False)

        self.assertEqual(record["operation_types"], {"add_object": 1})
        self.assertEqual(record["timestamp_utc"], "2026-11-11T09:30:00+00:00")
        self.assertNotIn("Конфиденциальное", encoded)
        self.assertNotIn("Не сохранять", encoded)
        self.assertNotIn("Секретный", encoded)

    def test_append_writes_one_json_line(self):
        with tempfile.TemporaryDirectory(dir="C:/projects/pzkpfw/tmp/test_temp") as folder:
            path = Path(folder) / "assistant.jsonl"
            written = append_audit_record(self._result(), path=path)

            lines = path.read_text(encoding="utf-8").splitlines()
            self.assertEqual(written, path)
            self.assertEqual(len(lines), 1)
            self.assertEqual(json.loads(lines[0])["event"], "applied")


if __name__ == "__main__":
    unittest.main()
