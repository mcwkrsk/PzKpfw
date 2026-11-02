#!/usr/bin/env python3
"""SHA-pinned static audit of Parameter/Object post-erase ownership paths."""
from __future__ import annotations
import argparse, hashlib, json, re, subprocess
from pathlib import Path

EXPECTED = {
    "PM_params.dll": "22c867d11fcc724b79fbff420f514d7adccd7a8eb7565e9b4b43e60b267ea781",
    "MAIWmodels.dll": "80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525",
}

def sha256(p: Path) -> str:
    h = hashlib.sha256()
    with p.open('rb') as f:
        for b in iter(lambda: f.read(1024 * 1024), b''):
            h.update(b)
    return h.hexdigest()

def disasm(path: Path, start: int, stop: int) -> str:
    return subprocess.run(
        ["objdump", "-d", "-Mintel", f"--start-address=0x{start:x}",
         f"--stop-address=0x{stop:x}", str(path)],
        check=True, text=True, capture_output=True).stdout.lower()

def dump(path: Path, start: int, stop: int) -> str:
    return subprocess.run(
        ["objdump", "-s", f"--start-address=0x{start:x}",
         f"--stop-address=0x{stop:x}", str(path)],
        check=True, text=True, capture_output=True).stdout.lower()

def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("pm_params", type=Path)
    ap.add_argument("maiwmodels", type=Path)
    ap.add_argument("--out", type=Path)
    ns = ap.parse_args()
    bins = {"PM_params.dll": ns.pm_params, "MAIWmodels.dll": ns.maiwmodels}
    hashes = {k: sha256(v) for k, v in bins.items()}
    for k, expected in EXPECTED.items():
        if hashes[k] != expected:
            raise SystemExit(f"SHA-256 mismatch for {k}: {hashes[k]}")

    pm = ns.pm_params; core = ns.maiwmodels
    obj_delete = disasm(pm, 0x10002450, 0x100025a5)
    param_delete = disasm(pm, 0x100059d0, 0x10005b3b)
    core_del_param_thunk = disasm(core, 0x10013bc0, 0x10013bc9)
    core_del_obj_thunk = disasm(core, 0x100129e0, 0x100129e9)
    core_erase_param = disasm(core, 0x1000de60, 0x1000deb7)
    core_erase_obj = disasm(core, 0x1000dec0, 0x1000df20)
    core_struct_dtor = disasm(core, 0x1000d8e0, 0x1000d96a)
    add_param = disasm(core, 0x100139d0, 0x10013a3e)
    add_obj = disasm(core, 0x10012970, 0x100129de)
    dtor_param = disasm(core, 0x10012ce0, 0x10012d7b)
    dtor_obj = disasm(core, 0x100124d0, 0x10012574)
    vtbl_obj = dump(core, 0x1001753c, 0x10017540)
    vtbl_param = dump(core, 0x10017574, 0x10017578)
    primary_ctor = disasm(core, 0x10013d30, 0x10013ebf)
    primary_get_params = disasm(core, 0x10014270, 0x10014279)
    primary_get_objects = disasm(core, 0x10014260, 0x1001426a)
    abstract_model_dtor = disasm(core, 0x100015f0, 0x100016b2)
    ais_private_dtor = disasm(core, 0x1000d970, 0x1000da34)
    ais_tree_node_dtor = disasm(core, 0x1000dcb0, 0x1000dd13)
    aebinary_add_endpoint = disasm(core, 0x10003080, 0x10003152)
    ais_add_link = disasm(core, 0x1000dd30, 0x1000dda2)

    checks = {
        "parameter_factory_allocates_8_byte_wrapper": "push   0x8" in add_param,
        "parameter_factory_constructs_parameter": "call   0x10012a50" in add_param,
        "parameter_factory_inserts_into_aistructure": "call   0x1000ddb0" in add_param,
        "object_factory_allocates_12_byte_wrapper": "push   0xc" in add_obj,
        "object_factory_constructs_object": "call   0x10012410" in add_obj,
        "object_factory_inserts_into_aistructure": "call   0x1000ddb0" in add_obj,
        "delete_parameter_export_thunk_targets_vector_erase": "jmp    0x1000de60" in core_del_param_thunk,
        "delete_object_export_thunk_targets_id_erase": "jmp    0x1000dec0" in core_del_obj_thunk,
        "parameter_erase_uses_element_vector": "[ebx+0x4]" in core_erase_param and "add    ecx,0x14" in core_erase_param,
        "object_erase_uses_id_search": "call   0x1000d650" in core_erase_obj,
        "parameter_erase_does_not_dispatch_pointee_destructor": "call   dword ptr [eax]" not in core_erase_param,
        "object_erase_does_not_dispatch_pointee_destructor": "call   dword ptr [eax]" not in core_erase_obj,
        "aistructure_dtor_dispatches_remaining_element_deleting_destructor": "call   dword ptr [eax]" in core_struct_dtor and "push   0x1" in core_struct_dtor,
        "object_vtable_slot0_is_object_deleting_destructor": bool(re.search(r"1001753c.*d0240110", vtbl_obj)),
        "parameter_vtable_slot0_is_parameter_deleting_destructor": bool(re.search(r"10017574.*e02c0110", vtbl_param)),
        "object_deleting_dtor_has_12_byte_free_path": "push   0xc" in dtor_obj and "call   0x10014d28" in dtor_obj,
        "parameter_deleting_dtor_has_8_byte_free_path": "push   0x8" in dtor_param and "call   0x10014d28" in dtor_param,
        "object_ui_clears_parameter_references_before_list_erase": (
            obj_delete.find("ds:0x1000a0c0") < obj_delete.find("ds:0x1000a0a4")
            and "ds:0x1000a0bc" in obj_delete and "push   0x0" in obj_delete),
        "object_ui_resolves_id_before_delete_by_id": (
            obj_delete.find("ds:0x1000a0b0") < obj_delete.find("ds:0x1000a0a4")),
        "parameter_ui_filters_type4_and_unlinks": (
            "cmp    eax,0x4" in param_delete and "ds:0x1000a098" in param_delete
            and "ds:0x1000a090" in param_delete),
        "parameter_ui_calls_delete_parameter_after_link_cleanup": (
            param_delete.find("ds:0x1000a070") > param_delete.find("ds:0x1000a090")),
        "primary_model_constructs_parameters_then_objects_lists": (
            "call   0x10013510" in primary_ctor and "call   0x100126a0" in primary_ctor
            and primary_ctor.find("call   0x10013510") < primary_ctor.find("call   0x100126a0")),
        "primary_model_appends_both_lists_to_same_aggregate_vector": (
            primary_ctor.count("add    ecx,0x4") >= 2
            and primary_ctor.count("call   0x10002a60") >= 2),
        "get_params_list_returns_first_aggregate_entry": (
            "mov    eax,dword ptr [eax+0x4]" in primary_get_params
            and "mov    eax,dword ptr [eax]" in primary_get_params),
        "get_objects_list_returns_second_aggregate_entry": (
            primary_get_objects.count("mov    eax,dword ptr [eax+0x4]") >= 2),
        "abstract_model_dtor_dispatches_child_container_deleting_dtors": (
            "mov    eax,dword ptr [eax+0x4]" in abstract_model_dtor
            and "mov    eax,dword ptr [eax+0x10]" in abstract_model_dtor
            and "mov    eax,dword ptr [eax+0x1c]" in abstract_model_dtor
            and abstract_model_dtor.count("call   dword ptr [eax]") >= 3
            and abstract_model_dtor.count("push   0x1") >= 3),
        "aistructure_private_dtor_cleans_separate_tree_header": (
            "call   0x1000df30" in ais_private_dtor
            and "lea    ecx,[esi+0x4]" in ais_private_dtor),
        "aistructure_tree_cleanup_visits_nested_tree_handle_and_frees_nodes": (
            "call   0x1000dcb0" in ais_tree_node_dtor
            and "[ebx+0x14]" in ais_tree_node_dtor
            and "call   0x10013bd0" in ais_tree_node_dtor
            and "call   0x10014d23" in ais_tree_node_dtor),
        "binary_link_registers_back_reference_on_aelement": (
            "lea    ecx,[esi+0x10]" in aebinary_add_endpoint
            and "cmp    dword ptr [ebx+eax*4],edi" in aebinary_add_endpoint
            and "add    dword ptr [esi+0x14],0x4" in aebinary_add_endpoint),
        "aistructure_keeps_binary_links_in_vector_plus20": (
            "add    ecx,0x20" in ais_add_link
            and "call   0x10002a60" in ais_add_link),
    }
    report = {
        "stage": "1.17",
        "topic": "Parameter/Object post-erase ownership",
        "static_only": True,
        "sha256": hashes,
        "checks_passed": sum(checks.values()),
        "checks_total": len(checks),
        "checks": checks,
        "conclusion": "Both UI deletion paths detach the selected AIElement from AIStructure's element vector without invoking the removed element's deleting destructor in the inspected path. The AIStructure destructor destroys elements that remain in its vector. No alternate owner/reclaimer has been established; classify as a high-confidence orphaned-allocation/leak candidate, not a proven runtime leak.",
        "primary_model_aggregate": {
            "constructor": "MAIWmodels.dll:0x10013D30",
            "first_vector_member": "PrimaryModelPrivate+0x04",
            "first_entry": "ParametersList (constructed at 0x10013510)",
            "second_entry": "ObjectsList (constructed at 0x100126A0)",
            "get_params_list": "0x10014270 returns first entry",
            "get_objects_list": "0x10014260 returns second entry",
            "destructor": "AbstractModel::~AbstractModel at 0x100015F0 dispatches deleting destructors for entries still in aggregate vectors",
            "interpretation": "PrimaryModel owns the list container wrappers; their own AIStructure element vectors own the elements still attached. No per-element parallel ownership vector is present in the observed PrimaryModel aggregate layout."
        },
        "known_gaps": [
            "No full whole-program pointer/ownership graph was recovered.",
            "No Windows runtime or heap trace was performed.",
            "A deferred cleanup or external owner has not been ruled out.",
            "Potential stale Qt role-0x101 pointer payloads after cross-plugin deletion require runtime invalidation testing.",
            "AIStructurePrivate+0x04..+0x0b is an inline outer TreeHandle32: DWORD[0] points to the 0x1c-byte outer header and DWORD[1] stores outer node_count. Each 0x1c-byte outer node stores a DWORD at +0x10 and embeds another inline TreeHandle32 at +0x14..+0x1b; its DWORD[0] points to a separately allocated 0x18-byte nested header and DWORD[1] stores nested node_count. Nested header/nodes are 0x18 bytes. Inner-node payload has two copied DWORDs. Exact payload semantics are unresolved; no evidence identifies these DWORDs as direct Parameter*/Object* owners."
        ]
    }
    if not all(checks.values()):
        failed = [k for k,v in checks.items() if not v]
        raise SystemExit("Audit failed: " + ", ".join(failed))
    payload = json.dumps(report, indent=2, ensure_ascii=False) + "\n"
    if ns.out:
        ns.out.parent.mkdir(parents=True, exist_ok=True)
        ns.out.write_text(payload, encoding="utf-8")
    print(payload, end="")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
