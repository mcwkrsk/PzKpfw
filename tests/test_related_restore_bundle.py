from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re import ProjectDocument, apply_selected_restores, compare_documents, expand_related_restore_bundle

FIXTURE = ROOT / "samples" / "synthetic_relationships_0.7.3.is2"


def _deleted_action_pair():
    reference = ProjectDocument.load(FIXTURE)
    current = reference.clone()
    current.actions_node.remove(current.action("1"))
    content = current.dynamic_structure.content_records
    content_node = next(node for node in content if node.get("e1") == "1")
    current.root.find("models/ConceptModel/content").remove(content_node)
    return reference, current


def test_related_bundle_includes_removed_link_touching_selected_entity():
    reference, current = _deleted_action_pair()
    diff = compare_documents(reference, current)
    action_op = next(item for item in diff.operations if item.kind == "removed" and item.tag == "pd" and item.fragment_xml and 'id="1"' in item.fragment_xml)
    expanded, report = expand_related_restore_bundle(reference, current, [action_op.operation_id])
    assert action_op.operation_id in expanded
    assert len(expanded) > 1
    assert report["added_operation_ids"]
    assert report["automatic_id_guessing"] is False


def test_related_bundle_restoration_repairs_selected_entity_and_incident_link():
    reference, current = _deleted_action_pair()
    diff = compare_documents(reference, current)
    action_op = next(item for item in diff.operations if item.kind == "removed" and item.tag == "pd" and item.fragment_xml and 'id="1"' in item.fragment_xml)
    expanded, _ = expand_related_restore_bundle(reference, current, [action_op.operation_id])
    restored, report = apply_selected_restores(reference, current, expanded, allow_ambiguous=True)
    assert restored.action("1") is not None
    assert any(node.get("e1") == "1" for node in restored.dynamic_structure.content_records)
    assert report["restored_count"] == len(expanded)


def test_related_bundle_rejects_unknown_operation_id():
    reference, current = _deleted_action_pair()
    try:
        expand_related_restore_bundle(reference, current, ["D999999"])
    except ValueError as exc:
        assert "unknown diff operation" in str(exc)
    else:
        raise AssertionError("unknown operation should be rejected")
