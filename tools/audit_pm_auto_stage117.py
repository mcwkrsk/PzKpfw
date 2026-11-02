#!/usr/bin/env python3
"""SHA-pinned static audit of Stage 1.17 nested DiagramBlock lifecycle."""
from __future__ import annotations
import argparse, csv, hashlib, json, re, subprocess, sys
from pathlib import Path
from xml.etree import ElementTree as ET

EXPECTED = {
    "PM_auto.dll": "c3cbde9cb83a7c10774a0faa4541622005856d09b79ce94dec3d8bd90d083018",
    "MAIWmodels.dll": "80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525",
}
RANGES = [
    ("child_cleanup", "PM_auto.dll", "0x100182b0", "0x10018380"),
    ("destroy_helper", "PM_auto.dll", "0x10018380", "0x100183a3"),
    ("destructor_body", "PM_auto.dll", "0x10017f70", "0x10018040"),
    ("type_dispatch", "PM_auto.dll", "0x100183b0", "0x10018410"),
    ("del_list", "PM_auto.dll", "0x1000a040", "0x1000a360"),
    ("nested_grid_lookup", "PM_auto.dll", "0x10016f90", "0x10016fc8"),
    ("composition_link", "MAIWmodels.dll", "0x100043d0", "0x10004410"),
    ("arrangement_link", "MAIWmodels.dll", "0x10004390", "0x100043d0"),
    ("link_type_setter", "MAIWmodels.dll", "0x10003310", "0x10003320"),
]

def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()

def disasm(path: Path, start: str, stop: str) -> str:
    return subprocess.check_output(
        ["objdump", "-d", "-Mintel", f"--start-address={start}", f"--stop-address={stop}", str(path)],
        text=True, errors="replace"
    )

def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--root", required=True, type=Path, help="Extracted IS2_PMauto_beta directory")
    ap.add_argument("--samples", nargs="*", type=Path, default=[])
    ap.add_argument("--vtable-tsv", type=Path, default=None)
    ap.add_argument("--out-json", required=True, type=Path)
    ap.add_argument("--out-asm", required=True, type=Path)
    args = ap.parse_args()
    paths = {"PM_auto.dll": args.root / "modules/PM_auto.dll", "MAIWmodels.dll": args.root / "MAIWmodels.dll"}
    hashes = {name: sha256(path) for name, path in paths.items()}
    if hashes != EXPECTED:
        print(json.dumps({"status": "rejected_hash_mismatch", "hashes": hashes}, indent=2))
        return 2
    texts = {}
    asm_parts = []
    for label, file_name, start, stop in RANGES:
        t = disasm(paths[file_name], start, stop)
        texts[label] = t
        asm_parts.append(f"\n; ===== {label} {start}..{stop} =====\n{t}")
    args.out_asm.parent.mkdir(parents=True, exist_ok=True)
    args.out_asm.write_text("\n".join(asm_parts), encoding="utf-8")
    checks = {
        "destroy_helper_calls_child_cleanup": "call   0x100182b0" in texts["destroy_helper"],
        "destroy_helper_calls_destructor_body": "call   0x10017f70" in texts["destroy_helper"],
        "destroy_helper_uses_0x278_size": "push   0x278" in texts["destroy_helper"],
        "destroy_helper_calls_delete_wrapper": "call   0x1001ccb3" in texts["destroy_helper"],
        "child_cleanup_recursively_calls_destroy": "call   0x10018380" in texts["child_cleanup"],
        "del_list_calls_destroy_helper": "call   0x10018380" in texts["del_list"],
        "del_list_fetches_nested_root_at_0_0": "call   0x10016f90" in texts["del_list"] and "push   0x0" in texts["del_list"],
        "nested_grid_lookup_checks_bounds": "cmp    eax,DWORD PTR [ecx+0x74]" in texts["nested_grid_lookup"] and "cmp    edx,DWORD PTR [ecx+0x70]" in texts["nested_grid_lookup"],
        "del_list_clears_nested_view_pointer": re.search(r"mov\s+DWORD PTR \[edi\+0x1c4\],0x0", texts["del_list"]) is not None,
        "del_list_resets_flag_1c1": re.search(r"mov\s+BYTE PTR \[edi\+0x1c1\],0x0", texts["del_list"]) is not None,
        "composition_helper_sets_type_2": "push   0x2" in texts["composition_link"] and "call   0x10003310" in texts["composition_link"],
        "arrangement_helper_sets_type_3": "push   0x3" in texts["arrangement_link"] and "call   0x10003310" in texts["arrangement_link"],
        "type_setter_writes_field_28": "mov    DWORD PTR [ecx+0x28],eax" in texts["link_type_setter"],
        "type_dispatch_uses_getType": "0x10022094" in texts["type_dispatch"],
    }
    if not all(checks.values()):
        print(json.dumps({"status": "failed", "checks": checks}, indent=2))
        return 1
    vtable_path = args.vtable_tsv or Path(__file__).resolve().parents[1] / "analysis/plugins/plugin_vtables.tsv"
    vtable_rows = []
    with vtable_path.open(encoding="utf-8") as f:
        for row in csv.reader(f, delimiter="\t"):
            if len(row) >= 6 and row[0] == "PM_auto.dll" and row[1] == ".?AVDiagramBlock@@" and row[3] == "0x1005be84":
                vtable_rows.append({"class": row[1], "vtable": row[3], "slot": int(row[4]), "target": row[5]})
    if not any(r["slot"] == 1 and r["target"] == "0x100183b0" for r in vtable_rows):
        print("DiagramBlock vtable snapshot mismatch", file=sys.stderr)
        return 1
    samples = []
    for sample in args.samples:
        doc = ET.parse(sample).getroot()
        actions = doc.findall(".//primaryModel/spd/actions/pd")
        links = doc.findall(".//primaryModel/spd/links/link")
        crosstab = {}
        for action in actions:
            key = f"type={action.get('type')};status={action.get('status')}"
            vals = crosstab.setdefault(key, {})
            v = action.get("formalization")
            vals[v] = vals.get(v, 0) + 1
        link_counts, pairs = {}, {}
        for link in links:
            typ = link.get("type")
            link_counts[typ] = link_counts.get(typ, 0) + 1
            pairs.setdefault(typ, set()).add((link.get("afe1"), link.get("afe2")))
        samples.append({
            "file": sample.name, "action_count": len(actions), "link_count": len(links),
            "action_type_status_formalization": crosstab, "link_type_counts": link_counts,
            "shared_type2_type3_afe1_afe2_pairs": len(pairs.get("2", set()) & pairs.get("3", set())),
            "type2_pairs": len(pairs.get("2", set())), "type3_pairs": len(pairs.get("3", set())), "validated": True,
        })
    report = {
        "schema": "is2.pm_auto.stage117_audit.v1", "status": "passed_static_audit", "source_hashes": hashes,
        "checks": checks,
        "diagram_block": {"rtti_class": ".?AVDiagramBlock@@", "vtable": "0x1005be84", "observed_vtable_rows": vtable_rows,
            "allocation_size_bytes": "0x278", "af_element_pointer_offset": "0x1d0", "nested_view_pointer_offset": "0x1c4",
            "child_pointer_list_offset": "0x1cc", "back_reference_offset": "0x1d8", "flag_offset": "0x1c1",
            "destroy_helper": "0x10018380", "child_cleanup": "0x100182b0", "destructor_body": "0x10017f70", "type_dispatch_method": "0x100183b0"},
        "nested_delete": {"slot": "delList_slot", "va": "0x1000a040", "nested_root_lookup": "0x10016f90(nested_view, 0, 0)", "calls_destroy_helper_at": "0x1000a252",
            "clears_nested_view_pointer_at": "0x1000a275", "resets_flag_at": "0x1000a27f", "refresh_call_at": "0x1000a286",
            "message_box_buttons": "QMessageBox::Ok (0x400)", "runtime_verified": False},
        "enum_correlations": {"action_type": {"0": "elementary", "1": "alternative", "2": "sequence", "3": "iteration"},
            "status": {"0": "elementary", "1": "intermediate"},
            "formalization": {"0": "analytical", "2": "algorithmic", "other": "unresolved"},
            "basis": "core setter arguments cross-checked with supplied thesis pages 124-127 and 141-144 plus XML samples",
            "confidence": {"action_type": "high", "status": "high", "formalization_0": "high", "formalization_2": "high", "other_formalization_values": "unresolved"}},
        "link_type_correlation": {"internal_type_2": "AFStructure::addCompositionLink", "internal_type_3": "AFStructure::addArragmentLink",
            "type_field_offset_in_AEBinaryLink": "0x28", "xml_mapping_confidence": "high, serializer path still pending Stage 2", "samples": samples},
        "limitations": ["Static PE32 disassembly only; original Windows application was not run.",
            "QObject parent ownership and runtime double-delete behavior are not proven.",
            "Formalization values other than 0 and 2 remain unmapped.",
            "The XML writer/reader has not yet been traced end-to-end.", "Custom undo/history remains unresolved."]
    }
    args.out_json.parent.mkdir(parents=True, exist_ok=True)
    args.out_json.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({"status": report["status"], "checks": checks, "samples": len(samples), "out_json": str(args.out_json), "out_asm": str(args.out_asm)}, indent=2))
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
