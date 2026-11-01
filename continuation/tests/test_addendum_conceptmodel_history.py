import json, subprocess, sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
def test_static_evidence_audit_passes():
    p=subprocess.run([sys.executable,str(ROOT/'tools/audit_conceptmodel_mismatch.py')],capture_output=True,text=True)
    assert p.returncode==0, p.stdout+p.stderr
    r=json.loads((ROOT/'analysis/conceptmodel_mismatch_followup_audit.json').read_text())
    assert r['passed']==r['total']==5
    assert r['status']=='SUPERSEDED'
    assert 'not a runtime round-trip' in r['scope']
    assert 'statically confirmed' in r['active_conclusion']
    history=(ROOT/'docs/44_stage1_17_conceptmodel_writer_reader_mismatch_proof.md').read_text()
    assert 'Исторический отчёт, superseded' in history
