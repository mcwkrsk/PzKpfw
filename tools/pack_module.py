#!/usr/bin/env python3
"""Pack a module folder into a ZIP and print its entry for modules/index.json.

    python tools/pack_module.py modules/example
    python tools/pack_module.py modules/example --url https://github.com/<owner>/<repo>/releases/download/<tag>/<file>.zip

The folder must contain module.json and the package named in "entry".
The archive is deterministic: the same files always give the same SHA-256.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import sys
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "src"))

from is2_re.modules import MANIFEST, parse_manifest  # noqa: E402

FIXED_TIME = (2020, 1, 1, 0, 0, 0)
SKIP = {"__pycache__", ".git", ".DS_Store", "Thumbs.db"}


def pack(folder: Path, output: Path) -> tuple[Path, dict]:
    folder = Path(folder)
    manifest_data = json.loads((folder / MANIFEST).read_text(encoding="utf-8"))
    manifest = parse_manifest(manifest_data)
    if not (folder / manifest.package / "__init__.py").is_file():
        raise SystemExit(f"{folder}: package {manifest.package!r} from 'entry' is missing")
    output.mkdir(parents=True, exist_ok=True)
    archive = output / f"{manifest.id}-{manifest.version}.zip"
    files = sorted(p for p in folder.rglob("*") if p.is_file() and not SKIP.intersection(p.parts) and p.suffix not in (".pyc", ".pyo"))
    with zipfile.ZipFile(archive, "w", zipfile.ZIP_DEFLATED, compresslevel=9) as handle:
        for path in files:
            info = zipfile.ZipInfo(path.relative_to(folder).as_posix(), FIXED_TIME)
            info.compress_type = zipfile.ZIP_DEFLATED
            info.external_attr = 0o644 << 16
            handle.writestr(info, path.read_bytes())
    entry = dict(manifest_data)
    entry["sha256"] = hashlib.sha256(archive.read_bytes()).hexdigest()
    entry["size"] = archive.stat().st_size
    entry["url"] = ""
    return archive, entry


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("folder", type=Path)
    parser.add_argument("--output", type=Path, default=ROOT / "dist-modules")
    parser.add_argument("--url", default="", help="download URL of the uploaded ZIP (release asset)")
    args = parser.parse_args(argv)
    archive, entry = pack(args.folder, args.output)
    entry["url"] = args.url or f"https://github.com/<owner>/<repo>/releases/download/<tag>/{archive.name}"
    print(f"Archive: {archive}")
    print("Entry for modules/index.json:")
    print(json.dumps(entry, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
