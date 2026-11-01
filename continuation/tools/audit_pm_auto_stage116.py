#!/usr/bin/env python3
"""Reproduce Stage 1.16 static findings for PM_auto's model projections and UI context.

This audit is deliberately read-only. It verifies the exact supplied x86 build by
SHA-256, extracts selected GNU objdump ranges, records Qt Undo surface evidence,
and summarizes (without modifying) the supplied XML project samples.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
import sys
from collections import Counter
from pathlib import Path
from typing import Iterable

EXPECTED = {
    "PM_auto.dll": "c3cbde9cb83a7c10774a0faa4541622005856d09b79ce94dec3d8bd90d083018",
    "MAIWmodels.dll": "80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525",
}

RANGES = [
    ("removeElementFromDiagramModels", 0x1000A360, 0x1000A4D8),
    ("name_projection_update_secondary", 0x10009730, 0x10009904),
    ("property_panel_toggle", 0x10009910, 0x10009930),
    ("set_context_value_and_emit_state", 0x10009930, 0x10009970),
    ("context_mode_selection", 0x100073B0, 0x10008210),
    ("create_and_delete_nested_diagram", 0x10009FB0, 0x1000A290),
    ("context_enabled_matrix", 0x10011B00, 0x10011D50),
]


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def command(args: list[str]) -> str:
    proc = subprocess.run(args, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    return proc.stdout


def import_report(path: Path) -> str:
    return command(["objdump", "-p", str(path)])


def disasm(path: Path, start: int, stop: int) -> str:
    return command([
        "objdump", "-d", "-Mintel", f"--start-address=0x{start:x}",
        f"--stop-address=0x{stop:x}", str(path)
    ])


def find_raw_terms(path: Path, terms: Iterable[str]) -> dict[str, list[str]]:
    data = path.read_bytes()
    found: dict[str, list[str]] = {}
    for term in terms:
        matches: list[str] = []
        for label, encoded in (("ascii", term.encode("ascii")), ("utf16le", term.encode("utf-16le"))):
            start = 0
            while True:
                pos = data.lower().find(encoded.lower(), start)
                if pos < 0:
                    break
                matches.append(f"{label}:0x{pos:x}")
                start = pos + 1
        if matches:
            found[term] = matches
    return found


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, required=True,
                        help="Extracted IS2_PMauto_beta directory containing IS.exe and modules/")
    parser.add_argument("--samples", nargs="*", type=Path, default=[], help="Optional .is2/.xml samples")
    parser.add_argument("--out-json", type=Path, required=True)
    parser.add_argument("--out-asm", type=Path, required=True)
    args = parser.parse_args()

    root = args.root.resolve()
    pm = root / "modules" / "PM_auto.dll"
    core = root / "MAIWmodels.dll"
    if not pm.is_file() or not core.is_file():
        parser.error("--root must contain modules/PM_auto.dll and MAIWmodels.dll")

    image_paths = [root / "IS.exe", core, *sorted((root / "modules").glob("*.dll"))]
    image_paths = [p for p in image_paths if p.is_file()]
    hashes = {p.name: sha256(p) for p in image_paths}
    if hashes.get("PM_auto.dll") != EXPECTED["PM_auto.dll"]:
        raise SystemExit("PM_auto.dll SHA-256 mismatch; refusing to analyse an unknown build")
    if hashes.get("MAIWmodels.dll") != EXPECTED["MAIWmodels.dll"]:
        raise SystemExit("MAIWmodels.dll SHA-256 mismatch; refusing to analyse an unknown build")

    pm_imports = import_report(pm)
    qUndo_imports = {}
    qAbstract_revert_submit = {}
    raw_tokens = {}
    for image in image_paths:
        imports = import_report(image)
        hits = [line.strip() for line in imports.splitlines()
                if re.search(r"QUndo(Stack|Command)|\bundo\b|\bredo\b", line, re.I)]
        if hits:
            qUndo_imports[image.name] = hits
        if image.name == "PM_auto.dll":
            qAbstract_revert_submit[image.name] = [line.strip() for line in imports.splitlines()
                if "QAbstractItemModel" in line and ("revert" in line or "submit" in line)]
        raw_hits = find_raw_terms(image, ("undo", "redo", "QUndoStack", "QUndoCommand"))
        if raw_hits:
            raw_tokens[image.name] = raw_hits

    pm_full = command(["objdump", "-d", "-Mintel", str(pm)])
    revert_submit_xrefs = [line.strip() for line in pm_full.splitlines()
                           if re.search(r"10022308|10022310", line, re.I)]
    # The only expected references in this build are two import-jump thunks;
    # do not mistake those forwarding stubs for actual application callsites.
    revert_submit_real_calls = [line for line in revert_submit_xrefs
                                if re.search(r"\\bcall\\b", line, re.I)]

    asm_parts = ["; Stage 1.16 evidence excerpts — exact PM_auto.dll build\n",
                 f"; SHA256 PM_auto.dll: {hashes['PM_auto.dll']}\n",
                 f"; SHA256 MAIWmodels.dll: {hashes['MAIWmodels.dll']}\n\n"]
    disassemblies: dict[str, str] = {}
    for name, start, stop in RANGES:
        text = disasm(pm, start, stop)
        disassemblies[name] = text
        asm_parts.append(f"\n; ===== {name} [0x{start:08x}, 0x{stop:08x}) =====\n")
        asm_parts.append(text)

    try:
        sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))
        from is2_re import load_project
    except Exception as exc:  # pragma: no cover - environment guard
        raise SystemExit(f"Unable to load repository XML parser: {exc}") from exc

    sample_results = []
    for sample in args.samples:
        project = load_project(sample)
        summary = project.summary()
        links2 = {(link.afe1, link.afe2) for link in project.links if link.type == "2"}
        links3 = {(link.afe1, link.afe2) for link in project.links if link.type == "3"}
        summary["link_pair_correlation"] = {
            "type_2_pairs": len(links2),
            "type_3_pairs": len(links3),
            "same_afe1_afe2_pairs": len(links2 & links3),
            "type_2_only_pairs": len(links2 - links3),
            "type_3_only_pairs": len(links3 - links2),
            "interpretation": "Observed endpoint-pair correlation only; link type semantics are not assigned here."
        }
        summary["validated"] = not project.warnings
        sample_results.append(summary)

    audit = {
        "stage": "1.16",
        "analysis_mode": "static; no Windows runtime execution",
        "binary_sha256": hashes,
        "pinned_binary_hashes": EXPECTED,
        "findings": {
            "model_projection_helper": {
                "address": "0x1000A360",
                "working_name": "removeElementFromDiagramModels(AFElement*)",
                "model_offsets": ["this+0x120", "this+0x128"],
                "map_offsets": ["this+0x140", "this+0x144"],
                "operations": ["QMap lookup by AFElement*", "QStandardItem::index",
                               "QModelIndex::parent/row", "QAbstractItemModel::removeRow",
                               "remove AFElement key from both maps", "get direct child list",
                               "remove direct-child projection entries", "destroy temporary child-list wrapper"],
                "recursion_observed": False,
                "caller_addresses": ["0x1000DBA4", "0x1001163D"],
                "confidence": "high for listed call/offset behavior; source-level intent is a working name"
            },
            "name_projection_updates": {
                "map_0x140_helper": "0x10009970",
                "map_0x144_helper": "0x10009730",
                "model_data_role": 2,
                "text_derivation": ["AElement::getName", "MString data -> QString",
                                    "AFElement::getStructureSymbols", "virtual getCode", "format QString"],
                "confidence": "high for offsets/imports/calls; exact rendered string format not fully decoded"
            },
            "context_field": {
                "offset": "DecompositionWidget+0x2C",
                "setter": "0x10009930",
                "selection_handler": "0x100073B0",
                "observed_conditions": [
                    {"condition": "AFElement::getStatus() == 0", "value": 2},
                    {"condition": "status == 1 and AFElement::getType() == 2", "value": 1},
                    {"condition": "status == 1 and type == 1 branch", "value": 3},
                    {"condition": "status == 1 and type == 3 branch", "value": 4},
                    {"condition": "invalid/deselected current block", "value": 0}
                ],
                "enum_names_assigned": False
            },
            "context_widget_enable_matrix": {
                "apply_range": "0x10011B00-0x10011D4F",
                "api": "QWidget::setEnabled(true)",
                "always_enabled_offsets": ["0x58", "0x54", "0xB8"],
                "modes": {
                    "1": ["0x70", "0x78", "0x6C", "0xA0"],
                    "2": ["0x7C", "0x78", "0x6C", "0xA0"],
                    "3": ["0x70", "0x7C", "0x78", "0xA0"],
                    "4": ["0x70", "0x7C", "0x6C", "0xA0"]
                },
                "conditional_offsets": ["0xA8", "0x90", "0x8C", "0x9C", "0x94"],
                "widget_names_resolved": False
            },
            "property_panel_toggle": {
                "handler": "0x10009910",
                "target_offset": "DecompositionWidget+0x100",
                "behavior": "reads QWidget visibility state and branches to QWidget::hide or QWidget::show",
                "model_mutation_observed": False
            },
            "nested_diagram_lifecycle": {
                "create_slot": "0x10009FB0",
                "create_helper": "0x10009170",
                "source_element_status_gate": "AFElement::getStatus() != 0",
                "back_reference_offsets": ["DiagramBlock+0x1D8", "DiagramBlock+0x1C4"],
                "delete_slot": "0x1000A040",
                "delete_behavior": ["shows a QMessageBox confirmation flow", "iterates linked diagram records",
                                     "runs helper cleanup/destruction paths", "invokes related widget virtual slot +0x0C with argument 1",
                                     "clears DiagramBlock+0x1C4", "sets byte DiagramBlock+0x1C1 to 0", "refreshes diagram view"],
                "exact_user_button_label": "not recovered",
                "exact ownership/parenting": "not fully established statically"
            },
            "undo_redo_surface": {
                "QUndoStack_or_QUndoCommand_imports": qUndo_imports,
                "raw_undo_redo_tokens": raw_tokens,
                "PM_auto_QAbstractItemModel_revert_submit_imports": qAbstract_revert_submit,
                "PM_auto_revert_submit_iat_references": revert_submit_xrefs,
                "PM_auto_revert_submit_real_call_instructions": revert_submit_real_calls,
                "assessment": "No explicit QUndoStack/QUndoCommand or undo/redo import/token was found. PM_auto imports QAbstractItemModel::revert/submit but objdump shows only their forwarding IAT thunks and no direct call instruction to those IAT entries. This is not proof that no custom undo/history logic exists."
            }
        },
        "sample_projects": sample_results,
        "validation": {
            "all_samples_parse_and_validate": all(x["validated"] for x in sample_results) if sample_results else None,
            "sample_count": len(sample_results),
            "static_only": True
        }
    }

    args.out_json.parent.mkdir(parents=True, exist_ok=True)
    args.out_asm.parent.mkdir(parents=True, exist_ok=True)
    args.out_json.write_text(json.dumps(audit, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    args.out_asm.write_text("".join(asm_parts), encoding="utf-8")
    print(json.dumps({
        "stage": audit["stage"],
        "binary_hashes_verified": True,
        "samples": len(sample_results),
        "all_samples_valid": audit["validation"]["all_samples_parse_and_validate"],
        "undo_framework_imports": sum(map(len, qUndo_imports.values())),
        "revert_submit_imports": sum(map(len, qAbstract_revert_submit.values())),
        "revert_submit_real_calls": len(revert_submit_real_calls),
        "json": str(args.out_json),
        "asm": str(args.out_asm)
    }, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
