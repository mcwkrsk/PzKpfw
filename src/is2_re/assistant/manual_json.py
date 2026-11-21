"""Manual JSON provider used to exercise the assistant pipeline offline."""
from __future__ import annotations

import json
from pathlib import Path

from .models import AssistantPlan, AssistantProtocolError


MAX_RESPONSE_BYTES = 2 * 1024 * 1024


def parse_plan_json(payload: str | bytes) -> AssistantPlan:
    if isinstance(payload, bytes):
        if len(payload) > MAX_RESPONSE_BYTES:
            raise AssistantProtocolError("assistant response exceeds the 2 MiB safety limit")
        try:
            payload = payload.decode("utf-8")
        except UnicodeDecodeError as exc:
            raise AssistantProtocolError("assistant response must be UTF-8") from exc
    if not isinstance(payload, str):
        raise AssistantProtocolError("assistant response must be text or UTF-8 bytes")
    if len(payload.encode("utf-8")) > MAX_RESPONSE_BYTES:
        raise AssistantProtocolError("assistant response exceeds the 2 MiB safety limit")
    try:
        decoded = json.loads(payload)
    except json.JSONDecodeError as exc:
        raise AssistantProtocolError(
            f"invalid assistant JSON at line {exc.lineno}, column {exc.colno}: {exc.msg}"
        ) from exc
    return AssistantPlan.from_dict(decoded)


def load_plan_file(path: str | Path) -> AssistantPlan:
    source = Path(path)
    if source.stat().st_size > MAX_RESPONSE_BYTES:
        raise AssistantProtocolError("assistant response exceeds the 2 MiB safety limit")
    return parse_plan_json(source.read_bytes())
