"""Installable PzKpfw modules: manifest, catalogue, install/remove and loading.

A module is a ZIP archive with ``module.json`` at its root and a Python
package next to it::

    module.json
    course_rules/__init__.py      # defines register(api)

``module.json``::

    {"id": "course-rules", "name": "Проверка по правилам курса",
     "version": "1.0.0", "min_app_version": "1.0.0",
     "entry": "course_rules:register", "description": "...", "author": "...",
     "requirements": []}

Modules run Python code with the user's rights, so the GUI installs only
archives whose SHA-256 is listed in the catalogue (``modules/index.json`` in
the repository). Nothing here imports Tk.
"""
from __future__ import annotations

import importlib
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import zipfile
from dataclasses import dataclass, field
from pathlib import Path, PurePosixPath

from . import __version__
from .installation import InstallationError, data_dir, download, fetch_json, is_newer, parse_version

CATALOGUE_URL = "https://raw.githubusercontent.com/mcwkrsk/PzKpfw/master/modules/index.json"
MANIFEST = "module.json"
ID_RE = re.compile(r"^[a-z][a-z0-9-]{1,63}$")
PACKAGE_RE = re.compile(r"^[A-Za-z_][A-Za-z0-9_]*$")
MAX_ARCHIVE_FILES = 5000
MAX_ARCHIVE_BYTES = 200 * 1024 * 1024


class ModuleError(InstallationError):
    """A module manifest, archive or loading problem."""


@dataclass(frozen=True)
class ModuleManifest:
    id: str
    name: str
    version: str
    entry: str
    min_app_version: str = "0"
    description: str = ""
    author: str = ""
    requirements: tuple[str, ...] = ()

    @property
    def package(self) -> str:
        return self.entry.split(":", 1)[0]

    @property
    def function(self) -> str:
        return self.entry.split(":", 1)[1]

    @property
    def compatible(self) -> bool:
        return not is_newer(self.min_app_version, __version__)


def parse_manifest(data) -> ModuleManifest:
    if not isinstance(data, dict):
        raise ModuleError("module.json must contain an object")
    ident = str(data.get("id", ""))
    if not ID_RE.match(ident):
        raise ModuleError(f"bad module id {ident!r}: use lowercase letters, digits and '-'")
    name = str(data.get("name") or "").strip()
    if not name:
        raise ModuleError(f"{ident}: name is required")
    version = str(data.get("version", ""))
    min_app = str(data.get("min_app_version", "0"))
    for label, value in (("version", version), ("min_app_version", min_app)):
        try:
            parse_version(value)
        except ValueError as exc:
            raise ModuleError(f"{ident}: bad {label} {value!r}") from exc
    entry = str(data.get("entry", ""))
    package, _, function = entry.partition(":")
    if not (PACKAGE_RE.match(package) and PACKAGE_RE.match(function)):
        raise ModuleError(f"{ident}: entry must look like 'package:function'")
    requirements = data.get("requirements") or []
    if not isinstance(requirements, list) or not all(isinstance(r, str) and r.strip() and not r.strip().startswith("-") for r in requirements):
        raise ModuleError(f"{ident}: requirements must be a list of package names")
    return ModuleManifest(ident, name, version, entry, min_app, str(data.get("description") or ""),
                          str(data.get("author") or ""), tuple(r.strip() for r in requirements))


@dataclass(frozen=True)
class CatalogueEntry:
    manifest: ModuleManifest
    url: str
    sha256: str
    size: int = 0
    homepage: str = ""


def parse_catalogue(data) -> list[CatalogueEntry]:
    """index.json -> entries. A broken entry is skipped, not fatal."""
    items = data.get("modules") if isinstance(data, dict) else None
    if not isinstance(items, list):
        raise ModuleError("catalogue has no 'modules' list")
    entries, seen = [], set()
    for item in items:
        try:
            manifest = parse_manifest(item)
            url, sha = str(item.get("url", "")), str(item.get("sha256", "")).lower()
            if not url.startswith("https://") or not re.fullmatch(r"[0-9a-f]{64}", sha):
                continue
        except (ModuleError, AttributeError):
            continue
        if manifest.id in seen:
            continue
        seen.add(manifest.id)
        entries.append(CatalogueEntry(manifest, url, sha, int(item.get("size") or 0), str(item.get("homepage") or "")))
    return entries


def fetch_catalogue(url: str = CATALOGUE_URL) -> list[CatalogueEntry]:
    return parse_catalogue(fetch_json(url))


# ---- installed modules ------------------------------------------------------

def modules_dir() -> Path:
    return data_dir() / "modules"


def _state_path(root: Path) -> Path:
    return root / "state.json"


def _load_state(root: Path) -> dict:
    try:
        value = json.loads(_state_path(root).read_text(encoding="utf-8"))
        return value if isinstance(value, dict) else {}
    except (OSError, ValueError):
        return {}


def _save_state(root: Path, state: dict) -> None:
    root.mkdir(parents=True, exist_ok=True)
    tmp = _state_path(root).with_suffix(".tmp")
    tmp.write_text(json.dumps(state, ensure_ascii=False, indent=1), encoding="utf-8")
    os.replace(tmp, _state_path(root))


@dataclass
class InstalledModule:
    manifest: ModuleManifest
    path: Path
    enabled: bool = True
    loaded: bool = False
    error: str = ""
    commands: list = field(default_factory=list)


def installed_modules(root: Path | None = None) -> list[InstalledModule]:
    root = modules_dir() if root is None else Path(root)
    disabled = set(_load_state(root).get("disabled", []))
    result = []
    if not root.is_dir():
        return result
    for folder in sorted(p for p in root.iterdir() if p.is_dir() and not p.name.startswith(".")):
        try:
            manifest = parse_manifest(json.loads((folder / MANIFEST).read_text(encoding="utf-8")))
        except (OSError, ValueError, ModuleError) as exc:
            result.append(InstalledModule(ModuleManifest(folder.name, folder.name, "0", "x:x"), folder, False, error=str(exc)))
            continue
        if manifest.id != folder.name:
            result.append(InstalledModule(manifest, folder, False, error="folder name differs from module id"))
            continue
        result.append(InstalledModule(manifest, folder, manifest.id not in disabled))
    return result


def set_enabled(module_id: str, enabled: bool, root: Path | None = None) -> None:
    root = modules_dir() if root is None else Path(root)
    state = _load_state(root)
    disabled = set(state.get("disabled", []))
    (disabled.discard if enabled else disabled.add)(module_id)
    state["disabled"] = sorted(disabled)
    _save_state(root, state)


def _safe_members(archive: zipfile.ZipFile) -> list[zipfile.ZipInfo]:
    """Reject absolute paths, '..', links and archive bombs."""
    members = archive.infolist()
    if len(members) > MAX_ARCHIVE_FILES:
        raise ModuleError("archive has too many files")
    if sum(m.file_size for m in members) > MAX_ARCHIVE_BYTES:
        raise ModuleError("archive is too large when unpacked")
    for member in members:
        name = member.filename.replace("\\", "/")
        path = PurePosixPath(name)
        if name.startswith("/") or re.match(r"^[A-Za-z]:", name) or ".." in path.parts:
            raise ModuleError(f"unsafe path in archive: {member.filename!r}")
        if (member.external_attr >> 16) & 0o170000 == 0o120000:
            raise ModuleError(f"links are not allowed in modules: {member.filename!r}")
    return members


def install_archive(archive_path: Path, root: Path | None = None, *, expected_id: str | None = None,
                    install_requirements: bool = True) -> ModuleManifest:
    """Unpack a verified module archive; replaces an older copy only on success."""
    root = modules_dir() if root is None else Path(root)
    root.mkdir(parents=True, exist_ok=True)
    staging = Path(tempfile.mkdtemp(prefix=".install-", dir=root))
    try:
        try:
            with zipfile.ZipFile(archive_path) as archive:
                members = _safe_members(archive)
                archive.extractall(staging, members)
        except zipfile.BadZipFile as exc:
            raise ModuleError("the module file is not a ZIP archive") from exc
        try:
            manifest = parse_manifest(json.loads((staging / MANIFEST).read_text(encoding="utf-8")))
        except (OSError, ValueError) as exc:
            raise ModuleError("module.json is missing or not JSON") from exc
        if expected_id is not None and manifest.id != expected_id:
            raise ModuleError(f"archive contains module {manifest.id!r}, expected {expected_id!r}")
        if not manifest.compatible:
            raise ModuleError(f"{manifest.id} needs PzKpfw {manifest.min_app_version} or newer")
        if not (staging / manifest.package / "__init__.py").is_file():
            raise ModuleError(f"package {manifest.package!r} is missing in the archive")
        if manifest.requirements and install_requirements:
            install_dependencies(manifest, staging)
        target = root / manifest.id
        backup = None
        if target.exists():
            backup = root / f".old-{manifest.id}"
            shutil.rmtree(backup, ignore_errors=True)
            os.replace(target, backup)
        try:
            os.replace(staging, target)
        except OSError:
            if backup is not None:
                os.replace(backup, target)
            raise
        if backup is not None:
            shutil.rmtree(backup, ignore_errors=True)
        return manifest
    finally:
        shutil.rmtree(staging, ignore_errors=True)


def install_dependencies(manifest: ModuleManifest, folder: Path) -> None:
    """pip-install the module's own requirements into <module>/deps."""
    command = [sys.executable, "-m", "pip", "install", "--disable-pip-version-check", "--no-input",
               "--only-binary=:all:", "--target", str(folder / "deps"), *manifest.requirements]
    kwargs = {"capture_output": True, "text": True, "timeout": 900}
    if sys.platform == "win32":
        kwargs["creationflags"] = getattr(subprocess, "CREATE_NO_WINDOW", 0)
    try:
        completed = subprocess.run(command, **kwargs)
    except (OSError, subprocess.SubprocessError) as exc:
        raise ModuleError(f"{manifest.id}: dependencies were not installed: {exc}") from exc
    if completed.returncode:
        tail = (completed.stderr or completed.stdout or "").strip().splitlines()[-5:]
        raise ModuleError(f"{manifest.id}: dependencies were not installed:\n" + "\n".join(tail))


def install_from_catalogue(entry: CatalogueEntry, root: Path | None = None, progress=None, cancelled=None) -> ModuleManifest:
    folder = Path(tempfile.mkdtemp(prefix="pzkpfw-module-"))
    try:
        archive = download(entry.url, folder / f"{entry.manifest.id}.zip", entry.sha256, progress, cancelled)
        return install_archive(archive, root, expected_id=entry.manifest.id)
    finally:
        shutil.rmtree(folder, ignore_errors=True)


def uninstall(module_id: str, root: Path | None = None) -> None:
    if not ID_RE.match(module_id):
        raise ModuleError(f"bad module id {module_id!r}")
    root = modules_dir() if root is None else Path(root)
    target = root / module_id
    if target.is_dir():
        shutil.rmtree(target)
    set_enabled(module_id, True, root)


def available_updates(installed: list[InstalledModule], catalogue: list[CatalogueEntry]) -> dict[str, CatalogueEntry]:
    current = {m.manifest.id: m.manifest.version for m in installed if not m.error}
    return {e.manifest.id: e for e in catalogue
            if e.manifest.id in current and is_newer(e.manifest.version, current[e.manifest.id]) and e.manifest.compatible}


# ---- loading ----------------------------------------------------------------

class ModuleAPI:
    """What a module's register(api) receives. Kept small on purpose."""

    def __init__(self, host, module: InstalledModule):
        self._host = host
        self._module = module
        self.module_id = module.manifest.id
        self.app_version = __version__

    @property
    def data_dir(self) -> Path:
        """Writable folder for the module's own settings and caches."""
        path = data_dir() / "module-data" / self.module_id
        path.mkdir(parents=True, exist_ok=True)
        return path

    def add_menu_command(self, label: str, callback) -> None:
        """Add an item to the «Модули» menu; errors in callback are reported, not raised."""
        self._module.commands.append((str(label), callback))
        self._host.module_command_added(self._module, str(label), callback)

    def document(self):
        """The open ProjectDocument, or None. Change it only through apply_change()."""
        return self._host.module_document()

    def project_path(self):
        return self._host.module_project_path()

    def apply_change(self, message: str, change) -> None:
        """Run change(document) as one undoable edit and refresh the views."""
        self._host.module_apply_change(str(message), change)

    def show_text(self, title: str, text: str) -> None:
        self._host.module_show_text(str(title), str(text))

    def tr(self, message: str) -> str:
        from .i18n import tr
        return tr(message)


def load_modules(host, modules: list[InstalledModule]) -> list[InstalledModule]:
    """Import enabled, compatible modules and call their register(api).

    A failing module is marked with its error; it never stops the program.
    """
    used_packages = {}
    for module in modules:
        if module.error or not module.enabled or module.loaded:
            continue
        manifest = module.manifest
        if not manifest.compatible:
            module.error = f"needs PzKpfw {manifest.min_app_version} or newer"
            continue
        existing = sys.modules.get(manifest.package)
        foreign = existing is not None and not str(getattr(existing, "__file__", "") or "").startswith(str(module.path))
        if manifest.package in used_packages or foreign:
            module.error = f"package name {manifest.package!r} is already used"
            continue
        for extra in (module.path / "deps", module.path):
            if extra.is_dir() and str(extra) not in sys.path:
                sys.path.insert(0, str(extra))
        try:
            package = importlib.import_module(manifest.package)
            register = getattr(package, manifest.function)
            register(ModuleAPI(host, module))
        except Exception as exc:  # a module must not break the editor
            module.error = f"{type(exc).__name__}: {exc}"
            continue
        used_packages[manifest.package] = manifest.id
        module.loaded = True
    return modules
