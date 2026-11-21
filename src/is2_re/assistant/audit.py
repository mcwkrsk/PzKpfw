"""Privacy-preserving technical journal for accepted assistant plans."""
from __future__ import annotations

from collections import Counter
from datetime import datetime, timezone
import json
import os
from pathlib import Path

from .executor import ExecutionResult


AUDIT_SCHEMA_VERSION = 1


def default_audit_path() -> Path:
    """Return the per-user journal path without depending on an open project."""
    local_app_data = os.environ.get("LOCALAPPDATA")
    base = Path(local_app_data) if local_app_data else Path.home() / ".pzkpfw"
    return base / "PzKpfw" / "assistant-audit.jsonl"


def build_audit_record(
    result: ExecutionResult,
    *,
    event: str = "applied",
    timestamp: datetime | None = None,
) -> dict[str, object]:
    """Build metadata-only record: no prompts, values, names, IDs or paths."""
    moment = timestamp or datetime.now(timezone.utc)
    operation_types = Counter(item.type for item in result.applied_operations)
    preflight = result.writer_preflight
    return {
        "schema_version": AUDIT_SCHEMA_VERSION,
        "timestamp_utc": moment.astimezone(timezone.utc).isoformat(),
        "event": event,
        "protocol_version": result.plan.protocol_version,
        "operation_count": len(result.applied_operations),
        "operation_types": dict(sorted(operation_types.items())),
        "change_count": len(result.diff.operations),
        "validation_issue_count": len(result.validation_issues_after),
        "writer_checks": {
            "xml_reopens": bool(preflight.get("xml_reopens")),
            "semantic_preserved": bool(preflight.get("semantic_preserved")),
            "writer_idempotent": bool(preflight.get("writer_idempotent")),
        },
    }


def append_audit_record(
    result: ExecutionResult,
    *,
    event: str = "applied",
    path: Path | None = None,
) -> Path:
    """Append one UTF-8 JSON line and return the journal path."""
    destination = path or default_audit_path()
    destination.parent.mkdir(parents=True, exist_ok=True)
    record = build_audit_record(result, event=event)
    with destination.open("a", encoding="utf-8", newline="\n") as stream:
        stream.write(json.dumps(record, ensure_ascii=False, sort_keys=True) + "\n")
    return destination
