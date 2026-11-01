#!/usr/bin/env python3
"""SHA-pinned audit of ConceptStructure::codeStructure auto-range behavior."""
import argparse, hashlib, json, pathlib, subprocess, sys
EXPECTED="80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525"
def sha(p):
 h=hashlib.sha256()
 with p.open("rb") as f:
  for b in iter(lambda:f.read(1<<20),b""):h.update(b)
 return h.hexdigest()
def dis(p,s,e):
 return subprocess.run(["objdump","-d","-Mintel",f"--start-address=0x{s:x}",f"--stop-address=0x{e:x}",str(p)],check=True,capture_output=True,text=True).stdout.lower()
def main():
 ap=argparse.ArgumentParser();ap.add_argument("dll",type=pathlib.Path);ap.add_argument("--out",type=pathlib.Path);a=ap.parse_args()
 h=sha(a.dll)
 if h!=EXPECTED: print("SHA mismatch "+h,file=sys.stderr);return 2
 c=dis(a.dll,0x1000fc10,0x10010359)
 p=dis(a.dll,0x10011670,0x100116b5)
 cmp=dis(a.dll,0x1000f390,0x1000f481)
 checks={
  "codeStructure_export_body_exists":"1000fc10" in c,
  "codeStructure_calls_getAutoRange":"0x10011390" in c,
  "codeStructure_filters_link_type_3":"0x10003180" in c and "cmp    eax,0x3" in c,
  "codeStructure_checks_third_endpoint":"0x1000d060" in c,
  "codeStructure_sorts_with_SCcompare":"0x1000f390" in c,
  "codeStructure_uses_second_endpoint_key":"0x10003610" in cmp,
  "codeStructure_assigns_range_with_setter":"0x1000d1b0" in c,
  "codeStructure_increments_rank":"inc    ebx" in c,
  "getAutoRange_field_offset_58":"[eax+0x58]" in dis(a.dll,0x10011390,0x10011397),
  "getParent_filters_type_2":"cmp    eax,0x2" in p,
  "getParent_checks_endpoint_2":"0x10003160" in p,
  "getParent_returns_endpoint_1":"push   0x0" in p and "0x10003160" in p,
  "class_4_group_inheritance":"0x10011670" in c and "0x10012fc0" in c,
  "number_getter_and_setter":"0x10011660" in c and "0x100117b0" in c,
  "group_getter_and_setter":"0x10012f80" in c and "0x10012fc0" in c,
  "class_getter":"0x10011440" in c,
  "parameter_ieclass_not_read":"[ebp+0x8]" not in c,
  "comparator_uses_SCcompare":"0x10011330" in cmp,
 }
 result={"audit":"conceptstructure-codestructure-autorange","static_only":True,"dll_sha256":h,
         "function_va":"0x1000FC10","checks":checks,"passed":sum(checks.values()),"total":len(checks),
         "status":"PASS" if all(checks.values()) else "FAIL",
         "confirmed_autorange_rule":"autoRange category -> links with type 3 and null endpoint 3 -> sort by endpoint 2 using SCcompare -> range 1..N",
         "limitations":["Full numbering-group partitioning across all SubjectCategory classes is not yet formalized.",
                        "No runtime save/reopen or UI behavior test."]}
 payload=json.dumps(result,ensure_ascii=False,indent=2)+"\n"
 if a.out:a.out.parent.mkdir(parents=True,exist_ok=True);a.out.write_text(payload,encoding="utf-8")
 print(payload,end="");return 0 if result["status"]=="PASS" else 1
if __name__=="__main__":raise SystemExit(main())
