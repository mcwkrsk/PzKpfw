"""Project-wide dependency preflight based on recovered relationship endpoints.

The report is advisory: document-level delete operations remain the final
atomic guard and may refuse deletion when opaque records or unsupported
references make a safe cascade impossible.
"""
from __future__ import annotations

from typing import Any

from .document import ProjectDocument
from .graph import build_relationship_graph


def dependency_report(doc: ProjectDocument) -> dict[str, Any]:
    """Return entity references and conservative opaque-record risk hints."""
    graph = build_relationship_graph(doc)
    edges_by_target: dict[str, list[dict[str, Any]]] = {}
    for edge in graph["edges"]:
        target = edge.get("target_key")
        if target:
            edges_by_target.setdefault(target, []).append(edge)

    opaque_branches = {item.get("branch", "") for item in graph["opaque_records"]}
    entities: list[dict[str, Any]] = []
    for node in graph["nodes"]:
        if node.get("kind") == "relation":
            continue
        refs = [
            {
                "relation_kind": next(
                    (n.get("relation_kind") for n in graph["nodes"] if n.get("key") == edge["relation_key"]),
                    "unknown",
                ),
                "record_index": next(
                    (n.get("record_index") for n in graph["nodes"] if n.get("key") == edge["relation_key"]),
                    -1,
                ),
                "slot": edge.get("slot"),
                "endpoint_id": edge.get("endpoint_id"),
            }
            for edge in edges_by_target.get(node["key"], [])
        ]
        domain = node.get("kind")
        opaque_risk = (
            (domain == "action" and "ConceptModel/content" in opaque_branches)
            or (domain == "category" and ("ConceptModel/content" in opaque_branches or "ConceptModel/cs/links" in opaque_branches))
            or (domain == "spz_element" and "ConceptModel/spz/links" in opaque_branches)
        )
        risk_level = "BLOCKED_UNKNOWN" if opaque_risk else ("REFERENCED" if refs else "NO_KNOWN_REFERENCES")
        entities.append({
            "key": node.get("key"),
            "domain": domain,
            "id": node.get("id"),
            "label": node.get("label"),
            "references": refs,
            "reference_count": len(refs),
            "opaque_risk": bool(opaque_risk),
            "risk_level": risk_level,
            "safe_without_cascade": not refs and not opaque_risk,
            "known_cascade_review_required": bool(refs) and not opaque_risk,
            "deletion_guidance": (
                "Do not delete automatically: opaque records may contain unmodelled references."
                if opaque_risk else
                ("Review listed references and use an explicit supported cascade."
                 if refs else "No known references were found; deletion still requires model validation.")
            ),
        })
    risk_summary = {
        level: sum(1 for item in entities if item["risk_level"] == level)
        for level in ("NO_KNOWN_REFERENCES", "REFERENCED", "BLOCKED_UNKNOWN")
    }
    return {
        "schema_version": 1,
        "entity_count": len(entities),
        "reference_count": sum(item["reference_count"] for item in entities),
        "dangling_count": len(graph["dangling_references"]),
        "opaque_count": len(graph["opaque_records"]),
        "entities": entities,
        "risk_summary": risk_summary,
        "dangling_references": graph["dangling_references"],
        "opaque_records": graph["opaque_records"],
        "note": "Advisory only. Deletion methods perform their own complete preflight and remain authoritative.",
    }
