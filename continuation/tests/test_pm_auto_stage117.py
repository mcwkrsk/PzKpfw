import json
from pathlib import Path


def test_stage117_nested_diagram_lifecycle_snapshot():
    root = Path(__file__).resolve().parents[1]
    data = json.loads((root / "analysis/pm_auto/stage117_audit.json").read_text(encoding="utf-8"))
    assert data["status"] == "passed_static_audit"
    assert all(data["checks"].values())
    assert data["diagram_block"]["allocation_size_bytes"] == "0x278"
    assert data["diagram_block"]["destroy_helper"] == "0x10018380"
    assert data["nested_delete"]["calls_destroy_helper_at"] == "0x1000a252"


def test_stage117_enum_and_link_mappings_are_scoped():
    root = Path(__file__).resolve().parents[1]
    data = json.loads((root / "analysis/pm_auto/stage117_audit.json").read_text(encoding="utf-8"))
    enums = data["enum_correlations"]
    assert enums["action_type"]["2"] == "sequence"
    assert enums["status"]["0"] == "elementary"
    assert enums["formalization"]["0"] == "analytical"
    assert enums["formalization"]["2"] == "algorithmic"
    assert enums["formalization"]["other"] == "unresolved"
    links = data["link_type_correlation"]
    assert links["internal_type_2"] == "AFStructure::addCompositionLink"
    assert links["internal_type_3"] == "AFStructure::addArragmentLink"
    assert links["xml_mapping_confidence"].startswith("high")
