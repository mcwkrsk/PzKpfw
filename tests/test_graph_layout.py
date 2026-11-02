from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re import ProjectDocument, build_relationship_graph
from is2_re.graph_layout import automatic_relationship_layout, COLUMN_X, ROW_STEP, node_column


def _graph():
    doc = ProjectDocument.new_empty("Layout fixture")
    actions = [doc.add_action(f"Action {i}", action_type=0) for i in range(1, 5)]
    categories = [doc.concept_structure.add_category(f"Category {i}", class_id=2) for i in range(1, 5)]
    spz = [doc.dynamic_structure.add_element(f"SPZ {i}") for i in range(1, 4)]
    doc.concept_structure.add_link(2, e1=categories[0], e2=categories[1])
    doc.concept_structure.add_link(2, e1=categories[1], e2=categories[2])
    doc.dynamic_structure.add_spz_link(e1=spz[0], e2=spz[1])
    doc.dynamic_structure.add_content_link(actions[0], categories[2], char=0, power=1)
    doc.dynamic_structure.add_content_link(actions[3], categories[0], char=1, power=2)
    parameter = doc.add_parameter({"name": "Parameter 1", "group": 1})
    obj = doc.add_object("Object 1")
    doc.set_parameter_object(parameter, obj)
    return build_relationship_graph(doc)


def test_automatic_layout_is_complete_deterministic_and_columnar():
    graph = _graph()
    first = automatic_relationship_layout(graph)
    second = automatic_relationship_layout(graph)
    assert first == second
    assert set(first) == {node["key"] for node in graph["nodes"]}
    assert all(x in set(COLUMN_X.values()) for x, _ in first.values())
    relation_columns = {
        first[node["key"]][0]
        for node in graph["nodes"] if node.get("kind") == "relation"
    }
    assert len(relation_columns) == 4
    assert first["parameter:1"][0] == COLUMN_X["parameter"]
    assert first["object:1"][0] == COLUMN_X["object"]


def test_automatic_layout_avoids_vertical_overlap_in_each_column():
    graph = _graph()
    positions = automatic_relationship_layout(graph)
    by_column = {}
    for key, (x, y) in positions.items():
        by_column.setdefault(x, []).append((y, key))
    for entries in by_column.values():
        ys = sorted(y for y, _ in entries)
        assert all((right - left) >= ROW_STEP for left, right in zip(ys, ys[1:]))


def test_automatic_layout_puts_each_relationship_family_in_its_own_column():
    graph = _graph()
    positions = automatic_relationship_layout(graph)
    relation_nodes = [node for node in graph["nodes"] if node.get("kind") == "relation"]
    columns = {node["relation_kind"]: positions[node["key"]][0] for node in relation_nodes}
    assert len(set(columns.values())) == 4
