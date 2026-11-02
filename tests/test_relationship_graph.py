from __future__ import annotations

import json
import sys
from pathlib import Path
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re import ProjectDocument, build_relationship_graph, filter_relationship_graph
from is2_re.cli import main as cli_main


def _project_with_relationships() -> ProjectDocument:
    doc = ProjectDocument.new_empty("Graph fixture")
    action_id = doc.add_action("Action Alpha", action_type=0)
    category_a = doc.concept_structure.add_category("Category A", class_id=1)
    category_b = doc.concept_structure.add_category("Category B", class_id=2)
    spz_a = doc.dynamic_structure.add_element("SPZ A")
    spz_b = doc.dynamic_structure.add_element("SPZ B")
    doc.concept_structure.add_link(2, e1=category_a, e2=category_b, e3="0")
    doc.dynamic_structure.add_spz_link(e1=spz_a, e2=spz_b, e3="0", name="SPZ relation")
    doc.dynamic_structure.add_content_link(action_id, category_b, char=46, power=3)
    return doc


def test_graph_projects_all_domains_as_neutral_endpoint_slots():
    doc = _project_with_relationships()
    before = doc.semantic_snapshot()
    report = build_relationship_graph(doc)

    assert report["summary"]["entity_node_count"] == 5
    assert report["summary"]["relation_node_count"] == 3
    assert report["summary"]["endpoint_count"] == 6
    assert report["summary"]["resolved_endpoint_count"] == 6
    assert report["summary"]["dangling_endpoint_count"] == 0
    assert report["summary"]["relations_by_kind"] == {
        "ae_content_link": 1,
        "aie_binary_link": 1,
        "scbinarylink": 1,
    }
    assert all(edge["valid"] for edge in report["edges"])
    assert {edge["target_domain"] for edge in report["edges"]} == {"action", "category", "spz_element"}
    assert "do not infer direction" in report["semantics"]
    assert doc.semantic_snapshot() == before, "graph creation must be read-only"


def test_graph_filter_by_kind_and_search_keeps_related_endpoint_nodes():
    doc = _project_with_relationships()
    report = build_relationship_graph(doc)
    filtered = filter_relationship_graph(report, relation_kind="ae_content_link", query="Action Alpha")
    assert filtered["summary"]["relation_count"] == 1
    assert {node["kind"] for node in filtered["nodes"]} == {"relation", "action", "category"}
    assert len(filtered["edges"]) == 2
    assert all(edge["relation_key"].startswith("relation:ae_content_link:") for edge in filtered["edges"])


def test_graph_reports_dangling_ids_and_keeps_opaque_records_out_of_typed_graph():
    doc = _project_with_relationships()
    spz_link = doc.dynamic_structure.links[0]
    spz_link.set("e2", "99999")
    doc.dynamic_structure.links_node.append(ET.Element("VendorExtension", {"opaque": "preserve"}))
    doc.dynamic_structure.content_node.append(ET.Element("VendorContent", {"payload": "untouched"}))

    report = build_relationship_graph(doc)
    assert len(report["dangling_references"]) == 1
    assert report["dangling_references"][0]["endpoint_id"] == "99999"
    assert report["dangling_references"][0]["expected_domain"] == "spz_element"
    assert len(report["opaque_records"]) == 2
    assert report["summary"]["opaque_record_count"] == 2


def test_graph_cli_exports_json_file(tmp_path, capsys):
    doc = _project_with_relationships()
    source = tmp_path / "graph.is2"
    output = tmp_path / "graph.json"
    doc.save(source)

    code = cli_main(["graph", str(source), "--output", str(output)])
    captured = capsys.readouterr()
    assert code == 0
    assert '"output"' in captured.out
    report = json.loads(output.read_text(encoding="utf-8"))
    assert report["summary"]["relation_node_count"] == 3
    assert report["summary"]["endpoint_count"] == 6


def test_distributed_synthetic_fixture_covers_all_three_relationship_kinds():
    fixture = ROOT / "samples" / "synthetic_relationships_0.7.3.is2"
    doc = ProjectDocument.load(fixture)
    report = build_relationship_graph(doc)
    assert report["summary"]["relation_node_count"] == 4
    assert report["summary"]["relations_by_kind"] == {
        "ae_content_link": 2,
        "aie_binary_link": 1,
        "scbinarylink": 1,
    }
    assert report["summary"]["dangling_endpoint_count"] == 0
    assert not doc.validate(deep=True)


def test_graph_projects_primary_parameters_objects_and_native_o_references():
    doc = ProjectDocument.new_empty("PrimaryModel graph")
    parameter_id = doc.add_parameter({"name": "Parameter A", "group": 1})
    object_id = doc.add_object("Object A")
    doc.set_parameter_object(parameter_id, object_id)
    report = build_relationship_graph(doc)
    by_key = {node["key"]: node for node in report["nodes"]}
    assert by_key[f"parameter:{parameter_id}"]["kind"] == "parameter"
    assert by_key[f"object:{object_id}"]["kind"] == "object"
    relation = next(node for node in report["nodes"] if node.get("relation_kind") == "parameter_object")
    assert relation["attributes"] == {"parameter_id": parameter_id, "o": object_id}
    edges = [edge for edge in report["edges"] if edge["relation_key"] == relation["key"]]
    assert {(edge["slot"], edge["target_domain"], edge["valid"]) for edge in edges} == {
        ("parameter", "parameter", True), ("object", "object", True),
    }
    filtered = filter_relationship_graph(report, relation_kind="parameter_object")
    assert filtered["summary"]["relation_count"] == 1
    assert {node["kind"] for node in filtered["nodes"]} == {"parameter", "object", "relation"}
