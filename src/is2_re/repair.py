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


class RepairError(ValueError):
    """A proposed repair is ambiguous, unsafe or does not match the document."""


_DOMAIN_LABELS = {
    "action": "AFElement action",
    "category": "AIElement ConceptModel category",
    "spz_element": "AIElement spz AElement",
    "object": "PrimaryModel object",
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
        raise RepairError(f"unsupported endpoint domain: {domain}")
    return [str(node.get("id", "")) for node in nodes if node.get("id") not in (None, "")]


def _can_clear(issue: dict, relation_node: dict | None) -> tuple[bool, str]:
    kind, slot = issue["relation_kind"], issue["slot"]
    if kind == "aie_binary_link":
        return True, "AIEBinaryLink endpoint slots accept the native null value 0."
    if kind == "parameter_object" and slot == "object":
        return True, "Parameter/@o is optional; clearing removes the native attribute."
    if kind == "scbinarylink" and slot == "e3" and relation_node:
        link_type = str(relation_node.get("attributes", {}).get("type", ""))
        if link_type == "3":
            return True, "SCBinaryLink type=3 permits a null e3 endpoint."
    return False, "This endpoint is required by the recovered contract and cannot be cleared safely."


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
        raise RepairError(f"selector must be KIND:INDEX:SLOT, got {value!r}")
    kind, raw_index, slot = parts
    if kind not in {"scbinarylink", "aie_binary_link", "ae_content_link", "parameter_object"}:
        raise RepairError(f"unsupported relationship kind in selector: {kind!r}")
    try:
        index = int(raw_index, 10)
    except ValueError as exc:
        raise RepairError(f"selector index must be a non-negative integer: {raw_index!r}") from exc
    if index < 0:
        raise RepairError("selector index must be non-negative")
    allowed_slots = {
        "scbinarylink": {"e1", "e2", "e3"},
        "aie_binary_link": {"e1", "e2", "e3"},
        "ae_content_link": {"e1", "e2"},
        "parameter_object": {"object"},
    }
    if slot not in allowed_slots[kind]:
        raise RepairError(f"unsupported slot {slot!r} for {kind}")
    return kind, index, slot


def parse_repair_assignment(value: str) -> tuple[str, str]:
    """Parse KIND:INDEX:SLOT=TARGET_ID."""
    if "=" not in value:
        raise RepairError(f"repair assignment must be KIND:INDEX:SLOT=TARGET_ID, got {value!r}")
    selector, target_id = value.split("=", 1)
    parse_repair_selector(selector)
    target_id = target_id.strip()
    if not target_id or target_id == "0":
        raise RepairError("replacement target must be a nonzero existing ID")
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
        raise RepairError("no repairs were specified")

    selectors = list(replacements) + list(clears)
    if len(selectors) != len(set(selectors)):
        raise RepairError("a dangling endpoint may be repaired only once per operation")

    original_report = link_integrity_report(doc)
    issue_by_selector = {item["selector"]: item for item in original_report["issues"]}
    parsed: list[tuple[str, tuple[str, int, str], dict, str | None]] = []
    for selector, target in replacements.items():
        parsed_selector = parse_repair_selector(selector)
        target = str(target).strip()
        if not target or target == "0":
            raise RepairError(f"{selector}: replacement target must be a nonzero existing ID")
        issue = issue_by_selector.get(selector)
        if issue is None:
            raise RepairError(f"{selector}: endpoint is not currently reported as dangling")
        if issue["endpoint_id"] in (None, "", "0"):
            raise RepairError(f"{selector}: null endpoints are not repair candidates")
        domain_ids = _domain_ids(doc, issue["expected_domain"])
        counts = Counter(domain_ids)
        if counts.get(str(target), 0) != 1:
            if counts.get(str(target), 0) > 1:
                raise RepairError(f"target ID {target!r} is duplicated in domain {issue['expected_domain']}")
            raise RepairError(
                f"target ID {target!r} does not exist in expected domain "
                f"{issue['expected_domain']} ({issue['expected_domain_label']})"
            )
        parsed.append((selector, parsed_selector, issue, str(target)))

    for selector in clears:
        parsed_selector = parse_repair_selector(selector)
        issue = issue_by_selector.get(selector)
        if issue is None:
            raise RepairError(f"{selector}: endpoint is not currently reported as dangling")
        if not issue["can_clear"]:
            raise RepairError(f"{selector}: cannot clear safely. {issue['clear_reason']}")
        parsed.append((selector, parsed_selector, issue, None))

    repaired = doc.clone()
    applied: list[dict] = []
    for selector, (kind, index, slot), issue, target in parsed:
        old_id = str(issue["endpoint_id"])
        if kind == "scbinarylink":
            nodes = repaired.concept_structure.links
            if index >= len(nodes):
                raise RepairError(f"{selector}: record index is out of range")
            node = nodes[index]
            link_id = node.get("id")
            if not link_id or sum(1 for item in nodes if item.get("id") == link_id) != 1:
                raise RepairError(f"{selector}: SCBinaryLink ID is missing or duplicated; refusing ambiguous edit")
            if target is None and not (slot == "e3" and node.get("type") == "3"):
                raise RepairError(f"{selector}: only type=3 e3 may be cleared for SCBinaryLink")
            repaired.concept_structure.update_link(link_id, **{slot: target if target is not None else "0"})
        elif kind == "aie_binary_link":
            repaired.dynamic_structure.update_spz_link(index, **{slot: target})
        elif kind == "ae_content_link":
            repaired.dynamic_structure.update_content_record(index, **{slot: target})
        elif kind == "parameter_object":
            params = repaired.params_node.findall("param")
            if index >= len(params):
                raise RepairError(f"{selector}: parameter index is out of range")
            parameter_id = params[index].get("id")
            if not parameter_id or sum(1 for item in params if item.get("id") == parameter_id) != 1:
                raise RepairError(f"{selector}: Parameter ID is missing or duplicated; refusing ambiguous edit")
            repaired.set_parameter_object(parameter_id, target)
        else:  # pragma: no cover - parse_repair_selector fences this
            raise RepairError(f"unsupported relationship kind: {kind}")
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
        raise RepairError(f"repair did not resolve requested endpoint(s): {unresolved_requested}")
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
