#!/usr/bin/env python3
"""Evidence-contract audit over the bundled, address-labelled disassembly excerpt."""
import json, pathlib, sys
ROOT = pathlib.Path(__file__).resolve().parents[1]
ASM = ROOT / "analysis/disassembly/codeStructure_number_group_and_helpers.asm"
EXPECTED_SHA = "80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525"

def main():
    s = ASM.read_text(encoding="utf-8").lower()
    checks = {
        "codingtype_zero_gate": "1000fc8c:" in s and "call   0x1000d360" in s and "1000fc93:" in s,
        "reserved_tuple_gets_number_group_class": all(x in s for x in ("call   0x10011660", "call   0x10012f80", "call   0x10011440")),
        "reserved_tuple_insert_helper": "call   0x1000f1c0" in s,
        "class5_deferred_list_branch": "cmp    eax,0x5" in s and "call   0x1000e9a0" in s,
        "class4_parent_group_inheritance": "call   0x10011670" in s and "call   0x10012fc0" in s,
        "general_group_minus_one_gate": "cmp    eax,0xffffffff" in s,
        "general_codingtype_nonzero_gate": "call   0x1000d360" in s,
        "per_bucket_counter_increment": "inc    eax" in s and "[esi+0x18]" in s,
        "collision_probe_helper": "call   0x1000ea40" in s,
        "candidate_increment_on_collision": "inc    edi" in s,
        "number_setter": "call   0x100117b0" in s,
        "class5_parent_number_to_group": "call   0x10011660" in s and "call   0x10012fc0" in s,
        "autorange_endpoint_index_zero": "cmp    dword ptr [ebp-0x5c],eax" in s,
        "autorange_type_three": "cmp    eax,0x3" in s,
        "autorange_third_endpoint_null": "call   0x1000d060" in s,
        "autorange_range_setter": "call   0x1000d1b0" in s,
        "sccompare_used_for_ordering": "call   0x10011330" in s,
    }
    result = {
        "audit": "subjectcategory-number-group-algorithm",
        "binary_sha256": EXPECTED_SHA,
        "source": str(ASM.relative_to(ROOT)),
        "checks": checks,
        "passed": sum(checks.values()),
        "total": len(checks),
        "status": "PASS" if all(checks.values()) else "FAIL",
        "scope": "static disassembly evidence only; no runtime validation"
    }
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return 0 if result["status"] == "PASS" else 1

if __name__ == "__main__":
    raise SystemExit(main())
