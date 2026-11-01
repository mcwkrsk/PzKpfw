#!/usr/bin/env python3
"""Recover MSVC x86 RTTI inheritance and vftable candidates from a PE image.

This script is deliberately conservative: it reports structures validated by
MSVC RTTI signatures and direct pointer references. It does not infer C++
source-level access, ownership, or exact function boundaries.
"""
from __future__ import annotations
import argparse, csv, hashlib, json, re, struct
from collections import defaultdict
from pathlib import Path

SECTIONS = [
    ('.text', 0x1000, 0x15F93, 0x400),
    ('.rdata', 0x17000, 0x98F2, 0x16400),
    ('.data', 0x21000, 0xA00, 0x1FE00),
    ('.gfids', 0x22000, 0x38, 0x20800),
    ('.rsrc', 0x23000, 0x1E0, 0x20A00),
    ('.reloc', 0x24000, 0x1258, 0x20C00),
]
BASE = 0x10000000
EXPECTED_SHA256 = '80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525'


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('dll', type=Path)
    ap.add_argument('--exports', type=Path, required=True)
    ap.add_argument('--out', type=Path, required=True)
    args = ap.parse_args()
    blob = args.dll.read_bytes()
    digest = hashlib.sha256(blob).hexdigest()
    if digest != EXPECTED_SHA256:
        ap.error(f'Unexpected MAIWmodels.dll SHA-256 {digest}; this parser uses build-specific section offsets and is pinned to {EXPECTED_SHA256}')
    def va_to_off(va):
        rva = va - BASE
        for _name, srva, size, raw in SECTIONS:
            if srva <= rva < srva + size:
                off = raw + rva - srva
                return off if off < len(blob) else None
        return None
    def off_to_va(off):
        for _name, srva, size, raw in SECTIONS:
            if raw <= off < raw + size:
                return BASE + srva + off - raw
        return None
    def section(va):
        rva = va - BASE
        for name, srva, size, _raw in SECTIONS:
            if srva <= rva < srva + size:
                return name
        return None

    # MSVC TypeDescriptor names start at TD+8 (two pointer-sized fields).
    name_pat = re.compile(rb'\.\?A[UVW][^\x00]{1,300}?@@\x00')
    type_by_va = {}
    for m in name_pat.finditer(blob):
        va = off_to_va(m.start())
        if va is not None and va >= BASE + 8:
            td = va - 8
            type_by_va[td] = m.group()[:-1].decode('latin1', errors='replace')

    # Export address -> all decorated aliases at that address.
    aliases = defaultdict(list)
    with args.exports.open(encoding='utf-8', newline='') as f:
        for row in csv.DictReader(f, delimiter='\t'):
            aliases[int(row['VA'], 16)].append(row['decorated_name'])

    # Complete Object Locators, their Class Hierarchy Descriptors and BCDs.
    cols = []
    for off in range(0, len(blob) - 20, 4):
        sig, object_offset, cd_offset, td_va, chd_va = struct.unpack_from('<IIIII', blob, off)
        if sig != 0 or td_va not in type_by_va:
            continue
        chd_off = va_to_off(chd_va)
        if chd_off is None or chd_off + 16 > len(blob):
            continue
        chd_sig, attrs, nbase, bca_va = struct.unpack_from('<IIII', blob, chd_off)
        if chd_sig != 0 or not (1 <= nbase <= 100):
            continue
        bca_off = va_to_off(bca_va)
        if bca_off is None or bca_off + 4 * nbase > len(blob):
            continue
        bcd_vas = struct.unpack_from('<' + 'I' * nbase, blob, bca_off)
        bases = []
        valid = True
        for bcd_va in bcd_vas:
            bcd_off = va_to_off(bcd_va)
            if bcd_off is None or bcd_off + 24 > len(blob):
                valid = False
                break
            td, num_contained, mdisp, pdisp, vdisp, battrs = struct.unpack_from('<IIIIII', blob, bcd_off)
            if td not in type_by_va:
                valid = False
                break
            # signed values are relevant for offsets; preserve raw hex and signed.
            bases.append({
                'type': type_by_va[td], 'type_descriptor_va': f'0x{td:08x}',
                'num_contained_bases': num_contained,
                'mdisp': struct.unpack('<i', struct.pack('<I', mdisp))[0],
                'pdisp': struct.unpack('<i', struct.pack('<I', pdisp))[0],
                'vdisp': struct.unpack('<i', struct.pack('<I', vdisp))[0],
                'attributes': f'0x{battrs:x}',
                'bcd_va': f'0x{bcd_va:08x}',
            })
        if valid:
            cols.append({
                'col_va': off_to_va(off), 'col_offset': object_offset,
                'cd_offset': cd_offset, 'type': type_by_va[td_va],
                'chd_attributes': f'0x{attrs:x}', 'bases': bases,
            })

    # Locate COL pointers within .rdata; next consecutive .text pointers are slots.
    vtables = []
    for col in cols:
        col_va = col['col_va']
        ptr = struct.pack('<I', col_va)
        starts = []
        pos = 0
        while True:
            pos = blob.find(ptr, pos)
            if pos < 0:
                break
            if pos % 4 == 0 and section(off_to_va(pos) or 0) == '.rdata':
                starts.append(pos)
            pos += 1
        for ref_off in starts:
            table_va = off_to_va(ref_off + 4)
            if table_va is None:
                continue
            slots = []
            for i in range(64):
                entry_off = ref_off + 4 + 4 * i
                if entry_off + 4 > len(blob):
                    break
                target = struct.unpack_from('<I', blob, entry_off)[0]
                if section(target) != '.text':
                    break
                slots.append({
                    'index': i,
                    'target_va': f'0x{target:08x}',
                    'rva': f'0x{target - BASE:05x}',
                    'exports': aliases.get(target, []),
                })
            if slots:
                vtables.append({
                    'type': col['type'], 'col_va': f"0x{col_va:08x}",
                    'vftable_va': f'0x{table_va:08x}',
                    'slots': slots,
                    'bases': col['bases'],
                })

    # De-duplicate COLs and write raw machine-readable evidence.
    seen = set(); dedup = []
    for c in cols:
        key = (c['col_va'], c['type'])
        if key not in seen:
            seen.add(key); dedup.append(c)
    args.out.mkdir(parents=True, exist_ok=True)
    (args.out / 'rtti_recovery.json').write_text(json.dumps({'dll': str(args.dll), 'sha256': digest, 'image_base': hex(BASE), 'types': len(type_by_va), 'class_object_locators': dedup, 'vftables': vtables}, indent=2), encoding='utf-8')

    with (args.out / 'class_hierarchy.tsv').open('w', encoding='utf-8', newline='') as f:
        w = csv.writer(f, delimiter='\t')
        w.writerow(['derived_type', 'base_order', 'base_type', 'mdisp', 'pdisp', 'vdisp', 'attributes', 'col_va'])
        for c in dedup:
            for i, b in enumerate(c['bases']):
                w.writerow([c['type'], i, b['type'], b['mdisp'], b['pdisp'], b['vdisp'], b['attributes'], f"0x{c['col_va']:08x}"])

    with (args.out / 'vtable_slots.tsv').open('w', encoding='utf-8', newline='') as f:
        w = csv.writer(f, delimiter='\t')
        w.writerow(['class', 'vftable_va', 'slot_0_based', 'target_va', 'rva', 'export_aliases'])
        for vt in vtables:
            for s in vt['slots']:
                w.writerow([vt['type'], vt['vftable_va'], s['index'], s['target_va'], s['rva'], ' | '.join(s['exports'])])

    # Compact Markdown report with a table of hierarchy and vtable targets.
    lines = [
        '# MSVC RTTI and vftable recovery', '',
        f"Input: `{args.dll.name}`; image base `{BASE:#010x}`; SHA-256 `{digest}`.",
        f"TypeDescriptors discovered: **{len(type_by_va)}**; validated COL records: **{len(dedup)}**; vftable candidates: **{len(vtables)}**.", '',
        '## Method and limitations',
        'Parsed MSVC x86 RTTI structures: TypeDescriptor, CompleteObjectLocator, ClassHierarchyDescriptor and BaseClassDescriptor. Vftable candidates are found by locating COL pointers in `.rdata` and reading contiguous `.text` pointers. Addresses are evidence; aliases may be folded by identical-code folding. A vftable slot is not assigned a unique source-level name where the exports do not resolve it. Constructor/destructor and access-control semantics require instruction-level corroboration.', '',
        '## Class inheritance (RTTI base order)', '',
        '| Most-derived type | RTTI base sequence |', '|---|---|'
    ]
    for c in dedup:
        if c['type'].startswith('.?AV?') or c['type'] in ('.?AVtype_info@@', '.?AVexception@std@@', '.?AVbad_alloc@std@@', '.?AVbad_array_new_length@std@@'):
            continue
        nice = c['type'].replace('.?AV', '').replace('@@', '')
        bases = ' → '.join(b['type'].replace('.?AV', '').replace('@@', '') for b in c['bases'])
        lines.append(f'| `{nice}` | `{bases}` |')
    lines += ['', '## Virtual function tables', '', '| Class | vftable VA | Slots (0-based): target — export alias |', '|---|---:|---|']
    for vt in vtables:
        if vt['type'].startswith('.?AV?') or vt['type'] in ('.?AVtype_info@@', '.?AVexception@std@@', '.?AVbad_alloc@std@@', '.?AVbad_array_new_length@std@@'):
            continue
        nm = vt['type'].replace('.?AV', '').replace('@@', '')
        slotstr = '<br>'.join(f"{s['index']}: `{s['target_va']}` — {'; '.join(s['exports']) if s['exports'] else 'unresolved / non-exported'}" for s in vt['slots'])
        lines.append(f"| `{nm}` | `{vt['vftable_va']}` | {slotstr} |")
    lines += ['', '## Observations',
        '- Repeated base-subobject offsets (`mdisp=0`) are consistent with single, non-virtual inheritance for the principal application classes in this build; do not infer C++ access level from this alone.',
        '- `__purecall` target is `0x10015aa2`; abstract base slots are therefore visible in the tables.',
        '- Multiple virtual names may share one implementation address; this can result from compiler identical-code folding or explicit forwarding/thunk code. Confirm with caller context before assigning semantics.',
        '- Classes ending in `Private` commonly expose a one-slot destructor vftable, consistent with private implementation objects.',
        '', 'Raw records: `rtti_recovery.json`; normalized tables: `class_hierarchy.tsv` and `vtable_slots.tsv`.'
    ]
    (args.out / 'rtti_vftable_report.md').write_text('\n'.join(lines) + '\n', encoding='utf-8')
    print(f'TypeDescriptors={len(type_by_va)} COL={len(dedup)} vftables={len(vtables)}')

if __name__ == '__main__':
    main()
