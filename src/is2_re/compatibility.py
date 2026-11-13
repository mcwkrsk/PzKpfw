"""Conservative compatibility audit for the observed native IS-2 XML envelope.

This audit proves structural XML round-trip preservation for the supplied
contract. It deliberately does not claim that the original Windows IS.exe has
accepted the output; that is a separate runtime test.
"""
from __future__ import annotations

from typing import Any

from .document import ProjectDocument
from .graph import build_relationship_graph


def audit_document(doc: ProjectDocument) -> dict[str, Any]:
    validation_issues = doc.validate(deep=True)
    original_snapshot = doc.semantic_snapshot()
    serialized = doc.to_bytes(pretty=True)
    reopened = ProjectDocument.from_bytes(serialized)
    semantic_preserved = reopened.semantic_snapshot() == original_snapshot
    writer_idempotent = serialized == reopened.to_bytes(pretty=True)
    writer_validation_issues = reopened.validate(deep=True)
    graph_report = build_relationship_graph(doc)

    # PzKpfw does not encode undo history, editor state or private metadata in
    # the project. Count any existing markers without treating user extensions
    # as errors; unknown vendor XML is preserved intentionally.
    pzkpfw_markers: list[str] = []
    for node in doc.root.iter():
        tag = str(node.tag)
        if "pzkpfw" in tag.casefold():
            pzkpfw_markers.append(f"element:{tag}")
        for key in node.attrib:
            if "pzkpfw" in str(key).casefold():
                pzkpfw_markers.append(f"attribute:{key}")

    module_params = doc.root.find("ModuleParams")
    module_records = module_params.findall("Module") if module_params is not None else []
    runtime_risk_notes: list[str] = []
    if module_params is None:
        runtime_risk_notes.append("Раздел ModuleParams отсутствует.")
    elif not module_records:
        runtime_risk_notes.append("В ModuleParams нет записей Module.")
    primary_auto = next((m for m in module_records if m.get("name") == "PrimaryModelAuto"), None)
    if primary_auto is None:
        runtime_risk_notes.append("Запись PrimaryModelAuto в ModuleParams отсутствует; настройки этого подключаемого модуля могли не сохраниться.")
    else:
        param = primary_auto.find("param")
        if param is None or param.get("decStr") is None:
            runtime_risk_notes.append("В PrimaryModelAuto отсутствует param/@decStr; не следует предполагать наличие непустого списка выбора.")

    required_paths = (
        "models/primaryModel/spd/actions",
        "models/primaryModel/spd/links",
        "models/primaryModel/params",
        "models/primaryModel/objects",
    )
    envelope = all(doc.root.find(path) is not None for path in required_paths)
    return {
        "format": "XML проекта ИС-2",
        "root_tag": doc.root.tag,
        "native_envelope": "PASS" if doc.root.tag == "project" and envelope else "FAIL",
        "structural_validation": "PASS" if not validation_issues else "FAIL",
        "structural_issues": validation_issues,
        "writer_semantic_roundtrip": "PASS" if semantic_preserved else "FAIL",
        "writer_semantic_preserved": semantic_preserved,
        "writer_idempotent_roundtrip": "PASS" if writer_idempotent else "FAIL",
        "writer_idempotent": writer_idempotent,
        "writer_reopened_validation": "PASS" if not writer_validation_issues else "FAIL",
        "writer_reopened_validation_issues": writer_validation_issues,
        "relationship_graph_summary": graph_report["summary"],
        "relationship_graph_dangling_references": graph_report["dangling_references"],
        "relationship_graph_opaque_records": graph_report["opaque_records"],
        "pzkpfw_private_markup_added": False,
        "pzkpfw_marker_count_in_source": len(pzkpfw_markers),
        "pzkpfw_markers_in_source": pzkpfw_markers,
        "module_params_module_count": len(module_records),
        "module_params_primary_model_auto": (
            {"present": primary_auto is not None,
             "decStr": (primary_auto.find("param").get("decStr") if primary_auto is not None and primary_auto.find("param") is not None else None),
             "default_provenance": "multiple supplied native samples contain PrimaryModelAuto with decStr; empty value is sample-backed for a blank project"}
            if primary_auto is not None else {"present": False}
        ),
        "content_endpoint_contract": {
            "e1": "AFElement in models/primaryModel/spd/actions/pd",
            "e2": "AIElement in models/ConceptModel/cs/elemets/pk",
            "link_type": 4,
            "evidence": "IS.exe reader and MAIWmodels AEContentLink constructor",
        },
        "spz_link_endpoint_contract": {
            "e1_e2_e3": "AIElement in models/ConceptModel/spz/elemets/AElement",
            "evidence": "IS.exe ConceptModel/spz link reader; typed AIEBinaryLink slots",
        },
        "runtime_risk_notes": runtime_risk_notes,
        "undo_redo_storage": "memory-only; not serialized into .is2",
        "original_is2_runtime_acceptance": "NOT_TESTED",
        "runtime_note": (
            "Для подтверждения необходимо запустить оригинальную IS.exe в Windows "
            "и проверить, что она открывает файл, сохранённый PzKpfw, а PzKpfw "
            "открывает файл, сохранённый IS-2."
        ),
    }
