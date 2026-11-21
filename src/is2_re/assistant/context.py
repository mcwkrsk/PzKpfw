"""Bounded read-only project context for future assistant providers."""
from __future__ import annotations

from collections import Counter
import re

from ..document import ProjectDocument
from ..methodology import METHODOLOGY_TOPICS, calculation_route


MAX_SUMMARY_ISSUES = 32


def summarize_project(document: ProjectDocument) -> dict[str, object]:
    """Return a deterministic summary without exposing serialized XML."""
    if not isinstance(document, ProjectDocument):
        raise TypeError("document must be a ProjectDocument")
    action_types = Counter(node.get("type", "unknown") for node in document.actions)
    issues = tuple(document.validate(deep=True))
    return {
        "schema_version": 1,
        "project_name": document.root.get("name", ""),
        "counts": {
            "actions": len(document.actions),
            "parameters": len(document.params_node.findall("param")),
            "objects": len(document.objects_node.findall("object")),
            "matrix_links": len(document.root.findall("./models/primaryModel/matrix/AElement")),
        },
        "action_types": dict(sorted(action_types.items())),
        "validation_issue_count": len(issues),
        "validation_issues": list(issues[:MAX_SUMMARY_ISSUES]),
        "validation_issues_truncated": len(issues) > MAX_SUMMARY_ISSUES,
    }


def model_project_context(document: ProjectDocument, user_prompt: str = "") -> dict[str, object]:
    """Return an allow-listed, de-identified subset suitable for a model request."""
    summary = summarize_project(document)
    context: dict[str, object] = {
        "schema_version": summary["schema_version"],
        "counts": summary["counts"],
        "action_types": summary["action_types"],
        "actions": [
            {
                "id": item.id,
                "type": item.type,
                "formalization": item.formalization,
                "level": item.level,
                "number": item.number,
            }
            for item in document.action_records()[:128]
        ],
        "validation_issue_count": summary["validation_issue_count"],
    }
    methodology = _methodology_context(user_prompt)
    if methodology is not None:
        context["methodology"] = methodology
    return context


def _methodology_context(user_prompt: str) -> dict[str, object] | None:
    """Attach a trusted local topic route when the request names a variant."""
    match = re.search(r"(?:вариант|тема)\s*(?:№\s*)?(\d{1,2})\b", user_prompt, re.IGNORECASE)
    if match is None:
        return None
    number = int(match.group(1))
    topic = next((item for item in METHODOLOGY_TOPICS if item.number == number), None)
    if topic is None:
        return None
    transmission = next(iter(topic.transmissions))
    mode = next(iter(topic.modes))
    steps = [
        {
            "key": item.key,
            "title": item.title,
            "reference": item.reference,
            "pages": item.page_label,
            "verification": item.verification,
            **({"expression": item.expression} if item.expression else {}),
        }
        for item in calculation_route(transmission, mode)
        if item.first_page <= topic.last_page and item.last_page >= topic.first_page
    ]
    return {
        "source": "Детали машин",
        "variant": number,
        "title": topic.title,
        "pages": topic.page_label,
        "transmission_kind": transmission,
        "calculation_mode": mode,
        "verification": topic.verification,
        "steps": steps,
        "coursework_output": {
            "kind": "IS-2 subject-task scheme",
            "calculate_numeric_values": False,
            "required_artifacts": [
                "functional decomposition",
                "action composition structure (Form A)",
                "action descriptions (Form B)",
                "information classification (Form C)",
                "elementary action descriptions with symbolic formulas (Form D)",
                "parameter descriptions (Form D1)",
                "action-parameter data flows (Form D2)",
                "data scheme and permanent-information references",
            ],
            "modeling_rule": (
                "Build actions, symbolic parameters, formula references, alternatives and data links only. "
                "Do not evaluate formulas and do not require numerical values."
            ),
        },
        "instruction": (
            "This is the trusted local methodology route. Do not ask the user to provide the source again. "
            "This coursework models the calculation scheme rather than performing a numerical calculation. "
            "Do not ask for numerical inputs; create symbolic parameters and formula dependencies."
        ),
    }
