import json
import unittest

from is2_re.assistant import (
    CancellationToken,
    ModelPlanRequest,
    ModelClarificationRequired,
    ModelProviderError,
    ModelRequestCancelled,
    OpenAIResponsesProvider,
    generate_model_preview,
)
from is2_re.coursework import create_course_project


VALID_PLAN = {
    "protocol_version": 1,
    "summary": "Добавить объект",
    "assumptions": [],
    "questions": [],
    "operations": [{
        "operation_id": "O1",
        "type": "add_object",
        "arguments": {"name": "Передача"},
    }],
    "sources": [],
    "manual_checks": [],
}


class FakeTransport:
    def __init__(self, response=None):
        self.response = response or {
            "id": "resp_test",
            "model": "test-model",
            "output": [{
                "type": "message",
                "content": [{"type": "output_text", "text": json.dumps(VALID_PLAN, ensure_ascii=False)}],
            }],
        }
        self.calls = []

    def post_sse_json(self, endpoint, **kwargs):
        self.calls.append((endpoint, kwargs))
        return self.response


class AssistantProviderTests(unittest.TestCase):
    def _provider(self, transport, **kwargs):
        return OpenAIResponsesProvider(
            model="test-model",
            api_key_provider=lambda: "secret-test-key",
            transport=transport,
            **kwargs,
        )

    def test_openai_provider_sends_bounded_context_and_validates_plan(self):
        transport = FakeTransport()
        provider = self._provider(transport, timeout_seconds=12)

        result = provider.generate_plan(ModelPlanRequest(
            user_prompt="Добавь объект передачи",
            project_context={"schema_version": 1, "counts": {"actions": 1}},
        ))

        self.assertEqual(result.plan.summary, "Добавить объект")
        self.assertEqual(result.response_id, "resp_test")
        endpoint, call = transport.calls[0]
        self.assertEqual(endpoint, "https://api.openai.com/v1/responses")
        self.assertEqual(call["timeout_seconds"], 12)
        self.assertEqual(call["headers"]["Authorization"], "Bearer secret-test-key")
        self.assertNotIn("secret-test-key", json.dumps(call["payload"], ensure_ascii=False))
        self.assertFalse(call["payload"]["store"])
        self.assertTrue(call["payload"]["stream"])
        self.assertNotIn("max_output_tokens", call["payload"])
        self.assertEqual(call["payload"]["text"]["format"]["type"], "json_schema")
        sent_text = call["payload"]["input"][0]["content"][0]["text"]
        self.assertIn("Добавь объект передачи", sent_text)
        self.assertIn('"actions":1', sent_text)

    def test_provider_rejects_model_output_outside_local_protocol(self):
        invalid = dict(VALID_PLAN)
        invalid["unexpected"] = True
        transport = FakeTransport({"output_text": json.dumps(invalid)})
        provider = self._provider(transport)

        with self.assertRaisesRegex(ModelProviderError, "rejected by the local protocol"):
            provider.generate_plan(ModelPlanRequest("Запрос", {"schema_version": 1}))

    def test_preview_returns_questions_for_user_instead_of_executing(self):
        response = dict(VALID_PLAN)
        response["questions"] = ["Какой модуль передачи?"]
        response["operations"] = []
        provider = self._provider(FakeTransport({"output_text": json.dumps(response, ensure_ascii=False)}))
        document = create_course_project("Курсовая", "Главное действие")

        with self.assertRaises(ModelClarificationRequired) as raised:
            generate_model_preview(document, provider, "Подготовь расчёт")

        self.assertEqual(raised.exception.questions, ("Какой модуль передачи?",))

    def test_missing_chatgpt_connection_is_rejected_before_transport(self):
        transport = FakeTransport()
        provider = OpenAIResponsesProvider(
            model="test-model",
            api_key_provider=lambda: None,
            transport=transport,
        )

        with self.assertRaisesRegex(ModelProviderError, "ChatGPT is not connected"):
            provider.generate_plan(ModelPlanRequest("Запрос", {"schema_version": 1}))
        self.assertEqual(transport.calls, [])

    def test_cancelled_request_never_reaches_transport(self):
        transport = FakeTransport()
        provider = self._provider(transport)
        cancellation = CancellationToken()
        cancellation.cancel()

        with self.assertRaises(ModelRequestCancelled):
            provider.generate_plan(
                ModelPlanRequest("Запрос", {"schema_version": 1}),
                cancellation=cancellation,
            )
        self.assertEqual(transport.calls, [])

    def test_context_and_prompt_limits_are_enforced(self):
        transport = FakeTransport()
        provider = self._provider(transport)
        with self.assertRaisesRegex(ModelProviderError, "project context exceeds"):
            provider.generate_plan(ModelPlanRequest("Запрос", {"large": "x" * (65 * 1024)}))
        with self.assertRaisesRegex(ModelProviderError, "user prompt exceeds"):
            provider.generate_plan(ModelPlanRequest("я" * (9 * 1024), {"schema_version": 1}))
        self.assertEqual(transport.calls, [])

    def test_refusal_is_reported_without_attempting_to_parse_it(self):
        transport = FakeTransport({
            "output": [{"type": "message", "content": [{"type": "refusal", "refusal": "cannot comply"}]}],
        })
        provider = self._provider(transport)
        with self.assertRaisesRegex(ModelProviderError, "refused"):
            provider.generate_plan(ModelPlanRequest("Запрос", {"schema_version": 1}))

    def test_model_preview_uses_summary_and_does_not_mutate_source_document(self):
        transport = FakeTransport()
        provider = self._provider(transport)
        document = create_course_project("Курсовая", "Главное действие")
        before = document.semantic_snapshot()

        preview = generate_model_preview(document, provider, "Добавь объект")

        self.assertEqual(document.semantic_snapshot(), before)
        self.assertNotEqual(preview.execution_result.candidate.semantic_snapshot(), before)
        self.assertTrue(preview.execution_result.writer_preflight["writer_idempotent"])
        sent_text = transport.calls[0][1]["payload"]["input"][0]["content"][0]["text"]
        self.assertIn('"counts":', sent_text)
        self.assertNotIn("Курсовая", sent_text)
        self.assertNotIn("<project", sent_text)


if __name__ == "__main__":
    unittest.main()

