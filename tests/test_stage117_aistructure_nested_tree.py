import json
import os
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def find_original(*parts: str) -> Path | None:
    candidates = []
    configured = os.environ.get("IS2_ORIGINAL_DIR")
    if configured:
        candidates.append(Path(configured) / Path(*parts))
    candidates.extend([
        ROOT.parent / "original" / Path(*parts),
        Path("/mnt/data/work_stage117/original") / Path(*parts),
    ])
    return next((candidate for candidate in candidates if candidate.is_file()), None)


def test_aistructure_nested_tree_audit_uses_binary_or_published_static_snapshot(tmp_path):
    original = find_original("MAIWmodels.dll")
    if original is not None:
        output = tmp_path / "nested_tree.json"
        proc = subprocess.run(
            [sys.executable, str(ROOT / "tools/audit_stage117_aistructure_nested_tree.py"),
             str(original), "--out", str(output)],
            capture_output=True, text=True)
        assert proc.returncode == 0, proc.stdout + proc.stderr
        report = json.loads(output.read_text(encoding="utf-8"))
    else:
        # The public source release intentionally contains no original DLL.
        # Validate the checked-in static-analysis evidence snapshot instead.
        snapshot = ROOT / "analysis/pm_params/aistructure_nested_tree_topology.json"
        report = json.loads(snapshot.read_text(encoding="utf-8"))

    assert report['checks_passed'] == 38
    assert report['checks_total'] == 38
    assert report['static_only'] is True
    top = report['confirmed_topology']
    assert top['outer_tree_handle'].startswith('inline 8-byte TreeHandle32 at AIStructurePrivate+0x04')
    assert top['outer_TreeHandle32']['+0x00'].startswith('pointer to the separately allocated 0x1c-byte')
    assert top['outer_TreeHandle32']['+0x04'] == 'outer tree node_count DWORD (incremented on insert, decremented on erase)'
    assert top['outer_node_payload']['+0x14..+0x1b'].startswith('inline 8-byte TreeHandle32')
    assert top['TreeHandle32']['+0x00'].startswith('pointer to a separately allocated 0x18-byte')
    assert top['TreeHandle32']['+0x04'] == 'nested tree node_count DWORD (incremented on insert, decremented on erase)'
    assert top['nested_tree_header_size'] == '0x18 bytes'
    assert top['nested_tree_node_size'] == '0x18 bytes'
    assert 'node_count' in report['behavior']['TreeHandle32_clone']
    assert 'size/count' not in report['behavior']['TreeHandle32_clone']
    checks = report['checks']
    assert checks['outer_insert_increments_handle_node_count'] is True
    assert checks['nested_insert_increments_handle_node_count'] is True
    assert checks['outer_erase_decrements_handle_node_count'] is True
    assert checks['nested_erase_decrements_handle_node_count'] is True
    assert 'not a standalone raw pointer' in report['correction']
    assert 'node-local vector' in report['correction']
    assert any('semantic' in gap.lower() for gap in report['unknowns'])
