from pathlib import Path
import sys
import xml.etree.ElementTree as ET

import pytest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))
from is2_re import ProjectDocument, ProjectFormatError

SAMPLES = ROOT / "samples"


def sample():
    return ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")


def make_categories(doc):
    cs = doc.concept_structure
    a = cs.add_category("Процесс A", class_id=2, group=1, number=1)
    b = cs.add_category("Задача B", class_id=3, group=1, number=2)
    c = cs.add_category("Задача C", class_id=3, group=1, number=1)
    return a, b, c


def test_all_supplied_projects_have_valid_empty_concept_structure():
    for name in ("schaefer.is2", "untitled.is2", "kaka2.xml", "kursach.is2", "kursach_user_supplied_42_actions.is2"):
        doc = ProjectDocument.load(SAMPLES / name)
        assert doc.concept_structure.validate() == []
        assert doc.concept_structure.category_records() == []
        assert doc.concept_structure.link_records() == []


def test_add_subject_categories_uses_pk_and_recovered_fields_and_counter(tmp_path):
    doc = sample()
    cs = doc.concept_structure
    first = cs.add_category("Процесс A", class_id=2, group=4, number=7)
    second = cs.add_category("Задача B", class_id=3, group=4, number=8, status=1, auto_range=False, coding_type=0)
    assert (first, second) == ("1", "2")
    assert cs.cs_node.get("last_elem_id") == "2"
    node = cs.category(first)
    assert node.tag == "pk"
    assert {k: node.get(k) for k in ("id", "name", "class", "group", "number", "status", "autoRange", "codingType")} == {
        "id":"1", "name":"Процесс A", "class":"2", "group":"4", "number":"7",
        "status":"0", "autoRange":"1", "codingType":"1",
    }
    assert cs.category_records()[1].auto_range is False
    assert cs.category_records()[1].coding_type == 0
    assert doc.validate() == []
    output = tmp_path / "concept-categories.is2"
    doc.roundtrip_to(output)
    reopened = ProjectDocument.load(output)
    assert reopened.concept_structure.category("1").get("name") == "Процесс A"
    assert reopened.validate() == []


def test_sc_binary_link_endpoint_layouts_and_factory_range_defaults():
    doc = sample()
    a, b, c = make_categories(doc)
    cs = doc.concept_structure
    # type 1: (null, A, B), always range 99
    order_id = cs.add_link(1, e2=a, e3=b)
    order = cs.link(order_id)
    assert (order.get("e1"), order.get("e2"), order.get("e3"), order.get("range")) == ("0", a, b, "99")
    # type 2: (A, B, null), range 1 for first endpoint class 1/3/5, else 99
    composition_id = cs.add_link(2, e1=a, e2=b)
    composition = cs.link(composition_id)
    assert (composition.get("e1"), composition.get("e2"), composition.get("e3")) == (a, b, "0")
    assert composition.get("range") == "99"  # class 2 is not in {1,3,5}
    # type 3: (A, B, C), range 1 when C is null, else 99
    arrangement_id = cs.add_link(3, e1=b, e2=c)
    assert cs.link(arrangement_id).get("range") == "1"
    arrangement_with_c = cs.add_link(3, e1=b, e2=c, e3=a)
    assert cs.link(arrangement_with_c).get("range") == "99"
    assert doc.validate() == []


def test_type2_factory_range_is_one_for_class_1_3_5():
    doc = sample()
    cs = doc.concept_structure
    a = cs.add_category("Task", class_id=3)
    b = cs.add_category("Component", class_id=4)
    link_id = cs.add_link(2, e1=a, e2=b)
    assert cs.link(link_id).get("range") == "1"


def test_link_id_counter_is_monotonic_and_does_not_reuse_deleted_ids():
    doc = sample()
    a, b, _ = make_categories(doc)
    cs = doc.concept_structure
    first = cs.add_link(2, e1=a, e2=b)
    cs.delete_link(first)
    second = cs.add_link(2, e1=a, e2=b)
    assert (first, second) == ("1", "2")
    assert cs.cs_node.get("last_link_id") == "2"


def test_category_delete_requires_explicit_link_cascade():
    doc = sample()
    a, b, _ = make_categories(doc)
    cs = doc.concept_structure
    cs.add_link(2, e1=a, e2=b)
    with pytest.raises(ValueError, match="referenced by 1 links"):
        cs.delete_category(a)
    cs.delete_category(a, cascade_links=True)
    assert not cs.links
    assert doc.validate() == []


def test_category_delete_is_blocked_when_content_exists():
    doc = sample()
    a, _, _ = make_categories(doc)
    ET.SubElement(doc.root.find("models/ConceptModel/content"), "opaqueContentRecord", {"af":"1"})
    with pytest.raises(ValueError, match="content is populated"):
        doc.concept_structure.delete_category(a, cascade_links=True)


def test_concept_model_validator_detects_dangling_and_wrong_slot_link():
    doc = sample()
    a, b, _ = make_categories(doc)
    cs = doc.concept_structure
    link_id = cs.add_link(2, e1=a, e2=b)
    cs.link(link_id).set("e3", "999")
    issues = doc.validate()
    assert any("requires null e3" in x for x in issues)
    assert any("references missing SubjectCategory 999" in x for x in issues)


def test_auto_range_recomputes_only_type3_e1_links_with_null_e3_in_category_order():
    doc = sample()
    cs = doc.concept_structure
    owner = cs.add_category("Owner", class_id=1, group=0, number=1)
    z2 = cs.add_category("Later", class_id=3, group=0, number=2)
    z1 = cs.add_category("Earlier", class_id=3, group=0, number=1)
    disabled = cs.add_category("Disabled", class_id=3, group=0, number=3, auto_range=False)
    later = cs.add_link(3, e1=owner, e2=z2)
    earlier = cs.add_link(3, e1=owner, e2=z1)
    # A non-null third endpoint must not be auto-ranked by this recovered path.
    non_null_third = cs.add_link(3, e1=owner, e2=z2, e3=z1)
    # autoRange=0 category does not re-rank links.
    disabled_link = cs.add_link(3, e1=disabled, e2=z1)
    changed = cs.recompute_auto_ranges()
    assert changed[owner] == [earlier, later]
    assert cs.link(earlier).get("range") == "1"
    assert cs.link(later).get("range") == "2"
    assert cs.link(non_null_third).get("range") == "99"
    assert cs.link(disabled_link).get("range") == "1"  # factory default remains untouched


def test_unknown_concept_nodes_and_attributes_survive_typed_edits_and_save(tmp_path):
    doc = sample()
    cs_node = doc.concept_structure.ensure_cs()
    cs_node.set("vendorCounter", "preserve")
    ET.SubElement(doc.concept_structure.elements_node, "vendorCategory", {"opaque":"yes"})
    ET.SubElement(doc.concept_structure.links_node, "vendorLink", {"opaque":"yes"})
    a = doc.concept_structure.add_category("Preserve", class_id=5, attributes={"vendor":"opaque"})
    out = tmp_path / "unknown-concept-preserved.is2"
    doc.save(out)
    loaded = ProjectDocument.load(out)
    assert loaded.concept_structure.cs_node.get("vendorCounter") == "preserve"
    assert loaded.concept_structure.elements_node.find("vendorCategory").get("opaque") == "yes"
    assert loaded.concept_structure.links_node.find("vendorLink").get("opaque") == "yes"
    assert loaded.concept_structure.category(a).get("vendor") == "opaque"


def test_category_counter_underflow_refuses_to_reuse_id():
    doc = sample()
    cs = doc.concept_structure
    ident = cs.add_category("First", class_id=1)
    cs.cs_node.set("last_elem_id", "0")
    with pytest.raises(ProjectFormatError, match="below max current ID"):
        cs.add_category("Must not reuse", class_id=2)


def test_concept_read_and_validation_do_not_materialise_missing_containers():
    doc = sample()
    cm = doc.root.find("models/ConceptModel")
    cs = cm.find("cs")
    # Preserve an intentionally partial cs exactly as it was loaded.
    cs.clear()
    cs.attrib.update({"last_elem_id": "0", "last_link_id": "0"})
    before = ET.tostring(cs, encoding="unicode")
    concept = doc.concept_structure
    assert concept.category_records() == []
    assert concept.link_records() == []
    assert concept.validate() == []
    assert ET.tostring(cs, encoding="unicode") == before


def test_update_link_validates_atomically_and_keeps_previous_xml_on_failure():
    doc = sample()
    a, b, c = make_categories(doc)
    link_id = doc.concept_structure.add_link(2, e1=a, e2=b)
    before = dict(doc.concept_structure.link(link_id).attrib)
    with pytest.raises(ValueError, match="endpoint layout"):
        doc.concept_structure.update_link(link_id, type=1, e1=a, e2=b, e3=c)
    assert dict(doc.concept_structure.link(link_id).attrib) == before
    with pytest.raises(KeyError, match="does not exist"):
        doc.concept_structure.update_link(link_id, e2="999")
    assert dict(doc.concept_structure.link(link_id).attrib) == before


def test_update_category_validates_atomically():
    doc = sample()
    ident = doc.concept_structure.add_category("Stable", class_id=2)
    before = dict(doc.concept_structure.category(ident).attrib)
    with pytest.raises(ValueError, match="class"):
        doc.concept_structure.update_category(ident, name="Changed", **{"class": 99})
    assert dict(doc.concept_structure.category(ident).attrib) == before
    with pytest.raises(ValueError):
        doc.concept_structure.update_category(ident, group="not-an-int")
    assert dict(doc.concept_structure.category(ident).attrib) == before


def test_concept_validator_reports_invalid_category_scalar_fields():
    doc = sample()
    ident = doc.concept_structure.add_category("Broken", class_id=2)
    node = doc.concept_structure.category(ident)
    node.set("class", "99")
    node.set("autoRange", "yes-ish")
    issues = doc.concept_structure.validate()
    assert any("unsupported class 99" in issue for issue in issues)
    assert any("autoRange" in issue and "invalid integer attribute" in issue for issue in issues)


def test_nonempty_concept_structure_full_semantic_roundtrip(tmp_path):
    doc = sample()
    a = doc.concept_structure.add_category("A", class_id=1, group=0, number=1)
    b = doc.concept_structure.add_category("B", class_id=3, group=0, number=1)
    c = doc.concept_structure.add_category("C", class_id=5, group=1, number=2)
    doc.concept_structure.add_link(1, e2=a, e3=b)
    doc.concept_structure.add_link(2, e1=b, e2=c)
    doc.concept_structure.add_link(3, e1=a, e2=b)
    assert doc.validate() == []
    target = tmp_path / "concept-full-roundtrip.is2"
    before = doc.semantic_snapshot()
    doc.save(target)
    reopened = ProjectDocument.load(target)
    assert reopened.semantic_snapshot() == before
    assert len(reopened.concept_structure.category_records()) == 3
    assert len(reopened.concept_structure.link_records()) == 3
    assert reopened.validate() == []


def test_bulk_update_categories_is_atomic_and_preserves_unknown_attributes():
    doc = sample()
    a, b, c = make_categories(doc)
    cs = doc.concept_structure
    cs.category(a).set("vendor", "keep-a")
    cs.category(b).set("vendor", "keep-b")
    changed = cs.update_categories({a: {"group": 12, "number": 1}, b: {"group": 12, "number": 2}})
    assert changed == (a, b)
    assert cs.category(a).get("group") == "12"
    assert cs.category(b).get("number") == "2"
    assert cs.category(a).get("vendor") == "keep-a"
    assert cs.category(b).get("vendor") == "keep-b"


def test_bulk_update_categories_validates_every_change_before_any_mutation():
    doc = sample()
    a, b, _ = make_categories(doc)
    cs = doc.concept_structure
    before = doc.semantic_snapshot()
    with pytest.raises(ValueError, match="class_id|class must"):
        cs.update_categories({a: {"group": 7}, b: {"class": 99}})
    assert doc.semantic_snapshot() == before


def test_bulk_update_categories_rejects_unknown_id_without_partial_changes():
    doc = sample()
    a, _, _ = make_categories(doc)
    cs = doc.concept_structure
    before = doc.semantic_snapshot()
    with pytest.raises(KeyError, match="does not exist"):
        cs.update_categories({a: {"group": 3}, "999": {"group": 3}})
    assert doc.semantic_snapshot() == before


def test_concept_catalog_report_summarizes_classes_groups_and_duplicate_numbers():
    doc = sample()
    a = doc.concept_structure.add_category("A", class_id=2, group=5, number=1)
    b = doc.concept_structure.add_category("B", class_id=2, group=5, number=1)
    doc.concept_structure.add_category("C", class_id=3, group=7, number=2)
    report = doc.concept_structure.catalog_report()
    assert report["category_count"] == 3
    assert report["class_count"] == 2
    assert report["group_count"] == 2
    assert report["duplicate_numbers"] == [{
        "class_id": 2, "group": 5, "number": 1, "category_ids": [a, b],
    }]


def test_custom_category_attributes_are_editable_without_losing_children_or_id():
    doc = sample()
    cs = doc.concept_structure
    ident = cs.add_category("Original", class_id=2, group=3, number=4, attributes={"vendorFlag": "keep"})
    node = cs.category(ident)
    child = ET.SubElement(node, "VendorChild", {"payload": "preserve"})
    cs.set_category_attributes(ident, {
        "name": "Renamed", "class": "3", "group": "8", "number": "9",
        "status": "1", "autoRange": "0", "codingType": "2", "vendorFlag": "changed",
        "vendorNew": "x",
    })
    assert node.get("id") == ident
    assert node.get("name") == "Renamed"
    assert node.get("class") == "3"
    assert node.get("vendorFlag") == "changed"
    assert node.get("vendorNew") == "x"
    assert node.find("VendorChild") is child
    assert child.get("payload") == "preserve"
    assert doc.validate() == []


def test_custom_category_attribute_edit_is_validated_atomically():
    doc = sample()
    cs = doc.concept_structure
    ident = cs.add_category("Original", class_id=2, group=3)
    before = doc.semantic_snapshot()
    with pytest.raises(ValueError, match="class"):
        cs.set_category_attributes(ident, {"name": "Changed", "group": "5"})
    assert doc.semantic_snapshot() == before
    with pytest.raises(ValueError, match="id"):
        cs.set_category_attributes(ident, {"id": "999", "name": "Changed", "class": "2"})
    assert doc.semantic_snapshot() == before


def test_custom_link_attributes_are_editable_and_typed_fields_remain_validated():
    doc = sample()
    cs = doc.concept_structure
    a, b, _ = make_categories(doc)
    link_id = cs.add_link(2, e1=a, e2=b, attributes={"vendorFlag": "old"})
    node = cs.link(link_id)
    child = ET.SubElement(node, "VendorChild", {"x": "1"})
    cs.set_link_attributes(link_id, {
        "name": "Edited", "e1": a, "e2": b, "e3": "0", "type": "2", "range": "17",
        "vendorFlag": "new", "vendorExtra": "v",
    })
    assert node.get("id") == link_id
    assert node.get("name") == "Edited"
    assert node.get("range") == "17"
    assert node.get("vendorFlag") == "new"
    assert node.get("vendorExtra") == "v"
    assert node.find("VendorChild") is child
    before = doc.semantic_snapshot()
    with pytest.raises(ValueError, match="type=2"):
        cs.set_link_attributes(link_id, {
            "name": "Broken", "e1": a, "e2": b, "e3": b, "type": "2", "range": "17",
        })
    assert doc.semantic_snapshot() == before


def test_catalog_report_contains_link_family_and_unknown_attribute_audit():
    doc = sample()
    cs = doc.concept_structure
    a, b, _ = make_categories(doc)
    cs.category(a).set("vendorExtra", "1")
    cs.add_link(2, e1=a, e2=b, attributes={"vendorLink": "yes"})
    report = cs.catalog_report()
    assert report["link_type_counts"] == {"1": 0, "2": 1, "3": 0}
    assert report["unknown_attribute_counts"] == {"categories": 1, "links": 1}
    assert report["duplicate_category_ids"] == []
    assert report["duplicate_link_ids"] == []
    assert report["validation_issues"] == []
