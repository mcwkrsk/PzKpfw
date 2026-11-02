import importlib.util
import json
from pathlib import Path
import pytest

ROOT = Path(__file__).resolve().parents[1]
TOOL = ROOT / "tools" / "audit_pm_auto_typed_connections.py"
SPEC = importlib.util.spec_from_file_location("audit_pm_auto_typed_connections", TOOL)
AUDIT = importlib.util.module_from_spec(SPEC)
assert SPEC and SPEC.loader
SPEC.loader.exec_module(AUDIT)


def test_connect_impl_instruction_parser_counts_exact_iat_calls():
    synthetic = "\n".join([
        "10001000:\tff 15 68 23 02 10\tcall DWORD PTR ds:0x10022368",
        "10001006:\t90\tnop",
        "10001007:\tff 15 68 23 02 10\tcall DWORD PTR ds:0x10022368",
    ])
    assert AUDIT.connect_impl_calls(synthetic) == ["0x10001000", "0x10001007"]


def test_stage22_inventory_snapshot():
    data = json.loads((ROOT / "analysis/plugins/pm_auto_typed_connections.json").read_text(encoding="utf-8"))
    assert data["binary"] == "PM_auto.dll"
    assert data["sha256"] == AUDIT.EXPECTED_SHA256
    assert data["connectImpl_static_callsite_count"] == 17
    assert len(data["connectImpl_static_call_sites"]) == 17
    assert len(data["logical_connections"]) == 26
    ids = {item["id"] for item in data["logical_connections"]}
    assert "functionalDiagram.itemDraged" in ids
    assert "decomposition.formalization_combo" in ids
    assert "cbWithBtnContainer.button_clicked" in ids
    assert "ownerWidget.textChanged_forwarder" in ids
    assert data["runtime_validation"] is False


def test_tsv_and_disassembly_artifacts_exist():
    tsv = ROOT / "analysis/plugins/pm_auto_typed_connections.tsv"
    asm = ROOT / "analysis/disassembly/pm_auto_typed_connections.asm"
    doc = ROOT / "docs/18_pm_auto_typed_connections.md"
    assert tsv.is_file() and tsv.stat().st_size > 1000
    assert asm.is_file() and asm.stat().st_size > 10000
    assert doc.is_file() and "static" in doc.read_text(encoding="utf-8").lower()


def test_audit_rejects_unrecognised_binary_before_disassembly(tmp_path):
    fake = tmp_path / "not_the_supplied_PM_auto.dll"
    fake.write_bytes(b"not a PE image")
    with pytest.raises(ValueError, match="SHA-256 mismatch"):
        AUDIT.audit(fake)
