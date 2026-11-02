#!/usr/bin/env python3
"""Audit how IS.exe copies/consumes IsModule's widget QList and handles widget destruction.

Static, SHA-pinned evidence only. Requires Python 3 and GNU objdump.
"""
from __future__ import annotations
import argparse, hashlib, json, re, subprocess
from pathlib import Path

EXPECTED_SHA256 = "ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2"
EXPECTED_IAT = {
    0x41938C: "?end@QListData@@QBEPAPAXXZ",
    0x419390: "?begin@QListData@@QBEPAPAXXZ",
    0x419230: "?size@QListData@@QBEHXZ",
    0x4192B0: "?at@QListData@@QBEPAPAXH@Z",
    0x419234: "?remove@QListData@@QAEXH@Z",
}

def objdump(*args: str) -> str:
    p = subprocess.run(["objdump", *args], check=True, text=True,
                       stdout=subprocess.PIPE, stderr=subprocess.PIPE, errors="replace")
    return p.stdout

def function(path: Path, start: int, stop: int) -> str:
    return objdump("-d", "-Mintel", f"--start-address={start:#x}", f"--stop-address={stop:#x}", str(path))

def parse_iat(path: Path) -> dict[int, str]:
    txt = objdump("-p", str(path))
    out: dict[int, str] = {}
    for line in txt.splitlines():
        m = re.match(r"\s*([0-9a-fA-F]{8})\s+<none>\s+[0-9a-fA-F]+\s+(.+?)\s*$", line)
        if m:
            out[0x400000 + int(m.group(1), 16)] = m.group(2)
    return out

def require(pattern: str, text: str, label: str) -> None:
    if not re.search(pattern, text, re.I):
        raise SystemExit(f"IS.exe evidence mismatch: {label}")

def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("binary_root", type=Path, help="Extracted IS2_PMauto_beta root")
    ap.add_argument("--out", type=Path, default=Path("analysis/host_interface/module_widget_consumption.json"))
    ap.add_argument("--asm-out", type=Path, default=Path("analysis/disassembly/module_widget_consumption.asm"))
    args = ap.parse_args()
    exe = args.binary_root / "IS.exe"
    digest = hashlib.sha256(exe.read_bytes()).hexdigest()
    if digest != EXPECTED_SHA256:
        raise SystemExit(f"REFUSING IS.exe: SHA-256 mismatch ({digest})")

    iat = parse_iat(exe)
    for va, name in EXPECTED_IAT.items():
        if iat.get(va) != name:
            raise SystemExit(f"IAT mismatch at {va:#x}: expected {name!r}, got {iat.get(va)!r}")

    copy_helper = function(exe, 0x404320, 0x404340)
    require(r"lea\s+eax,\s*\[ecx\+0xc\]", copy_helper, "helper reads IsModule+0x0c")
    require(r"call\s+0x403b10", copy_helper, "helper copies QList through 0x403b10")

    range_helper = function(exe, 0x403ad0, 0x403b10)
    require(r"call\s+0x403b10", range_helper, "range helper copies list")
    require(r"call\s+DWORD PTR ds:0x419390", range_helper, "range helper obtains QList begin")
    require(r"call\s+DWORD PTR ds:0x41938c", range_helper, "range helper obtains QList end")
    require(r"mov\s+DWORD PTR \[esi\+0x4\],eax", range_helper, "range helper stores begin")
    require(r"mov\s+DWORD PTR \[esi\+0x8\],eax", range_helper, "range helper stores end")
    require(r"mov\s+DWORD PTR \[esi\+0xc\],0x1", range_helper, "range helper marks snapshot initialized")

    loader = function(exe, 0x404340, 0x404560)
    require(r"call\s+0x404320", loader, "loader snapshots module widget list")
    require(r"call\s+0x403ad0", loader, "loader constructs iterator/range wrapper")
    require(r"mov\s+esi,DWORD PTR \[ecx\]", loader, "loader dereferences WorkWidget pointer from list")
    require(r"call\s+0x410b10", loader, "loader registers each WorkWidget")
    require(r"mov\s+DWORD PTR \[esi\+0x18\],edi", loader, "loader writes owning IsModule back-pointer")
    require(r"mov\s+ecx,0x4696b8", loader, "loader appends module to global registry")
    require(r"call\s+0x404c50", loader, "global registry append helper")

    destroyed = function(exe, 0x411A00, 0x411AEA)
    require(r"mov\s+eax,DWORD PTR \[ebx\+0x20\]", destroyed, "destroy handler uses WorkWidget+0x20 menu pointer")
    require(r"add\s+edi,0x30", destroyed, "destroy handler operates on MainForm+0x30 list")
    require(r"call\s+DWORD PTR ds:0x419234", destroyed, "destroy handler removes from MainForm QList")
    if re.search(r"\[ebx\+0x18\]", destroyed, re.I):
        raise SystemExit("destroy handler unexpectedly reads WorkWidget+0x18; review changed binary")

    result = {
        "static_only": True,
        "binary": "IS.exe",
        "sha256": digest,
        "module_widget_list": {
            "source_member_offset": "0x0c",
            "copy_helper_va": "0x00404320",
            "range_helper_va": "0x00403ad0",
            "list_copy": "Qt QList implicit-sharing copy; source is IsModule+0x0c",
            "iteration": "begin/end pointers are cached in a local range wrapper; each pointer-sized entry is treated as WorkWidget*",
            "registration_helper_va": "0x00410b10",
            "back_pointer_written": "WorkWidget+0x18 = owning IsModule*",
            "registry_append_va": "0x00404c50",
            "module_registry_global_va": "0x004696b8"
        },
        "destroy_handler": {
            "function_va": "0x00411a00",
            "menu_pointer_offset": "WorkWidget+0x20",
            "mainform_widget_list_offset": "MainForm+0x30",
            "operation": "remove destroyed WorkWidget from MainForm+0x30 QList and remove its menu tab",
            "reads_workwidget_owner_back_pointer_0x18": False,
            "touches_IsModule_widget_list_0x0c": False,
            "interpretation": "no module-side list removal is present in this bounded handler; possible stale raw pointer if widget dies after registration"
        },
        "caveat": "This proves absence only in the bounded destroy handler and traced registration path, not absence of every indirect cleanup path in all loaded code. No runtime test was performed."
    }
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(result, indent=2), encoding="utf-8")
    asm = [
        "; Stage 1.9 — host consumption of IsModule+0x0c widget list\n",
        "; Static analysis only; SHA-256 pinned IS.exe; GNU objdump.\n",
        "; 0x404320: snapshot/copy source list from this+0x0c\n", copy_helper,
        "; 0x403ad0: create begin/end wrapper around copied QList\n", range_helper,
        "; 0x404340: module loader, list enumeration and WorkWidget registration\n", loader,
        "; 0x411a00: WorkWidget destroyed handler\n", destroyed,
    ]
    args.asm_out.parent.mkdir(parents=True, exist_ok=True)
    args.asm_out.write_text("\n".join(asm), encoding="utf-8")
    print("host_widget_list_snapshot=PASS WorkWidget_owner_backptr=PASS destroy_handler_no_module_list_remove=PASS SHA256=PASS")

if __name__ == "__main__":
    main()
