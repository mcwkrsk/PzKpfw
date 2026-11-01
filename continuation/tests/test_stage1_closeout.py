import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PROJECT = ROOT.parent

def read_json(rel):
    return json.loads((ROOT / rel).read_text(encoding="utf-8"))

def assert_audit(rel, passed, total):
    data = read_json(rel)
    got_passed = data.get("passed", data.get("checks_passed"))
    got_total = data.get("total", data.get("checks_total"))
    assert data.get("status", "PASS") == "PASS"
    assert got_passed == passed
    assert got_total == total

def test_stage_one_is_formally_closed_with_scope_boundary():
    report = (ROOT / "docs/51_stage1_closeout_2026-11-01.md").read_text(encoding="utf-8")
    readme = (ROOT / "README.md").read_text(encoding="utf-8")
    assert "**STAGE 1: CLOSED.**" in report
    assert "Stage 2" in report and "Windows" in report and "round-trip" in report
    assert "Status: STAGE 1 CLOSED" in readme

def test_key_sha_pinned_audits_match_closeout_values():
    assert_audit("analysis/plugins/plugin_shutdown_audit.json", 33, 33)
    assert_audit("analysis/host_interface/widget_parent_ownership.json", 31, 31)
    assert_audit("analysis/host_interface/concrete_widget_lifecycle.json", 49, 49)
    assert_audit("analysis/project_writer/conceptmodel_tree_audit.json", 42, 42)
    assert_audit("analysis/project_writer/project_writer_audit.json", 21, 21)
    assert_audit("analysis/concept_structure/concept_structure_audit_result.json", 26, 26)
    assert_audit("analysis/pm_params/aistructure_nested_tree_topology.json", 38, 38)
    assert_audit("analysis/pm_params/post_erase_ownership.json", 30, 30)

def test_seven_source_pe_files_are_hash_pinned_and_present():
    manifest = read_json("analysis/hashes/stage1_closeout_binary_manifest.json")
    assert manifest["binary_count"] == 7
    assert len(manifest["files"]) == 7
    for item in manifest["files"]:
        path = PROJECT / item["path"]
        assert path.is_file()
        assert path.stat().st_size == item["size_bytes"]
        assert hashlib.sha256(path.read_bytes()).hexdigest() == item["sha256"]

def test_runtime_and_legal_unknowns_are_explicitly_transferred():
    report = (ROOT / "docs/51_stage1_closeout_2026-11-01.md").read_text(encoding="utf-8")
    for token in ["S2-RUN-01", "S2-RUN-03", "S2-FMT-01", "S2-MEM-01", "Legal/release gate"]:
        assert token in report
    known = (ROOT / "docs/known_unknowns.md").read_text(encoding="utf-8")
    assert "не является причиной держать стадию открытой" in known
