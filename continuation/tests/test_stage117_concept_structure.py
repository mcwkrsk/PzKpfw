from pathlib import Path
import json, subprocess, sys
ROOT=Path(__file__).resolve().parents[1]
def test_concept_structure_evidence_contract(tmp_path):
    out=tmp_path/"audit.json"
    cmd=[sys.executable,str(ROOT/"tools/audit_stage117_concept_structure.py"),"--asm",str(ROOT/"analysis/disassembly/concept_structure_stage117.asm"),"--exports",str(ROOT/"analysis/imports-exports/MAIWmodels_exports.tsv"),"--out",str(out)]
    p=subprocess.run(cmd,capture_output=True,text=True)
    assert p.returncode==0, p.stdout+p.stderr
    report=json.loads(out.read_text())
    assert report["status"]=="PASS"
    assert report["passed"]==report["total"]==24

def test_subject_category_compare_contract():
    data=json.loads((ROOT/"analysis/concept_structure/code_structure_tree_audit.json").read_text())
    assert data["subject_category_compare"]["field_order"]==["class@private+0x38","group@private+0x40","number@private+0x44"]
    assert data["subject_category_compare"]["strict_lexicographic"] is True

def test_persistent_aistructure_tree_not_mislabelled():
    data=json.loads((ROOT/"analysis/concept_structure/code_structure_tree_audit.json").read_text())
    assert data["persistent_aistructure_tree"]["semantic_role"]=="unresolved"
    assert data["code_structure"]["uses_two_stack_local_rb_tree_handles"] is True


def test_scbinarylink_factory_blocks_are_cross_checked():
    data=json.loads((ROOT/"analysis/concept_structure/code_structure_tree_audit.json").read_text())
    layout=data["scbinarylink_layout"]
    assert layout["outer_object_allocation_size"] == 48
    assert layout["base_private_record_allocation_size"] == 48
    assert layout["allocation_blocks_are_distinct"] is True
    assert layout["outer_object_release"]["vtable_va"] == "0x100173D4"
    assert layout["outer_object_release"]["slot0_scalar_deleting_destructor"] == "0x1000F740"
    assert layout["outer_object_release"]["outer_free_size"] == 48
    assert layout["endpoint_slots"] == {
        "slot0": "private+0x1c", "slot1": "private+0x20", "slot2": "private+0x24"
    }
    assert layout["types"] == {"order": 1, "composition": 2, "arragment": 3}
    assert layout["auto_range_filter_type"] == 3


def test_scbinarylink_display_methods_do_not_define_range_semantics():
    data=json.loads((ROOT/"analysis/concept_structure/code_structure_tree_audit.json").read_text())
    display=data["scbinarylink_layout"]["display_methods"]
    assert display["getCode"]["missing_endpoint_literal"]["text"] == "-"
    assert display["getCode"]["reads_range"] is False
    assert display["getName"]["type_labels"]["1"]["text"] == "Упорядочивание "
    assert display["getName"]["type_labels"]["2"]["text"] == "Состав "
    assert display["getName"]["type_labels"]["3"]["text"] == "Компоновка "
    assert display["getName"]["reads_range"] is False
    assert "natural-language meaning" in data["scbinarylink_layout"]["range_accessors"]["semantic_values_1_and_99"]
    documented = data["scbinarylink_layout"]["range_accessors"]["source_documentation"]["documented_allowed_outputs"]
    assert documented == {"type_1_order": "99", "type_2_composition": "1 or 99", "type_3_arragment": "rank number or 99"}


def test_range_import_scan_is_bounded_and_sha_pinned():
    scan=json.loads((ROOT/"analysis/concept_structure/range_consumer_scan.json").read_text())
    assert scan["status"] == "PASS"
    assert scan["passed"] == scan["total"] == 6
    assert all(item["no_named_range_symbol_occurrences"] and item["sha_matches"] for item in scan["results"].values())
    assert "does not rule out ordinal imports" in scan["limitations"]


def test_reference_samples_do_not_cover_scbinarylink_range():
    data=json.loads((ROOT/"analysis/concept_structure/code_structure_tree_audit.json").read_text())
    coverage=data["sample_project_coverage_for_scbinarylink_range"]["samples"]
    assert set(coverage) == {"kaka2.xml", "schaefer.is2", "untitled.is2"}
    assert all(item["concept_model_count"] == 1 for item in coverage.values())
    assert all(not item["has_nonempty_cs_links"] for item in coverage.values())
    assert all(item["cs_containers"][0]["element_count"] == 0 for item in coverage.values())


def test_subject_category_domain_scope_is_not_collapsed():
    data=json.loads((ROOT/"analysis/concept_structure/code_structure_tree_audit.json").read_text())
    domain=data["subject_category_domain"]
    assert domain["domain_labels_from_thesis"]["7"]["label"] == "feature value"
    assert domain["scope_distinction"]["gui_creation_menu"] == ["S","P","Z","K","O"]
    assert domain["scope_distinction"]["F1_class_list"] == ["S","P","Z","K","O","R"]
    assert domain["scope_distinction"]["formal_model"] == ["S","P","Z","K","O","R","C"]


def test_relation_constraints_and_endpoint_positions_are_explicit():
    data=json.loads((ROOT/"analysis/concept_structure/code_structure_tree_audit.json").read_text())
    constraints=data["subject_category_domain"]["relation_constraints_from_thesis"]
    assert constraints["order"]["constraint"] == "same class"
    assert constraints["composition"]["allowed_formal_transitions"] == ["P->Z","Z->K","K->O","O->R","R->C"]
    endpoints=data["scbinarylink_layout"]["endpoint_layout_by_type"]
    assert endpoints["order"]["slots"] == ["null","A","B"]
    assert endpoints["composition"]["slots"] == ["A","B","null"]
    assert endpoints["arragment"]["slots"] == ["A","B","C"]


def test_coding_type_cstype_and_category_status_are_distinct():
    data=json.loads((ROOT/"analysis/concept_structure/code_structure_tree_audit.json").read_text())
    props=data["subject_category_properties"]
    assert props["getCodingType"]["field"] == "private+0x3C"
    assert props["getStatus"]["field"] == "private+0x4C"
    assert "derived from attached type-3 links" in props["getType"]["kind"]
    assert props["getType"]["observed_return_values"] == [0, 1]
    assert "endpoint1 == current category" in props["getType"]["return_value_logic"]
    assert "not yet established" in props["semantic_mapping_note"]


def test_code_structure_first_pass_and_autorange_are_separate():
    data=json.loads((ROOT/"analysis/concept_structure/code_structure_tree_audit.json").read_text())
    cs=data["code_structure"]
    assert cs["first_normalization_pass"]["filter"] == "getCodingType()==0"
    ar=cs["auto_range"]
    assert ar["filters"] == {"binding_endpoint_index":0,"link_type":3,"endpoint_slot2":"null"}
    assert ar["sort_key"] == "endpoint1 SubjectCategory tuple (class, group, number)"
    assert ar["independent_from_first_normalization_pass"] is True
