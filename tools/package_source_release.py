#!/usr/bin/env python3
"""Create public PzKpfw source archives without private or proprietary binaries."""
from __future__ import annotations

import argparse
import hashlib
import tarfile
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ARCHIVE_STEM = "PzKpfw_Desktop_Alpha_0.7.9"
EXCLUDED_DIRS = {
    ".git", ".pytest_cache", ".mypy_cache", ".ruff_cache", "__pycache__",
    ".venv", "venv", "reference-private", "node_modules", "build",
}
EXCLUDED_SUFFIXES = {
    ".pyc", ".pyo", ".exe", ".dll", ".ocx", ".pdb", ".lib", ".obj",
    ".so", ".dylib", ".a", ".o", ".class", ".jar", ".pdf", ".png",
    ".jpg", ".jpeg", ".webp", ".bmp", ".gif",
}


def include(path: Path) -> bool:
    rel = path.relative_to(ROOT)
    if any(part in EXCLUDED_DIRS for part in rel.parts):
        return False
    if path.suffix.lower() in EXCLUDED_SUFFIXES:
        return False
    if any(part.endswith(".egg-info") for part in rel.parts):
        return False
    if path.name in {".DS_Store", "Thumbs.db"}:
        return False
    return path.is_file()


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output-dir", type=Path, default=ROOT.parent)
    args = parser.parse_args()
    out_dir = args.output_dir.resolve()
    out_dir.mkdir(parents=True, exist_ok=True)
    zip_path = out_dir / f"{ARCHIVE_STEM}.zip"
    tar_path = out_dir / f"{ARCHIVE_STEM}_SOURCES.tar.gz"
    files = sorted((p for p in ROOT.rglob("*") if include(p)), key=lambda p: p.as_posix())
    if not files:
        raise SystemExit("No source files selected")

    with zipfile.ZipFile(zip_path, "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9) as zf:
        for path in files:
            rel = path.relative_to(ROOT).as_posix()
            zf.write(path, f"{ARCHIVE_STEM}/{rel}")

    with tarfile.open(tar_path, "w:gz", compresslevel=9) as tf:
        for path in files:
            rel = path.relative_to(ROOT).as_posix()
            tf.add(path, arcname=f"{ARCHIVE_STEM}/{rel}", recursive=False)

    checksum_path = out_dir / f"{ARCHIVE_STEM}.sha256"
    checksum_lines = [f"{sha256(path)}  {path.name}" for path in (zip_path, tar_path)]
    wheel = ROOT / "dist" / "pzkpfw-0.7.9-py3-none-any.whl"
    if wheel.is_file():
        wheel_target = out_dir / wheel.name
        wheel_target.write_bytes(wheel.read_bytes())
        checksum_lines.append(f"{sha256(wheel_target)}  {wheel_target.name}")
    checksum_path.write_text("\n".join(checksum_lines) + "\n", encoding="utf-8")

    print(f"Source files: {len(files)}")
    print(f"ZIP: {zip_path} ({zip_path.stat().st_size} bytes)")
    print(f"TAR.GZ: {tar_path} ({tar_path.stat().st_size} bytes)")
    print(f"SHA256: {checksum_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
