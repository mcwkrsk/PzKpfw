import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SNAPSHOT = ROOT / "analysis" / "host_interface" / "workwidget_interface.json"


def test_workwidget_vtable_snapshot_contract():
    data = json.loads(SNAPSHOT.read_text(encoding="utf-8"))
    assert data["static_only"] is True
    assert data["validation_errors"] == []
    assert len(data["binaries"]) == 6
    for binary in data["binaries"]:
        tables = binary["tables"]
        for cls, primary_count in (("WorkWidget", 52), ("MenuWidget", 46)):
            matching = [t for t in tables if t["class"] == cls]
            assert len(matching) == 2
            primary = next(t for t in matching if t["object_offset"] == 0)
            secondary = next(t for t in matching if t["object_offset"] == 8)
            assert primary["slot_count"] == primary_count
            assert secondary["slot_count"] == 7
        work = next(t for t in tables if t["class"] == "WorkWidget" and t["object_offset"] == 0)
        assert work["slots"][45]["byte_offset"] == 0xB4
        assert work["slots"][51]["byte_offset"] == 0xCC
