#!/usr/bin/env python3
"""SHA-pinned static audit of the IS.exe ConceptModel writer/reader tree.

This audit establishes static XML-node and attribute symmetry only. It does not
execute the original Windows application or claim a runtime round-trip.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import pathlib
import subprocess
import sys
from typing import Dict

EXPECTED = "ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2"

RANGES = {
    "conceptmodel_writer_0x40a6d0.asm": (0x40A6D0, 0x40AC20),
    "conceptmodel_cs_factory_0x40ac20.asm": (0x40AC20, 0x40ACB0),
    "conceptmodel_cs_template_0x40a5d0.asm": (0x40A5D0, 0x40A6D0),
    "conceptmodel_spz_template_0x40a440.asm": (0x40A440, 0x40A510),
    "conceptmodel_reader_cs_meta_0x4065b0.asm": (0x4065B0, 0x4066D0),
    "conceptmodel_reader_0x4066d0.asm": (0x4066D0, 0x406F20),
    "conceptmodel_reader_caller_0x408f40.asm": (0x408F40, 0x409040),
    "conceptmodel_link_range_reader_0x406380.asm": (0x406380, 0x4065A5),
    "conceptmodel_content_writer_0x409de0.asm": (0x409DE0, 0x40A040),
}


def sha256(path: pathlib.Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def disasm(binary: pathlib.Path, start: int, stop: int) -> str:
    proc = subprocess.run(
        ["objdump", "-d", "-Mintel", f"--start-address=0x{start:x}",
         f"--stop-address=0x{stop:x}", str(binary)],
        check=True, capture_output=True, text=True,
    )
    return proc.stdout.lower()


def build(binary: pathlib.Path) -> tuple[dict, Dict[str, str]]:
    digest = sha256(binary)
    if digest != EXPECTED:
        raise ValueError(f"SHA-256 mismatch: expected {EXPECTED}, got {digest}")

    chunks = {name: disasm(binary, *bounds) for name, bounds in RANGES.items()}
    writer = chunks["conceptmodel_writer_0x40a6d0.asm"]
    cs_factory = chunks["conceptmodel_cs_factory_0x40ac20.asm"]
    cs_template = chunks["conceptmodel_cs_template_0x40a5d0.asm"]
    spz_template = chunks["conceptmodel_spz_template_0x40a440.asm"]
    reader = chunks["conceptmodel_reader_0x4066d0.asm"]
    reader_meta = chunks["conceptmodel_reader_cs_meta_0x4065b0.asm"]
    reader_caller = chunks["conceptmodel_reader_caller_0x408f40.asm"]
    link_reader = chunks["conceptmodel_link_range_reader_0x406380.asm"]
    content_writer = chunks["conceptmodel_content_writer_0x409de0.asm"]

    checks = {
        # Writer root and direct child collection shape.
        "writer_creates_ConceptModel_root": "0x457a64" in writer and "0x419b74" in writer,
        "writer_uses_concept_structure_getter": "0x419178" in writer,
        "writer_calls_cs_factory": "call   0x40ac20" in writer,
        "writer_uses_qdomnode_appendchild_for_cs": "0x419b58" in writer,
        "writer_creates_cs_elemets_collection": "0x457ba0" in writer,
        "writer_cs_element_loop_calls_category_writer": "call   0x40c1b0" in writer,
        "writer_creates_cs_links_collection": "0x457b6c" in writer,
        "writer_cs_link_loop_calls_link_wrapper": "call   0x40c190" in writer,
        # cs helper is templated as FStructure but retagged before return.
        "cs_factory_calls_FStructure_template": "call   0x40a5d0" in cs_factory and "0x457bac" in cs_factory,
        "cs_factory_calls_dom_setTagName": "0x419bb4" in cs_factory,
        "cs_template_uses_FStructure_name": "0x457bd8" in cs_template,
        "cs_template_writes_last_elem_id": "0x457be4" in cs_template,
        "cs_template_writes_last_link_id": "0x457bf4" in cs_template,
        # spz structure is separately templated and tagged.
        "writer_uses_dynamic_structure_getter": "0x4190f4" in writer,
        "writer_calls_spz_factory": "call   0x40c390" in writer,
        "spz_factory_delegates_to_IStructure_template": "call   0x40a440" in disasm(binary, 0x40C390, 0x40C3B0),
        "spz_template_uses_IStructure_name": "0x457bc4" in spz_template,
        "spz_template_writes_last_id": "0x457bd0" in spz_template and "[eax+0x24]" in spz_template,
        "writer_retags_spz_with_setTagName": "0x419bb4" in writer and "0x457ba8" in writer,
        "writer_creates_spz_elemets_and_links": writer.count("0x457ba0") >= 2 and writer.count("0x457b6c") >= 2,
        "writer_calls_dynamic_element_wrapper": "call   0x40c3b0" in writer,
        # content is a separately emitted direct child.
        "writer_calls_content_factory": "call   0x409de0" in writer,
        "content_factory_creates_content_child": "0x457bb0" in content_writer,
        "writer_iterates_content_records": "call   0x40a040" in writer,
        # Reader entrypoint and cs mirror.
        "project_reader_selects_ConceptModel": "0x457a64" in reader_caller,
        "project_reader_calls_ConceptModel_reader": "call   0x4066d0" in reader_caller,
        "reader_selects_cs_child": "0x457bac" in reader,
        "reader_calls_cs_metadata_reader": "call   0x4065b0" in reader,
        "reader_selects_cs_elemets_and_links": "0x457ba0" in reader and "0x457b6c" in reader,
        "cs_metadata_reader_parses_last_elem_id": "0x457be4" in reader_meta and "0x419b7c" in reader_meta and "0x4192d0" in reader_meta,
        "cs_metadata_reader_stores_last_elem_id_plus_0c": "[esi+0xc]" in reader_meta,
        "cs_metadata_reader_parses_last_link_id": "0x457bf4" in reader_meta and "0x419b7c" in reader_meta and "0x4192d0" in reader_meta,
        "cs_metadata_reader_stores_last_link_id_plus_10": "[esi+0x10]" in reader_meta,
        # Link and spz symmetry.
        "reader_link_loop_calls_range_link_parser": "call   0x406380" in reader,
        "link_reader_parses_range_attribute": "0x457c08" in link_reader and "0x419b7c" in link_reader,
        "link_reader_converts_range_to_integer": "0x4192d0" in link_reader,
        "link_reader_stores_range_plus_2c": "[esi+0x2c]" in link_reader,
        "reader_selects_spz_child": "0x457ba8" in reader,
        "reader_parses_spz_last_id": "0x457bd0" in reader and "[esi+0x24]" in reader,
        "reader_selects_spz_elemets_and_links": reader.count("0x457ba0") >= 1 and reader.count("0x457b6c") >= 1,
        "reader_selects_content_child": "0x457bb0" in reader,
        "reader_dispatches_content_records": "call   0x4059e0" in reader,
    }

    result = {
        "audit": "stage117-conceptmodel-writer-reader-tree-symmetry",
        "static_only": True,
        "binary": binary.name,
        "image_base": "0x00400000",
        "sha256": digest,
        "writer": {
            "entry_va": "0x0040A6D0",
            "output": "returns a newly created ConceptModel QDomElement",
            "direct_children": ["cs", "spz", "content"],
            "cs_factory_va": "0x0040AC20",
            "cs_temporary_tag": "FStructure",
            "cs_final_tag": "cs",
            "spz_template_va": "0x0040A440",
            "spz_temporary_tag": "IStructure",
            "spz_final_tag": "spz",
            "content_helper_va": "0x00409DE0",
        },
        "reader": {
            "project_reader_callsite_va": "0x0040900F",
            "entry_va": "0x004066D0",
            "cs_metadata_reader_va": "0x004065B0",
            "link_range_reader_va": "0x00406380",
            "content_record_reader_va": "0x004059E0",
        },
        "cs_metadata": {
            "last_elem_id": "ConceptStructurePrivate+0x0C",
            "last_link_id": "ConceptStructurePrivate+0x10",
        },
        "spz_metadata": {"last_id": "DynamicStructurePrivate+0x24"},
        "link_range": {
            "xml_attribute": "range",
            "private_field": "AIEBinaryLinkPrivate+0x2C",
        },
        "checks": checks,
        "passed": sum(checks.values()),
        "total": len(checks),
        "status": "PASS" if all(checks.values()) else "FAIL",
        "limitations": [
            "Static PE32 disassembly only; no original Windows Qt runtime was executed.",
            "The audit establishes writer/reader symmetry for the observed top-level ConceptModel node tree and selected metadata fields; it does not prove byte-for-byte save/reopen round-trip behavior.",
            "All supplied sample projects have empty cs/elemets and cs/links collections, so non-empty ConceptStructure/SCBinaryLink serialization still lacks a native golden project for format-level comparison.",
            "The full semantic interpretation of content records and every child field is not claimed by this tree-level audit.",
        ],
    }
    return result, chunks


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("binary", type=pathlib.Path)
    parser.add_argument("--out", type=pathlib.Path)
    parser.add_argument("--snapshot-dir", type=pathlib.Path)
    args = parser.parse_args()

    try:
        result, chunks = build(args.binary)
    except (OSError, subprocess.CalledProcessError, ValueError) as exc:
        print(str(exc), file=sys.stderr)
        return 2

    if args.snapshot_dir:
        args.snapshot_dir.mkdir(parents=True, exist_ok=True)
        for name, body in chunks.items():
            (args.snapshot_dir / name).write_text(body, encoding="utf-8")
        # The generic wrapper and content-record helper are small, useful callsite evidence.
        for name, bounds in {
            "conceptmodel_spz_factory_0x40c390.asm": (0x40C390, 0x40C3B0),
            "conceptmodel_content_record_writer_0x40a040.asm": (0x40A040, 0x40A110),
        }.items():
            (args.snapshot_dir / name).write_text(disasm(args.binary, *bounds), encoding="utf-8")

    payload = json.dumps(result, ensure_ascii=False, indent=2) + "\n"
    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(payload, encoding="utf-8")
    print(payload, end="")
    return 0 if result["status"] == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
