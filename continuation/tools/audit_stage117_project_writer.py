#!/usr/bin/env python3
"""SHA-pinned static audit of the IS.exe project writer and range persistence path."""
from __future__ import annotations
import argparse, hashlib, json, pathlib, re, subprocess, sys

EXPECTED = "ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2"

def sha256(path: pathlib.Path) -> str:
    h = hashlib.sha256()
    with path.open('rb') as f:
        for chunk in iter(lambda: f.read(1 << 20), b''):
            h.update(chunk)
    return h.hexdigest()

def disasm(binary: pathlib.Path, start: int, stop: int) -> str:
    p = subprocess.run(['objdump', '-d', '-Mintel', f'--start-address=0x{start:x}',
                        f'--stop-address=0x{stop:x}', str(binary)],
                       check=True, capture_output=True, text=True)
    return p.stdout.lower()

def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument('binary', type=pathlib.Path)
    ap.add_argument('--out', type=pathlib.Path)
    ns = ap.parse_args()
    digest = sha256(ns.binary)
    if digest != EXPECTED:
        print(f"SHA-256 mismatch: expected {EXPECTED}, got {digest}", file=sys.stderr)
        return 2
    whole = disasm(ns.binary, 0x402600, 0x4027e9)
    writer = disasm(ns.binary, 0x40b9d0, 0x40c187)
    fileout = disasm(ns.binary, 0x40c0a1, 0x40c187)
    range_writer = disasm(ns.binary, 0x40a510, 0x40a5a9)
    range_wrapper = disasm(ns.binary, 0x40c190, 0x40c1b0)
    category_writer = disasm(ns.binary, 0x40c1b0, 0x40c38a)
    concept_loop = disasm(ns.binary, 0x40a7d0, 0x40a95d)
    reader = disasm(ns.binary, 0x406380, 0x4065a5)
    reader_parent = disasm(ns.binary, 0x406954, 0x406a5f)
    checks = {
        'save_handler_one_calls_project_writer': 'call   0x40b9d0' in whole,
        'save_handler_two_calls_project_writer': whole.count('call   0x40b9d0') >= 2,
        'writer_constructs_qdomdocument': '0x419b94' in writer,
        'writer_creates_project_root': '0x457a04' in writer and '0x419b74' in writer,
        'writer_serializes_primary_and_concept_models': '0x40acd0' in writer and '0x40a6d0' in writer,
        'writer_calls_qdomdocument_tostring': '0x419b78' in fileout,
        'writer_uses_qtextstream_operator': '0x419358' in fileout,
        'writer_opens_qfile_write_only': '0x419348' in fileout and 'mov    dword ptr [eax],0x2' in fileout,
        'writer_sets_utf8_codec': '0x41935c' in fileout and '0x457a4c' in fileout,
        'writer_uses_one_space_dom_indent': 'push   0x1' in fileout and '0x419b78' in fileout,
        'range_writer_uses_range_xml_name': '0x457c08' in range_writer,
        'range_writer_reads_private_plus_2c': '[eax+0x2c]' in range_writer,
        'range_writer_sets_dom_integer_attribute': '0x419b4c' in range_writer,
        'range_wrapper_delegates_to_range_writer': 'call   0x40a510' in range_wrapper,
        'concept_link_loop_calls_range_wrapper': 'call   0x40c190' in concept_loop,
        'category_writer_reads_class_group_number_status_autorange_codingtype': all(
            x in category_writer for x in ('[eax+0x38]', '[eax+0x40]', '[eax+0x44]',
                                            '[eax+0x4c]', '[eax+0x58]', '[eax+0x3c]')),
        'reader_parses_range_attribute': '0x457c08' in reader and '0x419b7c' in reader,
        'reader_converts_range_to_integer': '0x4192d0' in reader,
        'reader_stores_range_at_private_plus_2c': '[esi+0x2c]' in reader,
        'concept_links_reader_calls_link_parser': 'call   0x406380' in reader_parent,
        'reader_parent_selects_links_collection': '0x457b6c' in reader_parent,
    }
    result = {
        'audit': 'stage117-is2-project-writer-and-range-persistence',
        'static_only': True,
        'binary': ns.binary.name,
        'image_base': '0x00400000',
        'sha256': digest,
        'writer_va': '0x0040B9D0',
        'writer_rva': '0x0000B9D0',
        'writer_end_va_exclusive': '0x0040C187',
        'checks': checks,
        'passed': sum(checks.values()),
        'total': len(checks),
        'status': 'PASS' if all(checks.values()) else 'FAIL',
        'range_persistence': {
            'xml_attribute': 'range',
            'host_writer_va': '0x0040A510',
            'wrapper_va': '0x0040C190',
            'concept_link_loop_call_va': '0x0040A8C6',
            'source_field': 'AIEBinaryLinkPrivate+0x2C',
            'write_api': 'QDomElement::setAttribute(QString, qint64)',
            'semantic_values': 'unresolved; persistence is established, interpretation is not',
        },
        'range_roundtrip': {
            'writer': 'IS.exe:0x0040A510 reads AIEBinaryLinkPrivate+0x2C and writes XML attribute range',
            'reader': 'IS.exe:0x00406380 reads XML attribute range, converts to integer, and stores at private+0x2C',
            'reader_caller': 'IS.exe:0x00406A2C inside ConceptModel links iteration',
            'status': 'static read/write path established; runtime round-trip not executed',
        },
        'file_output': {
            'qfile_open_flag': '0x2 (QIODevice::WriteOnly)',
            'text_codec': 'UTF-8',
            'dom_to_string_indent_argument': 1,
            'stream_operator': 'QTextStream::operator<<(QString)',
        },
        'limitations': [
            'Static disassembly only; original Windows save operation was not executed.',
            'The audit proves the observed host reader and writer transfer the range attribute to/from private+0x2C; it does not decode the domain meaning of values 1 and 99.',
            'It does not establish byte-for-byte output details such as XML declaration, BOM, or all whitespace without a runtime save.',
            'The exact complete serializer contract for every model node and legacy project version remains under investigation.'
        ]
    }
    if ns.out:
        ns.out.parent.mkdir(parents=True, exist_ok=True)
        ns.out.write_text(json.dumps(result, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return 0 if all(checks.values()) else 1

if __name__ == '__main__':
    raise SystemExit(main())
