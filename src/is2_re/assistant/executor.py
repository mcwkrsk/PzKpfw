"""Atomic execution of allow-listed assistant operations on a document clone."""
from __future__ import annotations

from collections import Counter
from dataclasses import dataclass
from typing import Any

from ..diff import ProjectDiff, compare_documents
from ..document import ProjectDocument
from ..coursework import renumber_structure
from ..specifications import add_primary_link
from .models import AssistantOperation, AssistantPlan


class AssistantExecutionError(ValueError):
    """Raised when an operation or final safety check refuses a plan."""

    def __init__(self, message: str, *, operation_id: str | None = None):
        self.operation_id = operation_id
        prefix = f"operation {operation_id}: " if operation_id else ""
        super().__init__(prefix + message)


@dataclass(frozen=True)
class AppliedOperation:
    operation_id: str
    type: str
    description: str
    result_id: str | None = None


@dataclass(frozen=True)
class ExecutionResult:
    candidate: ProjectDocument
    plan: AssistantPlan
    applied_operations: tuple[AppliedOperation, ...]
    diff: ProjectDiff
    validation_issues_before: tuple[str, ...]
    validation_issues_after: tuple[str, ...]
    writer_preflight: dict[str, object]

    @property
    def has_changes(self) -> bool:
        return bool(self.diff.operations)


def _apply(
    candidate: ProjectDocument,
    operation: AssistantOperation,
    resolved_ids: dict[str, tuple[str, str]],
) -> AppliedOperation:
    args = dict(operation.arguments)
    kind = operation.type

    def resolve_reference(id_field: str, operation_field: str, expected_kind: str) -> str:
        if id_field in args:
            return str(args.pop(id_field))
        producer = str(args.pop(operation_field))
        resolved = resolved_ids.get(producer)
        if resolved is None:
            raise AssistantExecutionError(
                f"operation {producer!r} has not produced an ID",
                operation_id=operation.operation_id,
            )
        resolved_kind, resolved_id = resolved
        if resolved_kind != expected_kind:
            raise AssistantExecutionError(
                f"operation {producer!r} did not create the required record",
                operation_id=operation.operation_id,
            )
        return resolved_id
    if kind == "add_object":
        ident = candidate.add_object(args["name"], attributes=args["attributes"])
        return AppliedOperation(operation.operation_id, kind, f"Добавлен объект «{args['name']}»", ident)
    if kind == "rename_object":
        ident = str(args["object_id"])
        previous_name = candidate.object(ident).get("name", "")
        candidate.update_object(ident, name=args["name"])
        return AppliedOperation(
            operation.operation_id,
            kind,
            f"Объект «{previous_name}» переименован в «{args['name']}»",
            ident,
        )
    if kind == "add_action":
        parent_operation_id = args.pop("parent_operation_id", None)
        if parent_operation_id is not None:
            resolved = resolved_ids.get(str(parent_operation_id))
            if resolved is None:
                raise AssistantExecutionError(
                    f"parent operation {parent_operation_id!r} has not produced an ID",
                    operation_id=operation.operation_id,
                )
            resolved_kind, resolved_id = resolved
            if resolved_kind != "add_action":
                raise AssistantExecutionError(
                    f"operation {parent_operation_id!r} did not create an action",
                    operation_id=operation.operation_id,
                )
            if "parent_id" in args:
                raise AssistantExecutionError(
                    "parent_id and parent_operation_id cannot be used together",
                    operation_id=operation.operation_id,
                )
            args["parent_id"] = resolved_id
        ident = candidate.add_action(**args)
        return AppliedOperation(operation.operation_id, kind, f"Добавлено действие «{args['name']}»", ident)
    if kind == "set_action_formula":
        ident = resolve_reference("action_id", "action_operation_id", "add_action")
        action = candidate.action(ident)
        if action.get("type") != "0":
            raise AssistantExecutionError(
                "formula can only be assigned to an elementary action (type 0)",
                operation_id=operation.operation_id,
            )
        note = f"{args['expression']} ({args['reference']})"
        candidate.update_action(ident, mark=note, formalization=0)
        return AppliedOperation(
            operation.operation_id,
            kind,
            f"Для действия «{action.get('name', '')}» задана формула {note}",
            ident,
        )
    if kind == "add_action_parameter_link":
        role_markers = {
            "function": ("*", "функция"),
            "argument": ("+", "аргумент"),
            "default_argument": (".", "аргумент по умолчанию"),
        }
        marker, role_label = role_markers[args["role"]]
        action_id = resolve_reference("action_id", "action_operation_id", "add_action")
        parameter_id = resolve_reference("parameter_id", "parameter_operation_id", "add_parameter")
        add_primary_link(
            candidate,
            action_id,
            parameter_id,
            marker,
            power=args["power"],
        )
        return AppliedOperation(
            operation.operation_id,
            kind,
            f"Параметр {parameter_id} связан с действием {action_id}: {role_label}",
        )
    if kind == "renumber_actions":
        report = renumber_structure(candidate, symbol=args["symbol"])
        return AppliedOperation(
            operation.operation_id,
            kind,
            f"Перенумеровано действий: {report['action_count']}; изменено кодов: {len(report['reassigned'])}",
        )
    if kind == "add_parameter":
        attributes = dict(args["attributes"])
        object_operation_id = args.get("object_operation_id")
        if object_operation_id is not None:
            resolved = resolved_ids.get(str(object_operation_id))
            if resolved is None:
                raise AssistantExecutionError(
                    f"object operation {object_operation_id!r} has not produced an ID",
                    operation_id=operation.operation_id,
                )
            resolved_kind, resolved_id = resolved
            if resolved_kind != "add_object":
                raise AssistantExecutionError(
                    f"operation {object_operation_id!r} did not create an object",
                    operation_id=operation.operation_id,
                )
            attributes["o"] = resolved_id
        ident = candidate.add_parameter(attributes)
        name = args["attributes"].get("name", "")
        return AppliedOperation(operation.operation_id, kind, f"Добавлен параметр «{name}»", ident)
    if kind == "update_parameter":
        ident = str(args["parameter_id"])
        candidate.update_parameter(ident, **args["changes"])
        return AppliedOperation(operation.operation_id, kind, f"Изменён параметр {ident}", ident)
    raise AssistantExecutionError(f"unsupported operation type {kind!r}", operation_id=operation.operation_id)


def _introduced_issues(before: tuple[str, ...], after: tuple[str, ...]) -> list[str]:
    old_counts = Counter(before)
    new_counts = Counter(after)
    introduced: list[str] = []
    for issue, count in new_counts.items():
        introduced.extend([issue] * max(0, count - old_counts.get(issue, 0)))
    return introduced


def execute_plan(document: ProjectDocument, plan: AssistantPlan) -> ExecutionResult:
    """Execute a complete plan on a clone and return it only after all checks pass.

    ``document`` is never mutated. Existing validation issues may remain, but a
    plan is rejected if it introduces any new issue or fails writer preflight.
    """
    if not isinstance(document, ProjectDocument):
        raise TypeError("document must be a ProjectDocument")
    if not isinstance(plan, AssistantPlan):
        raise TypeError("plan must be an AssistantPlan")
    if plan.questions:
        raise AssistantExecutionError(
            "plan has unanswered question(s): " + "; ".join(plan.questions[:8])
        )

    before_snapshot = document.semantic_snapshot()
    before_issues = tuple(document.validate(deep=True))
    candidate = document.clone()
    applied: list[AppliedOperation] = []
    resolved_ids: dict[str, tuple[str, str]] = {}
    for operation in plan.operations:
        try:
            applied_operation = _apply(candidate, operation, resolved_ids)
            applied.append(applied_operation)
            if applied_operation.result_id is not None:
                resolved_ids[operation.operation_id] = (operation.type, applied_operation.result_id)
        except AssistantExecutionError:
            raise
        except Exception as exc:
            raise AssistantExecutionError(str(exc), operation_id=operation.operation_id) from exc

    after_issues = tuple(candidate.validate(deep=True))
    introduced = _introduced_issues(before_issues, after_issues)
    if introduced:
        raise AssistantExecutionError(
            "plan introduced invalid project state: " + "; ".join(introduced[:12])
        )

    preflight = candidate.serialization_preflight()
    if not (
        preflight.get("xml_reopens")
        and preflight.get("semantic_preserved")
        and preflight.get("writer_idempotent")
    ):
        raise AssistantExecutionError("writer preflight failed; no changes were applied")
    if document.semantic_snapshot() != before_snapshot:
        raise AssistantExecutionError("source document changed during assistant execution")

    diff = compare_documents(document, candidate)
    return ExecutionResult(
        candidate=candidate,
        plan=plan,
        applied_operations=tuple(applied),
        diff=diff,
        validation_issues_before=before_issues,
        validation_issues_after=after_issues,
        writer_preflight=preflight,
    )
