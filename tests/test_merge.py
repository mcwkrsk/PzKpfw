from pathlib import Path
import sys
import xml.etree.ElementTree as ET

import pytest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re import ProjectDocument
from is2_re.merge import ProjectMergeError, merge_documents

FIXTURE = ROOT / "tests" / "fixtures" / "minimal.is2"


def _base_with_record():
    base = ProjectDocument.load(FIXTURE)
    ext = ET.SubElement(base.root, "extensions")
    ET.SubElement(ext, "record", {"id": "r1", "value": "base", "other": "stay"}).text = "base text"
    return base


def _record(doc):
    return doc.root.find("extensions/record[@id='r1']")


def test_three_way_merge_combines_disjoint_attribute_changes():
    base = _base_with_record()
    ours, theirs = base.clone(), base.clone()
    _record(ours).set("value", "local")
    _record(theirs).set("other", "incoming")
    merged, report = merge_documents(base, ours, theirs)
    assert _record(merged).attrib == {"id": "r1", "value": "local", "other": "incoming"}
    assert report["ready_to_write"] is True
    assert report["conflict_count"] == 0


def test_concurrent_attribute_change_is_reported_and_preview_keeps_ours():
    base = _base_with_record()
    ours, theirs = base.clone(), base.clone()
    _record(ours).set("value", "local")
    _record(theirs).set("value", "incoming")
    merged, report = merge_documents(base, ours, theirs)
    assert report["ready_to_write"] is False
    assert report["conflict_count"] == 1
    assert report["conflicts"][0]["kind"] == "attribute"
    assert _record(merged).get("value") == "local"


def test_conflict_resolution_can_choose_theirs():
    base = _base_with_record()
    ours, theirs = base.clone(), base.clone()
    _record(ours).set("value", "local")
    _record(theirs).set("value", "incoming")
    merged, report = merge_documents(base, ours, theirs, resolutions={"M000001": "theirs"})
    assert _record(merged).get("value") == "incoming"
    assert report["ready_to_write"] is True
    assert report["conflicts"][0]["resolution"] == "theirs"


def test_conflict_resolution_can_choose_base():
    base = _base_with_record()
    ours, theirs = base.clone(), base.clone()
    _record(ours).set("value", "local")
    _record(theirs).set("value", "incoming")
    merged, report = merge_documents(base, ours, theirs, resolutions={"M000001": "base"})
    assert _record(merged).get("value") == "base"
    assert report["ready_to_write"] is True


def test_conflicting_text_changes_require_resolution():
    base = _base_with_record()
    ours, theirs = base.clone(), base.clone()
    _record(ours).text = "local text"
    _record(theirs).text = "incoming text"
    merged, report = merge_documents(base, ours, theirs)
    assert report["conflicts"][0]["kind"] == "text"
    assert _record(merged).text == "local text"


def test_incoming_delete_is_accepted_when_local_node_is_unchanged():
    base = _base_with_record()
    ours, theirs = base.clone(), base.clone()
    theirs.root.find("extensions").remove(_record(theirs))
    merged, report = merge_documents(base, ours, theirs)
    assert merged.root.find("extensions/record") is None
    assert report["conflict_count"] == 0


def test_local_delete_is_accepted_when_incoming_node_is_unchanged():
    base = _base_with_record()
    ours, theirs = base.clone(), base.clone()
    ours.root.find("extensions").remove(_record(ours))
    merged, report = merge_documents(base, ours, theirs)
    assert merged.root.find("extensions/record") is None
    assert report["conflict_count"] == 0


def test_delete_vs_modify_is_a_conflict_and_can_keep_modified_side():
    base = _base_with_record()
    ours, theirs = base.clone(), base.clone()
    _record(ours).set("value", "local")
    theirs.root.find("extensions").remove(_record(theirs))
    merged, report = merge_documents(base, ours, theirs, resolutions={"M000001": "ours"})
    assert merged.root.find("extensions/record").get("value") == "local"
    assert report["ready_to_write"] is True
    assert report["conflicts"][0]["kind"] == "modify_delete"


def test_concurrent_add_of_same_identity_is_a_conflict():
    base = ProjectDocument.load(FIXTURE)
    ours, theirs = base.clone(), base.clone()
    ET.SubElement(ours.root, "extensions")
    ET.SubElement(theirs.root, "extensions")
    ET.SubElement(ours.root.find("extensions"), "record", {"id": "new", "value": "ours"})
    ET.SubElement(theirs.root.find("extensions"), "record", {"id": "new", "value": "theirs"})
    merged, report = merge_documents(base, ours, theirs)
    assert merged.root.find("extensions/record").get("value") == "ours"
    assert report["conflicts"][0]["kind"] == "concurrent_add"


def test_repeated_anonymous_children_are_not_matched_by_position():
    base = ProjectDocument.load(FIXTURE)
    ext = ET.SubElement(base.root, "extensions")
    ET.SubElement(ext, "entry", {"label": "one"})
    ET.SubElement(ext, "entry", {"label": "two"})
    ours, theirs = base.clone(), base.clone()
    ours.root.find("extensions/entry").set("label", "local one")
    theirs.root.findall("extensions/entry")[1].set("label", "incoming two")
    merged, report = merge_documents(base, ours, theirs)
    assert report["conflicts"][0]["kind"] == "ambiguous_child_group"
    assert report["ready_to_write"] is False
    assert [n.get("label") for n in merged.root.findall("extensions/entry")] == ["local one", "two"]


def test_unknown_conflict_resolution_id_is_rejected():
    base = _base_with_record()
    with pytest.raises(ProjectMergeError, match="unknown merge conflict"):
        merge_documents(base, base.clone(), base.clone(), resolutions={"M999999": "ours"})


def test_invalid_conflict_resolution_value_is_rejected():
    base = _base_with_record()
    ours, theirs = base.clone(), base.clone()
    _record(ours).set("value", "local")
    _record(theirs).set("value", "incoming")
    with pytest.raises(ProjectMergeError, match="invalid resolution"):
        merge_documents(base, ours, theirs, resolutions={"M000001": "automatic"})


def test_three_way_merge_never_mutates_input_documents():
    base = _base_with_record()
    ours, theirs = base.clone(), base.clone()
    _record(ours).set("value", "local")
    _record(theirs).set("other", "incoming")
    before = (base.to_bytes(pretty=False), ours.to_bytes(pretty=False), theirs.to_bytes(pretty=False))
    merge_documents(base, ours, theirs)
    after = (base.to_bytes(pretty=False), ours.to_bytes(pretty=False), theirs.to_bytes(pretty=False))
    assert after == before


def test_merge_candidate_passes_writer_preflight():
    base = _base_with_record()
    ours, theirs = base.clone(), base.clone()
    _record(ours).set("value", "local")
    _record(theirs).set("other", "incoming")
    merged, report = merge_documents(base, ours, theirs)
    assert report["writer_preflight"]["xml_reopens"] is True
    assert report["writer_preflight"]["semantic_preserved"] is True
    assert report["writer_preflight"]["writer_idempotent"] is True
    assert ProjectDocument.from_bytes(merged.to_bytes()).validate(deep=True) == merged.validate(deep=True)


def test_concurrent_node_add_resolution_can_select_theirs():
    base = ProjectDocument.load(FIXTURE)
    ours, theirs = base.clone(), base.clone()
    ET.SubElement(ours.root, "extensions")
    ET.SubElement(theirs.root, "extensions")
    ET.SubElement(ours.root.find("extensions"), "record", {"id": "new", "value": "ours"})
    ET.SubElement(theirs.root.find("extensions"), "record", {"id": "new", "value": "theirs"})
    merged, report = merge_documents(base, ours, theirs, resolutions={"M000001": "theirs"})
    assert merged.root.find("extensions/record").get("value") == "theirs"
    assert report["ready_to_write"] is True
