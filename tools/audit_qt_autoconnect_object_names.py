#!/usr/bin/env python3
"""Correlate Qt on_<objectName>_<signal> MOC slots with UTF-16LE names in DLL data.

The result is a static candidate audit. A matching UTF-16 string plus a
connectSlotsByName call proves a plausible auto-connect endpoint, but it does
not by itself prove the corresponding QObject is constructed in every run.
"""
from __future__ import annotations
import argparse, hashlib, json, re, subprocess
from pathlib import Path


def sections(path: Path):
    txt = subprocess.run(["objdump", "-h", str(path)], check=True, text=True,
                         stdout=subprocess.PIPE, stderr=subprocess.PIPE).stdout
    out=[]
    rx=re.compile(r"^\s*\d+\s+(\S+)\s+([0-9a-fA-F]+)\s+([0-9a-fA-F]+)\s+[0-9a-fA-F]+\s+([0-9a-fA-F]+)",re.M)
    for m in rx.finditer(txt):
        name,size,va,off=m.groups(); out.append((name,int(size,16),int(va,16),int(off,16)))
    return out


def find_utf16_name(data: bytes, sections_info, name: str):
    needle=name.encode('utf-16le')+b'\0\0'
    found=[]; start=0
    while True:
        off=data.find(needle,start)
        if off<0: break
        start=off+2
        for sec,size,va,fileoff in sections_info:
            if sec in ('.rdata','.data') and fileoff <= off < fileoff+size:
                found.append({'file_offset':off,'va':va+(off-fileoff),'section':sec})
                break
    return found


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('binary_dir',type=Path,help='IS-2 root containing modules/')
    ap.add_argument('--moc-json',type=Path,required=True)
    ap.add_argument('--out',type=Path,required=True)
    a=ap.parse_args()
    moc=json.loads(a.moc_json.read_text(encoding='utf-8'))
    plugins=[]
    for p in moc['plugins']:
        path=a.binary_dir/'modules'/p['binary']
        if not path.exists(): continue
        data=path.read_bytes(); sec=sections(path)
        rows=[]
        for obj in p['qmetaobjects']:
            for method in obj['methods']:
                n=method['name']
                if not n.startswith('on_') or '_' not in n[3:]: continue
                object_name, signal_name=n[3:].rsplit('_',1)
                refs=find_utf16_name(data,sec,object_name)
                rows.append({
                    'class_name':obj['class_name'],'slot':method['signature'],
                    'object_name_candidate':object_name,'signal_suffix':signal_name,
                    'method_index':method['index'],'object_name_string_found':bool(refs),
                    'string_references':refs
                })
        plugins.append({'binary':p['binary'],'sha256':hashlib.sha256(data).hexdigest(),
                        'connect_slots_by_name_imported':bool(p['connect_slots_by_name_imports']),
                        'auto_connect_candidates':rows})
    out={'analysis_scope':'Static correlation of MOC on_* slots, connectSlotsByName imports and UTF-16LE identifier strings in .rdata/.data. This is not a runtime connection trace.',
         'plugins':plugins}
    a.out.mkdir(parents=True,exist_ok=True)
    (a.out/'qt_autoconnect_candidates.json').write_text(json.dumps(out,indent=2,ensure_ascii=False),encoding='utf-8')
    with (a.out/'qt_autoconnect_candidates.tsv').open('w',encoding='utf-8') as f:
        f.write('binary\tclass\tmethod_index\tobject_name\tsignal_suffix\tslot_signature\tutf16_name_found\tstring_VAs\n')
        for p in plugins:
            for x in p['auto_connect_candidates']:
                vas=';'.join(f"0x{r['va']:08x}" for r in x['string_references'])
                f.write(f"{p['binary']}\t{x['class_name']}\t{x['method_index']}\t{x['object_name_candidate']}\t{x['signal_suffix']}\t{x['slot']}\t{int(x['object_name_string_found'])}\t{vas}\n")
    print('auto_connect_MOC_candidates',sum(len(p['auto_connect_candidates']) for p in plugins))
    print('UTF16_name_matches',sum(x['object_name_string_found'] for p in plugins for x in p['auto_connect_candidates']))

if __name__=='__main__': main()
