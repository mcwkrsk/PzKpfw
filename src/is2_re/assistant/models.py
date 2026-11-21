"""Strict versioned data contract for model-produced project operations.

The protocol intentionally accepts a very small JSON surface. Unknown fields
and operation kinds are rejected before a ProjectDocument is touched.
"""
from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Mapping


PROTOCOL_VERSION = 1
MAX_TEXT = 4_000
MAX_SHORT_TEXT = 240
MAX_LIST_ITEMS = 128
MAX_OPERATIONS = 128
MAX_MAPPING_ITEMS = 64

OPERATION_FIELDS: dict[str, tuple[set[str], set[str]]] = {
    "add_object": ({"name"}, {"attributes"}),
    "rename_object": ({"object_id", "name"}, set()),
    "add_action": (
        {"name", "action_type"},
        {"formalization", "status", "mark", "symbol", "level", "number", "parent_id", "parent_operation_id", "alternatives"},
    ),
    "set_action_formula": ({"expression", "reference"}, {"action_id", "action_operation_id"}),
    "add_action_parameter_link": (
        {"role"},
        {"action_id", "action_operation_id", "parameter_id", "parameter_operation_id", "power"},
    ),
    "renumber_actions": (set(), {"symbol"}),
    "add_parameter": ({"attributes"}, {"object_operation_id"}),
    "update_parameter": ({"parameter_id", "changes"}, set()),
}


class AssistantProtocolError(ValueError):
    """Raised when an assistant response violates the local JSON contract."""


def _object(value: Any, path: str) -> Mapping[str, Any]:
    if not isinstance(value, dict):
        raise AssistantProtocolError(f"{path} must be a JSON object")
    return value


def _check_fields(value: Mapping[str, Any], *, allowed: set[str], required: set[str], path: str) -> None:
    unknown = sorted(set(value) - allowed)
    missing = sorted(required - set(value))
    if unknown:
        raise AssistantProtocolError(f"{path} has unknown field(s): {', '.join(unknown)}")
    if missing:
        raise AssistantProtocolError(f"{path} is missing field(s): {', '.join(missing)}")


def _text(value: Any, path: str, *, maximum: int = MAX_TEXT, allow_empty: bool = False) -> str:
    if not isinstance(value, str):
        raise AssistantProtocolError(f"{path} must be a string")
    if not allow_empty and not value.strip():
        raise AssistantProtocolError(f"{path} must not be empty")
    if len(value) > maximum:
        raise AssistantProtocolError(f"{path} exceeds {maximum} characters")
    return value


def _scalar(value: Any, path: str, *, allow_none: bool = False) -> str | int | None:
    if value is None and allow_none:
        return None
    if isinstance(value, bool) or not isinstance(value, (str, int)):
        raise AssistantProtocolError(f"{path} must be a string or integer")
    if isinstance(value, str) and len(value) > MAX_TEXT:
        raise AssistantProtocolError(f"{path} exceeds {MAX_TEXT} characters")
    return value


def _string_list(value: Any, path: str, *, maximum: int = MAX_LIST_ITEMS) -> tuple[str, ...]:
    if not isinstance(value, list):
        raise AssistantProtocolError(f"{path} must be an array")
    if len(value) > maximum:
        raise AssistantProtocolError(f"{path} exceeds {maximum} items")
    return tuple(_text(item, f"{path}[{index}]", maximum=MAX_TEXT) for index, item in enumerate(value))


def _attributes(value: Any, path: str, *, allow_none: bool = False) -> dict[str, str | int | None]:
    mapping = _object(value, path)
    if len(mapping) > MAX_MAPPING_ITEMS:
        raise AssistantProtocolError(f"{path} exceeds {MAX_MAPPING_ITEMS} fields")
    result: dict[str, str | int | None] = {}
    for key, item in mapping.items():
        clean_key = _text(key, f"{path} key", maximum=MAX_SHORT_TEXT)
        result[clean_key] = _scalar(item, f"{path}.{clean_key}", allow_none=allow_none)
    return result


@dataclass(frozen=True)
class SourceReference:
    title: str
    locator: str = ""

    @classmethod
    def from_dict(cls, value: Any, path: str) -> "SourceReference":
        data = _object(value, path)
        _check_fields(data, allowed={"title", "locator"}, required={"title"}, path=path)
        return cls(
            title=_text(data["title"], f"{path}.title", maximum=MAX_SHORT_TEXT),
            locator=_text(data.get("locator", ""), f"{path}.locator", maximum=MAX_TEXT, allow_empty=True),
        )

    def as_dict(self) -> dict[str, str]:
        return {"title": self.title, "locator": self.locator}


@dataclass(frozen=True)
class AssistantOperation:
    operation_id: str
    type: str
    arguments: Mapping[str, Any]

    @classmethod
    def from_dict(cls, value: Any, index: int) -> "AssistantOperation":
        path = f"operations[{index}]"
        data = _object(value, path)
        _check_fields(
            data,
            allowed={"operation_id", "type", "arguments"},
            required={"type", "arguments"},
            path=path,
        )
        kind = _text(data["type"], f"{path}.type", maximum=MAX_SHORT_TEXT)
        if kind not in OPERATION_FIELDS:
            raise AssistantProtocolError(f"{path}.type is unsupported: {kind!r}")
        operation_id = _text(
            data.get("operation_id", f"O{index + 1:04d}"),
            f"{path}.operation_id",
            maximum=MAX_SHORT_TEXT,
        )
        args = _object(data["arguments"], f"{path}.arguments")
        required, optional = OPERATION_FIELDS[kind]
        _check_fields(args, allowed=required | optional, required=required, path=f"{path}.arguments")
        parsed = _parse_arguments(kind, args, f"{path}.arguments")
        return cls(operation_id=operation_id, type=kind, arguments=parsed)

    def as_dict(self) -> dict[str, Any]:
        arguments = dict(self.arguments)
        if isinstance(arguments.get("alternatives"), tuple):
            arguments["alternatives"] = list(arguments["alternatives"])
        return {"operation_id": self.operation_id, "type": self.type, "arguments": arguments}


def _parse_arguments(kind: str, data: Mapping[str, Any], path: str) -> dict[str, Any]:
    if kind == "add_object":
        attributes = _attributes(data.get("attributes", {}), f"{path}.attributes")
        forbidden = sorted({"id", "name"} & set(attributes))
        if forbidden:
            raise AssistantProtocolError(
                f"{path}.attributes cannot assign managed field(s): {', '.join(forbidden)}"
            )
        return {
            "name": _text(data["name"], f"{path}.name", maximum=MAX_SHORT_TEXT),
            "attributes": attributes,
        }
    if kind == "rename_object":
        return {
            "object_id": _scalar(data["object_id"], f"{path}.object_id"),
            "name": _text(data["name"], f"{path}.name", maximum=MAX_SHORT_TEXT),
        }
    if kind == "add_action":
        result: dict[str, Any] = {
            "name": _text(data["name"], f"{path}.name", maximum=MAX_SHORT_TEXT),
            "action_type": _scalar(data["action_type"], f"{path}.action_type"),
            "formalization": _scalar(data.get("formalization", 0), f"{path}.formalization"),
            "status": _scalar(data.get("status", 0), f"{path}.status"),
            "mark": _text(data.get("mark", ""), f"{path}.mark", maximum=MAX_SHORT_TEXT, allow_empty=True),
            "alternatives": _string_list(data.get("alternatives", []), f"{path}.alternatives"),
        }
        for name in ("symbol", "level", "number", "parent_id"):
            if name in data:
                result[name] = _scalar(data[name], f"{path}.{name}")
        if "parent_operation_id" in data:
            result["parent_operation_id"] = _text(
                data["parent_operation_id"],
                f"{path}.parent_operation_id",
                maximum=MAX_SHORT_TEXT,
            )
        return result
    if kind == "set_action_formula":
        action_id = data.get("action_id")
        action_operation_id = data.get("action_operation_id")
        if (action_id is None) == (action_operation_id is None):
            raise AssistantProtocolError(
                f"{path} must contain exactly one of action_id or action_operation_id"
            )
        result = {
            "expression": _text(data["expression"], f"{path}.expression", maximum=MAX_TEXT),
            "reference": _text(data["reference"], f"{path}.reference", maximum=MAX_SHORT_TEXT),
        }
        if action_id is not None:
            result["action_id"] = _scalar(action_id, f"{path}.action_id")
        else:
            result["action_operation_id"] = _text(
                action_operation_id, f"{path}.action_operation_id", maximum=MAX_SHORT_TEXT
            )
        return result
    if kind == "add_action_parameter_link":
        role = _text(data["role"], f"{path}.role", maximum=MAX_SHORT_TEXT)
        if role not in {"function", "argument", "default_argument"}:
            raise AssistantProtocolError(
                f"{path}.role must be function, argument or default_argument"
            )
        action_id = data.get("action_id")
        action_operation_id = data.get("action_operation_id")
        parameter_id = data.get("parameter_id")
        parameter_operation_id = data.get("parameter_operation_id")
        if (action_id is None) == (action_operation_id is None):
            raise AssistantProtocolError(
                f"{path} must contain exactly one of action_id or action_operation_id"
            )
        if (parameter_id is None) == (parameter_operation_id is None):
            raise AssistantProtocolError(
                f"{path} must contain exactly one of parameter_id or parameter_operation_id"
            )
        result = {
            "role": role,
            "power": _scalar(data.get("power", 1), f"{path}.power"),
        }
        if action_id is not None:
            result["action_id"] = _scalar(action_id, f"{path}.action_id")
        else:
            result["action_operation_id"] = _text(
                action_operation_id, f"{path}.action_operation_id", maximum=MAX_SHORT_TEXT
            )
        if parameter_id is not None:
            result["parameter_id"] = _scalar(parameter_id, f"{path}.parameter_id")
        else:
            result["parameter_operation_id"] = _text(
                parameter_operation_id, f"{path}.parameter_operation_id", maximum=MAX_SHORT_TEXT
            )
        return result
    if kind == "renumber_actions":
        symbol = _text(data.get("symbol", "z"), f"{path}.symbol", maximum=1)
        if len(symbol) != 1 or not symbol.isprintable() or symbol.isspace():
            raise AssistantProtocolError(f"{path}.symbol must be one printable non-space character")
        return {"symbol": symbol}
    if kind == "add_parameter":
        attributes = _attributes(data["attributes"], f"{path}.attributes")
        if "id" in attributes:
            raise AssistantProtocolError(f"{path}.attributes.id is assigned by PzKpfw")
        name = attributes.get("name")
        if not isinstance(name, str) or not name.strip():
            raise AssistantProtocolError(f"{path}.attributes.name must be a non-empty string")
        result = {"attributes": attributes}
        if "object_operation_id" in data:
            result["object_operation_id"] = _text(
                data["object_operation_id"],
                f"{path}.object_operation_id",
                maximum=MAX_SHORT_TEXT,
            )
        return result
    if kind == "update_parameter":
        changes = _attributes(data["changes"], f"{path}.changes", allow_none=True)
        if not changes:
            raise AssistantProtocolError(f"{path}.changes must not be empty")
        if "id" in changes:
            raise AssistantProtocolError(f"{path}.changes.id is not allowed")
        return {
            "parameter_id": _scalar(data["parameter_id"], f"{path}.parameter_id"),
            "changes": changes,
        }
    raise AssistantProtocolError(f"unsupported operation type: {kind!r}")


@dataclass(frozen=True)
class AssistantPlan:
    protocol_version: int
    summary: str
    assumptions: tuple[str, ...]
    questions: tuple[str, ...]
    operations: tuple[AssistantOperation, ...]
    sources: tuple[SourceReference, ...]
    manual_checks: tuple[str, ...]

    @classmethod
    def from_dict(cls, value: Any) -> "AssistantPlan":
        data = _object(value, "response")
        allowed = {
            "protocol_version", "summary", "assumptions", "questions",
            "operations", "sources", "manual_checks",
        }
        _check_fields(data, allowed=allowed, required={"protocol_version", "summary", "operations"}, path="response")
        version = data["protocol_version"]
        if isinstance(version, bool) or not isinstance(version, int) or version != PROTOCOL_VERSION:
            raise AssistantProtocolError(
                f"response.protocol_version must be {PROTOCOL_VERSION}, got {version!r}"
            )
        raw_operations = data["operations"]
        if not isinstance(raw_operations, list):
            raise AssistantProtocolError("response.operations must be an array")
        if len(raw_operations) > MAX_OPERATIONS:
            raise AssistantProtocolError(f"response.operations exceeds {MAX_OPERATIONS} items")
        operations = tuple(AssistantOperation.from_dict(item, index) for index, item in enumerate(raw_operations))
        operation_ids = [item.operation_id for item in operations]
        if len(operation_ids) != len(set(operation_ids)):
            raise AssistantProtocolError("response.operations contains duplicate operation_id values")
        raw_sources = data.get("sources", [])
        if not isinstance(raw_sources, list) or len(raw_sources) > MAX_LIST_ITEMS:
            raise AssistantProtocolError(f"response.sources must be an array of at most {MAX_LIST_ITEMS} items")
        return cls(
            protocol_version=version,
            summary=_text(data["summary"], "response.summary", maximum=MAX_TEXT),
            assumptions=_string_list(data.get("assumptions", []), "response.assumptions"),
            questions=_string_list(data.get("questions", []), "response.questions"),
            operations=operations,
            sources=tuple(SourceReference.from_dict(item, f"response.sources[{index}]") for index, item in enumerate(raw_sources)),
            manual_checks=_string_list(data.get("manual_checks", []), "response.manual_checks"),
        )

    def as_dict(self) -> dict[str, Any]:
        return {
            "protocol_version": self.protocol_version,
            "summary": self.summary,
            "assumptions": list(self.assumptions),
            "questions": list(self.questions),
            "operations": [item.as_dict() for item in self.operations],
            "sources": [item.as_dict() for item in self.sources],
            "manual_checks": list(self.manual_checks),
        }
