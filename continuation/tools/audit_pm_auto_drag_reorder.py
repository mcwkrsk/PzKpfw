#!/usr/bin/env python3
"""SHA-pinned static audit of PM_auto drag/reorder and MAIWmodels movieElementTo.

Uses GNU objdump only. Addresses are specific to the supplied PE32 binaries.
No binary is executed and no project file is modified.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import shutil
import subprocess
import sys
from pathlib import Path

EXPECTED = {
    "pm_auto": "c3cbde9cb83a7c10774a0faa4541622005856d09b79ce94dec3d8bd90d083018",
    "models": "80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525",
}


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def run_objdump(args: list[str]) -> str:
    exe = shutil.which("objdump")
    if not exe:
        raise RuntimeError("GNU objdump is required but was not found on PATH")
    p = subprocess.run([exe, *args], text=True, stdout=subprocess.PIPE,
                       stderr=subprocess.STDOUT, check=False)
    if p.returncode:
        raise RuntimeError(f"objdump failed ({p.returncode}): {' '.join(args)}\n{p.stdout}")
    return p.stdout


def require(text: str, token: str, label: str, failures: list[str]) -> None:
    if token not in text:
        failures.append(f"missing {label}: {token}")


def audit(pm_path: Path, models_path: Path, out_dir: Path) -> dict:
    actual_pm = sha256(pm_path)
    actual_models = sha256(models_path)
    if actual_pm != EXPECTED["pm_auto"]:
        raise RuntimeError(f"PM_auto.dll SHA-256 mismatch: {actual_pm}")
    if actual_models != EXPECTED["models"]:
        raise RuntimeError(f"MAIWmodels.dll SHA-256 mismatch: {actual_models}")

    pm_imp = run_objdump(["-p", str(pm_path)])
    models_pe = run_objdump(["-p", str(models_path)])
    pm_drag = run_objdump(["-d", "-Mintel", "--start-address=0x100064f0",
                           "--stop-address=0x10006780", str(pm_path)])
    pm_double = run_objdump(["-d", "-Mintel", "--start-address=0x10006eb0",
                             "--stop-address=0x10006f30", str(pm_path)])
    core_move = run_objdump(["-d", "-Mintel", "--start-address=0x1000c020",
                             "--stop-address=0x1000c140", str(models_path)])
    core_wrapper = run_objdump(["-d", "-Mintel", "--start-address=0x1000c140",
                                "--stop-address=0x1000c160", str(models_path)])
    pm_selection = run_objdump(["-d", "-Mintel", "--start-address=0x10015990",
                                "--stop-address=0x10015b80", str(pm_path)])
    pm_signal_emit = run_objdump(["-d", "-Mintel", "--start-address=0x10017a40",
                                  "--stop-address=0x10017a70", str(pm_path)])

    failures: list[str] = []
    for token, label in [
        ("?movieElementTo@AFStructure@@QAEXPAVAFElement@@00@Z", "movieElementTo import/export"),
        ("?getDynamicStructure@AbstractModel@@QAEPAVAFStructure@@H@Z", "dynamic structure import"),
        ("?takeChild@QStandardItem@@QAEPAV1@HH@Z", "QStandardItem::takeChild import"),
        ("?insertRow@QStandardItem@@QAEXHPAV1@@Z", "QStandardItem::insertRow import"),
        ("?removeRow@QStandardItem@@QAEXH@Z", "QStandardItem::removeRow import"),
        ("?setCurrentWidget@QTabWidget@@QAEXPAVQWidget@@@Z", "QTabWidget::setCurrentWidget import"),
        ("?activate@QMetaObject@@SAXPAVQObject@@PBU1@HPAPAX@Z", "QMetaObject::activate import"),
    ]:
        require(pm_imp, token, label, failures)
    for token, label in [
        ("?movieElementTo@AFStructure@@QAEXPAVAFElement@@00@Z", "movieElementTo export"),
        ("?movieToElementary@AFStructure@@QAEXPAVAFElement@@0@Z", "movieToElementary export"),
        ("?addArragmentLink@AFStructure@@QAEXPAVAFElement@@00@Z", "addArragmentLink export"),
        ("?addCompositionLink@AFStructure@@QAEXPAVAFElement@@0@Z", "addCompositionLink export"),
        ("?codeStructure@AFStructure@@QAEXXZ", "codeStructure export"),
    ]:
        require(models_pe, token, label, failures)
    for token, label in [
        ("0x10022608", "takeChild callsite"),
        ("0x10022614", "removeRow callsite"),
        ("0x10022610", "insertRow callsite"),
        ("0x100220b8", "getDynamicStructure callsite"),
        ("0x10022084", "movieElementTo callsite"),
        ("0x1d0", "DiagramBlock AFElement field offset"),
        ("0x1d4", "DiagramBlock owner field offset"),
    ]:
        require(pm_drag.lower(), token.lower(), label, failures)
    for token, label in [
        ("0x10009780", "getPrew"),
        ("0x100095d0", "getNext"),
        ("0x10009640", "getNextLink"),
        ("0x100097f0", "getPrewLink"),
        ("0x10009720", "getParentLink"),
        ("0x10003320", "unlink"),
        ("0x100032f0", "removeFromList"),
        ("0x1000add0", "addArragmentLink"),
        ("0x1000aeb0", "addCompositionLink"),
        ("0x1000b100", "codeStructure"),
    ]:
        require(core_move.lower(), token.lower(), label, failures)
    require(pm_double.lower(), "0x100228d0", "QTabWidget::setCurrentWidget call", failures)
    for token, label in [
        ("0x10013d60", "coordinate collection lookup"),
        ("0x10013ce0", "coordinate collection item access"),
        ("0x10017a40", "selection signal emitter call"),
        ("0x1c0", "selected DiagramBlock state byte"),
        ("0x70", "coordinate bound X/Y fields"),
        ("0x74", "coordinate bound Y/X fields"),
    ]:
        require(pm_selection.lower(), token.lower(), label, failures)
    for token, label in [
        ("0x1005bc90", "FunctionalDiagram static metaobject"),
        ("0x10022444", "QMetaObject::activate IAT"),
    ]:
        require(pm_signal_emit.lower(), token.lower(), label, failures)
    if failures:
        raise RuntimeError("Static audit failed:\n- " + "\n- ".join(failures))

    out_dir.mkdir(parents=True, exist_ok=True)
    disasm = (
        "; PM_auto.dll:0x100064F0 itemDraged callback\n" + pm_drag +
        "\n; MAIWmodels.dll:0x1000C020 AFStructure::movieElementTo\n" + core_move +
        "\n; PM_auto.dll:0x10006EB0 itemDoubleClick callback\n" + pm_double +
        "\n; MAIWmodels.dll:0x1000C140 AFStructure::movieToElementary\n" + core_wrapper +
        "\n; PM_auto.dll:0x10015990 coordinate selection helper\n" + pm_selection +
        "\n; PM_auto.dll:0x10017A40 FunctionalDiagram selectionChanged emitter\n" + pm_signal_emit
    )
    (out_dir / "drag_reorder.asm").write_text(disasm, encoding="utf-8")
    result = {
        "status": "passed",
        "evidence": "static_only",
        "sha256": {"PM_auto.dll": actual_pm, "MAIWmodels.dll": actual_models},
        "checks": {
            "pm_auto_imports": ["movieElementTo", "getDynamicStructure", "QStandardItem::takeChild", "QStandardItem::removeRow", "QStandardItem::insertRow", "QTabWidget::setCurrentWidget"],
            "core_exports": ["movieElementTo RVA 0xC020", "movieToElementary RVA 0xC140", "addArragmentLink", "addCompositionLink", "codeStructure"],
            "pm_drag_function": "0x100064F0",
            "core_move_function": "0x1000C020",
            "double_click_function": "0x10006EB0",
            "selection_helper": "0x10015990",
            "selection_signal_emitter": "0x10017A40",
            "core_wrapper_function": "0x1000C140"
        },
        "interpretation": {
            "drag": "same-owner target: move source AFElement before target by passing target previous sibling as predecessor; null target: move to end by passing last child; model mutation is skipped if source already last.",
            "core": "detach old arrangement/composition links, reconnect old neighbors, add new parent composition link and predecessor/source/next arrangement links, then codeStructure().",
            "double_click": "select one or two QTabWidget pages, resolve a DiagramBlock via coordinate lookup, mark its state byte, then emit FunctionalDiagram::selectionChanged(DiagramBlock*) via QMetaObject::activate."
        },
        "open_questions": [
            "Does target AFElement always have the same parent as source AFElement? No explicit target-parent equality check was observed.",
            "What concrete class is DiagramBlock+0x1D4?",
            "What are the meanings of DiagramBlock+0x1C4, +0x1C8, +0x1D8, +0x1DC and +0x1E0?",
            "What is the row/column orientation and source-level meaning of the two selected coordinates?",
            "What is the full animation/color side effect in helper 0x10015990?",
            "What do the post-move UI refresh helpers do internally?"
        ]
    }
    (out_dir / "drag_reorder_audit.json").write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    validation = [
        "Stage 1.13 static audit: PASS",
        f"PM_auto.dll SHA-256: {actual_pm}",
        f"MAIWmodels.dll SHA-256: {actual_models}",
        "PM_auto imports: 6/6 required symbols found",
        "MAIWmodels exports: 5/5 required symbols found",
        "Drag handler call/offset tokens: 7/7 found",
        "Core move helper call tokens: 10/10 found",
        "Double-click tab switch import/call: found",
        "Coordinate selection and selectionChanged emitter: found",
        "No program execution; static objdump analysis only"
    ]
    (out_dir / "stage13_validation.txt").write_text("\n".join(validation) + "\n", encoding="utf-8")
    return result


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("pm_auto", type=Path, help="path to the exact supplied PM_auto.dll")
    ap.add_argument("maiwmodels", type=Path, help="path to the exact supplied MAIWmodels.dll")
    ap.add_argument("--out-dir", type=Path, default=Path("analysis/pm_auto"))
    ns = ap.parse_args()
    try:
        result = audit(ns.pm_auto, ns.maiwmodels, ns.out_dir)
    except Exception as exc:  # CLI reports analysis failures cleanly
        print(f"ERROR: {exc}", file=sys.stderr)
        return 2
    print(json.dumps(result, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
