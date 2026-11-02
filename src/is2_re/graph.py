"""Typed, non-mutating relationship graph projection for IS-2 projects.

The graph deliberately models each serialized relationship as its own node
and attaches endpoint slots to it. This avoids inventing direction or pairwise
semantics for native records that expose three endpoint fields.
"""
from __future__ import annotations

from collections import Counter
from typing import Any, Iterable

from .document import ProjectDocument

RELATION_LABELS = {
    "scbinarylink": "SCBinaryLink (ConceptModel/cs)",
    "aie_binary_link": "AIEBinaryLink (ConceptModel/spz/links)",
    "ae_content_link": "AEContentLink (ConceptModel/content)",
}


def _sort_id(value: str) -> tuple[int, int | str]:
    return (0, int(value)) if value.isdigit() else (1, value.casefold())


def build_relationship_graph(doc: ProjectDocument) -> dict[str, Any]:
    """Build a read-only graph inventory from the recovered native endpoints.

    Nodes are AFElement actions, AIElement categories, AIElement spz elements,
    and one record-node for each recognized relationship. Every edge is a
    labelled endpoint slot (e1/e2/e3), not a claim about semantic direction.
    Opaque records are reported separately and remain untouched.
    """
    nodes: list[dict[str, Any]] = []
    edges: list[dict[str, Any]] = []
    dangling: list[dict[str, Any]] = []
    opaque: list[dict[str, Any]] = []
    by_domain: dict[str, dict[str, str]] = {
        "action": {}, "category": {}, "spz_element": {}, "parameter": {}, "object": {},
    }
    duplicate_ids: list[dict[str, str]] = []

    def add_entity(domain: str, ident: str, label: str, detail: str, attrs: dict[str, str]) -> None:
        key = f"{domain}:{ident}"
        if ident in by_domain[domain]:
            duplicate_ids.append({"domain": domain, "id": ident, "first_key": by_domain[domain][ident], "duplicate_key": key})
            return
        by_domain[domain][ident] = key
        nodes.append({
            "key": key, "kind": domain, "id": ident, "label": label,
            "detail": detail, "attributes": attrs,
        })

    for node in doc.actions:
        ident = node.get("id")
        if not ident:
            continue
        name = node.get("name", "") or "(без названия)"
        detail = "AFElement" + " · ".join(
            f"{field}={node.get(field)}" for field in ("type", "level", "number") if node.get(field) is not None
        )
        add_entity("action", ident, f"#{ident} · {name}", detail, dict(node.attrib))

    for node in doc.concept_structure.categories:
        ident = node.get("id")
        if not ident:
            continue
        name = node.get("name", "") or "(без названия)"
        detail = "AIElement / SubjectCategory" + " · ".join(
            f"{field}={node.get(field)}" for field in ("class", "group", "number", "status") if node.get(field) is not None
        )
        add_entity("category", ident, f"#{ident} · {name}", detail, dict(node.attrib))

    for node in doc.dynamic_structure.elements:
        ident = node.get("id")
        if not ident:
            continue
        name = node.get("name", "") or "(без названия)"
        detail = "AIElement / spz AElement" + " · ".join(
            f"{field}={node.get(field)}" for field in ("type", "status", "level", "number") if node.get(field) is not None
        )
        add_entity("spz_element", ident, f"#{ident} · {name}", detail, dict(node.attrib))

    # PrimaryModel records are first-class graph entities. The native
    # Parameter/@o attribute is the recovered stable Object ID reference.
    for node in doc.params_node.findall("param"):
        ident = node.get("id")
        if not ident:
            continue
        name = node.get("name", "") or "(без названия)"
        detail = "PrimaryModel / Parameter" + " · ".join(
            f"{field}={node.get(field)}" for field in ("group", "codingType", "number", "sign", "o") if node.get(field) is not None
        )
        add_entity("parameter", ident, f"Параметр #{ident} · {name}", detail, dict(node.attrib))

    for node in doc.objects_node:
        ident = node.get("id")
        if not ident:
            continue
        name = node.get("name", "") or "(без названия)"
        detail = "PrimaryModel / Object" + " · ".join(
            f"{key}={value}" for key, value in node.attrib.items() if key not in {"id", "name"}
        )
        add_entity("object", ident, f"Объект #{ident} · {name}", detail, dict(node.attrib))

    def add_relation(
        *, key: str, kind: str, label: str, detail: str,
        raw: dict[str, str], endpoints: Iterable[tuple[str, str | None, str]],
        index: int,
    ) -> None:
        relation_node = {
            "key": key, "kind": "relation", "relation_kind": kind,
            "label": label, "detail": detail, "attributes": raw,
            "record_index": index,
        }
        nodes.append(relation_node)
        for slot, raw_value, domain in endpoints:
            value = "" if raw_value is None else str(raw_value).strip()
            if value in {"", "0"}:
                continue
            target_key = by_domain.get(domain, {}).get(value)
            edge = {
                "key": f"{key}:{slot}", "relation_key": key,
                "slot": slot, "endpoint_id": value,
                "target_key": target_key, "target_domain": domain,
                "valid": target_key is not None,
            }
            edges.append(edge)
            if target_key is None:
                dangling.append({
                    "relation_key": key, "relation_kind": kind,
                    "record_index": index, "slot": slot,
                    "endpoint_id": value, "expected_domain": domain,
                })

    # Parameter/@o is serialized as a direct native reference, not as a
    # separate XML link record. We project it through a virtual graph record
    # so both endpoints can be inspected without writing fork metadata.
    for index, parameter in enumerate(doc.params_node.findall("param")):
        parameter_id = parameter.get("id")
        object_id = parameter.get("o")
        if not parameter_id or object_id in (None, "", "0"):
            continue
        key = f"relation:parameter_object:{parameter_id}:{index}"
        add_relation(
            key=key, kind="parameter_object",
            label=f"Parameter → Object · #{parameter_id} → #{object_id}",
            detail=f"PrimaryModel/params/param[@id='{parameter_id}']/@o={object_id}",
            raw={"parameter_id": parameter_id, "o": object_id}, index=index,
            endpoints=(("parameter", parameter_id, "parameter"), ("object", object_id, "object")),
        )

    # ConceptModel/cs links are SCBinaryLink records over SubjectCategory IDs.
    for index, node in enumerate(doc.concept_structure.links):
        ident = node.get("id", str(index))
        key = f"relation:scbinarylink:{ident}:{index}"
        label = f"SCBinaryLink · #{ident} · type={node.get('type', '?')}"
        detail = f"ConceptModel/cs/link · id={ident} · type={node.get('type', '?')} · range={node.get('range', '?')}"
        add_relation(
            key=key, kind="scbinarylink", label=label, detail=detail,
            raw=dict(node.attrib), index=index,
            endpoints=((slot, node.get(slot), "category") for slot in ("e1", "e2", "e3")),
        )

    # DynamicStructure links are interpreted only when the complete recovered
    # AIEBinaryLink shape is present. Unknown records are inventory-only.
    for index, node in enumerate(doc.dynamic_structure.links):
        if node.tag != "AElement" or any(node.get(slot) is None for slot in ("e1", "e2", "e3")):
            opaque.append({"branch": "ConceptModel/spz/links", "index": index, "tag": str(node.tag), "attributes": dict(node.attrib)})
            continue
        key = f"relation:aie_binary_link:{index}"
        label = f"AIEBinaryLink · #{index + 1} · {node.get('name', '')}".rstrip()
        detail = f"ConceptModel/spz/links/AElement · index={index} · id={node.get('id', '?')} · type={node.get('type', '?')}"
        add_relation(
            key=key, kind="aie_binary_link", label=label, detail=detail,
            raw=dict(node.attrib), index=index,
            endpoints=((slot, node.get(slot), "spz_element") for slot in ("e1", "e2", "e3")),
        )

    # ConceptModel/content AEContentLink type 4 binds AFElement to category AIElement.
    for index, node in enumerate(doc.dynamic_structure.content_records):
        if node.tag != "AElement" or node.get("type") != "4" or any(node.get(slot) is None for slot in ("e1", "e2")):
            opaque.append({"branch": "ConceptModel/content", "index": index, "tag": str(node.tag), "attributes": dict(node.attrib)})
            continue
        key = f"relation:ae_content_link:{index}"
        label = f"AEContentLink · #{index + 1} · char={node.get('char', '?')}"
        detail = f"ConceptModel/content/AElement · index={index} · type=4 · char={node.get('char', '?')} · power={node.get('power', '?')}"
        add_relation(
            key=key, kind="ae_content_link", label=label, detail=detail,
            raw=dict(node.attrib), index=index,
            endpoints=(
                ("e1", node.get("e1"), "action"),
                ("e2", node.get("e2"), "category"),
            ),
        )

    node_counts = Counter(node["kind"] for node in nodes)
    relation_counts = Counter(node.get("relation_kind") for node in nodes if node["kind"] == "relation")
    return {
        "schema_version": 1,
        "model": "IS-2 relationship endpoint graph",
        "semantics": "Each relation is a record node; edges represent serialized endpoint slots and do not infer direction.",
        "nodes": nodes,
        "edges": edges,
        "dangling_references": dangling,
        "opaque_records": opaque,
        "duplicate_ids": duplicate_ids,
        "summary": {
            "node_count": len(nodes),
            "entity_node_count": sum(count for kind, count in node_counts.items() if kind != "relation"),
            "relation_node_count": node_counts.get("relation", 0),
            "endpoint_count": len(edges),
            "resolved_endpoint_count": sum(1 for edge in edges if edge["valid"]),
            "dangling_endpoint_count": len(dangling),
            "opaque_record_count": len(opaque),
            "duplicate_id_count": len(duplicate_ids),
            "nodes_by_kind": dict(sorted(node_counts.items())),
            "relations_by_kind": dict(sorted(relation_counts.items())),
        },
    }


def filter_relationship_graph(
    graph: dict[str, Any], *, relation_kind: str = "all", query: str = ""
) -> dict[str, Any]:
    """Return a display/export subset without mutating the source report."""
    selected_relations = {
        node["key"] for node in graph["nodes"]
        if node["kind"] == "relation" and (relation_kind == "all" or node.get("relation_kind") == relation_kind)
    }
    nodes_by_key = {node["key"]: node for node in graph["nodes"]}
    edges = [edge for edge in graph["edges"] if edge["relation_key"] in selected_relations]
    q = query.strip().casefold()
    if q:
        matched_entity_keys = {
            node["key"] for node in graph["nodes"]
            if node["kind"] != "relation" and q in (node.get("label", "") + " " + node.get("detail", "") + " " + node.get("id", "")).casefold()
        }
        matched_relation_keys = {
            node["key"] for node in graph["nodes"]
            if node["kind"] == "relation" and q in (node.get("label", "") + " " + node.get("detail", "") + " " + json_attrs(node.get("attributes", {}))).casefold()
        }
        selected_relations = {
            edge["relation_key"] for edge in edges if edge.get("target_key") in matched_entity_keys
        } | (selected_relations & matched_relation_keys)
        edges = [edge for edge in edges if edge["relation_key"] in selected_relations]
        entity_keys = matched_entity_keys | {edge["target_key"] for edge in edges if edge.get("target_key")}
    else:
        entity_keys = {node["key"] for node in graph["nodes"] if node["kind"] != "relation"}
    visible_keys = entity_keys | selected_relations
    visible_nodes = [node for node in graph["nodes"] if node["key"] in visible_keys]
    dangling = [item for item in graph["dangling_references"] if item["relation_key"] in selected_relations]
    return {
        "schema_version": graph.get("schema_version", 1),
        "model": graph.get("model", "IS-2 relationship endpoint graph"),
        "semantics": graph.get("semantics", "Endpoint-slot associations; direction is not inferred."),
        "nodes": visible_nodes,
        "edges": edges,
        "dangling_references": dangling,
        "opaque_records": graph.get("opaque_records", []),
        "duplicate_ids": graph.get("duplicate_ids", []),
        "summary": {
            "node_count": len(visible_nodes),
            "relation_count": len(selected_relations),
            "endpoint_count": len(edges),
            "dangling_endpoint_count": len(dangling),
        },
    }


def json_attrs(attributes: dict[str, str]) -> str:
    return " ".join(f"{key}={value}" for key, value in attributes.items())
