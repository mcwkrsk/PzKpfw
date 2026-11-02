import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def test_native_sample_audit_snapshot_is_consistent():
    data = json.loads((ROOT / "analysis/kursach_native_sample_audit.json").read_text(encoding="utf-8"))
    assert data["sample"] == "kursach_.is2"
    assert data["sha256"] == "096c67d83f6459e24c914b4818a5b3509e3991e7441389aba1a69586d0d650d4"
    assert data["size_bytes"] == 13634
    primary = data["primary_model"]
    assert primary["spd_actions"] == 42
    assert primary["spd_links"] == 82
    assert primary["spd_link_type_counts"] == {"2": 41, "3": 41}
    assert primary["parameters"] == 10
    assert primary["objects"] == 2
    assert primary["type2_roots"] == [1]
    assert primary["type3_broken_chains"] == 0
    assert data["concept_model"]["cs_elemets_count"] == 0
    assert data["concept_model"]["cs_links_count"] == 0
    assert all(data["checks"].values())
