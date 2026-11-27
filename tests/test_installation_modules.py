"""Updates and modules without network: parsing, checksums, safe unpacking, loading."""
import hashlib
import json
import os
import sys
import tempfile
import unittest
import zipfile
from pathlib import Path
from unittest import mock

from is2_re import __version__, installation, modules


def _module_zip(folder, ident="demo-mod", package="demo_mod", version="1.0.0", body=None, extra=None, manifest=None):
    path = Path(folder) / f"{ident}-{version}.zip"
    data = manifest or {"id": ident, "name": "Demo", "version": version, "entry": f"{package}:register",
                        "min_app_version": __version__, "description": "test"}
    with zipfile.ZipFile(path, "w") as archive:
        archive.writestr("module.json", json.dumps(data))
        archive.writestr(f"{package}/__init__.py", body or
                         "def register(api):\n    api.add_menu_command('Demo command', lambda: None)\n")
        for name, content in (extra or {}).items():
            archive.writestr(name, content)
    return path


class VersionAndReleaseTests(unittest.TestCase):
    def test_versions(self):
        self.assertEqual(installation.parse_version("v9.10.0"), (9, 10, 0))
        self.assertTrue(installation.is_newer("9.10.1", "9.10.0"))
        self.assertTrue(installation.is_newer("9.10.0", "9.9.1"))
        self.assertFalse(installation.is_newer("9.10", "9.10.0"))
        self.assertFalse(installation.is_newer("9.11.0-beta", "9.11.0"))
        self.assertTrue(installation.is_newer("9.11.0", "9.11.0-beta"))
        self.assertTrue(installation.is_newer("9.11.0-beta", "9.10.0"))
        self.assertFalse(installation.is_newer("garbage", "1.0"))

    def test_parse_release_picks_installer_and_checksums(self):
        payload = {"tag_name": "v9.11.0", "html_url": "https://github.com/x/y/releases/tag/v9.11.0", "body": "notes",
                   "assets": [{"name": "PzKpfw-Setup-9.11.0.exe", "browser_download_url": "https://example.org/s.exe", "size": 5},
                              {"name": "SHA256SUMS.txt", "browser_download_url": "https://example.org/sums", "size": 1},
                              {"name": "PzKpfw-Setup-evil.exe", "browser_download_url": "http://insecure/x.exe"}]}
        release = installation.parse_release(payload)
        self.assertEqual((release.version, release.installer.name, release.checksums.name),
                         ("9.11.0", "PzKpfw-Setup-9.11.0.exe", "SHA256SUMS.txt"))
        self.assertTrue(release.newer)
        with self.assertRaises(installation.InstallationError):
            installation.parse_release(dict(payload, prerelease=True))

    def test_checksum_file_format(self):
        sha = "a" * 64
        self.assertEqual(installation.parse_checksums(f"{sha}  PzKpfw-Setup-1.exe\n{sha} *runtime.zip\nnoise"),
                         {"PzKpfw-Setup-1.exe": sha, "runtime.zip": sha})

    def test_download_verifies_checksum(self):
        payload = b"x" * 1000

        class Response:
            headers = {"Content-Length": str(len(payload))}
            def __init__(self): self._data = payload
            def read(self, n): chunk, self._data = self._data[:n], self._data[n:]; return chunk
            def __enter__(self): return self
            def __exit__(self, *a): return False

        with tempfile.TemporaryDirectory() as folder, mock.patch.object(installation, "_open", lambda url: Response()):
            target = Path(folder) / "file.bin"
            good = hashlib.sha256(payload).hexdigest()
            self.assertEqual(installation.download("https://e/x", target, good).read_bytes(), payload)
            target.unlink()
            with self.assertRaises(installation.InstallationError):
                installation.download("https://e/x", target, "0" * 64)
            self.assertFalse(target.exists())
            self.assertEqual(list(Path(folder).iterdir()), [])
            with self.assertRaises(installation.InstallationError):
                installation.download("http://e/x", target, good)

    def test_install_dir_requires_marker(self):
        with tempfile.TemporaryDirectory() as folder:
            with mock.patch.dict(os.environ, {"PZKPFW_INSTALL_DIR": folder}):
                self.assertIsNone(installation.install_dir())
                (Path(folder) / "pzkpfw-install.json").write_text("{}")
                self.assertEqual(installation.install_dir(), Path(folder))

    def test_automatic_check_only_in_installed_copy_and_once_a_day(self):
        with tempfile.TemporaryDirectory() as folder, mock.patch.object(installation, "data_dir", lambda: Path(folder)):
            with mock.patch.object(installation, "is_installed_copy", lambda: False):
                self.assertFalse(installation.automatic_check_due())
            with mock.patch.object(installation, "is_installed_copy", lambda: True):
                self.assertTrue(installation.automatic_check_due(now=10 ** 6))
                installation.save_update_settings(last_check=10 ** 6)
                self.assertFalse(installation.automatic_check_due(now=10 ** 6 + 3600))
                self.assertTrue(installation.automatic_check_due(now=10 ** 6 + 86400))
                installation.save_update_settings(automatic=False)
                self.assertFalse(installation.automatic_check_due(now=10 ** 9))

    def test_silent_installer_command(self):
        self.assertEqual(installation.installer_command(Path("s.exe"))[1:3], ["/SILENT", "/SUPPRESSMSGBOXES"])


class ModuleTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.root = Path(self.tmp.name) / "modules"
        self._path = list(sys.path)

    def tearDown(self):
        sys.path[:] = self._path
        for name in [n for n in sys.modules if n.startswith("demo_mod") or n.startswith("other_mod")]:
            del sys.modules[name]
        self.tmp.cleanup()

    def test_manifest_validation(self):
        good = {"id": "x-mod", "name": "X", "version": "1.0", "entry": "x_mod:register"}
        self.assertEqual(modules.parse_manifest(good).package, "x_mod")
        for bad in (dict(good, id="Bad Id"), dict(good, entry="x-mod"), dict(good, version="abc"),
                    dict(good, requirements=["--index-url=http://evil"]), dict(good, name="")):
            with self.assertRaises(modules.ModuleError):
                modules.parse_manifest(bad)
        self.assertFalse(modules.parse_manifest(dict(good, min_app_version="999")).compatible)

    def test_catalogue_skips_broken_entries(self):
        sha = "b" * 64
        data = {"modules": [
            {"id": "a-mod", "name": "A", "version": "1.0", "entry": "a:register", "url": "https://e/a.zip", "sha256": sha},
            {"id": "b-mod", "name": "B", "version": "1.0", "entry": "b:register", "url": "http://e/b.zip", "sha256": sha},
            {"id": "c-mod", "name": "C", "version": "1.0", "entry": "c:register", "url": "https://e/c.zip", "sha256": "short"},
            {"id": "a-mod", "name": "A2", "version": "2.0", "entry": "a:register", "url": "https://e/a2.zip", "sha256": sha},
            "garbage"]}
        self.assertEqual([e.manifest.id for e in modules.parse_catalogue(data)], ["a-mod"])

    def test_install_load_disable_update_remove(self):
        archive = _module_zip(self.tmp.name)
        manifest = modules.install_archive(archive, self.root)
        self.assertEqual(manifest.id, "demo-mod")
        installed = modules.installed_modules(self.root)
        self.assertEqual([(m.manifest.id, m.enabled, m.error) for m in installed], [("demo-mod", True, "")])

        host = mock.Mock()
        modules.load_modules(host, installed)
        self.assertTrue(installed[0].loaded, installed[0].error)
        host.module_command_added.assert_called_once()
        self.assertEqual(installed[0].commands[0][0], "Demo command")

        modules.set_enabled("demo-mod", False, self.root)
        self.assertFalse(modules.installed_modules(self.root)[0].enabled)
        modules.set_enabled("demo-mod", True, self.root)

        newer = _module_zip(self.tmp.name, version="1.1.0")
        entry = modules.CatalogueEntry(modules.parse_manifest(json.loads(zipfile.ZipFile(newer).read("module.json"))), "https://e/x", "c" * 64)
        self.assertIn("demo-mod", modules.available_updates(modules.installed_modules(self.root), [entry]))
        modules.install_archive(newer, self.root)
        self.assertEqual(modules.installed_modules(self.root)[0].manifest.version, "1.1.0")
        self.assertEqual(sorted(p.name for p in self.root.iterdir()), ["demo-mod", "state.json"])

        modules.uninstall("demo-mod", self.root)
        self.assertEqual(modules.installed_modules(self.root), [])

    def test_unsafe_archives_are_rejected_and_leave_nothing(self):
        cases = [
            _module_zip(self.tmp.name, ident="slip-mod", extra={"../escape.py": "x"}),
            _module_zip(self.tmp.name, ident="abs-mod", extra={"/etc/x": "x"}),
            _module_zip(self.tmp.name, ident="old-mod", manifest={"id": "old-mod", "name": "Old", "version": "1",
                                                                   "entry": "demo_mod:register", "min_app_version": "999"}),
        ]
        for archive in cases:
            with self.assertRaises(modules.ModuleError):
                modules.install_archive(archive, self.root)
        self.assertFalse((Path(self.tmp.name) / "escape.py").exists())
        self.assertEqual([p.name for p in self.root.iterdir()], [])
        with self.assertRaises(modules.ModuleError):
            modules.install_archive(_module_zip(self.tmp.name), self.root, expected_id="other-id")

    def test_broken_module_does_not_stop_others(self):
        modules.install_archive(_module_zip(self.tmp.name, ident="aaa-mod", package="other_mod_a",
                                            body="def register(api):\n    raise RuntimeError('boom')\n"), self.root)
        modules.install_archive(_module_zip(self.tmp.name), self.root)
        loaded = modules.load_modules(mock.Mock(), modules.installed_modules(self.root))
        state = {m.manifest.id: (m.loaded, m.error) for m in loaded}
        self.assertEqual(state["demo-mod"], (True, ""))
        self.assertIn("boom", state["aaa-mod"][1])

    def test_package_name_clash_is_reported(self):
        modules.install_archive(_module_zip(self.tmp.name, ident="aaa-mod", package="json"), self.root)
        loaded = modules.load_modules(mock.Mock(), modules.installed_modules(self.root))
        self.assertIn("already used", loaded[0].error)

    def test_api_apply_change_goes_through_host(self):
        host = mock.Mock()
        api = modules.ModuleAPI(host, modules.InstalledModule(modules.parse_manifest(
            {"id": "x-mod", "name": "X", "version": "1", "entry": "x:register"}), self.root))
        change = lambda doc: None
        api.apply_change("msg", change)
        host.module_apply_change.assert_called_once_with("msg", change)
        self.assertEqual(api.app_version, __version__)


if __name__ == "__main__":
    unittest.main()
