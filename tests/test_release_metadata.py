from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

import is2_re


def test_release_version_is_consistent_across_source_metadata():
    pyproject = (ROOT / "pyproject.toml").read_text(encoding="utf-8")
    assert is2_re.__version__ == "0.7.9"
    assert 'version = "0.7.9"' in pyproject
    assert (ROOT / "VERSION.txt").read_text(encoding="utf-8").startswith("PzKpfw Desktop Alpha 0.7.9")
    assert '"version": "0.7.9"' in (ROOT / "SBOM.json").read_text(encoding="utf-8")
    assert "version: 0.7.9" in (ROOT / "CITATION.cff").read_text(encoding="utf-8")


def test_source_release_has_license_notices_and_reproducible_build_scripts():
    required = (
        "LICENSE", "NOTICE", "THIRD_PARTY_NOTICES.md", "RESEARCH_MATERIALS_NOTICE.md",
        "SBOM.json", "CITATION.cff", "tools/build_from_source.sh",
        "tools/build_from_source.ps1", "tools/package_source_release.py", "docs/build_from_source.md",
        "docs/windows_runtime_acceptance.md", ".github/workflows/ci.yml",
        "docs/graph_workspace.md", "docs/build_from_source.md", "docs/conceptmodel_editor.md",
        "docs/history.md", "docs/compatibility_075.md", "docs/licensing_scope.md",
        "docs/primarymodel_editor.md", "docs/editor_state.md", "docs/link_repair.md",
        "docs/backup_restore.md", "docs/project_diff_restore.md", "docs/three_way_merge.md",
        "docs/relationship_graph_diff.md", "tools/smoke_project_diff_gui.py", "tools/smoke_project_merge_gui.py",
        "release_reports/validation_0.7.9.md", "release_reports/validation_0.7.9.json",
        "release_reports/compatibility_0.7.9.json", "release_reports/open_source_release_audit_0.7.9.json",
        "release_reports/project_merge_cli_0.7.9.json", "release_reports/graph_diff_cli_0.7.9.json",
        "release_reports/gui_project_merge_smoke_0.7.9.txt",
    )
    assert all((ROOT / item).is_file() for item in required)
    assert (ROOT / "src/is2_re/gui.py").is_file()
    assert (ROOT / "src/is2_re/repair.py").is_file()
    assert (ROOT / "src/is2_re/backups.py").is_file()
    assert (ROOT / "src/is2_re/diff.py").is_file()
    assert (ROOT / "src/is2_re/merge.py").is_file()
    assert (ROOT / "src/is2_re/graph_diff.py").is_file()
    assert (ROOT / "tests/test_relationship_graph.py").is_file()
    assert (ROOT / "tests/test_cli_075.py").is_file()
    assert (ROOT / "tests/test_link_repair.py").is_file()
    assert (ROOT / "tests/test_backups.py").is_file()
    cli = (ROOT / "src/is2_re/cli.py").read_text(encoding="utf-8")
    assert 'add_parser("link-integrity"' in cli
    assert 'add_parser("repair-links"' in cli
    assert 'add_parser("backup"' in cli
    assert 'add_parser("list-backups"' in cli
    assert 'add_parser("restore-backup"' in cli
    assert 'add_parser("diff"' in cli
    assert 'add_parser("restore-diff"' in cli
    assert 'add_parser("merge"' in cli
    assert 'add_parser("graph-diff"' in cli
    gui = (ROOT / "src/is2_re/gui.py").read_text(encoding="utf-8")
    assert 'label="Сравнить с другой версией…"' in gui
    assert 'label="Сравнить графы связей…"' in gui
    assert 'label="Объединить три версии…"' in gui
    assert "def show_project_diff" in gui
    assert "def show_relationship_graph_diff" in gui
    assert "def show_three_way_merge" in gui
    assert "docs/project_diff_restore.md" in (ROOT / "README.md").read_text(encoding="utf-8")
    acceptance = (ROOT / "docs/windows_runtime_acceptance.md").read_text(encoding="utf-8")
    assert "PzKpfw 0.7.9" in acceptance
    assert "Test C — semantic diff and selective restoration" in acceptance
    assert "Test D — three-way merge and graph comparison" in acceptance


def test_public_source_packager_excludes_private_material_and_original_binaries():
    packager = (ROOT / "tools/package_source_release.py").read_text(encoding="utf-8")
    assert '"reference-private"' in packager
    for suffix in (".exe", ".dll", ".ocx", ".so", ".dylib"):
        assert f'"{suffix}"' in packager
    assert "PzKpfw_Desktop_Alpha_0.7.9" in packager
