"""Modular, dependency-free localization for PzKpfw.

Language packs are ordinary folders containing language.json and messages.json.
The source language is Russian; missing/empty entries safely fall back to source.
"""
from __future__ import annotations

import argparse
import json
import os
import re
import string
from functools import lru_cache
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

FORMAT_VERSION = 1
DEFAULT_LANGUAGE = "ru"
LOCALE_RE = re.compile(r"^[a-z]{2,3}(?:[_-][A-Za-z0-9]{2,8})*$")


def config_dir() -> Path:
    if os.name == "nt":
        base = os.environ.get("APPDATA")
        return (Path(base) if base else Path.home() / "AppData" / "Roaming") / "PzKpfw"
    base = os.environ.get("XDG_CONFIG_HOME")
    return (Path(base) if base else Path.home() / ".config") / "PzKpfw"


def preferences_path() -> Path:
    return config_dir() / "appearance.json"


def user_locales_dir() -> Path:
    return config_dir() / "locales"


def _read_preferences() -> dict[str, Any]:
    try:
        data = json.loads(preferences_path().read_text(encoding="utf-8"))
        return data if isinstance(data, dict) else {}
    except (OSError, ValueError, TypeError):
        return {}


def _save_language_preference(locale: str) -> bool:
    path = preferences_path()
    try:
        path.parent.mkdir(parents=True, exist_ok=True)
        data = _read_preferences()
        data["language"] = locale
        tmp = path.with_suffix(path.suffix + ".tmp")
        tmp.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
        tmp.replace(path)
        return True
    except OSError:
        return False


@dataclass(frozen=True)
class LanguageInfo:
    locale: str
    native_name: str
    english_name: str
    direction: str = "ltr"
    version: int = FORMAT_VERSION
    author: str = ""
    path: Path | None = None
    messages: dict[str, Any] = field(default_factory=dict, compare=False)
    builtin: bool = False

    @property
    def menu_label(self) -> str:
        if self.native_name == self.english_name:
            return self.native_name
        return f"{self.native_name} · {self.english_name}"


class LocalizationError(ValueError):
    """A language pack does not satisfy the PzKpfw language-pack contract."""


def _builtin_dir() -> Path:
    return Path(__file__).resolve().parent / "locales"


def _load_pack(folder: Path, *, builtin: bool = False) -> LanguageInfo:
    metadata_path = folder / "language.json"
    messages_path = folder / "messages.json"
    try:
        metadata = json.loads(metadata_path.read_text(encoding="utf-8"))
        messages = json.loads(messages_path.read_text(encoding="utf-8"))
    except FileNotFoundError as exc:
        raise LocalizationError(f"Missing language.json or messages.json in {folder}") from exc
    except (OSError, json.JSONDecodeError) as exc:
        raise LocalizationError(f"Cannot read language pack {folder}: {exc}") from exc
    if not isinstance(metadata, dict) or not isinstance(messages, dict):
        raise LocalizationError("language.json and messages.json must contain JSON objects")
    locale = metadata.get("locale")
    if not isinstance(locale, str) or not LOCALE_RE.fullmatch(locale):
        raise LocalizationError("metadata.locale must be a valid locale code (for example de or pt_BR)")
    if folder.name != locale:
        raise LocalizationError(f"Folder name '{folder.name}' must match metadata.locale '{locale}'")
    for key in ("native_name", "english_name"):
        if not isinstance(metadata.get(key), str) or not metadata[key].strip():
            raise LocalizationError(f"metadata.{key} must be a non-empty string")
    direction = metadata.get("direction", "ltr")
    if direction not in ("ltr", "rtl"):
        raise LocalizationError("metadata.direction must be 'ltr' or 'rtl'")
    version = metadata.get("format_version", FORMAT_VERSION)
    if version != FORMAT_VERSION:
        raise LocalizationError(f"Unsupported format_version {version}; expected {FORMAT_VERSION}")
    clean: dict[str, Any] = {}
    for msgid, value in messages.items():
        if not isinstance(msgid, str):
            continue
        if isinstance(value, str):
            clean[msgid] = value
        elif isinstance(value, dict) and all(isinstance(k, str) and isinstance(v, str) for k, v in value.items()):
            clean[msgid] = value
    return LanguageInfo(
        locale=locale,
        native_name=metadata["native_name"].strip(),
        english_name=metadata["english_name"].strip(),
        direction=direction,
        version=version,
        author=str(metadata.get("author", "")),
        path=folder,
        messages=clean,
        builtin=builtin,
    )


_PACKS: dict[str, LanguageInfo] = {}
_PACK_ERRORS: list[str] = []
_CURRENT_LANGUAGE = DEFAULT_LANGUAGE
_CURRENT_MESSAGES: dict[str, Any] = {}


def discover_languages() -> list[LanguageInfo]:
    """Load built-in packs first, then allow user packs to override/add locales."""
    global _PACKS, _PACK_ERRORS
    packs: dict[str, LanguageInfo] = {}
    errors: list[str] = []
    for folder, builtin in ((_builtin_dir(), True), (user_locales_dir(), False)):
        if not folder.is_dir():
            continue
        for child in sorted(folder.iterdir()):
            if not child.is_dir() or child.name.startswith("_") or child.name.startswith("."):
                continue
            try:
                pack = _load_pack(child, builtin=builtin)
                packs[pack.locale] = pack
            except LocalizationError as exc:
                errors.append(str(exc))
    if DEFAULT_LANGUAGE not in packs:
        packs[DEFAULT_LANGUAGE] = LanguageInfo(DEFAULT_LANGUAGE, "Русский", "Russian")
    _PACKS, _PACK_ERRORS = packs, errors
    return sorted(packs.values(), key=lambda item: (item.locale != DEFAULT_LANGUAGE, item.english_name.casefold()))


def pack_errors() -> list[str]:
    return list(_PACK_ERRORS)


def available_languages() -> list[LanguageInfo]:
    if not _PACKS:
        discover_languages()
    return sorted(_PACKS.values(), key=lambda item: (item.locale != DEFAULT_LANGUAGE, item.english_name.casefold()))


def get_language() -> str:
    return _CURRENT_LANGUAGE


def get_language_info(locale: str | None = None) -> LanguageInfo:
    if not _PACKS:
        discover_languages()
    return _PACKS.get(locale or _CURRENT_LANGUAGE, _PACKS[DEFAULT_LANGUAGE])


def save_language_preference(locale: str) -> bool:
    """Save a language for the next launch without changing this process' locale."""
    if not _PACKS:
        discover_languages()
    if locale not in _PACKS:
        raise LocalizationError(f"Language '{locale}' is not installed")
    return _save_language_preference(locale)


def set_language(locale: str, *, persist: bool = True) -> bool:
    """Select an installed language. Returns False if the preference could not be saved."""
    global _CURRENT_LANGUAGE, _CURRENT_MESSAGES
    if not _PACKS:
        discover_languages()
    if locale not in _PACKS:
        raise LocalizationError(f"Language '{locale}' is not installed")
    _CURRENT_LANGUAGE = locale
    _CURRENT_MESSAGES = _PACKS[locale].messages
    return _save_language_preference(locale) if persist else True


def tr(message: str) -> str:
    """Translate a source-language string; empty/missing values fall back to Russian."""
    if not isinstance(message, str) or not message:
        return message
    value = _CURRENT_MESSAGES.get(message)
    if isinstance(value, str) and value.strip():
        return value
    return message


@lru_cache(maxsize=1)
def _dynamic_message_patterns() -> tuple[tuple[str, re.Pattern[str]], ...]:
    """Compile source-catalog templates used for dynamic status/history messages.

    Only simple named ``str.format`` fields are supported. This deliberately
    avoids guessing translations for arbitrary user data or exception text.
    """
    template_path = _builtin_dir() / "_template" / "messages.json"
    try:
        source_messages = json.loads(template_path.read_text(encoding="utf-8"))
    except (OSError, ValueError):
        return ()

    compiled: list[tuple[str, re.Pattern[str]]] = []
    formatter = string.Formatter()
    for source in source_messages:
        if not isinstance(source, str) or "{" not in source:
            continue
        pieces: list[str] = ["^"]
        seen: set[str] = set()
        valid = True
        try:
            parsed = list(formatter.parse(source))
        except ValueError:
            continue
        for literal, field_name, _format_spec, conversion in parsed:
            pieces.append(re.escape(literal))
            if field_name is None:
                continue
            if (not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", field_name)
                    or conversion is not None):
                valid = False
                break
            if field_name in seen:
                pieces.append(f"(?P={field_name})")
            else:
                pieces.append(rf"(?P<{field_name}>[\s\S]*?)")
                seen.add(field_name)
        if valid and seen:
            pieces.append("$")
            try:
                compiled.append((source, re.compile("".join(pieces))))
            except re.error:
                continue
    # More literal text and fewer substitutions are less likely to collide.
    compiled.sort(key=lambda item: (-len(item[0]), item[1].pattern.count("(?P<")))
    return tuple(compiled)


def tr_dynamic(message: str) -> str:
    """Translate a known source-template after its format fields were inserted.

    This is intended for controlled UI status/history strings. Unknown strings
    are returned untouched, so user data and backend exception messages are
    never guessed or rewritten.
    """
    direct = tr(message)
    if direct != message or not isinstance(message, str):
        return direct
    for source, pattern in _dynamic_message_patterns():
        match = pattern.fullmatch(message)
        if match is None:
            continue
        translated = tr(source)
        try:
            return translated.format(**match.groupdict())
        except (KeyError, ValueError, IndexError):
            return message
    return message


def plural_category(locale: str, n: int) -> str:
    """Small dependency-free plural selector for optional future plural messages."""
    n = abs(int(n))
    language = locale.split("_", 1)[0].split("-", 1)[0]
    if language in {"ru", "uk"}:
        if n % 10 == 1 and n % 100 != 11:
            return "one"
        if 2 <= n % 10 <= 4 and not 12 <= n % 100 <= 14:
            return "few"
        return "many"
    if language == "he":
        if n == 1:
            return "one"
        if n == 2:
            return "two"
        if n == 0 or n > 10:
            return "many"
        return "other"
    return "one" if n == 1 else "other"


def trn(singular: str, plural: str, n: int) -> str:
    """Translate a plural message with optional one/few/many/other JSON forms."""
    entry = _CURRENT_MESSAGES.get(singular)
    category = plural_category(_CURRENT_LANGUAGE, n)
    if isinstance(entry, dict):
        value = entry.get(category) or entry.get("other")
        if isinstance(value, str) and value:
            return value
    elif isinstance(entry, str) and entry:
        return entry
    return singular if n == 1 else plural


def translation_stats(locale: str | None = None, source_messages: list[str] | None = None) -> tuple[int, int]:
    pack = get_language_info(locale)
    if source_messages is None:
        # The source catalog lives in _template; the Russian pack intentionally
        # needs no duplicate translations and may therefore have an empty file.
        try:
            keys = list(json.loads((_builtin_dir() / "_template" / "messages.json").read_text(encoding="utf-8")))
        except (OSError, ValueError):
            keys = []
    else:
        keys = source_messages
    if pack.locale == DEFAULT_LANGUAGE:
        return len(keys), len(keys)
    translated = sum(1 for key in keys if isinstance(pack.messages.get(key), str) and pack.messages[key].strip())
    return translated, len(keys)


def _placeholders(value: str) -> set[str]:
    result: set[str] = set()
    try:
        for _, field_name, _, _ in string.Formatter().parse(value):
            if field_name:
                result.add(field_name.split(".", 1)[0].split("[", 1)[0])
    except ValueError:
        pass
    return result


def validate_pack(folder: Path | str, *, source_messages: list[str] | None = None) -> list[str]:
    """Return validation warnings/errors. An empty list means the pack is valid."""
    folder = Path(folder)
    errors: list[str] = []
    try:
        pack = _load_pack(folder)
    except LocalizationError as exc:
        return [str(exc)]
    if source_messages is None:
        try:
            source_messages = list(json.loads((_builtin_dir() / "_template" / "messages.json").read_text(encoding="utf-8")))
        except (OSError, ValueError):
            source_messages = []
    if pack.locale == DEFAULT_LANGUAGE:
        return errors
    for msgid, translation in pack.messages.items():
        if isinstance(translation, str) and translation:
            expected = _placeholders(msgid)
            actual = _placeholders(translation)
            if expected != actual:
                errors.append(f"{msgid!r}: placeholders differ; source={sorted(expected)}, translation={sorted(actual)}")
    missing = [key for key in source_messages if not (isinstance(pack.messages.get(key), str) and pack.messages[key].strip())]
    if missing:
        errors.append(f"{len(missing)} untranslated message(s) (fallback to Russian will be used)")
    return errors


def _initialize() -> None:
    discover_languages()
    preferred = _read_preferences().get("language", DEFAULT_LANGUAGE)
    if preferred not in _PACKS:
        preferred = DEFAULT_LANGUAGE
    set_language(preferred, persist=False)


_initialize()


def _cli() -> int:
    parser = argparse.ArgumentParser(description="Validate PzKpfw language packs")
    parser.add_argument("path", nargs="?", help="Path to a language-pack folder")
    parser.add_argument("--list", action="store_true", help="List installed language packs")
    args = parser.parse_args()
    if args.list:
        for pack in available_languages():
            translated, total = translation_stats(pack.locale)
            print(f"{pack.locale:14} {pack.menu_label:32} {translated}/{total}")
        return 0
    if not args.path:
        parser.error("provide a language-pack path or --list")
    errors = validate_pack(args.path)
    for error in errors:
        print(error)
    if errors:
        return 1
    print("Language pack is valid.")
    return 0


if __name__ == "__main__":
    raise SystemExit(_cli())
