"""Installed-copy information, release lookup and verified downloads.

No Tk here: the GUI calls these functions from a worker thread and shows the
result on the Tk thread. Network access is used only when the user starts it
(menu command) or when automatic update checks are enabled in an installed copy.
"""
from __future__ import annotations

import hashlib
import json
import os
import re
import sys
import tempfile
import time
import urllib.request
from dataclasses import dataclass
from pathlib import Path

from . import __version__

GITHUB_REPOSITORY = "mcwkrsk/PzKpfw"
RELEASES_API = f"https://api.github.com/repos/{GITHUB_REPOSITORY}/releases/latest"
RELEASES_PAGE = f"https://github.com/{GITHUB_REPOSITORY}/releases"
INSTALLER_PREFIX = "PzKpfw-Setup-"
CHECKSUMS_ASSET = "SHA256SUMS.txt"
USER_AGENT = f"PzKpfw/{__version__}"
NETWORK_TIMEOUT = 15
UPDATE_CHECK_INTERVAL = 24 * 60 * 60
MAX_DOWNLOAD_BYTES = 512 * 1024 * 1024


class InstallationError(RuntimeError):
    """A release, download or checksum problem that should be shown to the user."""


def parse_version(text: str) -> tuple[int, ...]:
    """'v9.10.0' -> (9, 10, 0). Pre-release suffixes sort before the release."""
    match = re.match(r"^\s*v?(\d+(?:\.\d+)*)(.*)$", str(text or ""))
    if not match:
        raise ValueError(f"not a version: {text!r}")
    numbers = tuple(int(part) for part in match.group(1).split("."))
    while len(numbers) > 1 and numbers[-1] == 0:
        numbers = numbers[:-1]
    # Last element: 0 for a release, -1 for a pre-release such as 9.11.0-beta.
    return numbers + ((-1,) if match.group(2).strip(" -+") else (0,))


def is_newer(candidate: str, current: str = __version__) -> bool:
    try:
        return parse_version(candidate) > parse_version(current)
    except ValueError:
        return False


# ---- locations -------------------------------------------------------------

def install_dir() -> Path | None:
    """Folder of an installer-made copy, or None when run from sources / EXE build.

    The launcher sets PZKPFW_INSTALL_DIR; the marker file is written by the
    installer, so an unrelated environment variable is not enough.
    """
    value = os.environ.get("PZKPFW_INSTALL_DIR")
    if not value:
        return None
    path = Path(value)
    return path if (path / "pzkpfw-install.json").is_file() else None


def is_installed_copy() -> bool:
    return install_dir() is not None


def data_dir() -> Path:
    """Per-user writable folder for modules and caches (not roaming)."""
    if os.name == "nt":
        base = os.environ.get("LOCALAPPDATA")
        return (Path(base) if base else Path.home() / "AppData" / "Local") / "PzKpfw"
    base = os.environ.get("XDG_DATA_HOME")
    return (Path(base) if base else Path.home() / ".local" / "share") / "PzKpfw"


def _settings_path() -> Path:
    return data_dir() / "updates.json"


def load_update_settings() -> dict:
    try:
        value = json.loads(_settings_path().read_text(encoding="utf-8"))
        return value if isinstance(value, dict) else {}
    except (OSError, ValueError):
        return {}


def save_update_settings(**changes) -> bool:
    data = load_update_settings()
    data.update(changes)
    path = _settings_path()
    try:
        path.parent.mkdir(parents=True, exist_ok=True)
        tmp = path.with_suffix(".tmp")
        tmp.write_text(json.dumps(data, ensure_ascii=False, indent=1), encoding="utf-8")
        os.replace(tmp, path)
        return True
    except OSError:
        return False


def automatic_checks_enabled() -> bool:
    return bool(load_update_settings().get("automatic", True))


def automatic_check_due(now: float | None = None) -> bool:
    """True in an installed copy when checks are on and the last one is a day old."""
    if not is_installed_copy() or not automatic_checks_enabled():
        return False
    last = load_update_settings().get("last_check", 0)
    now = time.time() if now is None else now
    return not isinstance(last, (int, float)) or now - last >= UPDATE_CHECK_INTERVAL


# ---- releases --------------------------------------------------------------

@dataclass(frozen=True)
class ReleaseAsset:
    name: str
    url: str
    size: int


@dataclass(frozen=True)
class ReleaseInfo:
    version: str
    tag: str
    notes: str
    page_url: str
    installer: ReleaseAsset | None
    checksums: ReleaseAsset | None

    @property
    def newer(self) -> bool:
        return is_newer(self.version)


def parse_release(payload: dict) -> ReleaseInfo:
    """GitHub 'latest release' JSON -> ReleaseInfo (drafts and pre-releases are rejected)."""
    if not isinstance(payload, dict) or payload.get("draft") or payload.get("prerelease"):
        raise InstallationError("no published release")
    tag = str(payload.get("tag_name") or "")
    try:
        parse_version(tag)
    except ValueError as exc:
        raise InstallationError(f"unexpected release tag {tag!r}") from exc
    installer = checksums = None
    for item in payload.get("assets") or ():
        if not isinstance(item, dict):
            continue
        asset = ReleaseAsset(str(item.get("name", "")), str(item.get("browser_download_url", "")), int(item.get("size") or 0))
        if not asset.url.startswith("https://"):
            continue
        if asset.name.startswith(INSTALLER_PREFIX) and asset.name.lower().endswith(".exe"):
            installer = asset
        elif asset.name == CHECKSUMS_ASSET:
            checksums = asset
    return ReleaseInfo(tag.lstrip("v"), tag, str(payload.get("body") or ""),
                       str(payload.get("html_url") or RELEASES_PAGE), installer, checksums)


def _open(url: str):
    request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT, "Accept": "application/vnd.github+json"})
    return urllib.request.urlopen(request, timeout=NETWORK_TIMEOUT)


def fetch_json(url: str, limit: int = 4 * 1024 * 1024):
    try:
        with _open(url) as response:
            data = response.read(limit + 1)
    except OSError as exc:
        raise InstallationError(str(exc)) from exc
    if len(data) > limit:
        raise InstallationError("response is too large")
    try:
        return json.loads(data.decode("utf-8"))
    except ValueError as exc:
        raise InstallationError("response is not JSON") from exc


def fetch_latest_release() -> ReleaseInfo:
    info = parse_release(fetch_json(RELEASES_API))
    save_update_settings(last_check=time.time())
    return info


def parse_checksums(text: str) -> dict[str, str]:
    """'<sha256>  <name>' lines (sha256sum format) -> {name: sha256}."""
    result = {}
    for line in text.splitlines():
        match = re.match(r"^([0-9a-fA-F]{64})\s+\*?(\S.*)$", line.strip())
        if match:
            result[match.group(2).strip()] = match.group(1).lower()
    return result


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with open(path, "rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def download(url: str, target: Path, expected_sha256: str, progress=None, cancelled=None) -> Path:
    """Download to `target` and verify SHA-256; a bad or partial file is removed.

    progress(done_bytes, total_bytes) and cancelled() are called from the
    worker thread; they must not touch Tk widgets directly.
    """
    expected = (expected_sha256 or "").lower()
    if not re.fullmatch(r"[0-9a-f]{64}", expected):
        raise InstallationError("checksum is missing")
    if not url.startswith("https://"):
        raise InstallationError("only https downloads are allowed")
    target = Path(target)
    target.parent.mkdir(parents=True, exist_ok=True)
    partial = target.with_name(target.name + ".part")
    digest = hashlib.sha256()
    done = 0
    try:
        with _open(url) as response, open(partial, "wb") as handle:
            total = int(response.headers.get("Content-Length") or 0)
            while True:
                if cancelled is not None and cancelled():
                    raise InstallationError("cancelled")
                chunk = response.read(256 * 1024)
                if not chunk:
                    break
                done += len(chunk)
                if done > MAX_DOWNLOAD_BYTES:
                    raise InstallationError("download is too large")
                digest.update(chunk)
                handle.write(chunk)
                if progress is not None:
                    progress(done, total)
        if digest.hexdigest() != expected:
            raise InstallationError("checksum mismatch: the file is damaged or was replaced")
        os.replace(partial, target)
        return target
    except OSError as exc:
        raise InstallationError(str(exc)) from exc
    finally:
        try:
            partial.unlink()
        except OSError:
            pass


def download_installer(release: ReleaseInfo, progress=None, cancelled=None) -> Path:
    """Fetch the release installer into a fresh temp folder after checking SHA256SUMS."""
    if release.installer is None or release.checksums is None:
        raise InstallationError("the release has no installer or checksum file")
    try:
        with _open(release.checksums.url) as response:
            sums = parse_checksums(response.read(64 * 1024).decode("utf-8", "replace"))
    except OSError as exc:
        raise InstallationError(str(exc)) from exc
    expected = sums.get(release.installer.name)
    if not expected:
        raise InstallationError("the installer is not listed in SHA256SUMS.txt")
    folder = Path(tempfile.mkdtemp(prefix="pzkpfw-update-"))
    return download(release.installer.url, folder / release.installer.name, expected, progress, cancelled)


def installer_command(installer: Path) -> list[str]:
    """Silent update: Inno Setup closes this program, installs it and starts it again
    (the installer's [Run] entry starts PzKpfw after a silent install)."""
    return [str(installer), "/SILENT", "/SUPPRESSMSGBOXES", "/NORESTART", "/CLOSEAPPLICATIONS"]


def start_installer(installer: Path) -> None:
    """Start the installer detached from this process (Windows only)."""
    import subprocess
    if sys.platform != "win32":
        raise InstallationError("automatic installation works only on Windows")
    flags = getattr(subprocess, "DETACHED_PROCESS", 0) | getattr(subprocess, "CREATE_NEW_PROCESS_GROUP", 0)
    subprocess.Popen(installer_command(installer), close_fds=True, creationflags=flags)
