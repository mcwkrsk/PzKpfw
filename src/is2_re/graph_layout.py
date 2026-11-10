"""Deterministic grouped layout for the IS-2 endpoint-slot graph.

The layout is a view projection only. It never changes project XML and does not
infer direction between endpoints: relationship records remain independent
nodes connected to their labelled e1/e2/e3 slots. Relationship families get
separate columns so users can visually scan groups without changing semantics.
"""
from __future__ import annotations

from statistics import median
from typing import Any

COLUMN_X = {
    "action": 30.0,
    "category": 390.0,
    "spz_element": 750.0,
    "parameter": 1110.0,
    "object": 1470.0,
    # Each serialized or virtual reference family gets an explicit lane.
    "relation:scbinarylink": 1830.0,
    "relation:aie_binary_link": 2190.0,
    "relation:ae_content_link": 2550.0,
    "relation:parameter_object": 2910.0,
    "relation": 3270.0,
}
TOP = 70.0
ROW_STEP = 108.0
RELATION_ORDER = ("scbinarylink", "aie_binary_link", "ae_content_link", "parameter_object")


def _natural_id(node: dict[str, Any]) -> tuple[int, int | str, str]:
    ident = str(node.get("id", ""))
    return (0, int(ident), str(node.get("label", "")).casefold()) if ident.isdigit() else (1, ident.casefold(), str(node.get("label", "")).casefold())


def node_column(node: dict[str, Any]) -> str:
    kind = str(node.get("kind", ""))
    if kind != "relation":
        return kind if kind in COLUMN_X else "relation"
    relation_kind = str(node.get("relation_kind", ""))
    key = f"relation:{relation_kind}"
    return key if key in COLUMN_X else "relation"


def automatic_relationship_layout(graph: dict[str, Any]) -> dict[str, tuple[float, float]]:
    """Return deterministic, collision-free layered coordinates.

    Actions, categories and SPZ elements are entity columns. Each known
    relationship family is placed in its own column. Relation nodes are
    ordered near the median row of their resolved endpoint nodes, then packed
    with a fixed vertical separation. Isolated and unknown nodes remain visible.
    """
    nodes = list(graph.get("nodes", []))
    edges = list(graph.get("edges", []))
    by_key = {str(node.get("key")): node for node in nodes}
    if not nodes:
        return {}

    active = {node_column(node) for node in nodes}
    compact_x = {key: 30.0 + 360.0 * index for index, key in
                 enumerate(key for key in COLUMN_X if key in active)}

    entity_kinds = ("action", "category", "spz_element", "parameter", "object")
    entities: dict[str, list[dict[str, Any]]] = {
        kind: sorted((n for n in nodes if n.get("kind") == kind), key=_natural_id)
        for kind in entity_kinds
    }
    relation_groups: dict[str, list[dict[str, Any]]] = {}
    for node in nodes:
        if node.get("kind") == "relation":
            relation_groups.setdefault(node_column(node), []).append(node)
    for group in relation_groups.values():
        group.sort(key=lambda n: (int(n.get("record_index", 0)), str(n.get("key", ""))))

    positions: dict[str, tuple[float, float]] = {}

    def place_entities() -> None:
        for kind in entity_kinds:
            for index, node in enumerate(entities[kind]):
                positions[str(node["key"])] = (compact_x[kind], TOP + index * ROW_STEP)

    targets_by_relation: dict[str, list[str]] = {}
    for edge in edges:
        relation_key = str(edge.get("relation_key", ""))
        target_key = edge.get("target_key")
        if target_key and str(target_key) in by_key:
            targets_by_relation.setdefault(relation_key, []).append(str(target_key))

    def pack_group(column_key: str, relations: list[dict[str, Any]]) -> None:
        desired = []
        for index, node in enumerate(relations):
            resolved = [
                positions[key][1]
                for key in targets_by_relation.get(str(node.get("key")), [])
                if key in positions
            ]
            target_y = float(median(resolved)) if resolved else TOP + index * ROW_STEP
            desired.append((target_y, int(node.get("record_index", index)), str(node.get("key", "")), node))
        desired.sort(key=lambda item: (item[0], item[1], item[2]))
        previous = TOP - ROW_STEP
        for target_y, _index, _key, node in desired:
            y = max(target_y, previous + ROW_STEP)
            positions[str(node["key"])] = (compact_x[column_key], y)
            previous = y

    place_entities()
    # Two barycentric sweeps to bring related entities closer while preserving
    # stable ID order for disconnected records.
    for _ in range(2):
        for group_key, group in relation_groups.items():
            pack_group(group_key, group)
        for kind in entity_kinds:
            relation_rows: dict[str, list[float]] = {}
            for edge in edges:
                target_key = edge.get("target_key")
                relation_key = str(edge.get("relation_key", ""))
                if target_key and str(target_key) in positions and relation_key in positions:
                    target_node = by_key.get(str(target_key), {})
                    if target_node.get("kind") == kind:
                        relation_rows.setdefault(str(target_key), []).append(positions[relation_key][1])

            def entity_order(node: dict[str, Any]):
                key = str(node.get("key", ""))
                rows = relation_rows.get(key, [])
                return (0, median(rows), *_natural_id(node)) if rows else (1, 0.0, *_natural_id(node))

            entities[kind].sort(key=entity_order)
            for index, node in enumerate(entities[kind]):
                positions[str(node["key"])] = (compact_x[kind], TOP + index * ROW_STEP)

    for group_key, group in relation_groups.items():
        pack_group(group_key, group)

    # Unknown node domains are retained in a final diagnostics column.
    unknown = [n for n in nodes if n.get("kind") not in {*entity_kinds, "relation"}]
    for index, node in enumerate(sorted(unknown, key=_natural_id)):
        positions[str(node["key"])] = (compact_x["relation"], TOP + index * ROW_STEP)
    return positions
