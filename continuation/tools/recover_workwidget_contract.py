#!/usr/bin/env python3
"""Recover the shared WorkWidget/MenuWidget vtable contract from IS-2 PE32 binaries.

Static evidence only: parses MSVC RTTI/vftables via recover_plugin_rtti.py.
No binary is executed. Slot indices are reported verbatim; only slots +0xb4
(WorkWidget menu factory) and +0xcc (host-context setter) are semantically
labelled because their call sites and implementations were manually verified.
"""
from __future__ import annotations
import argparse
import csv
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from recover_plugin_rtti import parse_pe  # noqa: E402

PLUGINS = [
    "PM_auto.dll",
    "PM_params.dll",
    "PM_spec_WEB.dll",
    "PM_matrix_web.dll",
    "Model_Visualiser.dll",
]


def short_type(decorated: str) -> str | None:
    if decorated == ".?AVWorkWidget@@":
        return "WorkWidget"
    if decorated == ".?AVMenuWidget@@":
        return "MenuWidget"
    return None


def slot_label(class_name: str, object_offset: int, index: int) -> str:
    # Only the primary subobject carries the host-facing slot labels. The
    # secondary +8 table contains adjustor thunks / interface slots.
    if object_offset != 0:
        return "secondary_vtable_slot"
    offset = index * 4
    if class_name == "WorkWidget" and offset == 0xB4:
        return "createMenuWidget"
    if class_name == "WorkWidget" and offset == 0xCC:
        return "setHostContext"
    if class_name == "MenuWidget" and offset == 0xB4:
        return "no_op_in_supplied_build"
    return "unresolved_virtual_slot"


def recover_one(path: Path) -> dict:
    parsed = parse_pe(path)
    selected = []
    for table in parsed["vtable_candidates"]:
        cls = short_type(table["type"])
        if not cls:
            continue
        col = next((c for c in parsed["complete_object_locators"]
                    if c["va"] == table["col_va"]), None)
        if col is None:
            continue
        selected.append({
            "class": cls,
            "vftable_va": table["vftable_va"],
            "col_va": table["col_va"],
            "object_offset": col["object_offset"],
            "slot_count": len(table["slots"]),
            "slots": [
                {"index": i, "byte_offset": i * 4, "target_va": target,
                 "label": slot_label(cls, col["object_offset"], i)}
                for i, target in enumerate(table["slots"])
            ],
        })
    selected.sort(key=lambda t: (t["class"], t["object_offset"], t["vftable_va"]))
    return {
        "binary": path.name,
        "sha256": parsed["sha256"],
        "image_base": parsed["image_base"],
        "type_descriptor_count": parsed["type_descriptor_count"],
        "col_count": parsed["complete_object_locator_count"],
        "vtable_candidate_count": parsed["vtable_candidate_count"],
        "tables": selected,
    }


def validate(results: list[dict]) -> list[str]:
    errors: list[str] = []
    if len(results) != 6:
        errors.append(f"expected host + 5 plugins, got {len(results)} binaries")
    for result in results:
        for cls, expected in (("WorkWidget", 52), ("MenuWidget", 46)):
            matches = [t for t in result["tables"] if t["class"] == cls]
            if len(matches) != 2:
                errors.append(f"{result['binary']}: expected 2 {cls} vftables, got {len(matches)}")
                continue
            offsets = sorted(t["object_offset"] for t in matches)
            if offsets != [0, 8]:
                errors.append(f"{result['binary']}: {cls} COL offsets should be [0,8], got {offsets}")
            for table in matches:
                expected_slots = expected if table["object_offset"] == 0 else 7
                if table["slot_count"] != expected_slots:
                    errors.append(f"{result['binary']}: {cls} at {table['vftable_va']:#x} "
                                  f"(object_offset={table['object_offset']}): "
                                  f"expected {expected_slots} slots, got {table['slot_count']}")
    return errors


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("binary_dir", type=Path, help="IS-2 root containing IS.exe and modules/")
    ap.add_argument("--out", type=Path, required=True, help="Output directory")
    args = ap.parse_args()
    paths = [args.binary_dir / "IS.exe"] + [args.binary_dir / "modules" / p for p in PLUGINS]
    missing = [str(p) for p in paths if not p.exists()]
    if missing:
        raise SystemExit("Missing binary(s):\n" + "\n".join(missing))
    results = [recover_one(p) for p in paths]
    errors = validate(results)
    args.out.mkdir(parents=True, exist_ok=True)
    (args.out / "workwidget_interface.json").write_text(
        json.dumps({"schema_version": 1, "static_only": True,
                    "validation_errors": errors, "binaries": results}, indent=2),
        encoding="utf-8")
    with (args.out / "workwidget_vtables.tsv").open("w", encoding="utf-8", newline="") as f:
        w = csv.writer(f, delimiter="\t")
        w.writerow(["binary", "sha256", "class", "object_offset", "vftable_va",
                    "col_va", "slot_index", "slot_offset", "target_va", "label"])
        for result in results:
            for table in result["tables"]:
                for slot in table["slots"]:
                    w.writerow([result["binary"], result["sha256"], table["class"],
                                f"0x{table['object_offset']:x}", f"0x{table['vftable_va']:08x}",
                                f"0x{table['col_va']:08x}", slot["index"],
                                f"0x{slot['byte_offset']:x}", f"0x{slot['target_va']:08x}",
                                slot["label"]])
    for result in results:
        print(f"{result['binary']}: WorkWidget={[t['slot_count'] for t in result['tables'] if t['class']=='WorkWidget']}; "
              f"MenuWidget={[t['slot_count'] for t in result['tables'] if t['class']=='MenuWidget']}; "
              f"SHA256={result['sha256']}")
    if errors:
        for err in errors:
            print("ERROR:", err, file=sys.stderr)
        raise SystemExit(1)
    print("VALIDATION: host + 5 plugins; 24 vftables; primary WorkWidget=52, MenuWidget=46; "
          "secondary tables=7 slots; COL offsets 0,8")

if __name__ == "__main__":
    main()
