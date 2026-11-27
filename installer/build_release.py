#!/usr/bin/env python3
"""Build the PzKpfw installer and its runtime archive.

Windows (GitHub Actions or locally):

    python installer/build_release.py --python-dir <python-build-standalone folder>

Steps: copy the standalone CPython (with Tk) to build/release/runtime, install
requirements.txt into it, pack it as PzKpfw-runtime-<id>.zip, stage the program
files, compile installer/PzKpfw.iss with Inno Setup and write SHA256SUMS.txt.
Results are in dist-installer/. The source tree is not modified.

--skip-runtime-packages / --skip-iscc exist for tests on other systems.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
REPOSITORY = "mcwkrsk/PzKpfw"
RUNTIME_PREFIX = "PzKpfw-runtime-"
# Not needed at run time; removing them makes the download ~40% smaller.
RUNTIME_PRUNE = ("Lib/test", "Lib/idlelib", "Lib/tkinter/test", "Lib/lib2to3/tests", "Lib/unittest/test",
                 "Lib/ensurepip/_bundled", "include", "libs", "Scripts", "tcl/tix8.4.3", "Doc")
FIXED_ZIP_TIME = (2020, 1, 1, 0, 0, 0)


def app_version() -> str:
    text = (ROOT / "src" / "is2_re" / "__init__.py").read_text(encoding="utf-8")
    match = re.search(r'^__version__\s*=\s*"([^"]+)"', text, re.M)
    if not match:
        raise SystemExit("__version__ not found in src/is2_re/__init__.py")
    return match.group(1)


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with open(path, "rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def runtime_python(runtime: Path) -> Path:
    for candidate in (runtime / "python.exe", runtime / "bin" / "python3"):
        if candidate.exists():
            return candidate
    raise SystemExit(f"no python executable in {runtime}")


def _runtime_ignore(folder, names):
    """Skip caches and links (uv may leave a dangling 'python' link in its folders)."""
    skipped = set(shutil.ignore_patterns("__pycache__", "*.pyc", "*.pdb")(folder, names))
    return skipped | {name for name in names if os.path.islink(os.path.join(folder, name))}


def prepare_runtime(source: Path, target: Path, *, install_packages: bool) -> str:
    """Copy the standalone Python, add requirements, prune it; returns the runtime id."""
    if target.exists():
        shutil.rmtree(target)
    shutil.copytree(source, target, ignore=_runtime_ignore)
    for marker in target.rglob("EXTERNALLY-MANAGED"):
        marker.unlink()
    python = runtime_python(target)
    version = subprocess.run([str(python), "-c", "import sys,tkinter;print('%d.%d.%d' % sys.version_info[:3])"],
                             check=True, capture_output=True, text=True).stdout.strip()
    frozen = ""
    if install_packages:
        subprocess.run([str(python), "-m", "ensurepip", "--upgrade"], check=False, capture_output=True)
        subprocess.run([str(python), "-m", "pip", "install", "--disable-pip-version-check", "--no-input",
                        "--only-binary=:all:", "-r", str(ROOT / "requirements.txt")], check=True)
        frozen = subprocess.run([str(python), "-m", "pip", "freeze", "--all"], check=True,
                                capture_output=True, text=True).stdout
    for relative in RUNTIME_PRUNE:
        shutil.rmtree(target / relative, ignore_errors=True)
    for cache in list(target.rglob("__pycache__")):
        shutil.rmtree(cache, ignore_errors=True)
    # The id changes whenever Python or any package version changes; equal ids
    # let an update skip the download.
    digest = hashlib.sha256((version + "\n" + frozen).encode()).hexdigest()[:12]
    runtime_id = f"cpython{version}-{digest}"
    (target / "pzkpfw-runtime.id").write_text(runtime_id + "\n", encoding="ascii")
    return runtime_id


def zip_dir(folder: Path, archive: Path) -> None:
    """Deterministic ZIP (sorted names, fixed times) so equal inputs give equal hashes."""
    archive.parent.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(archive, "w", zipfile.ZIP_DEFLATED, compresslevel=9) as handle:
        for path in sorted(p for p in folder.rglob("*") if p.is_file() and not p.is_symlink()):
            info = zipfile.ZipInfo(path.relative_to(folder).as_posix(), FIXED_ZIP_TIME)
            info.compress_type = zipfile.ZIP_DEFLATED
            info.external_attr = 0o644 << 16
            handle.writestr(info, path.read_bytes())


def stage_program(stage: Path, version: str, runtime_id: str) -> None:
    if stage.exists():
        shutil.rmtree(stage)
    shutil.copytree(ROOT / "src" / "is2_re", stage / "app" / "is2_re",
                    ignore=shutil.ignore_patterns("__pycache__", "*.pyc", "*.pyo"))
    shutil.copy2(ROOT / "installer" / "pzkpfw.pyw", stage / "pzkpfw.pyw")
    shutil.copy2(ROOT / "src" / "is2_re" / "assets" / "pzkpfw.ico", stage / "pzkpfw.ico")
    shutil.copy2(ROOT / "LICENSE", stage / "LICENSE.txt")
    (stage / "pzkpfw-install.json").write_text(json.dumps({"version": version, "runtime": runtime_id}) + "\n", encoding="utf-8")


def find_iscc(explicit: str | None) -> str:
    candidates = [explicit] if explicit else []
    candidates += [shutil.which("ISCC"), shutil.which("iscc")]
    for base in (os.environ.get("ProgramFiles(x86)"), os.environ.get("ProgramFiles"), os.environ.get("LOCALAPPDATA")):
        if base:
            candidates.append(str(Path(base) / "Inno Setup 6" / "ISCC.exe"))
            candidates.append(str(Path(base) / "Programs" / "Inno Setup 6" / "ISCC.exe"))
    for candidate in candidates:
        if candidate and Path(candidate).is_file():
            return candidate
    raise SystemExit("ISCC.exe (Inno Setup 6) not found: install it or pass --iscc")


def build(args) -> dict:
    version = app_version()
    if args.tag and args.tag.lstrip("v") != version:
        raise SystemExit(f"tag {args.tag} does not match __version__ {version}")
    work = ROOT / "build" / "release"
    out = Path(args.output).resolve()
    out.mkdir(parents=True, exist_ok=True)
    runtime_id = prepare_runtime(Path(args.python_dir), work / "runtime", install_packages=not args.skip_runtime_packages)
    runtime_file = f"{RUNTIME_PREFIX}{runtime_id}.zip"
    runtime_zip = out / runtime_file
    zip_dir(work / "runtime", runtime_zip)
    runtime_sha = sha256(runtime_zip)
    unpacked_mb = sum(p.stat().st_size for p in (work / "runtime").rglob("*") if p.is_file()) // 1_000_000 + 1
    stage_program(work / "stage", version, runtime_id)
    url = f"https://github.com/{args.repository}/releases/download/v{version}/{runtime_file}"
    defines = {"AppVersion": version, "StageDir": str(work / "stage"), "OutputDir": str(out), "RuntimeId": runtime_id,
               "RuntimeFile": runtime_file, "RuntimeUrl": url, "RuntimeSha256": runtime_sha,
               "RuntimeSizeMB": str(unpacked_mb), "RuntimeDownloadMB": str(runtime_zip.stat().st_size // 1_000_000 + 1)}
    setup = out / f"PzKpfw-Setup-{version}.exe"
    if not args.skip_iscc:
        command = [find_iscc(args.iscc), "/Qp"] + [f"/D{key}={value}" for key, value in defines.items()]
        subprocess.run(command + [str(ROOT / "installer" / "PzKpfw.iss")], check=True)
    sums = [(sha256(p), p.name) for p in sorted(out.iterdir()) if p.is_file() and p.name != "SHA256SUMS.txt"]
    (out / "SHA256SUMS.txt").write_text("".join(f"{digest}  {name}\n" for digest, name in sums), encoding="ascii")
    (out / "build-info.json").write_text(json.dumps(defines, indent=1) + "\n", encoding="utf-8")
    print(json.dumps({"setup": str(setup), **defines}, indent=1))
    return defines


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--python-dir", required=True, help="python-build-standalone install folder (contains python.exe)")
    parser.add_argument("--output", default=str(ROOT / "dist-installer"))
    parser.add_argument("--repository", default=REPOSITORY, help="owner/name used in the runtime download URL")
    parser.add_argument("--tag", default=os.environ.get("RELEASE_TAG", ""), help="release tag; must equal v<__version__>")
    parser.add_argument("--iscc", help="path to ISCC.exe")
    parser.add_argument("--skip-runtime-packages", action="store_true", help="do not pip-install requirements (tests)")
    parser.add_argument("--skip-iscc", action="store_true", help="do not compile the installer (tests)")
    build(parser.parse_args(argv))
    return 0


if __name__ == "__main__":
    sys.exit(main())
