#!/usr/bin/env python3
"""SHA-pinned static audit for AIStructurePrivate's nested RB-tree topology.

TreeHandle32 is an analytical name introduced by this report, not an original
MSVC/source symbol. It describes the two DWORDs embedded at AIStructurePrivate+0x04 and outer_node+0x14:
{ tree_header_pointer, node_count }.
"""
from __future__ import annotations
import argparse, hashlib, json, subprocess
from pathlib import Path

EXPECTED_SHA256 = "80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525"

def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()

def disasm(path: Path, start: int, stop: int) -> str:
    return subprocess.run(
        ["objdump", "-d", "-Mintel", f"--start-address=0x{start:x}",
         f"--stop-address=0x{stop:x}", str(path)],
        text=True, capture_output=True, check=True).stdout.lower()

def has_all(text: str, *needles: str) -> bool:
    return all(n.lower() in text for n in needles)

def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("maiwmodels", type=Path)
    ap.add_argument("--out", type=Path)
    ns = ap.parse_args()
    digest = sha256(ns.maiwmodels)
    if digest != EXPECTED_SHA256:
        raise SystemExit(f"MAIWmodels.dll SHA-256 mismatch: {digest}")

    private_ctor = disasm(ns.maiwmodels, 0x1000d800, 0x1000d870)
    outer_handle_copy = disasm(ns.maiwmodels, 0x1000d510, 0x1000d590)
    outer_node = disasm(ns.maiwmodels, 0x1000d470, 0x1000d510)
    outer_recursion = disasm(ns.maiwmodels, 0x1000d590, 0x1000d630)
    outer_header_factory = disasm(ns.maiwmodels, 0x1000dbf0, 0x1000dc20)
    nested_handle_ctor = disasm(ns.maiwmodels, 0x10001000, 0x10001090)
    nested_handle_copy = disasm(ns.maiwmodels, 0x100010c0, 0x10001134)
    nested_node_copy = disasm(ns.maiwmodels, 0x10001090, 0x100010c0)
    nested_header_factory = disasm(ns.maiwmodels, 0x10001c10, 0x10001c40)
    nested_node_factory = disasm(ns.maiwmodels, 0x10001c40, 0x10001c78)
    recursive_clear = disasm(ns.maiwmodels, 0x1000dcb0, 0x1000dd13)
    outer_clear = disasm(ns.maiwmodels, 0x1000df30, 0x1000e020)
    range_erase = disasm(ns.maiwmodels, 0x10013bd0, 0x10013c70)
    private_dtor = disasm(ns.maiwmodels, 0x1000d970, 0x1000da40)
    outer_insert = disasm(ns.maiwmodels, 0x1000ec70, 0x1000ecb0)
    nested_insert = disasm(ns.maiwmodels, 0x10013210, 0x10013260)
    outer_erase = disasm(ns.maiwmodels, 0x1000e020, 0x1000e280)
    nested_erase = disasm(ns.maiwmodels, 0x10001d10, 0x10001f53)

    checks = {
        "private_tree_ctor_calls_outer_header_factory": "call   0x1000dbf0" in private_ctor,
        "private_ctor_addresses_inline_outer_handle": "lea    esi,[edi+0x4]" in private_ctor,
        "private_ctor_zeros_both_outer_handle_dwords": has_all(private_ctor, "mov    dword ptr [esi],0x0", "mov    dword ptr [esi+0x4],0x0"),
        "private_ctor_stores_outer_header_in_handle_dword0": "mov    dword ptr [esi],eax" in private_ctor,
        "outer_handle_copy_copies_root_into_header": "mov    dword ptr [esi+0x4],eax" in outer_handle_copy,
        "outer_handle_copy_copies_count_to_handle_plus4": "mov    eax,dword ptr [edi+0x4]" in outer_handle_copy and "mov    dword ptr [ebx+0x4],eax" in outer_handle_copy,
        "outer_header_factory_allocates_0x1c": "push   0x1c" in outer_header_factory,
        "outer_header_factory_self_links_sentinel": has_all(outer_header_factory, "mov    dword ptr [eax],eax", "mov    dword ptr [ecx],eax", "mov    word ptr [eax+0xc],0x101"),
        "outer_node_allocator_called": "call   0x1000f8f0" in outer_node,
        "outer_node_copies_one_payload_dword_to_plus10": "mov    dword ptr [edx],eax" in outer_node,
        "outer_node_passes_source_inline_handle_at_plus14": "lea    eax,[ecx+0x4]" in outer_node,
        "outer_node_passes_destination_inline_handle_at_plus14": "lea    ecx,[edx+0x4]" in outer_node,
        "outer_node_clones_inline_handle": "call   0x10001000" in outer_node,
        "outer_tree_recursion_clones_outer_nodes": "call   0x1000d470" in outer_recursion,
        "outer_tree_recursion_handles_left_and_right_children": has_all(outer_recursion, "push   dword ptr [ecx]", "push   dword ptr [eax+0x8]"),
        "nested_handle_ctor_zeros_both_dwords": has_all(nested_handle_ctor, "mov    dword ptr [esi],0x0", "mov    dword ptr [esi+0x4],0x0"),
        "nested_handle_ctor_allocates_fresh_0x18_header": "call   0x10001c10" in nested_handle_ctor,
        "nested_handle_ctor_stores_header_pointer_in_first_dword": "mov    dword ptr [esi],eax" in nested_handle_ctor,
        "nested_handle_ctor_runs_deep_copy": "call   0x100010c0" in nested_handle_ctor,
        "nested_handle_copy_copies_root_into_inner_header": "mov    dword ptr [esi+0x4],eax" in nested_handle_copy,
        "nested_handle_copy_copies_node_count_to_handle_plus4": "mov    dword ptr [ebx+0x4],eax" in nested_handle_copy and "mov    eax,dword ptr [edi+0x4]" in nested_handle_copy,
        "nested_header_factory_allocates_0x18": "push   0x18" in nested_header_factory,
        "nested_header_factory_self_links_sentinel": has_all(nested_header_factory, "mov    dword ptr [eax],eax", "mov    dword ptr [ecx],eax", "mov    word ptr [eax+0xc],0x101"),
        "nested_node_factory_allocates_0x18": "push   0x18" in nested_node_factory,
        "nested_node_copy_copies_first_payload_word": "mov    dword ptr [esi],ecx" in nested_node_copy,
        "nested_node_copy_copies_second_payload_word": "mov    dword ptr [esi+0x4],eax" in nested_node_copy,
        "outer_cleanup_recurses": "call   0x1000dcb0" in recursive_clear,
        "outer_cleanup_uses_inline_handle_header_dword": has_all(recursive_clear, "mov    eax,dword ptr [ebx+0x14]", "lea    ecx,[ebx+0x14]"),
        "outer_cleanup_erases_nested_tree_range": "call   0x10013bd0" in recursive_clear,
        "outer_cleanup_frees_nested_header_and_outer_node": recursive_clear.count("call   0x10014d23") >= 2,
        "range_erase_uses_tree_node_erase": "call   0x10001d10" in range_erase,
        "outer_clear_calls_recursive_node_cleanup": "call   0x1000dcb0" in outer_clear,
        "private_destructor_clears_outer_tree": "call   0x1000df30" in private_dtor,
        "private_destructor_releases_two_vector_buffers_separately": has_all(private_dtor, "[esi+0x20]", "[esi+0x14]"),
        "outer_insert_increments_handle_node_count": has_all(outer_insert, "mov    edi,ecx", "call   0x1000ea00", "inc    dword ptr [edi+0x4]"),
        "nested_insert_increments_handle_node_count": has_all(nested_insert, "mov    edi,ecx", "call   0x10001090", "inc    dword ptr [edi+0x4]"),
        "outer_erase_decrements_handle_node_count": has_all(outer_erase, "mov    ebx,ecx", "test   eax,eax", "dec    eax", "mov    dword ptr [ebx+0x4],eax"),
        "nested_erase_decrements_handle_node_count": has_all(nested_erase, "mov    ebx,ecx", "test   eax,eax", "dec    eax", "mov    dword ptr [ebx+0x4],eax"),
    }
    report = {
        "stage": "1.17",
        "topic": "AIStructurePrivate nested red-black tree topology and TreeHandle32",
        "static_only": True,
        "binary": "MAIWmodels.dll",
        "sha256": digest,
        "checks_passed": sum(checks.values()),
        "checks_total": len(checks),
        "checks": checks,
        "confirmed_topology": {
            "outer_tree_handle": "inline 8-byte TreeHandle32 at AIStructurePrivate+0x04..+0x0b (analytical name)",
            "outer_TreeHandle32": {
                "+0x00": "pointer to the separately allocated 0x1c-byte outer tree header",
                "+0x04": "outer tree node_count DWORD (incremented on insert, decremented on erase)",
            },
            "outer_node_size": "0x1c bytes",
            "outer_node_payload": {
                "+0x10": "one copied DWORD; semantic type unknown",
                "+0x14..+0x1b": "inline 8-byte TreeHandle32 (analytical name, not original symbol)",
            },
            "TreeHandle32": {
                "+0x00": "pointer to a separately allocated 0x18-byte nested tree header",
                "+0x04": "nested tree node_count DWORD (incremented on insert, decremented on erase)",
            },
            "nested_tree_header_size": "0x18 bytes",
            "nested_tree_node_size": "0x18 bytes",
            "nested_node_payload": {"+0x10": "DWORD (meaning unknown)", "+0x14": "DWORD (meaning unknown)"},
            "element_vector": "AIStructurePrivate+0x14",
            "binary_link_vector": "AIStructurePrivate+0x20",
        },
        "behavior": {
            "outer_node_clone": "0x1000D470 allocates a 0x1c-byte outer node, copies the DWORD at +0x10, and passes source/destination inline TreeHandle32 addresses to 0x10001000.",
            "TreeHandle32_clone": "0x10001000 zeros both handle DWORDs, allocates a fresh 0x18-byte nested header via 0x10001C10, stores its pointer in handle[0], then calls 0x100010C0; that helper clones the nested root and copies source handle[1] (node_count) to destination handle[1].",
            "outer_tree_clone": "0x1000D590 recursively clones left/right outer nodes; 0x1000D510 installs the cloned root/header state.",
            "nested_tree_clone": "0x100010C0/0x10001140 rebuild nested node topology; 0x10001090 allocates a 0x18-byte node and copies two DWORD payload words.",
            "clear": "0x1000DCB0 reads the nested header pointer from inline handle[0], passes the handle address to 0x10013BD0 for range erase, then frees the nested header and outer node; 0x1000DF30 clears/restores the outer tree.",
        },
        "unknowns": [
            "Exact semantic type of the outer node DWORD at +0x10 is unknown.",
            "Exact meanings of the two nested-node DWORD payloads are unknown.",
            "The public model feature that populates or queries this tree is not yet mapped.",
            "No direct Parameter*/Object* ownership is visible in the examined clone/clear paths; indirect IDs or opaque references are not excluded.",
            "No Windows runtime or heap trace has been performed.",
        "The exact public API feature that mutates these two trees remains unmapped.",
        ],
        "correction": "The earlier node-local vector interpretation and the later single-pointer reading were incomplete. outer_node+0x14 is not a standalone raw pointer field. AIStructurePrivate+0x04..+0x0b and outer_node+0x14..+0x1b are both inline TreeHandle32 descriptors: DWORD[0] is the separately allocated tree-header pointer; DWORD[1] is that tree's node_count, as insert helpers increment it and erase helpers decrement it. The outer node/header size is 0x1c; nested header/node size is 0x18. TreeHandle32 is an analytical label, not an original symbol.",
    }
    if not all(checks.values()):
        raise SystemExit("Audit failed: " + ", ".join(k for k,v in checks.items() if not v))
    data = json.dumps(report, indent=2, ensure_ascii=False) + "\n"
    if ns.out:
        ns.out.parent.mkdir(parents=True, exist_ok=True)
        ns.out.write_text(data, encoding="utf-8")
    print(data, end="")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
