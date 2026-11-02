from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re import ProjectDocument, compare_relationship_graphs

FIXTURE = ROOT / "samples" / "synthetic_relationships_0.7.3.is2"


def test_graph_diff_detects_entity_metadata_and_rewired_endpoint():
    reference = ProjectDocument.load(FIXTURE)
    current = reference.clone()
    current.action("1").set("name", "renamed action")
    current.dynamic_structure.content_records[0].set("e1", "2")
    report = compare_relationship_graphs(reference, current)
    assert report["summary"]["changed_nodes"] >= 1
    assert report["summary"]["rewired_edges"] == 1
    assert any(item["key"].startswith("action:1") for item in report["changed_nodes"])


def test_graph_diff_is_empty_for_identical_semantic_projects():
    reference = ProjectDocument.load(FIXTURE)
    current = reference.clone()
    report = compare_relationship_graphs(reference, current)
    assert all(value == 0 for value in report["summary"].values())
    assert report["added_nodes"] == []
    assert report["removed_edges"] == []


def test_graph_diff_warns_about_opaque_and_index_matched_records():
    reference = ProjectDocument.load(FIXTURE)
    current = reference.clone()
    report = compare_relationship_graphs(reference, current)
    # The synthetic project contains index-keyed AIE/AE records.
    assert any("индексу" in warning for warning in report["warnings"])
