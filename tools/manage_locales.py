#!/usr/bin/env python3
"""Create, validate, and inspect PzKpfw JSON language packs."""
from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "src"
sys.path.insert(0, str(SRC))

from is2_re.i18n import (  # noqa: E402
    available_languages,
    config_dir,
    translation_stats,
    user_locales_dir,
    validate_pack,
)


def create_pack(locale: str, native_name: str, english_name: str, direction: str, output: Path, author: str) -> Path:
    if not re.fullmatch(r"[a-z]{2,3}(?:[_-][A-Za-z0-9]{2,8})*", locale):
        raise ValueError("Invalid locale code; use e.g. pt, pt_BR, or zh_Hans")
    if direction not in {"ltr", "rtl"}:
        raise ValueError("Direction must be ltr or rtl")
    if not native_name.strip() or not english_name.strip():
        raise ValueError("Both native and English language names are required")
    target = output / locale
    if target.exists():
        raise FileExistsError(f"Language folder already exists: {target}")
    template_path = ROOT / "src" / "is2_re" / "locales" / "_template" / "messages.json"
    source = json.loads(template_path.read_text(encoding="utf-8"))
    target.mkdir(parents=True)
    (target / "language.json").write_text(
        json.dumps({
            "format_version": 1,
            "locale": locale,
            "native_name": native_name.strip(),
            "english_name": english_name.strip(),
            "direction": direction,
            "author": author.strip(),
        }, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    (target / "messages.json").write_text(
        json.dumps({message: "" for message in source}, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    return target


def main() -> int:
    parser = argparse.ArgumentParser(description="Manage PzKpfw community language packs")
    sub = parser.add_subparsers(dest="command", required=True)

    create = sub.add_parser("create", help="Create a new language pack from the full source template")
    create.add_argument("--locale", required=True, help="Locale code, e.g. pt_BR")
    create.add_argument("--native-name", required=True, help="Language name in that language")
    create.add_argument("--english-name", required=True, help="English language name")
    create.add_argument("--direction", choices=("ltr", "rtl"), default="ltr")
    create.add_argument("--author", default="Community translator")
    create.add_argument("--user", action="store_true", help="Install into this user's PzKpfw/locales folder")
    create.add_argument("--output", type=Path, help="Explicit output folder (overrides --user)")

    validate = sub.add_parser("validate", help="Validate a language pack and report missing strings")
    validate.add_argument("path", type=Path)

    sub.add_parser("list", help="List all discovered built-in and user language packs")
    args = parser.parse_args()

    if args.command == "create":
        output = args.output or (user_locales_dir() if args.user else ROOT / "src" / "is2_re" / "locales")
        folder = create_pack(args.locale, args.native_name, args.english_name, args.direction, output, args.author)
        print(f"Created: {folder}")
        print("Fill messages.json, then run: python tools/manage_locales.py validate " + str(folder))
        return 0

    if args.command == "validate":
        errors = validate_pack(args.path)
        if not errors:
            print("Language pack is complete and valid.")
            return 0
        for error in errors:
            print("- " + error)
        # A valid but incomplete pack is still usable: missing strings fall back to Russian.
        structural = [item for item in errors if "untranslated message(s)" not in item]
        return 1 if structural else 0

    for info in available_languages():
        translated, total = translation_stats(info.locale)
        where = "user" if info.path and str(user_locales_dir()) in str(info.path) else "built-in"
        print(f"{info.locale:14} {info.menu_label:36} {translated:>3}/{total:<3} {info.direction:3} {where}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
