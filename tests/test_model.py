from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))
from is2_re import load_project, ProjectFormatError
import pytest

FIXTURE = Path(__file__).parent / "fixtures" / "minimal.is2"

def test_load_summary_and_links():
    p = load_project(FIXTURE)
    assert p.name == "fixture"
    assert len(p.actions) == 2
    assert len(p.links) == 2
    assert p.actions[1].alternatives == ("demo",)
    assert p.validate() == []

def test_unknown_or_malformed_root(tmp_path):
    f = tmp_path / "bad.is2"
    f.write_text("<wrong/>", encoding="utf-8")
    with pytest.raises(ProjectFormatError):
        load_project(f)

def test_missing_link_target_is_reported(tmp_path):
    f = tmp_path / "badref.is2"
    f.write_text(FIXTURE.read_text(encoding="utf-8").replace('afe2="2"', 'afe2="404"', 1), encoding="utf-8")
    p = load_project(f)
    assert any("404" in issue for issue in p.validate())
