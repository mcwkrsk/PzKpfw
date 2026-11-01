#!/usr/bin/env python3
"""SHA-pinned static audit for the MAIWmodels AEContentLink / LinkType=4 contract."""
from __future__ import annotations
import argparse, hashlib, json, re, subprocess
from pathlib import Path

EXPECTED = "80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525"

def sha256(p: Path) -> str:
    h = hashlib.sha256()
    with p.open('rb') as f:
        for b in iter(lambda: f.read(1024 * 1024), b''):
            h.update(b)
    return h.hexdigest()

def dump(p: Path, start: int, stop: int) -> str:
    return subprocess.run(['objdump','-d','-Mintel',f'--start-address={start:#x}',f'--stop-address={stop:#x}',str(p)],check=True,text=True,capture_output=True).stdout

def main() -> int:
    ap=argparse.ArgumentParser()
    ap.add_argument('maiwmodels', type=Path)
    ap.add_argument('--pm-params', type=Path)
    ap.add_argument('--out', type=Path)
    ns=ap.parse_args()
    digest=sha256(ns.maiwmodels)
    if digest != EXPECTED:
        raise SystemExit(f'MAIWmodels.dll SHA-256 mismatch: {digest}')
    ctor=dump(ns.maiwmodels,0x10003400,0x10003496)
    af=dump(ns.maiwmodels,0x100026a0,0x10002740)
    access=dump(ns.maiwmodels,0x10003160,0x10003690)
    exp=subprocess.run(['objdump','-p',str(ns.maiwmodels)],check=True,text=True,capture_output=True).stdout
    checks={
      'aecontentlink_default_ctor_exported_at_10003400':'??0AEContentLink@@AAE@XZ' in exp and '10003400:' in ctor,
      'aecontentlink_vtable_written':'mov    DWORD PTR [esi],0x10017188' in ctor,
      'constructor_sets_type_4':'push   0x4' in ctor and 'call   0x10003310' in ctor,
      'aecontentlink_vtable_exported':'??_7AEContentLink@@6B@' in exp,
      'setAElements_exported_at_10003640':'?setAElements@AEContentLink@@QAEXPAVAFElement@@PAVAIElement@@D@Z' in exp and '10003640:' in access,
      'setAElements_uses_endpoint_index_0':'push   0x0' in access[access.find('10003640:'):access.find('10003670:')],
      'setAElements_uses_endpoint_index_1':'push   0x1' in access[access.find('10003640:'):access.find('10003670:')],
      'setAElements_writes_marker_at_2c':'mov    BYTE PTR [ecx+0x2c],al' in access,
      'getAFelement_maps_to_endpoint_0':'push   0x0' in dump(ns.maiwmodels,0x1000d050,0x1000d058),
      'getAIelement_maps_to_endpoint_1':'push   0x1' in access[access.find('10003610:'):access.find('10003618:')],
      'getType_reads_type_at_28':'mov    eax,DWORD PTR [eax+0x28]' in dump(ns.maiwmodels,0x10003180,0x10003187),
      'getChar_and_setChar_use_2c':'BYTE PTR [eax+0x2c]' in access and 'BYTE PTR [ecx+0x2c]' in access,
      'getPower_and_setPower_use_30':'DWORD PTR [eax+0x30]' in access and 'DWORD PTR [ecx+0x30]' in access,
      'addContentLink_compares_both_endpoints_and_marker': all(x in af for x in ['call   0x1000d050','call   0x10003610','call   0x10003620']),
      'addContentLink_increments_power_on_duplicate':'call   0x10003630' in af and 'call   0x10003680' in af,
      'addContentLink_constructs_new_AEContentLink':'call   0x10002740' in af and 'call   0x10003640' in af,
    }
    if ns.pm_params:
      pdel=dump(ns.pm_params,0x100059d0,0x10005b40)
      checks['pm_params_delete_filters_type_4']=bool(re.search(r'cmp\s+eax,0x4',pdel))
      checks['pm_params_delete_unlinks_and_removes_link']='0x1000a098' in pdel and '0x1000a090' in pdel
      pexp=subprocess.run(['objdump','-p',str(ns.pm_params)],check=True,text=True,capture_output=True).stdout
      checks['pm_params_imports_AEBinaryLink_type_unlink_remove']=all(s in pexp for s in ['?getType@AEBinaryLink@@','?unlink@AEBinaryLink@@','?removeFromList@AEBinaryLink@@'])
    result={
      'stage':'1.17','topic':'AEContentLink / LinkType 4 class contract','static_only':True,
      'sha256':{'MAIWmodels.dll':digest}, 'checks_passed':sum(checks.values()),'checks_total':len(checks),'checks':checks,
      'contract':{'dynamic_class':'AEContentLink','link_type':4,'endpoint_0':'AFElement*','endpoint_1':'AIElement*','marker_offset':'AEContentLinkPrivate+0x2C','power_offset':'AEContentLinkPrivate+0x30','link_type_offset':'AEBinaryLinkPrivate+0x28'},
      'limitations':['Static analysis only; no original Windows runtime execution.','Power is observed as a duplicate-add integer counter; wider domain semantics are not established.','Ownership/destruction of Parameter after erase from ParametersList remains unresolved.']
    }
    if not all(checks.values()):
      raise SystemExit('Failed checks: '+', '.join(k for k,v in checks.items() if not v))
    payload=json.dumps(result,ensure_ascii=False,indent=2)+'\n'
    if ns.out:
      ns.out.parent.mkdir(parents=True,exist_ok=True); ns.out.write_text(payload,encoding='utf-8')
    print(payload,end='')
    return 0
if __name__=='__main__': raise SystemExit(main())
