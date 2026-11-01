#!/usr/bin/env python3
"""Recover the pinned IS.exe MainForm MOC and plugin-lifetime evidence.

This is a narrow PE32 metadata reader plus objdump evidence exporter. It does
not decompile C++, execute the application, or claim runtime behaviour.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import shutil
import struct
import subprocess
from pathlib import Path
from typing import Any

EXPECTED_SHA256 = "ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2"
EXPECTED_PM_AUTO_SHA256 = "c3cbde9cb83a7c10774a0faa4541622005856d09b79ce94dec3d8bd90d083018"
IMAGE_BASE = 0x400000
STRING_TABLE_VA = 0x457350
STRING_COUNT = 14
META_VA = 0x457500
DISPATCH_TABLE_VA = 0x4032D0

# Direct-call targets recovered from qt_static_metacall's nine-way dispatch.
# Entry 8 is the virtual MainForm::showEvent(QShowEvent*) dispatch.
HANDLERS = [
    {"index": 0, "target_va": "0x00411A00", "dispatch": "direct tail jump"},
    {"index": 1, "target_va": "0x004115C0", "dispatch": "direct call; argument dereferenced as int"},
    {"index": 2, "target_va": "0x004119A0", "dispatch": "direct tail jump"},
    {"index": 3, "target_va": "0x004119E0", "dispatch": "direct tail jump"},
    {"index": 4, "target_va": "0x00411760", "dispatch": "direct tail jump"},
    {"index": 5, "target_va": "0x00411550", "dispatch": "direct tail jump"},
    {"index": 6, "target_va": "0x004114D0", "dispatch": "direct tail jump"},
    {"index": 7, "target_va": "0x00411410", "dispatch": "direct tail jump"},
    {"index": 8, "target_va": None, "dispatch": "virtual call through MainForm vtable +0x98"},
]

RANGES = [
    (0x403250, 0x4032F0, "MainForm qt_static_metacall and dispatch jump table"),
    (0x410B10, 0x410BE4, "MainForm WorkWidget registration and destroyed() connection"),
    (0x410C80, 0x410D50, "Qt QListData detach helper reached before registry removal"),
    (0x411A00, 0x411AF0, "MainForm::on_workWidget_destroyed"),
    (0x404320, 0x404340, "module QListData collection copy/assignment helper"),
    (0x404340, 0x4045FB, "IS.exe module loader / loadModule resolution"),
    (0x403B10, 0x403BA0, "Qt shared-handle copy/refcount helper"),
    (0x418730, 0x418780, "static destructors for module-name and raw module-pointer lists"),
]


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for block in iter(lambda: f.read(1024 * 1024), b""):
            h.update(block)
    return h.hexdigest()


class PE32:
    def __init__(self, path: Path):
        self.data = path.read_bytes()
        if self.data[:2] != b"MZ":
            raise ValueError("Not an MZ/PE file")
        pe_off = struct.unpack_from("<I", self.data, 0x3C)[0]
        if self.data[pe_off:pe_off + 4] != b"PE\0\0":
            raise ValueError("PE signature not found")
        sections_n = struct.unpack_from("<H", self.data, pe_off + 6)[0]
        opt_size = struct.unpack_from("<H", self.data, pe_off + 20)[0]
        opt = pe_off + 24
        magic = struct.unpack_from("<H", self.data, opt)[0]
        if magic != 0x10B:
            raise ValueError(f"Expected PE32 optional header 0x10b, got {magic:#x}")
        self.image_base = struct.unpack_from("<I", self.data, opt + 28)[0]
        sec_base = opt + opt_size
        self.sections = []
        for i in range(sections_n):
            p = sec_base + i * 40
            name = self.data[p:p + 8].split(b"\0", 1)[0].decode("ascii", "replace")
            virtual_size, virtual_address, raw_size, raw_ptr = struct.unpack_from("<IIII", self.data, p + 8)
            self.sections.append((name, virtual_address, virtual_size, raw_size, raw_ptr))

    def offset(self, va: int) -> int:
        rva = va - self.image_base
        for _, va0, vsize, raw_size, raw_ptr in self.sections:
            span = max(vsize, raw_size)
            if va0 <= rva < va0 + span:
                off = raw_ptr + rva - va0
                if off >= len(self.data):
                    break
                return off
        raise ValueError(f"VA is not backed by file data: {va:#x}")

    def u32(self, va: int) -> int:
        return struct.unpack_from("<I", self.data, self.offset(va))[0]

    def i32(self, va: int) -> int:
        return struct.unpack_from("<i", self.data, self.offset(va))[0]

    def bytes_at(self, va: int, count: int) -> bytes:
        off = self.offset(va)
        return self.data[off:off + count]

    def cstring_at(self, va: int, length: int) -> str:
        return self.bytes_at(va, length).decode("utf-8", "replace")


def decode_moc(pe: PE32) -> dict[str, Any]:
    strings = []
    for i in range(STRING_COUNT):
        entry_va = STRING_TABLE_VA + 16 * i
        size = pe.u32(entry_va + 4)
        relative = pe.i32(entry_va + 12)
        string_va = entry_va + relative
        value = pe.cstring_at(string_va, size)
        strings.append({"index": i, "va": f"0x{string_va:08X}", "value": value})

    header = [pe.u32(META_VA + 4 * i) for i in range(14)]
    revision, class_name_idx, _ci_count, _ci_data, method_count, method_data = header[:6]
    if revision != 7 or class_name_idx >= len(strings) or strings[class_name_idx]["value"] != "MainForm":
        raise ValueError("Unexpected MainForm QMetaObject header")
    methods = []
    method_base = META_VA + method_data * 4
    for i in range(method_count):
        row = [pe.u32(method_base + i * 20 + j * 4) for j in range(5)]
        name_index, argc, parameter_data, tag_index, flags = row
        if name_index >= len(strings):
            raise ValueError(f"Invalid MOC method name index {name_index}")
        methods.append({
            "index": i,
            "name": strings[name_index]["value"],
            "argc": argc,
            "parameter_data_index": parameter_data,
            "tag_index": tag_index,
            "flags": flags,
            **HANDLERS[i],
        })
    return {
        "revision": revision,
        "class": strings[class_name_idx]["value"],
        "method_count": method_count,
        "method_data_index": method_data,
        "strings": strings,
        "methods": methods,
        "metadata_va": f"0x{META_VA:08X}",
        "string_table_va": f"0x{STRING_TABLE_VA:08X}",
        "dispatch_table_va": f"0x{DISPATCH_TABLE_VA:08X}",
        "dispatch_case_entries": [f"0x{pe.u32(DISPATCH_TABLE_VA + i * 4):08X}" for i in range(method_count)],
    }


def run_objdump(binary: Path, start: int, stop: int) -> str:
    objdump = shutil.which("objdump")
    if not objdump:
        raise RuntimeError("GNU objdump is required for the disassembly evidence export")
    p = subprocess.run(
        [objdump, "-d", "-Mintel", f"--start-address={start:#x}", f"--stop-address={stop:#x}", str(binary)],
        check=True, capture_output=True, text=True,
    )
    return p.stdout


def run_objdump_full(binary: Path, mode: str) -> str:
    objdump = shutil.which("objdump")
    if not objdump:
        raise RuntimeError("GNU objdump is required for reproducibility checks")
    p = subprocess.run([objdump, mode, str(binary)], check=True, capture_output=True, text=True)
    return p.stdout


def direct_xrefs(disassembly: str, address: str) -> list[str]:
    needle = address.lower()
    found = []
    for line in disassembly.splitlines():
        if needle in line.lower() and ":" in line:
            token = line.strip().split(":", 1)[0]
            try:
                found.append(f"0x{int(token, 16):08X}")
            except ValueError:
                continue
    return found


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("binary", type=Path, help="Exact IS.exe from the supplied starter pack")
    ap.add_argument("--pm-auto", type=Path, help="Matching PM_auto.dll to verify QListData::append producer side")
    ap.add_argument("--out-json", type=Path, required=True)
    ap.add_argument("--out-asm", type=Path, required=True)
    args = ap.parse_args()

    digest = sha256(args.binary)
    if digest != EXPECTED_SHA256:
        raise SystemExit(f"Refusing unverified binary: SHA-256 {digest}; expected {EXPECTED_SHA256}")

    pe = PE32(args.binary)
    if pe.image_base != IMAGE_BASE:
        raise SystemExit(f"Unexpected image base: {pe.image_base:#x}")
    moc = decode_moc(pe)
    full_disassembly = run_objdump_full(args.binary, "-d")
    import_table = run_objdump_full(args.binary, "-p")
    raw_list_xrefs = direct_xrefs(full_disassembly, "4696b8")
    names_list_xrefs = direct_xrefs(full_disassembly, "4696b4")
    expected_raw_xrefs = ["0x004010DB", "0x0040451A", "0x00418740", "0x0041875F"]
    expected_name_xrefs = ["0x004010BB", "0x00404368", "0x00404527", "0x00418730"]
    if raw_list_xrefs != expected_raw_xrefs or names_list_xrefs != expected_name_xrefs:
        raise SystemExit(f"Registry xrefs changed: raw={raw_list_xrefs}, names={names_list_xrefs}")
    required_imports = ["?resolve@QLibrary", "??1QLibrary", "?size@QListData", "?remove@QListData", "?at@QListData", "?begin@QListData", "?end@QListData", "?detach@QListData", "?dispose@QListData"]
    missing_imports = [item for item in required_imports if item not in import_table]
    if missing_imports:
        raise SystemExit(f"Expected imports not found: {missing_imports}")
    qlibrary_unload_import = "?unload@QLibrary" in import_table
    if args.pm_auto is None:
        raise SystemExit("--pm-auto is required to verify the producer-side QListData::append call")
    pm_digest = sha256(args.pm_auto)
    if pm_digest != EXPECTED_PM_AUTO_SHA256:
        raise SystemExit(f"Refusing unverified PM_auto.dll: SHA-256 {pm_digest}; expected {EXPECTED_PM_AUTO_SHA256}")
    pm_import_table = run_objdump_full(args.pm_auto, "-p")
    if "?append@QListData" not in pm_import_table:
        raise SystemExit("Expected QListData::append import not found in PM_auto.dll")
    expected_names = [
        "on_workWidget_destroyed", "on_tabMenu_currentChanged", "on_tb_max_clicked",
        "on_tb_min_clicked", "on_tb_close_clicked", "on_pbR_clicked",
        "on_pbOpenHome_clicked", "on_pbFeedback_clicked", "showEvent",
    ]
    actual_names = [m["name"] for m in moc["methods"]]
    if actual_names != expected_names:
        raise SystemExit(f"Unexpected MOC method ordering: {actual_names}")

    json_data = {
        "schema": "is2.mainform.lifecycle.v1",
        "static_only": True,
        "binary": args.binary.name,
        "sha256": digest,
        "producer_binary": args.pm_auto.name,
        "producer_sha256": pm_digest,
        "image_base": f"0x{pe.image_base:08X}",
        "moc": moc,
        "host_lifecycle": {
            "registration_va": "0x00410B10",
            "destroyed_handler_va": "0x00411A00",
            "destroyed_signal": "2destroyed()",
            "receiver_slot": "1on_workWidget_destroyed()",
            "connection_type": 0,
            "handler_actions": [
                "QObject::sender() obtains the WorkWidget being destroyed",
                "read WorkWidget+0x20 to get the paired MenuWidget pointer",
                "scan QTabWidget at MainForm+0x80 and remove matching tab",
                "scan QListData registry at MainForm+0x30 and locate WorkWidget*",
                "if backing data is shared, call Qt QListData::detach before mutation",
                "remove the matching pointer entry with QListData::remove(index)",
            ],
            "handler_does_not_call": [
                "WorkWidget destructor",
                "MenuWidget destructor",
                "IsModule destructor or operator delete",
                "QObject::deleteLater for the paired MenuWidget",
                "QLibrary::unload",
            ],
        },
        "module_registry": {
            "raw_module_pointer_list_global": "0x004696B8",
            "module_name_list_global": "0x004696B4",
            "pointer_list_direct_reference_sites": raw_list_xrefs,
            "name_list_direct_reference_sites": names_list_xrefs,
            "pointer_list_static_dtor_va": "0x00418740",
            "pointer_list_static_dtor_effect": "decrements QListData shared refcount and disposes storage; no per-pointee destructor loop observed",
            "module_object_deletion": "no direct deletion xref found in IS.exe; module pointers are stored raw in the registry",
            "caveat": "Static xref absence is not proof that no indirect or plugin-local destruction path exists.",
        },
        "module_workwidget_collection": {
            "module_field_offset": "+0x0C",
            "assignment_helper_va": "0x00404320",
            "container_copy_helper_va": "0x00403B10",
            "plugin_append_example": {"dll": "PM_auto.dll", "sha256": pm_digest, "append_helper_va": "0x100095B0", "QListData_append_iat": "0x10022378"},
            "evidence": "PM_auto.dll:0x100095B0 calls imported QListData::append and stores the raw widget pointer in the module member; IS.exe:0x00403B10 calls QListData::detach/begin/end and performs atomic Data refcount operations. This is a Qt QList/QListData-style collection of WorkWidget pointers, not a per-widget QSharedPointer. Exact C++ wrapper specialization is not recovered.",
        },
        "qlibrary_imports": {
            "observed": ["QLibrary constructor", "QLibrary::resolve", "QLibrary destructor"],
            "QLibrary_unload_import_present": qlibrary_unload_import,
            "QListData_imports_confirmed": required_imports[2:],
            "detach_helper_va": "0x00410C80",
            "detach_helper_effect": "Qt QListData::detach; performs copy-on-write of shared container storage before remove(index), not a plugin/widget destructor or application cleanup callback",
            "note": "The analyzed IS.exe import table contains no QLibrary::unload import. This supports process-lifetime loading but cannot exclude indirect resolution or a call from another module.",
        },
        "evidence_limits": [
            "No Windows runtime execution was performed.",
            "No Ghidra/IDA decompiler output is claimed; this is PE metadata parsing plus objdump disassembly.",
            "Potential dangling MenuWidget+0x18 -> WorkWidget pointer is static risk only, not a demonstrated crash.",
        ],
    }
    args.out_json.parent.mkdir(parents=True, exist_ok=True)
    args.out_json.write_text(json.dumps(json_data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

    chunks = []
    for start, stop, title in RANGES:
        chunks.append(f"\n===== {title} [{start:#010x}..{stop:#010x}) =====\n")
        chunks.append(run_objdump(args.binary, start, stop))
    chunks.append("\n===== PM_auto WorkWidget collection producer [0x100027D0..0x10002844) =====\n")
    chunks.append(run_objdump(args.pm_auto, 0x100027D0, 0x10002844))
    chunks.append("\n===== PM_auto QListData append helper [0x100095B0..0x10009630) =====\n")
    chunks.append(run_objdump(args.pm_auto, 0x100095B0, 0x10009630))
    args.out_asm.parent.mkdir(parents=True, exist_ok=True)
    args.out_asm.write_text("".join(chunks), encoding="utf-8")
    print(f"Verified {args.binary.name}: sha256={digest}")
    print(f"Verified {args.pm_auto.name}: sha256={pm_digest}")
    print(f"Decoded {moc['method_count']} MainForm MOC methods")
    print(f"Wrote {args.out_json} and {args.out_asm}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
