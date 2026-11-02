#!/usr/bin/env python3
"""Extract Qt/MOC UI metadata and WebEngine template dependencies from IS-2 plugins.

Static string/import inventory only; this does not emulate Qt's QMetaObject runtime.
Requires Python 3 and GNU objdump for import enumeration.
"""
from __future__ import annotations
import argparse
import hashlib
import json
import re
import subprocess
from pathlib import Path

PLUGINS = ["PM_auto.dll", "PM_params.dll", "PM_spec_WEB.dll", "PM_matrix_web.dll", "Model_Visualiser.dll"]
ASCII_RE = re.compile(rb"[\x20-\x7e]{3,}")
MOC_RE = re.compile(r"^[12][A-Za-z_~][A-Za-z0-9_:~<> ,*&.\[\]]*\([^\r\n]*\)$")
AUTO_SLOT_RE = re.compile(r"^on_[A-Za-z0-9_]+$")


def ascii_strings(data: bytes) -> list[tuple[int, str]]:
    return [(m.start(), m.group().decode("latin1")) for m in ASCII_RE.finditer(data)]


def imports(path: Path) -> list[dict[str, str]]:
    text = subprocess.run(["objdump", "-p", str(path)], check=True, text=True,
                          stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                          errors="replace").stdout
    current = ""
    result: list[dict[str, str]] = []
    for line in text.splitlines():
        m = re.search(r"DLL Name:\s*(\S+)", line)
        if m:
            current = m.group(1)
            continue
        m = re.match(r"\s*[0-9a-fA-F]{8}\s+<none>\s+[0-9a-fA-F]{4}\s+(.+?)\s*$", line)
        if m and current:
            result.append({"dll": current, "symbol": m.group(1)})
    return result


def recover_plugin(path: Path) -> dict:
    data = path.read_bytes()
    strings = ascii_strings(data)
    imps = imports(path)
    qweb = [x["symbol"] for x in imps if x["dll"].lower() == "qt5webenginewidgets.dll"]
    return {
        "binary": path.name,
        "sha256": hashlib.sha256(data).hexdigest(),
        "moc_signals_slots": [{"file_offset": off, "signature": s,
                               "kind": "signal" if s.startswith("2") else "slot"}
                              for off, s in strings if MOC_RE.match(s)],
        "auto_connection_slot_names": [{"file_offset": off, "name": s}
                                       for off, s in strings if AUTO_SLOT_RE.match(s)],
        "named_slot_candidates": [{"file_offset": off, "name": s}
                                  for off, s in strings
                                  if s.endswith("_slot") or s.endswith("Slot")],
        "template_paths": [{"file_offset": off, "path": s}
                           for off, s in strings if ".html" in s.lower()],
        "template_placeholders": [{"file_offset": off, "placeholder": s}
                                  for off, s in strings
                                  if re.fullmatch(r"%[A-Za-z0-9_-]+%", s)],
        "qwebenginewidgets_imports": qweb,
        "qwebenginewidgets_import_count": len(qweb),
        "qfile_and_textstream_imports": [x["symbol"] for x in imps
                                          if x["dll"].lower() == "qt5core.dll"
                                          and any(k in x["symbol"] for k in
                                                  ("QFile", "QTextStream", "readAll@"))],
    }


def inspect_template(path: Path) -> dict:
    raw = path.read_bytes()
    text = raw.decode("latin1", "replace")
    comments = re.findall(r"<!--(.*?)-->", text, re.S)
    active_text = re.sub(r"<!--.*?-->", "", text, flags=re.S)
    css_re = r"(?:href|src)\s*=\s*[\"']([^\"']+\.css)[\"']"
    return {
        "path": str(path),
        "sha256": hashlib.sha256(raw).hexdigest(),
        "placeholders": re.findall(r"%[A-Za-z0-9_-]+%", text),
        "active_stylesheet_references": re.findall(css_re, active_text, re.I),
        "commented_stylesheet_references": [ref for comment in comments for ref in re.findall(css_re, comment, re.I)],
        "external_urls": sorted(set(re.findall(r"https?://[^\s\"'<>]+", active_text, re.I))),
        "meta_charset": re.findall(r"<meta\s+charset=[\"']([^\"']+)", text, re.I),
    }


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("binary_dir", type=Path, help="Original IS-2 root containing modules/")
    ap.add_argument("--out", type=Path, required=True)
    args = ap.parse_args()
    results = []
    for name in PLUGINS:
        path = args.binary_dir / "modules" / name
        if path.exists():
            results.append(recover_plugin(path))
    templates = []
    for rel in ("pm_template/formA.html", "matrix_template/Matrix template.html"):
        path = args.binary_dir / rel
        if path.exists():
            templates.append(inspect_template(path))
    args.out.mkdir(parents=True, exist_ok=True)
    payload = {"plugins": results, "templates": templates,
               "analysis_note": "Static MOC/string/import inventory; names are not proof of runtime reachability."}
    (args.out / "qt_ui_metadata.json").write_text(json.dumps(payload, indent=2), encoding="utf-8")
    with (args.out / "qt_ui_slots.tsv").open("w", encoding="utf-8") as f:
        f.write("binary\tkind\tfile_offset\tname\n")
        for r in results:
            for x in r["moc_signals_slots"]:
                f.write(f"{r['binary']}\t{x['kind']}\t0x{x['file_offset']:x}\t{x['signature']}\n")
            for x in r["auto_connection_slot_names"]:
                f.write(f"{r['binary']}\tauto-slot-candidate\t0x{x['file_offset']:x}\t{x['name']}\n")
            for x in r["named_slot_candidates"]:
                f.write(f"{r['binary']}\tcustom-slot-candidate\t0x{x['file_offset']:x}\t{x['name']}\n")
    for r in results:
        print(f"{r['binary']}: signals/slots={len(r['moc_signals_slots'])}, "
              f"auto-connect={len(r['auto_connection_slot_names'])}, "
              f"QWebEngine imports={r['qwebenginewidgets_import_count']}, SHA256={r['sha256']}")
    print(f"Templates analyzed: {len(templates)}; output: {args.out}")

if __name__ == "__main__":
    main()
