from __future__ import annotations

import sys
from pathlib import Path
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re import ProjectDocument, audit_document

SAMPLES = ROOT / "samples"
SAMPLE_NAMES = (
    "schaefer.is2",
    "untitled.is2",
    "kaka2.xml",
    "kursach.is2",
    "kursach_user_supplied_42_actions.is2",
)


def test_native_sample_corpus_preserves_full_xml_semantics(tmp_path):
    for name in SAMPLE_NAMES:
        source = SAMPLES / name
        doc = ProjectDocument.load(source)
        before = doc.semantic_snapshot()
        output = tmp_path / name
        doc.save(output)
        reopened = ProjectDocument.load(output)
        assert reopened.semantic_snapshot() == before, name
        assert reopened.validate(deep=True) == [], name


def test_compatibility_audit_separates_structural_pass_from_original_runtime():
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    report = audit_document(doc)
    assert report["native_envelope"] == "PASS"
    assert report["structural_validation"] == "PASS"
    assert report["writer_semantic_roundtrip"] == "PASS"
    assert report["pzkpfw_private_markup_added"] is False
    assert report["undo_redo_storage"].startswith("memory-only")
    # Runtime acceptance is deliberately not inferred from XML tests.
    assert report["original_is2_runtime_acceptance"] == "NOT_TESTED"


def test_writer_does_not_mutate_live_tree_or_add_private_attributes():
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    before = doc.semantic_snapshot()
    serialized = doc.to_bytes(pretty=True)
    assert doc.semantic_snapshot() == before
    root = ET.fromstring(serialized)
    assert root.tag == "project"
    for node in root.iter():
        assert not any("pzkpfw" in key.casefold() for key in node.attrib)
        assert "pzkpfw" not in str(node.tag).casefold()


def test_new_project_uses_native_envelope_without_fork_metadata():
    doc = ProjectDocument.new_empty("PzKpfw native schema test")
    report = audit_document(doc)
    assert report["native_envelope"] == "PASS"
    assert report["writer_semantic_roundtrip"] == "PASS"
    assert report["pzkpfw_marker_count_in_source"] == 0
    assert report["module_params_module_count"] == 1
    assert report["module_params_primary_model_auto"]["present"] is True
    assert report["module_params_primary_model_auto"]["decStr"] == ""
    assert not any("ModuleParams" in note for note in report["runtime_risk_notes"])
    assert doc.root.find("models/ConceptModel/cs/elemets") is not None
    assert doc.root.find("models/ConceptModel/spz/elemets") is not None


def test_serialization_preflight_reports_semantic_and_idempotent_writer_passes():
    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    report = doc.serialization_preflight()
    assert report["xml_reopens"] is True
    assert report["semantic_preserved"] is True
    assert report["writer_idempotent"] is True
    assert report["validation_issues"] == []
    assert report["output_encoding"] == "utf-8"


def test_writer_accepts_legacy_windows_1251_and_utf16_xml_inputs():
    doc = ProjectDocument.new_empty("Проект Кириллица", user_name="Тестовый пользователь")
    doc.add_action("Действие с русским названием", action_type=0)
    snapshot = doc.semantic_snapshot()
    utf8_text = doc.to_bytes().decode("utf-8")

    cp1251_text = utf8_text.replace("encoding='utf-8'", "encoding='windows-1251'", 1)
    cp1251_doc = ProjectDocument.from_bytes(cp1251_text.encode("cp1251"))
    assert cp1251_doc.semantic_snapshot() == snapshot
    assert cp1251_doc.serialization_preflight()["writer_idempotent"] is True

    utf16_text = utf8_text.replace("encoding='utf-8'", "encoding='utf-16'", 1)
    utf16_payload = b"\xff\xfe" + utf16_text.encode("utf-16le")
    utf16_doc = ProjectDocument.from_bytes(utf16_payload)
    assert utf16_doc.semantic_snapshot() == snapshot
    assert utf16_doc.serialization_preflight()["writer_idempotent"] is True


def test_save_preflight_refuses_semantic_change_before_replacing_existing_file(tmp_path, monkeypatch):
    import pytest
    from is2_re.model import ProjectFormatError

    doc = ProjectDocument.load(SAMPLES / "kursach_user_supplied_42_actions.is2")
    target = tmp_path / "protected.is2"
    target.write_bytes(b"ORIGINAL FILE MUST SURVIVE")
    original = target.read_bytes()
    changed = doc.clone()
    changed.update_project_metadata(name="mutated by fake parser")

    monkeypatch.setattr(ProjectDocument, "from_bytes", classmethod(lambda cls, raw: changed))
    with pytest.raises(ProjectFormatError, match="semantic project tree"):
        doc.save(target)
    assert target.read_bytes() == original
