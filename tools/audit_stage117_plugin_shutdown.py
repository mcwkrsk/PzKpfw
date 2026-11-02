#!/usr/bin/env python3
"""SHA-pinned static audit of the supplied IS.exe/plugin shutdown boundary.

This script checks import/export tables and bounded host disassembly. It does
not execute the Windows application, prove heap ownership, or rule out API
calls obtained dynamically (for example through GetProcAddress).
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import pathlib
import re
import subprocess
import sys
import struct
from typing import Dict

ROOT = pathlib.Path(__file__).resolve().parents[1]
EXPECTED = {
    "IS.exe": "ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2",
    "MAIWmodels.dll": "80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525",
    "Model_Visualiser.dll": "1187c7a59ae2dbb8eb91bebbbe89850d9724a62ff186865733930f1488bce880",
    "PM_auto.dll": "c3cbde9cb83a7c10774a0faa4541622005856d09b79ce94dec3d8bd90d083018",
    "PM_matrix_web.dll": "55d25ef0f07a069d80226abae1583928be92cf023fb66ffddbdd32b4f1a66f22",
    "PM_params.dll": "22c867d11fcc724b79fbff420f514d7adccd7a8eb7565e9b4b43e60b267ea781",
    "PM_spec_WEB.dll": "ef0365f6fd3f69648ccf28c5eb564312f70faa9bbd892543a933ec4ae7fa6d68",
}
PLUGINS = [
    "Model_Visualiser.dll", "PM_auto.dll", "PM_matrix_web.dll",
    "PM_params.dll", "PM_spec_WEB.dll",
]
RANGES = {
    "plugin_loader_0x404340.asm": (0x404340, 0x4045FA),
    "workwidget_register_0x410b10.asm": (0x410B10, 0x410BE2),
    "workwidget_destroyed_handler_0x411a00.asm": (0x411A00, 0x411AEA),
    "module_registry_destructor_0x418740.asm": (0x418740, 0x418774),
}
GETPROC_RANGES = {
    "IS.exe": (0x4147D0, 0x414890),
    "PM_auto.dll": (0x1001D010, 0x1001D0D0),
    "PM_matrix_web.dll": (0x10005E30, 0x10005EF0),
    "PM_params.dll": (0x10008260, 0x10008320),
    "PM_spec_WEB.dll": (0x10008AF0, 0x10008BA0),
}


def sha256(path: pathlib.Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def run_objdump(*args: str, path: pathlib.Path) -> str:
    proc = subprocess.run(["objdump", *args, str(path)], check=True,
                          capture_output=True, text=True)
    return proc.stdout


def disasm(binary: pathlib.Path, start: int, stop: int) -> str:
    return run_objdump(
        "-d", "-Mintel", f"--start-address=0x{start:x}",
        f"--stop-address=0x{stop:x}", path=binary,
    ).lower()


def imports(binary: pathlib.Path) -> str:
    return run_objdump("-p", path=binary).lower()


def read_pe_cstring(binary: pathlib.Path, va: int) -> str | None:
    """Read an ASCII NUL-terminated string from a PE32 virtual address."""
    data = binary.read_bytes()
    pe_offset = struct.unpack_from("<I", data, 0x3C)[0]
    section_count = struct.unpack_from("<H", data, pe_offset + 6)[0]
    optional_size = struct.unpack_from("<H", data, pe_offset + 20)[0]
    optional = pe_offset + 24
    magic = struct.unpack_from("<H", data, optional)[0]
    if magic != 0x10B:  # PE32 only; supplied binaries are PE32 x86.
        return None
    image_base = struct.unpack_from("<I", data, optional + 28)[0]
    rva = va - image_base
    section_table = optional + optional_size
    for index in range(section_count):
        offset = section_table + index * 40
        virtual_size, virtual_address, raw_size, raw_pointer = struct.unpack_from(
            "<IIII", data, offset + 8
        )
        if virtual_address <= rva < virtual_address + max(virtual_size, raw_size):
            file_offset = raw_pointer + (rva - virtual_address)
            end = data.find(b"\0", file_offset)
            if end < 0:
                return None
            try:
                return data[file_offset:end].decode("ascii")
            except UnicodeDecodeError:
                return None
    return None


def getproc_targets(binary: pathlib.Path, import_text: str) -> list[str]:
    """Recover the symbol-name arguments at every direct GetProcAddress IAT call."""
    image_base_match = re.search(r"imagebase\s+([0-9a-f]+)", import_text, re.I)
    iat_match = re.search(
        r"^\s*([0-9a-f]+)\s+<none>\s+\S+\s+getprocaddress\s*$",
        import_text, re.I | re.M,
    )
    if not image_base_match or not iat_match:
        return []
    iat_va = int(image_base_match.group(1), 16) + int(iat_match.group(1), 16)
    lines = run_objdump("-d", "-Mintel", path=binary).lower().splitlines()
    targets: list[str] = []
    for index, line in enumerate(lines):
        if not re.search(r"call\s+dword ptr ds:0x" + format(iat_va, "x") + r"\b", line):
            continue
        target_va = None
        for previous in reversed(lines[max(0, index - 6):index]):
            match = re.search(r"\bpush\s+0x([0-9a-f]+)", previous)
            if match:
                target_va = int(match.group(1), 16)
                break
        target = read_pe_cstring(binary, target_va) if target_va is not None else None
        targets.append(target if target is not None else f"<unresolved-arg@0x{target_va:x}>")
    return targets


def export_names(export_text: str) -> set[str]:
    names: set[str] = set()
    in_names = False
    for line in export_text.splitlines():
        if "[ordinal/name pointer] table" in line.lower():
            in_names = True
            continue
        if in_names:
            match = re.search(r"\]\s+\d+\s+([a-z_][a-z0-9_]*)\s*$", line.strip(), re.I)
            if match:
                names.add(match.group(1).lower())
            elif line.strip() and "pe file" in line.lower():
                break
    return names


def build(original_dir: pathlib.Path) -> tuple[dict, Dict[str, str]]:
    files: dict[str, pathlib.Path] = {
        "IS.exe": original_dir / "IS.exe",
        "MAIWmodels.dll": original_dir / "MAIWmodels.dll",
    }
    files.update({name: original_dir / "modules" / name for name in PLUGINS})

    hashes: dict[str, str] = {}
    import_text: dict[str, str] = {}
    exports: dict[str, set[str]] = {}
    for name, path in files.items():
        if not path.is_file():
            raise FileNotFoundError(f"Missing required binary: {path}")
        digest = sha256(path)
        if digest != EXPECTED[name]:
            raise ValueError(f"SHA-256 mismatch for {name}: expected {EXPECTED[name]}, got {digest}")
        hashes[name] = digest
        import_text[name] = imports(path)
        if name in PLUGINS:
            exports[name] = export_names(import_text[name])

    host = files["IS.exe"]
    chunks = {name: disasm(host, *bounds) for name, bounds in RANGES.items()}
    full_host_disassembly = run_objdump("-d", "-Mintel", path=host).lower()
    module_registry_xref_lines = [
        line.strip() for line in full_host_disassembly.splitlines()
        if "0x4696b8" in line
    ]
    module_registry_xref_addresses = [
        f"0x{int(match.group(1), 16):08X}"
        for line in module_registry_xref_lines
        if (match := re.match(r"^\s*([0-9a-f]+):", line))
    ]
    chunks["module_registry_global_xrefs.asm"] = (
        "Direct absolute-address references to 0x004696B8 in the full IS.exe .text disassembly\n"
        + "\n".join(module_registry_xref_lines) + "\n"
    )
    for binary_name, bounds in GETPROC_RANGES.items():
        snapshot_name = f"getproc_{pathlib.Path(binary_name).stem}_condition_api_resolution.asm"
        chunks[snapshot_name] = disasm(files[binary_name], *bounds)
    loader = chunks["plugin_loader_0x404340.asm"]
    registration = chunks["workwidget_register_0x410b10.asm"]
    destroyed = chunks["workwidget_destroyed_handler_0x411a00.asm"]
    registry_dtor = chunks["module_registry_destructor_0x418740.asm"]
    host_imports = import_text["IS.exe"]

    # Named imports are intentionally treated as a bounded negative result.
    no_unload_imports: dict[str, bool] = {}
    getproc_presence: dict[str, bool] = {}
    getproc_resolution_targets: dict[str, list[str]] = {}
    for name, text in import_text.items():
        no_unload_imports[name] = not any(token in text for token in (
            "freelibrary", "loadlibrarya", "loadlibraryw", "?unload@qlibrary",
        ))
        getproc_presence[name] = "getprocaddress" in text
        if getproc_presence[name]:
            getproc_resolution_targets[name] = getproc_targets(files[name], text)

    expected_condition_apis = [
        "InitializeConditionVariable", "SleepConditionVariableCS", "WakeAllConditionVariable"
    ]
    checks = {
        "loader_constructs_local_qlibrary": "ff 15 a4 92 41 00" in loader,
        "loader_resolves_loadModule": "ff 15 9c 92 41 00" in loader and "0x457a98" in loader,
        "loader_invokes_resolved_factory": "404461:\tff d0" in loader,
        "loader_calls_descriptor_getter_slot_plus_8": "40446c:\tff 50 08" in loader,
        "loader_stores_descriptor_at_module_plus_4": "40446f:\t89 47 04" in loader,
        "loader_calls_create_widgets_slot_plus_4": "404476:\tff 50 04" in loader,
        "loader_calls_post_create_slot_zero": "40447d:\tff 10" in loader,
        "loader_registers_each_workwidget": "call   0x410b10" in loader,
        "loader_stores_module_backpointer_on_widget_plus_18": "4044cc:\t89 7e 18" in loader,
        "loader_appends_module_wrapper_to_registry_4696b8": "40451a:" in loader and "0x4696b8" in loader and "0x404c50" in loader,
        "loader_destroys_stack_qlibrary_object": "4045bd:\tff 15 a0 92 41 00" in loader,
        "register_calls_workwidget_virtual_cc": "[eax+0xcc]" in registration,
        "register_calls_workwidget_virtual_c8": "[eax+0xc8]" in registration,
        "register_calls_workwidget_virtual_b8": "[eax+0xb8]" in registration,
        "register_adds_workwidget_to_host_list_plus_30": "lea    ecx,[edi+0x30]" in registration,
        "register_calls_workwidget_menu_factory_b4": "[eax+0xb4]" in registration,
        "destroy_handler_uses_qobject_sender": "0x4191d4" in destroyed,
        "destroy_handler_removes_tab_page": "0x419884" in destroyed,
        "destroy_handler_removes_host_registry_entry": "0x4192b0" in destroyed and "0x419234" in destroyed,
        "destroy_handler_does_not_reference_module_registry": "0x4696b8" not in destroyed,
        "registry_dtor_reads_global_module_registry": "0x4696b8" in registry_dtor,
        "registry_dtor_deallocates_four_byte_pointer_storage": "push   0x4" in registry_dtor and "0x4192e0" in registry_dtor,
        "registry_dtor_has_no_module_pointer_iteration": "call   " not in "\n".join(
            line for line in registry_dtor.splitlines() if "4187" in line and "4192e0" not in line
        ),
        "host_module_registry_xrefs_are_bounded_to_init_loader_append_and_static_dtor": (
            module_registry_xref_addresses == [
                "0x004010DB", "0x0040451A", "0x00418740", "0x0041875F"
            ]
        ),
        "host_imports_qlibrary_constructor": "??0qlibrary@@" in host_imports,
        "host_imports_qlibrary_resolve": "?resolve@qlibrary@@" in host_imports,
        "host_imports_qlibrary_destructor": "??1qlibrary@@" in host_imports,
        "host_has_no_named_qlibrary_unload_import": "?unload@qlibrary" not in host_imports,
        "all_plugins_export_loadModule": all("loadmodule" in exports[name] for name in PLUGINS),
        "no_plugin_exports_unloadModule": all("unloadmodule" not in exports[name] for name in PLUGINS),
        "all_binaries_have_no_named_loader_or_unloader_imports": all(no_unload_imports.values()),
        "all_getprocaddress_call_sites_resolve_only_condition_variable_apis": all(
            targets == expected_condition_apis for targets in getproc_resolution_targets.values()
        ),
        "getprocaddress_iat_call_count_is_three_per_calling_binary": all(
            len(targets) == 3 for targets in getproc_resolution_targets.values()
        ),
    }

    module_evidence = {}
    for name in PLUGINS:
        module_evidence[name] = {
            "sha256": hashes[name],
            "exports": sorted(exports[name]),
            "getprocaddress_import_present": getproc_presence[name],
            "no_named_freelibrary_loadlibrary_or_qlibrary_unload_import": no_unload_imports[name],
        }

    result = {
        "audit": "stage117-plugin-module-shutdown-boundary",
        "static_only": True,
        "host": "IS.exe",
        "host_sha256": hashes["IS.exe"],
        "binary_sha256": hashes,
        "plugin_exports_and_imports": module_evidence,
        "loader": {
            "entry_va": "0x00404340",
            "library_object": "stack-local QLibrary at [ebp-0x4c]",
            "resolve_symbol": "loadModule",
            "factory_via_resolved_function_pointer": "0x00404461",
            "vtable_call_order": ["+0x08 descriptor getter", "+0x04 create widgets", "+0x00 post-create"],
            "module_registry_global": "0x004696B8",
            "path_registry_global": "0x004696B4",
            "workwidget_module_backpointer": "+0x18",
            "stack_qlibrary_destructor_call": "0x004045BD",
        },
        "registration": {
            "entry_va": "0x00410B10",
            "workwidget_virtual_offsets": ["+0xCC", "+0xC8", "+0xB8", "+0xB4 menu factory"],
            "host_workwidget_list_member": "MainForm+0x30",
        },
        "destroy_handler": {
            "entry_va": "0x00411A00",
            "actions": [
                "obtain QObject::sender()",
                "find and remove matching tab page from QTabWidget",
                "find and remove matching WorkWidget* from MainForm+0x30 list",
            ],
            "does_not_reference_module_registry_global": True,
            "does_not_establish_IsModule_or_MenuWidget_destruction": True,
        },
        "module_registry_destructor": {
            "entry_va": "0x00418740",
            "global": "0x004696B8",
            "observed_cleanup": "QArrayData::deallocate for pointer-sized (4-byte) QList storage",
            "pointee_destructor_loop_observed": False,
        },
        "module_registry_global_xrefs": {
            "global": "0x004696B8",
            "host_full_text_disassembly_reference_count": len(module_registry_xref_addresses),
            "reference_instruction_addresses": module_registry_xref_addresses,
            "interpretation": [
                "0x004010DB: static initialization writes the initialized Qt list data pointer",
                "0x0040451A: loader passes the global list to the append helper",
                "0x00418740 and 0x0041875F: static destructor reads/releases the list backing storage",
            ],
            "scope": "direct absolute-address references found by scanning the full IS.exe .text disassembly; indirect aliases or pointers copied elsewhere are outside this xref test",
        },
        "qlibrary": {
            "imports": ["QLibrary constructor", "QLibrary::resolve", "QLibrary destructor"],
            "QLibrary_unload_import_present": False,
            "FreeLibrary_or_LoadLibrary_named_import_present_in_host_or_plugins": False,
            "getprocaddress_imports": [name for name, present in getproc_presence.items() if present],
            "getprocaddress_resolution_targets": getproc_resolution_targets,
            "interpretation": "The local QLibrary wrapper is destroyed, but this is not an explicit unload call. All direct GetProcAddress IAT call sites found in the five importing binaries resolve only InitializeConditionVariable, SleepConditionVariableCS and WakeAllConditionVariable; this is not an observed dynamic FreeLibrary resolution.",
        },
        "checks": checks,
        "passed": sum(bool(value) for value in checks.values()),
        "total": len(checks),
        "status": "PASS" if all(checks.values()) else "FAIL",
        "limitations": [
            "Static PE import/export inspection and bounded host disassembly only; no Windows runtime or heap/destructor trace was run.",
            "The absence of named FreeLibrary/LoadLibrary/QLibrary::unload imports does not rule out every possible indirect call. However, all direct GetProcAddress IAT call sites in the host and four importing plugins were traced to InitializeConditionVariable, SleepConditionVariableCS and WakeAllConditionVariable; no dynamically resolved FreeLibrary call was observed.",
            "The QLibrary documentation describes normal Qt behavior; the exact runtime behavior of this binary still requires execution against its bundled Qt 5 runtime.",
            "The handler's bounded instructions do not establish ownership of MenuWidget or the fate of IsModule and descriptor allocations.",
            "Registry backing-store deallocation does not imply deletion of IsModule pointees; no pointee destruction loop appears in the bounded static destructor.",
            "No conclusion is made that process-lifetime retention is necessarily a leak; it may be intentional host design.",
        ],
        "external_reference": "https://doc.qt.io/qt-5.12/qlibrary.html",
    }
    return result, chunks


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--original-dir", type=pathlib.Path,
                        default=pathlib.Path(os.environ.get("IS2_ORIGINAL_DIR", ROOT.parent / "original")))
    parser.add_argument("--out", type=pathlib.Path,
                        default=ROOT / "analysis/plugins/plugin_shutdown_audit.json")
    parser.add_argument("--snapshot-dir", type=pathlib.Path,
                        default=ROOT / "analysis/disassembly")
    args = parser.parse_args()
    try:
        result, chunks = build(args.original_dir)
    except (OSError, subprocess.CalledProcessError, ValueError) as exc:
        print(str(exc), file=sys.stderr)
        return 2

    if args.snapshot_dir:
        args.snapshot_dir.mkdir(parents=True, exist_ok=True)
        for name, body in chunks.items():
            (args.snapshot_dir / name).write_text(body, encoding="utf-8")

    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return 0 if result["status"] == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
