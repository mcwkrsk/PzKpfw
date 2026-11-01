#!/usr/bin/env python3
"""Recover Qt 5 static QMetaObject/MOC contracts from PE32 plugin DLLs.

This is a static parser for the Qt 5.9-era metadata layout used by the supplied
IS-2 binaries. It scans initialized PE sections (including .data), validates
metadata/string references, and emits method signatures and metacall addresses.
It does not execute Qt or prove runtime reachability.
"""
from __future__ import annotations
import argparse
import hashlib
import json
import re
import struct
import subprocess
from dataclasses import dataclass
from pathlib import Path
from typing import Optional

PLUGINS = ["PM_auto.dll", "PM_params.dll", "PM_spec_WEB.dll", "PM_matrix_web.dll", "Model_Visualiser.dll"]
# QMetaType ids relevant to these binaries; unlisted ids remain explicit.
QT_TYPES = {
    0: "Unknown", 1: "bool", 2: "int", 3: "uint", 4: "qlonglong",
    5: "qulonglong", 6: "double", 7: "QChar", 8: "QVariantMap",
    9: "QVariantList", 10: "QString", 11: "QStringList", 12: "QByteArray",
    13: "QBitArray", 14: "QDate", 15: "QTime", 16: "QDateTime",
    17: "QUrl", 18: "QLocale", 19: "QRect", 20: "QRectF", 21: "QSize",
    22: "QSizeF", 23: "QLine", 24: "QLineF", 25: "QPoint", 26: "QPointF",
    27: "QRegExp", 28: "QVariantHash", 29: "QEasingCurve", 30: "QUuid",
    42: "QModelIndex", 43: "void",
}

@dataclass(frozen=True)
class Section:
    name: str
    size: int
    va: int
    fileoff: int

class PEImage:
    def __init__(self, path: Path):
        self.path = path
        self.data = path.read_bytes()
        self.sections = self._sections()

    def _sections(self) -> list[Section]:
        txt = subprocess.run(["objdump", "-h", str(self.path)], check=True,
                            text=True, stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE).stdout
        out = []
        rx = re.compile(r"^\s*\d+\s+(\S+)\s+([0-9a-fA-F]+)\s+([0-9a-fA-F]+)\s+[0-9a-fA-F]+\s+([0-9a-fA-F]+)", re.M)
        for m in rx.finditer(txt):
            name, size, va, off = m.groups()
            out.append(Section(name, int(size, 16), int(va, 16), int(off, 16)))
        if not out:
            raise ValueError(f"Could not parse PE sections for {self.path}")
        return out

    def va_to_off(self, va: int, size: int = 1) -> Optional[int]:
        for s in self.sections:
            if s.va <= va and va + size <= s.va + s.size:
                off = s.fileoff + va - s.va
                if off + size <= len(self.data):
                    return off
        return None

    def section_for_va(self, va: int) -> Optional[str]:
        for s in self.sections:
            if s.va <= va < s.va + s.size:
                return s.name
        return None

    def u32(self, va: int) -> Optional[int]:
        off = self.va_to_off(va, 4)
        return struct.unpack_from("<I", self.data, off)[0] if off is not None else None

    def bytes_at(self, va: int, n: int) -> Optional[bytes]:
        off = self.va_to_off(va, n)
        return self.data[off:off+n] if off is not None else None

    def cstring(self, va: int, maxlen: int = 1024) -> Optional[str]:
        raw = self.bytes_at(va, 1)
        if raw is None: return None
        off = self.va_to_off(va, 1)
        end = self.data.find(b"\0", off, min(len(self.data), off + maxlen))
        if end < 0: return None
        return self.data[off:end].decode("utf-8", "replace")

    def string_at_index(self, strdata_va: int, idx: int) -> Optional[str]:
        if idx < 0 or idx > 4096:
            return None
        desc_va = strdata_va + idx * 16
        raw = self.bytes_at(desc_va, 16)
        if raw is None:
            return None
        _ref, size, _alloc, rel = struct.unpack("<iiIi", raw)
        if size < 0 or size > 4096:
            return None
        text_va = (desc_va + rel) & 0xFFFFFFFF
        rawtext = self.bytes_at(text_va, size + 1)
        if rawtext is None or rawtext[-1] != 0:
            return None
        return rawtext[:size].decode("utf-8", "replace")

    def imports(self) -> list[dict[str, str]]:
        txt = subprocess.run(["objdump", "-p", str(self.path)], check=True,
                            text=True, stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE, errors="replace").stdout
        current = ""
        result = []
        for line in txt.splitlines():
            m = re.search(r"DLL Name:\s*(\S+)", line)
            if m:
                current = m.group(1); continue
            m = re.match(r"\s*[0-9a-fA-F]{8}\s+<none>\s+[0-9a-fA-F]{4}\s+(.+?)\s*$", line)
            if m and current:
                result.append({"dll": current, "symbol": m.group(1)})
        return result


def decode_type(img: PEImage, strdata: int, rawtype: int) -> str:
    if rawtype & 0x80000000:
        idx = rawtype & 0x7FFFFFFF
        return img.string_at_index(strdata, idx) or f"custom_type_string_{idx}"
    return QT_TYPES.get(rawtype, f"QMetaType({rawtype})")


def decode_qmetaobject(img: PEImage, obj_va: int) -> Optional[dict]:
    objraw = img.bytes_at(obj_va, 24)
    if objraw is None: return None
    super_va, stringdata_va, data_va, metacall_va, related_va, extradata_va = struct.unpack("<6I", objraw)
    if img.section_for_va(stringdata_va) not in (".rdata", ".data"):
        return None
    if img.section_for_va(data_va) not in (".rdata", ".data"):
        return None
    if metacall_va and img.section_for_va(metacall_va) != ".text":
        return None
    head = img.bytes_at(data_va, 56)
    if head is None: return None
    words = struct.unpack("<14I", head)
    revision, class_name_idx, classinfo_count, classinfo_data, method_count, method_data, prop_count, prop_data, enum_count, enum_data, ctor_count, ctor_data, flags, signal_count = words
    if revision != 7 or not (0 <= method_count <= 128) or signal_count > method_count:
        return None
    if classinfo_count > 64 or prop_count > 128 or enum_count > 64 or ctor_count > 32:
        return None
    class_name = img.string_at_index(stringdata_va, class_name_idx)
    if not class_name or len(class_name) > 256 or not re.match(r"^[A-Za-z_][A-Za-z0-9_:<>]*$", class_name):
        return None
    if method_count:
        recs = img.bytes_at(data_va + method_data * 4, method_count * 20)
        if recs is None: return None
    methods = []
    if method_count:
        for i in range(method_count):
            rec_va = data_va + method_data * 4 + i * 20
            r = img.bytes_at(rec_va, 20)
            name_idx, argc, param_offset, tag_idx, mflags = struct.unpack("<5I", r)
            if argc > 16: return None
            name = img.string_at_index(stringdata_va, name_idx)
            tag = img.string_at_index(stringdata_va, tag_idx) if tag_idx not in (0xFFFFFFFF, 0) else ("" if tag_idx == 0 else None)
            if not name or not re.match(r"^[A-Za-z_~][A-Za-z0-9_~]*$", name): return None
            # Qt5 metadata stores return type, argument types, then argument-name indexes.
            nparam_words = 1 + 2 * argc
            pbytes = img.bytes_at(data_va + param_offset * 4, nparam_words * 4)
            if pbytes is None: return None
            pwords = struct.unpack("<" + "I" * nparam_words, pbytes)
            ret = decode_type(img, stringdata_va, pwords[0])
            argtypes = [decode_type(img, stringdata_va, x) for x in pwords[1:1+argc]]
            argname_idx = pwords[1+argc:1+2*argc]
            argnames = [img.string_at_index(stringdata_va, x) or f"arg{n}" for n, x in enumerate(argname_idx)]
            access_code = mflags & 0x3
            access = {0:"private", 1:"protected", 2:"public", 3:"unknown"}[access_code]
            method_kind_code = mflags & 0x0c
            kind = {0:"method", 4:"signal", 8:"slot", 12:"constructor"}.get(method_kind_code, "unknown")
            args = [f"{t} {an}" for t, an in zip(argtypes, argnames)]
            signature = f"{name}({', '.join(args)})"
            methods.append({"index": i, "name": name, "kind": kind, "access": access,
                            "return_type": ret, "arguments": [{"type": t, "name": n} for t,n in zip(argtypes,argnames)],
                            "signature": signature, "tag": tag or "", "flags": mflags,
                            "parameter_data_index": param_offset})
    return {
        "va": obj_va, "section": img.section_for_va(obj_va), "super_va": super_va,
        "stringdata_va": stringdata_va, "data_va": data_va,
        "static_metacall_va": metacall_va, "related_metaobjects_va": related_va,
        "extradata_va": extradata_va, "class_name": class_name,
        "revision": revision, "classinfo_count": classinfo_count,
        "method_count": method_count, "property_count": prop_count,
        "enum_count": enum_count, "constructor_count": ctor_count,
        "signal_count": signal_count, "flags": flags, "methods": methods,
    }


def scan_image(img: PEImage) -> list[dict]:
    found: dict[int, dict] = {}
    for sec in img.sections:
        if sec.name not in (".rdata", ".data"):
            continue
        # Four-byte alignment is sufficient for 32-bit Qt static metaobjects.
        end = sec.fileoff + sec.size - 24
        for off in range((sec.fileoff + 3) & ~3, end + 1, 4):
            va = sec.va + off - sec.fileoff
            obj = decode_qmetaobject(img, va)
            if obj:
                found[va] = obj
    # Parent names can be resolved only after all metaobjects have been collected.
    by_va = {x["va"]: x["class_name"] for x in found.values()}
    for obj in found.values():
        obj["super_class"] = by_va.get(obj["super_va"], None) if obj["super_va"] else None
    return sorted(found.values(), key=lambda x: (x["va"], x["class_name"]))


def recover(path: Path) -> dict:
    img = PEImage(path)
    objs = scan_image(img)
    auto_import = [x for x in img.imports() if x["symbol"].find("connectSlotsByName") >= 0]
    return {"binary": path.name, "sha256": hashlib.sha256(img.data).hexdigest(),
            "sections": [{"name": s.name, "va": s.va, "size": s.size} for s in img.sections],
            "qmetaobject_count": len(objs), "total_methods": sum(o["method_count"] for o in objs),
            "total_signals": sum(o["signal_count"] for o in objs),
            "connect_slots_by_name_imports": auto_import, "qmetaobjects": objs}


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("binary_dir", type=Path, help="IS-2 root containing modules/")
    ap.add_argument("--out", type=Path, required=True)
    args = ap.parse_args()
    result = []
    for name in PLUGINS:
        path = args.binary_dir / "modules" / name
        if path.exists(): result.append(recover(path))
    args.out.mkdir(parents=True, exist_ok=True)
    payload = {"format": "Qt5 QMetaObject static metadata", "revision": 7,
               "analysis_scope": "Static PE metadata parsing; no Qt runtime emulation or reachability proof.",
               "plugins": result}
    (args.out / "qt_moc_contracts.json").write_text(json.dumps(payload, indent=2, ensure_ascii=False), encoding="utf-8")
    with (args.out / "qt_moc_contracts.tsv").open("w", encoding="utf-8") as f:
        f.write("binary\tclass\tclass_va\tsection\tsuper\tmethod_index\tkind\taccess\tsignature\tmetacall_va\n")
        for p in result:
            for o in p["qmetaobjects"]:
                if not o["methods"]:
                    f.write(f"{p['binary']}\t{o['class_name']}\t0x{o['va']:08x}\t{o['section']}\t{o['super_class'] or ''}\t-\t-\t-\t-\t0x{o['static_metacall_va']:08x}\n")
                for m in o["methods"]:
                    f.write(f"{p['binary']}\t{o['class_name']}\t0x{o['va']:08x}\t{o['section']}\t{o['super_class'] or ''}\t{m['index']}\t{m['kind']}\t{m['access']}\t{m['signature']}\t0x{o['static_metacall_va']:08x}\n")
    for p in result:
        print(f"{p['binary']}: QMetaObjects={p['qmetaobject_count']}, methods={p['total_methods']}, signals={p['total_signals']}, connectSlotsByName={bool(p['connect_slots_by_name_imports'])}")
    print(f"Total QMetaObjects={sum(x['qmetaobject_count'] for x in result)}, methods={sum(x['total_methods'] for x in result)}, signals={sum(x['total_signals'] for x in result)}")

if __name__ == "__main__": main()
