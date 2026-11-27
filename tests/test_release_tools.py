"""Release tooling: staging of program files, deterministic archives, module packing."""
import importlib.util
import json
import sys
import tempfile
import unittest
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def _load(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


build_release = _load("build_release", ROOT / "installer" / "build_release.py")
pack_module = _load("pack_module", ROOT / "tools" / "pack_module.py")


class ReleaseToolTests(unittest.TestCase):
    def test_version_matches_package(self):
        from is2_re import __version__
        self.assertEqual(build_release.app_version(), __version__)

    def test_stage_contains_launcher_and_marker(self):
        with tempfile.TemporaryDirectory() as folder:
            stage = Path(folder) / "stage"
            build_release.stage_program(stage, "1.2.3", "rt-1")
            for name in ("pzkpfw.pyw", "pzkpfw.ico", "LICENSE.txt", "app/is2_re/gui.py", "app/is2_re/locales/en/messages.json"):
                self.assertTrue((stage / name).is_file(), name)
            self.assertEqual(json.loads((stage / "pzkpfw-install.json").read_text()), {"version": "1.2.3", "runtime": "rt-1"})
            self.assertFalse(list(stage.rglob("__pycache__")))

    def test_zip_is_deterministic(self):
        with tempfile.TemporaryDirectory() as folder:
            source = Path(folder) / "src"
            (source / "a").mkdir(parents=True)
            (source / "a" / "x.txt").write_text("x")
            (source / "b.txt").write_text("b")
            first, second = Path(folder) / "1.zip", Path(folder) / "2.zip"
            build_release.zip_dir(source, first)
            (source / "b.txt").touch()
            build_release.zip_dir(source, second)
            self.assertEqual(first.read_bytes(), second.read_bytes())
            self.assertEqual(zipfile.ZipFile(first).namelist(), ["a/x.txt", "b.txt"])

    def test_example_module_packs_into_a_valid_catalogue_entry(self):
        from is2_re import modules
        with tempfile.TemporaryDirectory() as folder:
            archive, entry = pack_module.pack(ROOT / "modules" / "example", Path(folder))
            entry["url"] = "https://example.org/" + archive.name
            [parsed] = modules.parse_catalogue({"modules": [entry]})
            self.assertEqual(parsed.manifest.id, "hello-example")
            installed = modules.install_archive(archive, Path(folder) / "installed")
            self.assertEqual(installed.version, entry["version"])

    def test_catalogue_in_repository_is_valid(self):
        from is2_re import modules
        data = json.loads((ROOT / "modules" / "index.json").read_text(encoding="utf-8"))
        self.assertEqual(len(modules.parse_catalogue(data)), len(data["modules"]))


if __name__ == "__main__":
    unittest.main()
