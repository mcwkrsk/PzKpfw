"""Model-provider boundary with bounded context and strict local validation."""
from __future__ import annotations

from dataclasses import dataclass
import json
from threading import Event, Lock
from typing import Any, Callable, Mapping, Protocol
from urllib.error import HTTPError, URLError
from urllib.parse import urlparse
from urllib.request import Request, urlopen

from .manual_json import MAX_RESPONSE_BYTES, parse_plan_json
from .models import AssistantPlan


MAX_USER_PROMPT_BYTES = 16 * 1024
MAX_CONTEXT_BYTES = 64 * 1024
MAX_HTTP_RESPONSE_BYTES = MAX_RESPONSE_BYTES
DEFAULT_OPENAI_ENDPOINT = "https://api.openai.com/v1/responses"


class ModelProviderError(ValueError):
    """Raised when a provider request cannot produce a valid local plan."""


class ModelRequestCancelled(ModelProviderError):
    """Raised when the caller cancels a provider request."""


class ModelClarificationRequired(ModelProviderError):
    """Carries model questions that the user must answer before execution."""

    def __init__(self, questions: tuple[str, ...]) -> None:
        self.questions = questions
        super().__init__("model needs clarification")


class CancellationToken:
    """Thread-safe cancellation signal that can close an active transport."""

    def __init__(self) -> None:
        self._event = Event()
        self._lock = Lock()
        self._callbacks: list[Callable[[], None]] = []

    @property
    def cancelled(self) -> bool:
        return self._event.is_set()

    def cancel(self) -> None:
        with self._lock:
            if self._event.is_set():
                return
            self._event.set()
            callbacks = tuple(self._callbacks)
            self._callbacks.clear()
        for callback in callbacks:
            try:
                callback()
            except OSError:
                pass

    def raise_if_cancelled(self) -> None:
        if self.cancelled:
            raise ModelRequestCancelled("model request was cancelled")

    def register(self, callback: Callable[[], None]) -> Callable[[], None]:
        with self._lock:
            if self._event.is_set():
                call_now = True
            else:
                self._callbacks.append(callback)
                call_now = False
        if call_now:
            callback()

        def unregister() -> None:
            with self._lock:
                if callback in self._callbacks:
                    self._callbacks.remove(callback)

        return unregister


@dataclass(frozen=True)
class ModelPlanRequest:
    user_prompt: str
    project_context: Mapping[str, Any]


@dataclass(frozen=True)
class ModelPlanResult:
    plan: AssistantPlan
    provider: str
    model: str
    response_id: str | None


@dataclass(frozen=True)
class VerifiedModelPreview:
    model_result: ModelPlanResult
    execution_result: Any


class ModelProvider(Protocol):
    name: str

    def generate_plan(
        self,
        request: ModelPlanRequest,
        *,
        cancellation: CancellationToken | None = None,
    ) -> ModelPlanResult: ...


class JsonTransport(Protocol):
    def post_sse_json(
        self,
        endpoint: str,
        *,
        headers: Mapping[str, str],
        payload: Mapping[str, Any],
        timeout_seconds: float,
        cancellation: CancellationToken,
    ) -> Mapping[str, Any]: ...


class HttpJsonTransport:
    """Small Responses SSE transport with timeout, cancellation and size limits."""

    def post_sse_json(
        self,
        endpoint: str,
        *,
        headers: Mapping[str, str],
        payload: Mapping[str, Any],
        timeout_seconds: float,
        cancellation: CancellationToken,
    ) -> Mapping[str, Any]:
        parsed = urlparse(endpoint)
        if parsed.scheme not in {"https", "http"} or not parsed.hostname:
            raise ModelProviderError("model endpoint must be an HTTP(S) URL")
        body = json.dumps(payload, ensure_ascii=False, separators=(",", ":")).encode("utf-8")
        response_holder: dict[str, Any] = {}

        def close_response() -> None:
            response = response_holder.get("response")
            if response is not None:
                response.close()

        unregister = cancellation.register(close_response)
        try:
            cancellation.raise_if_cancelled()
            request = Request(endpoint, data=body, headers=dict(headers), method="POST")
            try:
                response = urlopen(request, timeout=timeout_seconds)
            except HTTPError as exc:
                raw = exc.read(MAX_HTTP_RESPONSE_BYTES + 1)
                cancellation.raise_if_cancelled()
                return self._rejected_response(exc.code, raw)
            response_holder["response"] = response
            cancellation.raise_if_cancelled()
            total = 0
            completed: Mapping[str, Any] | None = None
            while True:
                line = response.readline(MAX_HTTP_RESPONSE_BYTES + 1)
                if not line:
                    break
                total += len(line)
                if total > MAX_HTTP_RESPONSE_BYTES:
                    raise ModelProviderError("model response exceeds the 2 MiB safety limit")
                cancellation.raise_if_cancelled()
                if not line.startswith(b"data:"):
                    continue
                data = line[5:].strip()
                if not data or data == b"[DONE]":
                    continue
                try:
                    event = json.loads(data.decode("utf-8"))
                except (UnicodeDecodeError, json.JSONDecodeError) as exc:
                    raise ModelProviderError("model service returned an invalid event stream") from exc
                if not isinstance(event, dict):
                    continue
                if event.get("type") == "response.failed":
                    detail = event.get("response")
                    message = _api_error_message(detail) if isinstance(detail, dict) else None
                    raise ModelProviderError("model response failed: " + (message or "unknown error"))
                if event.get("type") == "response.completed" and isinstance(event.get("response"), dict):
                    completed = event["response"]
            if completed is None:
                raise ModelProviderError("model stream ended without response.completed")
            return completed
        except ModelRequestCancelled:
            raise
        except (OSError, TimeoutError, URLError) as exc:
            if cancellation.cancelled:
                raise ModelRequestCancelled("model request was cancelled") from exc
            raise ModelProviderError(f"model request failed: {exc}") from exc
        finally:
            unregister()
            close_response()

    @staticmethod
    def _rejected_response(status: int, raw: bytes) -> Mapping[str, Any]:
        if len(raw) > MAX_HTTP_RESPONSE_BYTES:
            raise ModelProviderError("model response exceeds the 2 MiB safety limit")
        try:
            decoded = json.loads(raw.decode("utf-8"))
        except (UnicodeDecodeError, json.JSONDecodeError) as exc:
            raise ModelProviderError("model service returned invalid UTF-8 JSON") from exc
        if not isinstance(decoded, dict):
            raise ModelProviderError("model service response must be a JSON object")
        message = _api_error_message(decoded)
        if not message and isinstance(decoded.get("detail"), str):
            message = decoded["detail"]
        raise ModelProviderError(f"model service rejected the request: {message or 'HTTP ' + str(status)}")


_SCALAR_SCHEMA = {"anyOf": [{"type": "string"}, {"type": "integer"}]}
_NULLABLE_SCALAR_SCHEMA = {"anyOf": [{"type": "string"}, {"type": "integer"}, {"type": "null"}]}
_ATTRIBUTES_SCHEMA = {"type": "object", "additionalProperties": _SCALAR_SCHEMA}
_CHANGES_SCHEMA = {"type": "object", "additionalProperties": _NULLABLE_SCALAR_SCHEMA}


def _operation_schema(
    kind: str,
    properties: Mapping[str, Any],
    required: list[str],
) -> dict[str, Any]:
    return {
        "type": "object",
        "additionalProperties": False,
        "required": ["operation_id", "type", "arguments"],
        "properties": {
            "operation_id": {"type": "string"},
            "type": {"type": "string", "const": kind},
            "arguments": {
                "type": "object",
                "additionalProperties": False,
                "required": required,
                "properties": dict(properties),
            },
        },
    }


MODEL_OPERATION_SCHEMAS = [
    _operation_schema("add_object", {
        "name": {"type": "string"}, "attributes": _ATTRIBUTES_SCHEMA,
    }, ["name"]),
    _operation_schema("rename_object", {
        "object_id": _SCALAR_SCHEMA, "name": {"type": "string"},
    }, ["object_id", "name"]),
    _operation_schema("add_action", {
        "name": {"type": "string"}, "action_type": _SCALAR_SCHEMA,
        "formalization": _SCALAR_SCHEMA, "status": _SCALAR_SCHEMA,
        "mark": {"type": "string"}, "symbol": _SCALAR_SCHEMA,
        "level": _SCALAR_SCHEMA, "number": _SCALAR_SCHEMA,
        "parent_id": _SCALAR_SCHEMA, "parent_operation_id": {"type": "string"},
        "alternatives": {"type": "array", "items": {"type": "string"}},
    }, ["name", "action_type"]),
    _operation_schema("set_action_formula", {
        "action_id": _SCALAR_SCHEMA, "action_operation_id": {"type": "string"},
        "expression": {"type": "string"}, "reference": {"type": "string"},
    }, ["expression", "reference"]),
    _operation_schema("add_action_parameter_link", {
        "action_id": _SCALAR_SCHEMA, "action_operation_id": {"type": "string"},
        "parameter_id": _SCALAR_SCHEMA, "parameter_operation_id": {"type": "string"},
        "role": {"type": "string", "enum": ["function", "argument", "default_argument"]},
        "power": _SCALAR_SCHEMA,
    }, ["role"]),
    _operation_schema("renumber_actions", {"symbol": {"type": "string"}}, []),
    _operation_schema("add_parameter", {
        "attributes": _ATTRIBUTES_SCHEMA, "object_operation_id": {"type": "string"},
    }, ["attributes"]),
    _operation_schema("update_parameter", {
        "parameter_id": _SCALAR_SCHEMA, "changes": _CHANGES_SCHEMA,
    }, ["parameter_id", "changes"]),
]


MODEL_PLAN_SCHEMA: dict[str, Any] = {
    "type": "object",
    "additionalProperties": False,
    "required": [
        "protocol_version", "summary", "assumptions", "questions",
        "operations", "sources", "manual_checks",
    ],
    "properties": {
        "protocol_version": {"type": "integer", "enum": [1]},
        "summary": {"type": "string"},
        "assumptions": {"type": "array", "items": {"type": "string"}},
        "questions": {"type": "array", "items": {"type": "string"}},
        "operations": {
            "type": "array",
            "items": {"anyOf": MODEL_OPERATION_SCHEMAS},
        },
        "sources": {
            "type": "array",
            "items": {
                "type": "object",
                "additionalProperties": False,
                "required": ["title", "locator"],
                "properties": {"title": {"type": "string"}, "locator": {"type": "string"}},
            },
        },
        "manual_checks": {"type": "array", "items": {"type": "string"}},
    },
}


SYSTEM_INSTRUCTIONS = """You prepare a proposed PzKpfw assistant plan.
Return JSON only, matching protocol version 1. Use only the supplied user request and bounded project context.
Never invent project identifiers, formulas, coefficients, sources, or successful validation claims.
Use only allow-listed operation types from the response schema. A supplied methodology context is a trusted local
route: use it and do not ask the user to provide that source again. Put genuinely missing numerical inputs in
questions and uncertain claims in assumptions or manual_checks. Do not request, expose, or include secrets. The plan
will be validated and executed on a cloned document; it is never applied automatically.
When methodology.coursework_output.calculate_numeric_values is false, the task is to model an IS-2 scheme, not to
solve the engineering calculation. Do not request numerical inputs and do not evaluate formulas. Create a functional
decomposition, symbolic parameters, formula references, alternatives, and action-parameter links sufficient for
Forms A, B, C, D, D1, and D2.
Never use client_ref or description inside operation arguments. To refer to a record created earlier in the same
plan, use its operation_id through parent_operation_id, action_operation_id, parameter_operation_id, or
object_operation_id as appropriate. Use direct *_id fields only for existing records from project context."""


class OpenAIResponsesProvider:
    """Primary provider using the OpenAI Responses API and local protocol validation."""

    name = "openai_responses"

    def __init__(
        self,
        *,
        model: str = "gpt-6.1-sol",
        endpoint: str = DEFAULT_OPENAI_ENDPOINT,
        timeout_seconds: float = 45.0,
        max_output_tokens: int = 8_000,
        access_token_provider: Callable[[], str | None] | None = None,
        api_key_provider: Callable[[], str | None] | None = None,
        transport: JsonTransport | None = None,
    ) -> None:
        if not model.strip():
            raise ValueError("model must not be empty")
        if not 1 <= timeout_seconds <= 300:
            raise ValueError("timeout_seconds must be between 1 and 300")
        if not 1 <= max_output_tokens <= 64_000:
            raise ValueError("max_output_tokens must be between 1 and 64000")
        self.model = model.strip()
        self.endpoint = endpoint
        self.timeout_seconds = float(timeout_seconds)
        self.max_output_tokens = max_output_tokens
        self._access_token_provider = access_token_provider or api_key_provider or (lambda: None)
        self._transport = transport or HttpJsonTransport()

    def generate_plan(
        self,
        request: ModelPlanRequest,
        *,
        cancellation: CancellationToken | None = None,
    ) -> ModelPlanResult:
        token = cancellation or CancellationToken()
        token.raise_if_cancelled()
        user_prompt = _bounded_text(request.user_prompt, "user prompt", MAX_USER_PROMPT_BYTES)
        context_text = _bounded_context(request.project_context)
        try:
            access_token = self._access_token_provider()
        except Exception as exc:
            raise ModelProviderError(str(exc)) from exc
        if not access_token or not access_token.strip():
            raise ModelProviderError("ChatGPT is not connected")
        payload = {
            "model": self.model,
            "store": False,
            "stream": True,
            "instructions": SYSTEM_INSTRUCTIONS,
            "input": [{
                "role": "user",
                "content": [{
                    "type": "input_text",
                    "text": "User request:\n" + user_prompt + "\n\nBounded project context JSON:\n" + context_text,
                }],
            }],
            "text": {"format": {
                "type": "json_schema",
                "name": "pzkpfw_assistant_plan_v1",
                "description": "A proposed, locally validated PzKpfw project operation plan",
                "strict": False,
                "schema": MODEL_PLAN_SCHEMA,
            }},
        }
        response = self._transport.post_sse_json(
            self.endpoint,
            headers={
                "Authorization": "Bearer " + access_token.strip(),
                "Content-Type": "application/json",
                "Accept": "text/event-stream",
            },
            payload=payload,
            timeout_seconds=self.timeout_seconds,
            cancellation=token,
        )
        token.raise_if_cancelled()
        output_text = _response_output_text(response)
        try:
            plan = parse_plan_json(output_text)
        except ValueError as exc:
            raise ModelProviderError(f"model returned a plan rejected by the local protocol: {exc}") from exc
        return ModelPlanResult(
            plan=plan,
            provider=self.name,
            model=str(response.get("model") or self.model),
            response_id=str(response["id"]) if response.get("id") is not None else None,
        )


def generate_model_preview(
    document: Any,
    provider: ModelProvider,
    user_prompt: str,
    *,
    cancellation: CancellationToken | None = None,
) -> VerifiedModelPreview:
    """Request a plan from a bounded summary and execute it only on a clone."""
    from ..document import ProjectDocument
    from .context import model_project_context
    from .executor import execute_plan

    if not isinstance(document, ProjectDocument):
        raise TypeError("document must be a ProjectDocument")
    request = ModelPlanRequest(
        user_prompt=user_prompt,
        project_context=model_project_context(document, user_prompt),
    )
    model_result = provider.generate_plan(request, cancellation=cancellation)
    if model_result.plan.questions:
        raise ModelClarificationRequired(model_result.plan.questions)
    execution_result = execute_plan(document, model_result.plan)
    return VerifiedModelPreview(model_result=model_result, execution_result=execution_result)


def _bounded_text(value: str, label: str, maximum_bytes: int) -> str:
    if not isinstance(value, str) or not value.strip():
        raise ModelProviderError(f"{label} must not be empty")
    encoded = value.encode("utf-8")
    if len(encoded) > maximum_bytes:
        raise ModelProviderError(f"{label} exceeds the {maximum_bytes // 1024} KiB safety limit")
    return value.strip()


def _bounded_context(context: Mapping[str, Any]) -> str:
    if not isinstance(context, Mapping):
        raise ModelProviderError("project context must be a mapping")
    try:
        encoded = json.dumps(context, ensure_ascii=False, separators=(",", ":")).encode("utf-8")
    except (TypeError, ValueError) as exc:
        raise ModelProviderError("project context must contain only JSON-compatible values") from exc
    if len(encoded) > MAX_CONTEXT_BYTES:
        raise ModelProviderError("project context exceeds the 64 KiB safety limit")
    return encoded.decode("utf-8")


def _response_output_text(response: Mapping[str, Any]) -> str:
    direct = response.get("output_text")
    if isinstance(direct, str) and direct.strip():
        return direct
    chunks: list[str] = []
    output = response.get("output", [])
    if not isinstance(output, list):
        raise ModelProviderError("model response has an invalid output field")
    for item in output:
        if not isinstance(item, dict) or item.get("type") != "message":
            continue
        content = item.get("content", [])
        if not isinstance(content, list):
            continue
        for part in content:
            if not isinstance(part, dict):
                continue
            if part.get("type") == "refusal":
                raise ModelProviderError("model refused the request: " + str(part.get("refusal", "refused")))
            if part.get("type") == "output_text" and isinstance(part.get("text"), str):
                chunks.append(part["text"])
    if not chunks:
        message = _api_error_message(response)
        if message:
            raise ModelProviderError("model response error: " + message)
        raise ModelProviderError("model response contains no output text")
    return "".join(chunks)


def _api_error_message(response: Mapping[str, Any]) -> str | None:
    error = response.get("error")
    if isinstance(error, dict) and isinstance(error.get("message"), str):
        return error["message"]
    if isinstance(error, str):
        return error
    return None

