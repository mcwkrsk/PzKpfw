from pathlib import Path
import sys
import xml.etree.ElementTree as ET

import pytest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re import ProjectDocument
from is2_re.diff import (
    ProjectDiffError, apply_selected_restores, compare_documents,
    compare_project_files, format_locator, resolve_locator,
)

FIXTURE = ROOT / "tests" / "fixtures" / "minimal.is2"


def _pair(tmp_path):
    reference = ProjectDocument.load(FIXTURE)
    # Add an extension node to prove unknown XML can be restored without losing it.
    extensions = ET.SubElement(reference.root, "extensions")
    ET.SubElement(extensions, "annotation", {"id": "7", "kind": "review"}).text = "old note"
    current = reference.clone()
    current.update_project_metadata(name="Renamed", info="changed")
    current.action("2").set("name", "renamed leaf")
    current.root.find("extensions").remove(current.root.find("extensions/annotation"))
    ET.SubElement(current.root.find("extensions"), "annotation", {"id": "8", "kind": "new"}).text = "added note"
    ref_path, cur_path = tmp_path / "reference.is2", tmp_path / "current.is2"
    reference.save(ref_path)
    current.save(cur_path)
    return reference, current, ref_path, cur_path


def test_compare_reports_modified_removed_and_added_records(tmp_path):
    reference, current, ref_path, cur_path = _pair(tmp_path)
    diff = compare_project_files(ref_path, cur_path)
    assert diff.reference_sha256 != diff.current_sha256
    assert diff.summary["modified_attributes"] >= 3
    assert diff.summary["removed_in_current"] == 1
    assert diff.summary["added_in_current"] == 1
    kinds = {item.kind for item in diff.operations}
    assert {"modified_attribute", "removed", "added"} <= kinds
    assert all(item.operation_id for item in diff.operations)


def test_selective_restore_restores_only_selected_values_and_removed_node(tmp_path):
    reference, current, _, _ = _pair(tmp_path)
    diff = compare_documents(reference, current)
    chosen = [item.operation_id for item in diff.operations
              if item.kind == "removed" or
              (item.kind == "modified_attribute" and item.path == () and item.attribute == "name")]
    restored, report = apply_selected_restores(reference, current, chosen)
    assert restored.root.get("name") == "fixture"
    assert restored.root.get("info") == "changed"  # not selected
    assert restored.action("2").get("name") == "renamed leaf"  # not selected
    assert restored.root.find("extensions/annotation").get("id") == "7"
    assert restored.root.find("extensions/annotation").text == "old note"
    assert restored.root.find("extensions/annotation[@id='8']") is not None
    assert report["restored_count"] == len(chosen)
    assert report["native_is2_metadata_added"] is False


def test_newer_additions_are_not_removed_without_explicit_opt_in(tmp_path):
    reference, current, _, _ = _pair(tmp_path)
    diff = compare_documents(reference, current)
    addition = next(item for item in diff.operations if item.kind == "added")
    with pytest.raises(ProjectDiffError, match="revert_additions"):
        apply_selected_restores(reference, current, [addition.operation_id])
    restored, _ = apply_selected_restores(
        reference, current, [addition.operation_id], revert_additions=True,
    )
    assert restored.root.find("extensions/annotation[@id='8']") is None


def test_unknown_operation_id_is_rejected(tmp_path):
    reference, current, _, _ = _pair(tmp_path)
    with pytest.raises(ProjectDiffError, match="unknown diff operation"):
        apply_selected_restores(reference, current, ["D999999"])


def test_project_diff_is_non_mutating(tmp_path):
    reference, current, _, _ = _pair(tmp_path)
    before = current.to_bytes(pretty=False)
    compare_documents(reference, current)
    assert current.to_bytes(pretty=False) == before


def test_duplicate_operation_ids_are_rejected(tmp_path):
    reference, current, _, _ = _pair(tmp_path)
    diff = compare_documents(reference, current)
    item = next(item for item in diff.operations if item.kind == "removed")
    with pytest.raises(ProjectDiffError, match="duplicate diff operation"):
        apply_selected_restores(reference, current, [item.operation_id, item.operation_id])


def test_restore_that_introduces_validation_errors_is_blocked(tmp_path):
    reference = ProjectDocument.load(FIXTURE)
    # This baseline action has an arrangement relation. The current branch has a
    # structurally valid document where the record is absent but the relation is
    # not: validation detects the dangling link before a restore can be written.
    current = reference.clone()
    current.action("2").set("name", "renamed")
    diff = compare_documents(reference, current)
    # A normal scalar restore should remain safe and fix only the name.
    name_change = next(item for item in diff.operations if item.kind == "modified_attribute" and item.attribute == "name" and item.path)
    restored, _ = apply_selected_restores(reference, current, [name_change.operation_id])
    assert restored.action("2").get("name") == "leaf"


def test_locator_resolution_uses_stable_ids(tmp_path):
    reference = ProjectDocument.load(FIXTURE)
    current = reference.clone()
    current.action("2").set("name", "changed")
    diff = compare_documents(reference, current)
    name_change = next(item for item in diff.operations if item.kind == "modified_attribute" and item.attribute == "name" and item.path)
    node = resolve_locator(current.root, name_change.path)
    assert node.get("id") == "2"
    assert "pd[@id='2']" in format_locator(name_change.path)


def test_restoring_deleted_action_repairs_existing_dangling_references():
    reference = ProjectDocument.load(FIXTURE)
    current = reference.clone()
    current.actions_node.remove(current.action("2"))
    assert any("missing action id 2" in issue for issue in current.validate())
    diff = compare_documents(reference, current)
    deleted_action = next(item for item in diff.operations if item.kind == "removed" and item.tag == "pd")
    restored, report = apply_selected_restores(reference, current, [deleted_action.operation_id])
    assert restored.action("2").get("name") == "leaf"
    assert not any("missing action id 2" in issue for issue in restored.validate())
    assert report["validation_issue_count_after"] < report["validation_issue_count_before"]


def test_partial_link_restore_that_introduces_dependency_issue_is_blocked():
    reference = ProjectDocument.load(FIXTURE)
    reference.root.find("models/ConceptModel/cs").set("last_elem_id", "0")
    reference.root.find("models/ConceptModel/cs").set("last_link_id", "0")
    reference.root.find("models/ConceptModel/spz").set("last_id", "0")
    current = reference.clone()
    current.actions_node.remove(current.action("2"))
    # The current branch remains valid because both links to action 2 were
    # intentionally removed along with the action.
    current.links_node.clear()
    assert current.validate() == []
    diff = compare_documents(reference, current)
    one_link = next(item for item in diff.operations if item.kind == "removed" and item.tag == "link")
    with pytest.raises(ProjectDiffError, match="dependency/structure preflight"):
        apply_selected_restores(reference, current, [one_link.operation_id], allow_ambiguous=True)


def test_anonymous_repeated_nodes_require_ambiguity_opt_in(tmp_path):
    reference = ProjectDocument.load(FIXTURE)
    extension = ET.SubElement(reference.root, "extensions")
    ET.SubElement(extension, "entry", {"value": "first"})
    ET.SubElement(extension, "entry", {"value": "second"})
    current = reference.clone()
    current.root.find("extensions").remove(current.root.find("extensions/entry[1]"))
    diff = compare_documents(reference, current)
    removed = next(item for item in diff.operations if item.kind == "removed" and item.tag == "entry")
    assert removed.ambiguous
    with pytest.raises(ProjectDiffError, match="allow_ambiguous"):
        apply_selected_restores(reference, current, [removed.operation_id])
    restored, _ = apply_selected_restores(reference, current, [removed.operation_id], allow_ambiguous=True)
    assert len(restored.root.findall("extensions/entry")) == 2


def test_diff_operation_ids_are_deterministic():
    reference = ProjectDocument.load(FIXTURE)
    current = reference.clone()
    current.update_project_metadata(name="changed")
    current.action("2").set("name", "changed leaf")
    first = compare_documents(reference, current)
    second = compare_documents(reference, current)
    assert [item.operation_id for item in first.operations] == [item.operation_id for item in second.operations]


def test_restoring_multiple_removed_siblings_uses_reference_order():
    reference = ProjectDocument.load(FIXTURE)
    extension = ET.SubElement(reference.root, "extensions")
    for ident in ("a", "b", "c"):
        ET.SubElement(extension, "entry", {"id": ident})
    current = reference.clone()
    ext = current.root.find("extensions")
    ext.remove(next(node for node in list(ext) if node.get("id") == "a"))
    ext.remove(next(node for node in list(ext) if node.get("id") == "b"))
    diff = compare_documents(reference, current)
    removed_ids = [item.operation_id for item in diff.operations if item.kind == "removed" and item.tag == "entry"]
    restored, _ = apply_selected_restores(reference, current, removed_ids)
    assert [node.get("id") for node in restored.root.findall("extensions/entry")] == ["a", "b", "c"]


def test_restoring_removed_subtree_preserves_unknown_nested_xml():
    reference = ProjectDocument.load(FIXTURE)
    extension = ET.SubElement(reference.root, "extensions")
    old = ET.SubElement(extension, "futureRecord", {"id": "legacy", "vendor": "opaque"})
    ET.SubElement(old, "unrecognizedChild", {"payload": "keep"}).text = "opaque value"
    current = reference.clone()
    current.root.find("extensions").remove(current.root.find("extensions/futureRecord"))
    diff = compare_documents(reference, current)
    removed = next(item for item in diff.operations if item.kind == "removed" and item.tag == "futureRecord")
    restored, _ = apply_selected_restores(reference, current, [removed.operation_id])
    node = restored.root.find("extensions/futureRecord")
    assert node is not None and node.get("vendor") == "opaque"
    assert node.find("unrecognizedChild").get("payload") == "keep"
    assert node.find("unrecognizedChild").text == "opaque value"


def test_restore_of_an_existing_destination_is_not_part_of_model_api(tmp_path):
    # The pure model API never writes to disk; even its source_path remains the
    # current project path while the returned candidate is a separate clone.
    reference, current, _, current_path = _pair(tmp_path)
    before = current_path.read_bytes()
    diff = compare_documents(reference, current)
    selected = next(item for item in diff.operations if item.kind == "modified_attribute" and item.attribute == "name" and not item.path)
    restored, _ = apply_selected_restores(reference, current, [selected.operation_id])
    assert current_path.read_bytes() == before
    assert restored.source_path == current.source_path


def test_zero_id_is_not_used_as_a_stable_identity():
    reference = ProjectDocument.load(FIXTURE)
    links = ET.SubElement(reference.root, "zero_id_links")
    ET.SubElement(links, "AElement", {"id": "0", "e1": "1"})
    ET.SubElement(links, "AElement", {"id": "0", "e1": "2"})
    current = reference.clone()
    current.root.find("zero_id_links/AElement").set("e1", "2")
    diff = compare_documents(reference, current)
    changed = next(item for item in diff.operations if item.kind == "modified_attribute" and item.attribute == "e1")
    assert changed.ambiguous is True
    assert "index" in changed.path[-1]


def test_large_repeated_id_xml_group_diff_generates_deterministic_operations():
    reference = ProjectDocument.load(FIXTURE)
    rows = ET.SubElement(reference.root, "largeExtension")
    for index in range(1500):
        ET.SubElement(rows, "row", {"id": f"row-{index:04d}", "value": str(index)})
    current = reference.clone()
    current_rows = current.root.find("largeExtension")
    for index in range(0, 1500, 30):
        current_rows[index].set("value", f"changed-{index}")
    first = compare_documents(reference, current)
    second = compare_documents(reference, current)
    assert first.summary["modified_attributes"] == 50
    assert [item.operation_id for item in first.operations] == [item.operation_id for item in second.operations]
    assert not any(item.ambiguous for item in first.operations)
