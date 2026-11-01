#!/usr/bin/env python3
"""SHA-pinned static evidence audit for Stage 1.17 ConceptStructure findings."""
from __future__ import annotations
import argparse, hashlib, json, re, sys
from pathlib import Path
EXPECTED_SHA256 = "80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525"
REQUIRED = {
    "arragment_factory": ["1000f9b0:", "call   0x10011170", "call   0x1000dd30", "call   0x1000d1b0"],
    "composition_factory": ["1000fa50:", "call   0x10011180", "call   0x1000dd30", "call   0x1000d1b0"],
    "order_factory": ["1000fb10:", "call   0x10011190", "call   0x1000dd30", "push   0x63"],
    "category_factory": ["1000fba0:", "push   0x8", "call   0x10011230", "call   0x1000ddb0"],
    "code_structure": ["1000fc10:", "call   0x1000dbf0", "call   0x1000f1c0", "call   0x10013bd0"],
    "sccompare": ["10011330:", "[eax+0x38]", "[eax+0x40]", "[eax+0x44]"],
    "class_char_map": ["10011450:", "mov    al,0x53", "mov    al,0x50", "mov    al,0x5a", "mov    al,0x4b", "mov    al,0x4f", "mov    al,0x52", "mov    al,0x43"],
}
SCBINARY_REQUIRED = {
    "outer_object_allocation_and_release": ["1000f9b0:", "push   0x30", "call   0x10014cf0", "call   0x10010480", "1000f740:", "call   0x100104a0", "push   0x30", "push   esi", "call   0x10014d28"],
    "base_private_record_allocation": ["10010480:", "call   0x1000c600", "1000c600:", "push   0x30", "call   0x10014cf0", "call   0x10002b80"],
    "endpoint_slots_and_type_field": ["10003080:", "[eax*4+0x1c]", "10003160:", "[ecx+eax*4+0x1c]", "10003180:", "[eax+0x28]"],
    "arragment_setter_type_and_three_slots": ["1000d0f0:", "push   0x0", "push   0x1", "push   0x2", "mov    dword ptr [eax+0x28],0x3"],
    "composition_setter_type_and_two_slots": ["1000d130:", "mov    dword ptr [eax+0x28],0x2"],
    "order_setter_type_and_two_slots": ["1000d170:", "mov    dword ptr [eax+0x28],0x1"],
    "typed_endpoint_accessors": ["1000d050:", "push   0x0", "10003610:", "push   0x1", "1000d060:", "push   0x2"],
}

AUTORANGE_REQUIRED = {
    "coding_type_zero_gate_in_first_normalization_pass": ["1000fc8c:", "call   0x1000d360", "test   eax,eax", "jne    0x1000fcd0", "call   0x10011660", "call   0x10012f80", "call   0x10011440", "call   0x1000f1c0"],
    "auto_range_exact_link_filter": ["10010180:", "call   0x10011390", "ff 50 04", "ff 50 08", "call   0x10003180", "cmp    eax,0x3", "call   0x1000d060", "cmp    DWORD PTR [ebp-0x5c],eax"],
    "auto_range_sort_and_sequential_assignment": ["call   0x1000f390", "inc    ebx", "call   0x1000d1b0"],
    "link_binding_endpoint_index_and_link_pointer": ["10003a20:", "mov    DWORD PTR [ecx+0x4],esi", "mov    DWORD PTR [ecx],eax", "10003aa0:", "sar    eax,0x2"],
    "subject_category_type_fields_are_distinct": ["1000d360:", "[eax+0x3c]", "100116c0:", "[eax+0x4c]", "100116d0:", "call   0x10003180", "cmp    eax,0x3", "call   0x10003160", "test   eax,eax"],
    "cstype_observed_boolean_return_domain": ["100116d0:", "xor    esi,esi", "mov    esi,0x1", "mov    eax,esi", "ret"],
}

DISPLAY_REQUIRED = {
    "scbinarylink_getcode_endpoints_and_missing_marker": ["10010800:", "call   0x1000d050", "call   0x10003610", "call   0x1000d060", "ff 52 14", "100174f0:", "call   0x10011f90", "call   0x10011e40"],
    "scbinarylink_getname_type_dispatch": ["100109e0:", "call   0x10003180", "100174a4: ; utf-16le \"компоновка \"", "100174c0: ; utf-16le \"состав \"", "100174d0: ; utf-16le \"упорядочивание \""],
    "range_getter_setter_field": ["1000d070:", "[eax+0x2c]", "1000d1b0:", "[ecx+0x2c]"],
}

def pe_va_bytes(data: bytes, va: int, image_base: int) -> bytes:
    import struct
    pe_off = struct.unpack_from("<I", data, 0x3C)[0]
    if data[pe_off:pe_off+4] != b"PE\0\0":
        raise ValueError("invalid PE signature")
    nsec = struct.unpack_from("<H", data, pe_off+6)[0]
    opt_size = struct.unpack_from("<H", data, pe_off+20)[0]
    opt = pe_off+24
    actual_base = struct.unpack_from("<I", data, opt+28)[0]
    if actual_base != image_base:
        raise ValueError(f"unexpected PE image base {actual_base:#x}")
    sec = opt+opt_size
    rva = va-image_base
    for i in range(nsec):
        off = sec+i*40
        vsize, vaddr, raw_size, raw_ptr = struct.unpack_from("<IIII", data, off+8)
        if vaddr <= rva < vaddr+max(vsize, raw_size):
            delta = rva-vaddr
            if delta >= raw_size:
                raise ValueError("VA maps to virtual-only section bytes")
            return data[raw_ptr+delta:raw_ptr+raw_size]
    raise ValueError(f"VA {va:#x} is not mapped by a PE section")

def utf16z_at(data: bytes, va: int) -> str:
    raw = pe_va_bytes(data, va, 0x10000000)
    end = next((i for i in range(0, len(raw)-1, 2) if raw[i:i+2] == b"\0\0"), len(raw) & ~1)
    return raw[:end].decode("utf-16le")

def main() -> int:
    ap=argparse.ArgumentParser()
    ap.add_argument("--asm",type=Path,required=True)
    ap.add_argument("--exports",type=Path,required=True)
    ap.add_argument("--binary",type=Path)
    ap.add_argument("--out",type=Path)
    args=ap.parse_args()
    asm=args.asm.read_text(errors="replace").lower()
    endpoint_asm=args.asm.with_name("scbinarylink_allocation_and_typed_endpoints.asm")
    if endpoint_asm.exists():
        asm += "\n" + endpoint_asm.read_text(errors="replace").lower()
    display_asm=args.asm.with_name("scbinarylink_display_methods.asm")
    if display_asm.exists():
        asm += "\n" + display_asm.read_text(errors="replace").lower()
    endpoint_range_asm=args.asm.with_name("concept_structure_endpoint_and_range_contract.asm")
    if endpoint_range_asm.exists():
        asm += "\n" + endpoint_range_asm.read_text(errors="replace").lower()
    exports=args.exports.read_text(errors="replace")
    checks={}
    for name,needles in REQUIRED.items():
        checks[name]=all(n.lower() in asm for n in needles)
    for name,needles in SCBINARY_REQUIRED.items():
        checks[name]=all(n.lower() in asm for n in needles)
    for name,needles in DISPLAY_REQUIRED.items():
        checks[name]=all(n.lower() in asm for n in needles)
    for name,needles in AUTORANGE_REQUIRED.items():
        checks[name]=all(n.lower() in asm for n in needles)
    export_names=["?addArragmentLink@ConceptStructure", "?addCompositionLink@ConceptStructure", "?addOrderLink@ConceptStructure", "?addSubjectCategory@ConceptStructure", "?codeStructure@ConceptStructure", "?SCcompare@SubjectCategory"]
    checks["decorated_exports"]=all(x in exports for x in export_names)
    actual_sha=None
    if args.binary:
        h=hashlib.sha256()
        with args.binary.open("rb") as f:
            for chunk in iter(lambda:f.read(1024*1024),b""): h.update(chunk)
        actual_sha=h.hexdigest()
        checks["source_binary_sha256"]=actual_sha==EXPECTED_SHA256
        raw=args.binary.read_bytes()
        expected_literals={0x100174A4:"Компоновка ",0x100174C0:"Состав ",0x100174D0:"Упорядочивание ",0x100174F0:"-"}
        checks["rdata_relation_labels"]=all(utf16z_at(raw,va)==value for va,value in expected_literals.items())
    result={"audit":"stage117-concept-structure","expected_binary_sha256":EXPECTED_SHA256,"actual_binary_sha256":actual_sha,"checks":checks,"passed":sum(checks.values()),"total":len(checks),"status":"PASS" if all(checks.values()) else "FAIL"}
    payload=json.dumps(result,indent=2)+"\n"
    if args.out:
        args.out.parent.mkdir(parents=True,exist_ok=True); args.out.write_text(payload)
    print(payload,end="")
    return 0 if all(checks.values()) else 1
if __name__=="__main__": sys.exit(main())
