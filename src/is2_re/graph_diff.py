"""Semantic comparison of the recovered relationship graph in two IS-2 projects."""
from __future__ import annotations

from typing import Any

from .document import ProjectDocument
from .graph import build_relationship_graph


def compare_relationship_graphs(reference: ProjectDocument, current: ProjectDocument) -> dict[str, Any]:
    """Compare typed graph nodes and endpoint slots without inventing semantics.

    Entity IDs are matched within their recovered domains. Relationship records
    use the keys emitted by ``build_relationship_graph``; index-based records
    are flagged when their index-based identity cannot prove continuity.
    """
    old = build_relationship_graph(reference)
    new = build_relationship_graph(current)
    old_nodes = {item["key"]: item for item in old["nodes"]}
    new_nodes = {item["key"]: item for item in new["nodes"]}
    added_nodes = [new_nodes[key] for key in sorted(new_nodes.keys() - old_nodes.keys())]
    removed_nodes = [old_nodes[key] for key in sorted(old_nodes.keys() - new_nodes.keys())]
    changed_nodes = []
    for key in sorted(old_nodes.keys() & new_nodes.keys()):
        before, after = old_nodes[key], new_nodes[key]
        if (before.get("kind"), before.get("relation_kind"), before.get("attributes")) != (
            after.get("kind"), after.get("relation_kind"), after.get("attributes")
        ):
            changed_nodes.append({"key": key, "before": before, "after": after})

    old_edges = {item["key"]: item for item in old["edges"]}
    new_edges = {item["key"]: item for item in new["edges"]}
    added_edges = [new_edges[key] for key in sorted(new_edges.keys() - old_edges.keys())]
    removed_edges = [old_edges[key] for key in sorted(old_edges.keys() - new_edges.keys())]
    rewired_edges = []
    for key in sorted(old_edges.keys() & new_edges.keys()):
        before, after = old_edges[key], new_edges[key]
        fields = ("endpoint_id", "target_domain", "target_key", "valid")
        if any(before.get(name) != after.get(name) for name in fields):
            rewired_edges.append({"key": key, "before": before, "after": after})

    ambiguous_relation_keys = []
    for node in old["nodes"] + new["nodes"]:
        if node.get("kind") == "relation" and node.get("relation_kind") in {"aie_binary_link", "ae_content_link"}:
            if node.get("record_index") is not None:
                ambiguous_relation_keys.append(node["key"])
    warnings = []
    if ambiguous_relation_keys:
        warnings.append(
            "Часть AIEBinaryLink/AEContentLink сопоставляется по индексу записи: "
            "вставка или удаление перед записью может выглядеть как изменение нескольких связей."
        )
    if old["opaque_records"] or new["opaque_records"]:
        warnings.append(
            "В проектах есть непрозрачные записи, которые не включены в типизированное сравнение графа."
        )
    return {
        "schema_version": 1,
        "mode": "relationship_graph_diff",
        "reference_summary": old["summary"],
        "current_summary": new["summary"],
        "summary": {
            "added_nodes": len(added_nodes),
            "removed_nodes": len(removed_nodes),
            "changed_nodes": len(changed_nodes),
            "added_edges": len(added_edges),
            "removed_edges": len(removed_edges),
            "rewired_edges": len(rewired_edges),
            "dangling_reference_delta": len(new["dangling_references"]) - len(old["dangling_references"]),
            "opaque_record_delta": len(new["opaque_records"]) - len(old["opaque_records"]),
        },
        "added_nodes": added_nodes,
        "removed_nodes": removed_nodes,
        "changed_nodes": changed_nodes,
        "added_edges": added_edges,
        "removed_edges": removed_edges,
        "rewired_edges": rewired_edges,
        "new_dangling_references": new["dangling_references"],
        "new_opaque_records": new["opaque_records"],
        "warnings": warnings,
        "semantics": "Edges are serialized endpoint slots; direction beyond the recovered slot mapping is not inferred.",
    }
