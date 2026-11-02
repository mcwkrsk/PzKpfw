"""Pure presentation projections used by the desktop UI and unit tests."""
from __future__ import annotations

from dataclasses import dataclass
from .document import ProjectDocument


@dataclass(frozen=True)
class ActionTreeRow:
    action_id: str
    parent_id: str
    label: str
    depth: int


def action_tree_rows(document: ProjectDocument) -> list[ActionTreeRow]:
    """Build display rows from composition edges and type-3 sibling order.

    This deliberately does not sort numeric IDs. If a damaged graph cannot be
    traversed, the unvisited records are appended as roots so none disappear.
    """
    nodes = {n.get("id", ""): n for n in document.actions}
    parent_of: dict[str, str] = {}
    for link in document.links:
        if link.get("type") == "2":
            parent_of.setdefault(link.get("afe2", ""), link.get("afe1", ""))
    children: dict[str, list[str]] = {}
    for parent in dict.fromkeys(link.get("afe1", "") for link in document.links if link.get("type") == "2"):
        try:
            children[parent] = document.sibling_order(parent)
        except Exception:
            # Preserve reachability and source order in the display for corrupt files.
            children[parent] = [
                link.get("afe2", "") for link in document.links
                if link.get("type") == "2" and link.get("afe1") == parent
            ]
    rows: list[ActionTreeRow] = []
    visited: set[str] = set()

    def visit(action_id: str, parent_id: str, depth: int) -> None:
        if action_id not in nodes or action_id in visited:
            return
        visited.add(action_id)
        node = nodes[action_id]
        label = f"{action_id}  {node.get('name', '')}"
        rows.append(ActionTreeRow(action_id, parent_id, label, depth))
        for child in children.get(action_id, []):
            visit(child, action_id, depth + 1)

    roots = [ident for ident in nodes if ident not in parent_of]
    for ident in roots:
        visit(ident, "", 0)
    for ident in nodes:
        visit(ident, "", 0)
    return rows


def action_diagram_layout(document: ProjectDocument, *, x_gap: int = 260, y_gap: int = 110):
    """Return tree rows, node coordinates and the two observed edge classes.

    Coordinates preserve the recovered type-2 hierarchy and type-3 sibling
    order; they do not sort by numeric IDs.
    """
    rows = action_tree_rows(document)
    positions = {
        row.action_id: (70 + row.depth * x_gap, 55 + index * y_gap)
        for index, row in enumerate(rows)
    }
    composition_edges = []
    sequence_edges = []
    for link in document.links:
        source = link.get("afe1", "")
        current = link.get("afe2", "")
        next_id = link.get("afe3", "0")
        if link.get("type") == "2" and source in positions and current in positions:
            composition_edges.append((source, current))
        elif link.get("type") == "3" and current in positions and next_id not in ("", "0") and next_id in positions:
            sequence_edges.append((current, next_id))
    return rows, positions, composition_edges, sequence_edges
