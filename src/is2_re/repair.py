"""Explicit, conservative repair tools for dangling native project references.

The repair layer never guesses the intended target of a broken endpoint. A user
must select an existing ID from the endpoint's recovered native domain, or
explicitly clear a slot only where the recovered writer/reader contract allows
it. Repairs are applied to a cloned document and returned for review/save.
"""
from __future__ import annotations

from collections import Counter
from typing import Mapping, Iterable

from .document import ProjectDocument
from .graph import build_relationship_graph
from .i18n import tr


class RepairError(ValueError):
    """A proposed repair is ambiguous, unsafe or does not match the document."""


def _message(source: str, **values: object) -> str:
    return tr(source).format(**values)


_DOMAIN_LABELS = {
    "action": "Действие AFElement",
    "category": "Категория AIElement в ConceptModel",
    "spz_element": "Элемент AIElement в spz/AElement",
    "object": "Объект PrimaryModel",
}


def _domain_ids(doc: ProjectDocument, domain: str) -> list[str]:
    if domain == "action":
        nodes = doc.actions
    elif domain == "category":
        nodes = doc.concept_structure.categories
    elif domain == "spz_element":
        nodes = doc.dynamic_structure.elements
    elif domain == "object":
        nodes = list(doc.objects_node)
    else:  # pragma: no cover - graph contracts control this field
        raise RepairError(_message("Неподдерживаемый домен endpoint-а: {domain}", domain=domain))
    return [str(node.get("id", "")) for node in nodes if node.get("id") not in (None, "")]


def _can_clear(issue: dict, relation_node: dict | None) -> tuple[bool, str]:
    kind, slot = issue["relation_kind"], issue["slot"]
    if kind == "aie_binary_link":
        return True, "AIEBinaryLink допускает нулевые значения в слотах endpoint-ов."
    if kind == "parameter_object" and slot == "object":
        return True, "Атрибут Parameter/@o необязателен; снятие связи удаляет этот атрибут."
    if kind == "scbinarylink" and slot == "e3" and relation_node:
        link_type = str(relation_node.get("attributes", {}).get("type", ""))
        if link_type == "3":
            return True, "SCBinaryLink типа 3 допускает нулевое значение endpoint-а e3."
    return False, "Этот endpoint обязателен по восстановленному контракту и не может быть безопасно очищен."


def available_repair_targets(doc: ProjectDocument, domain: str) -> list[str]:
    """Return unique existing IDs in one recovered endpoint domain."""
    counts = Counter(_domain_ids(doc, domain))
    return sorted((ident for ident, count in counts.items() if count == 1), key=lambda value: (not value.isdigit(), int(value) if value.isdigit() else value.casefold()))


def link_integrity_report(doc: ProjectDocument) -> dict:
    """Return typed dangling references, explicit selectors and repair policy."""
    graph = build_relationship_graph(doc)
    relation_by_key = {
        node.get("key"): node
        for node in graph["nodes"]
        if node.get("kind") == "relation"
    }
    issues = []
    for raw in graph["dangling_references"]:
        item = dict(raw)
        item["selector"] = f"{item['relation_kind']}:{item['record_index']}:{item['slot']}"
        item["expected_domain_label"] = _DOMAIN_LABELS.get(item["expected_domain"], item["expected_domain"])
        relation = relation_by_key.get(item.get("relation_key"))
        can_clear, clear_reason = _can_clear(item, relation)
        item["can_clear"] = can_clear
        item["clear_reason"] = clear_reason
        ids = _domain_ids(doc, item["expected_domain"])
        counts = Counter(ids)
        item["available_target_ids"] = sorted(
            (ident for ident, count in counts.items() if count == 1),
            key=lambda value: (not value.isdigit(), int(value) if value.isdigit() else value.casefold()),
        )
        item["available_target_count"] = len(item["available_target_ids"])
        issues.append(item)
    return {
        "schema_version": 1,
        "file_format": "IS-2 project XML",
        "repair_policy": "explicit-only; no heuristic ID guessing; typed endpoints only",
        "issues": issues,
        "duplicate_ids": graph["duplicate_ids"],
        "opaque_records": graph["opaque_records"],
        "summary": {
            "dangling_count": len(issues),
            "repairable_by_remap": sum(1 for issue in issues if issue["available_target_count"] > 0),
            "clearable_count": sum(1 for issue in issues if issue["can_clear"]),
            "duplicate_id_count": len(graph["duplicate_ids"]),
            "opaque_record_count": len(graph["opaque_records"]),
        },
    }


def parse_repair_selector(value: str) -> tuple[str, int, str]:
    """Parse KIND:INDEX:SLOT and reject malformed selectors."""
    parts = value.split(":")
    if len(parts) != 3:
        raise RepairError(_message("Селектор должен иметь формат KIND:INDEX:SLOT; получено: {value}", value=repr(value)))
    kind, raw_index, slot = parts
    if kind not in {"scbinarylink", "aie_binary_link", "ae_content_link", "parameter_object"}:
        raise RepairError(_message("В селекторе указан неподдерживаемый тип связи: {kind}", kind=repr(kind)))
    try:
        index = int(raw_index, 10)
    except ValueError as exc:
        raise RepairError(_message("Индекс селектора должен быть неотрицательным целым числом: {value}", value=repr(raw_index))) from exc
    if index < 0:
        raise RepairError(tr("Индекс селектора не может быть отрицательным."))
    allowed_slots = {
        "scbinarylink": {"e1", "e2", "e3"},
        "aie_binary_link": {"e1", "e2", "e3"},
        "ae_content_link": {"e1", "e2"},
        "parameter_object": {"object"},
    }
    if slot not in allowed_slots[kind]:
        raise RepairError(_message("Слот {slot} не поддерживается для связи {kind}.", slot=repr(slot), kind=kind))
    return kind, index, slot


def parse_repair_assignment(value: str) -> tuple[str, str]:
    """Parse KIND:INDEX:SLOT=TARGET_ID."""
    if "=" not in value:
        raise RepairError(_message("Назначение исправления должно иметь формат KIND:INDEX:SLOT=TARGET_ID; получено: {value}", value=repr(value)))
    selector, target_id = value.split("=", 1)
    parse_repair_selector(selector)
    target_id = target_id.strip()
    if not target_id or target_id == "0":
        raise RepairError(tr("Целевой ID должен быть существующим ненулевым идентификатором."))
    return selector, target_id


def apply_link_repairs(
    doc: ProjectDocument,
    replacements: Mapping[str, str] | None = None,
    *,
    clears: Iterable[str] = (),
) -> tuple[ProjectDocument, dict]:
    """Apply explicit endpoint remaps/clears to a cloned document.

    The original ``doc`` is never mutated. Every selector must identify a
    currently dangling typed endpoint and every replacement must be a unique
    ID in that endpoint's recovered domain. No fuzzy matching is attempted.
    """
    replacements = dict(replacements or {})
    clears = tuple(clears)
    if not replacements and not clears:
        raise RepairError(tr("Исправления не заданы."))

    selectors = list(replacements) + list(clears)
    if len(selectors) != len(set(selectors)):
        raise RepairError(tr("Один endpoint можно исправить только один раз за операцию."))

    original_report = link_integrity_report(doc)
    issue_by_selector = {item["selector"]: item for item in original_report["issues"]}
    parsed: list[tuple[str, tuple[str, int, str], dict, str | None]] = []
    for selector, target in replacements.items():
        parsed_selector = parse_repair_selector(selector)
        target = str(target).strip()
        if not target or target == "0":
            raise RepairError(_message("{selector}: целевой ID должен быть существующим ненулевым идентификатором.", selector=selector))
        issue = issue_by_selector.get(selector)
        if issue is None:
            raise RepairError(_message("{selector}: endpoint не найден среди текущих неразрешённых ссылок.", selector=selector))
        if issue["endpoint_id"] in (None, "", "0"):
            raise RepairError(_message("{selector}: нулевые endpoint-ы нельзя переназначить.", selector=selector))
        domain_ids = _domain_ids(doc, issue["expected_domain"])
        counts = Counter(domain_ids)
        if counts.get(str(target), 0) != 1:
            if counts.get(str(target), 0) > 1:
                raise RepairError(_message("Целевой ID {target} повторяется в домене {domain}.", target=repr(target), domain=issue["expected_domain"]))
            raise RepairError(_message(
                "Целевой ID {target} отсутствует в ожидаемом домене {domain} ({label}).",
                target=repr(target), domain=issue["expected_domain"], label=issue["expected_domain_label"],
            ))
        parsed.append((selector, parsed_selector, issue, str(target)))

    for selector in clears:
        parsed_selector = parse_repair_selector(selector)
        issue = issue_by_selector.get(selector)
        if issue is None:
            raise RepairError(_message("{selector}: endpoint не найден среди текущих неразрешённых ссылок.", selector=selector))
        if not issue["can_clear"]:
            raise RepairError(_message("{selector}: endpoint нельзя безопасно очистить. {reason}", selector=selector, reason=issue["clear_reason"]))
        parsed.append((selector, parsed_selector, issue, None))

    repaired = doc.clone()
    applied: list[dict] = []
    for selector, (kind, index, slot), issue, target in parsed:
        old_id = str(issue["endpoint_id"])
        if kind == "scbinarylink":
            nodes = repaired.concept_structure.links
            if index >= len(nodes):
                raise RepairError(_message("{selector}: индекс записи вне допустимого диапазона.", selector=selector))
            node = nodes[index]
            link_id = node.get("id")
            if not link_id or sum(1 for item in nodes if item.get("id") == link_id) != 1:
                raise RepairError(_message("{selector}: ID SCBinaryLink отсутствует или повторяется; неоднозначное изменение запрещено.", selector=selector))
            if target is None and not (slot == "e3" and node.get("type") == "3"):
                raise RepairError(_message("{selector}: для SCBinaryLink можно очистить только e3 при type=3.", selector=selector))
            repaired.concept_structure.update_link(link_id, **{slot: target if target is not None else "0"})
        elif kind == "aie_binary_link":
            repaired.dynamic_structure.update_spz_link(index, **{slot: target})
        elif kind == "ae_content_link":
            repaired.dynamic_structure.update_content_record(index, **{slot: target})
        elif kind == "parameter_object":
            params = repaired.params_node.findall("param")
            if index >= len(params):
                raise RepairError(_message("{selector}: индекс параметра вне допустимого диапазона.", selector=selector))
            parameter_id = params[index].get("id")
            if not parameter_id or sum(1 for item in params if item.get("id") == parameter_id) != 1:
                raise RepairError(_message("{selector}: ID параметра отсутствует или повторяется; неоднозначное изменение запрещено.", selector=selector))
            repaired.set_parameter_object(parameter_id, target)
        else:  # pragma: no cover - parse_repair_selector fences this
            raise RepairError(_message("Неподдерживаемый тип связи: {kind}.", kind=kind))
        applied.append({
            "selector": selector,
            "relation_kind": kind,
            "record_index": index,
            "slot": slot,
            "old_id": old_id,
            "new_id": target,
            "operation": "remap" if target is not None else "clear",
            "expected_domain": issue["expected_domain"],
        })

    remaining_report = link_integrity_report(repaired)
    remaining_selectors = {item["selector"] for item in remaining_report["issues"]}
    unresolved_requested = sorted(set(selectors) & remaining_selectors)
    if unresolved_requested:
        raise RepairError(_message("Исправление не устранило выбранные endpoint-ы: {endpoints}", endpoints=unresolved_requested))
    validation_issues = repaired.validate(deep=True)
    result = {
        "schema_version": 1,
        "repair_policy": "explicit-only; original document left unchanged",
        "applied": applied,
        "summary": {
            "applied_count": len(applied),
            "remaining_dangling_count": remaining_report["summary"]["dangling_count"],
            "remaining_duplicate_id_count": remaining_report["summary"]["duplicate_id_count"],
            "validation_issue_count": len(validation_issues),
            "safe_to_save": not validation_issues,
        },
        "remaining_issues": remaining_report["issues"],
        "remaining_duplicate_ids": remaining_report["duplicate_ids"],
        "validation_issues": validation_issues,
    }
    return repaired, result
