import json
import os
import subprocess
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[1]


def test_post_erase_ownership_audit_uses_binary_or_published_static_snapshot(tmp_path):
    configured = os.environ.get("IS2_ORIGINAL_DIR")
    candidates = [Path(configured)] if configured else []
    candidates.extend([ROOT.parent / "original", Path("/mnt/data/work_stage117/original")])
    original = next((p for p in candidates if (p / "MAIWmodels.dll").is_file()), None)
    if original is not None:
        pm_params = original / "modules" / "PM_params.dll"
        if not pm_params.is_file():
            pm_params = original / "PM_params.dll"
        if pm_params.is_file():
            out = tmp_path / 'post_erase_ownership.json'
            proc = subprocess.run([
                sys.executable,
                str(ROOT / 'tools/audit_stage117_post_erase_ownership.py'),
                str(pm_params),
                str(original / 'MAIWmodels.dll'),
                '--out', str(out),
            ], text=True, capture_output=True)
            assert proc.returncode == 0, proc.stdout + proc.stderr
            result = json.loads(out.read_text(encoding='utf-8'))
        else:
            result = json.loads((ROOT / "analysis/pm_params/post_erase_ownership.json").read_text(encoding="utf-8"))
    else:
        # No original DLLs are distributed. Validate the published analysis
        # snapshot to keep the public source test suite self-contained.
        result = json.loads((ROOT / "analysis/pm_params/post_erase_ownership.json").read_text(encoding="utf-8"))
    assert result['checks_total'] == 30
    assert result['checks_passed'] == 30
    assert result['static_only'] is True
    assert 'not a proven runtime leak' in result['conclusion']
