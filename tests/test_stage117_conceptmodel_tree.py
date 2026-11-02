import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
EXPECTED_SHA = "ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2"


def test_conceptmodel_tree_audit_snapshot_is_complete():
    audit = json.loads((ROOT / "analysis/project_writer/conceptmodel_tree_audit.json").read_text(encoding="utf-8"))
    assert audit["audit"] == "stage117-conceptmodel-writer-reader-tree-symmetry"
    assert audit["status"] == "PASS"
    assert audit["passed"] == audit["total"] == 42
    assert audit["sha256"] == EXPECTED_SHA
    assert audit["writer"]["direct_children"] == ["cs", "spz", "content"]
    assert audit["writer"]["cs_temporary_tag"] == "FStructure"
    assert audit["writer"]["cs_final_tag"] == "cs"
    assert audit["writer"]["spz_temporary_tag"] == "IStructure"
    assert audit["writer"]["spz_final_tag"] == "spz"


def test_conceptmodel_tree_audit_records_reciprocal_metadata_fields():
    audit = json.loads((ROOT / "analysis/project_writer/conceptmodel_tree_audit.json").read_text(encoding="utf-8"))
    assert audit["cs_metadata"] == {
        "last_elem_id": "ConceptStructurePrivate+0x0C",
        "last_link_id": "ConceptStructurePrivate+0x10",
    }
    assert audit["spz_metadata"]["last_id"] == "DynamicStructurePrivate+0x24"
    assert audit["link_range"]["private_field"] == "AIEBinaryLinkPrivate+0x2C"


def test_conceptmodel_tree_report_preserves_static_only_boundary():
    report = (ROOT / "docs/47_stage1_17_conceptmodel_writer_reader_tree_symmetry.md").read_text(encoding="utf-8")
    assert "0x0040A6D0" in report
    assert "0x004066D0" in report
    assert "FStructure" in report and "setTagName" in report
    assert "IStructure" in report and "last_id" in report
    assert "42/42" in report
    assert "does not establish runtime round-trip compatibility" in report
    assert "empty `ConceptModel/cs/elemets` and `ConceptModel/cs/links`" in report


def test_conceptmodel_disassembly_snapshots_cover_both_directions():
    names = [
        "conceptmodel_writer_0x40a6d0.asm",
        "conceptmodel_cs_factory_0x40ac20.asm",
        "conceptmodel_cs_template_0x40a5d0.asm",
        "conceptmodel_spz_template_0x40a440.asm",
        "conceptmodel_reader_0x4066d0.asm",
        "conceptmodel_reader_cs_meta_0x4065b0.asm",
        "conceptmodel_reader_caller_0x408f40.asm",
        "conceptmodel_link_range_reader_0x406380.asm",
        "conceptmodel_content_writer_0x409de0.asm",
    ]
    for name in names:
        text = (ROOT / "analysis/disassembly" / name).read_text(encoding="utf-8")
        assert "disassembly of section .text" in text
        assert "0040" in text or "00406" in text
