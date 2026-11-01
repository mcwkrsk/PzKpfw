import json, pathlib, subprocess, sys, unittest
ROOT=pathlib.Path(__file__).resolve().parents[1]
DLL=ROOT.parent / "original" / "MAIWmodels.dll"
class TestCodeStructureAutoRange(unittest.TestCase):
 def test_audit(self):
  d=json.loads((ROOT/"analysis/codestructure_autorange_audit.json").read_text(encoding="utf-8"))
  self.assertEqual(d["status"],"PASS")
  self.assertEqual((d["passed"],d["total"]),(18,18))
 def test_algorithm_is_documented(self):
  s=(ROOT/"docs/42_stage1_17_codestructure_autorange.md").read_text(encoding="utf-8")
  for term in ("getAutoRange","getAIE3","SCcompare","setRange","1-based","type 3"):
   self.assertIn(term,s)
 def test_parent_resolution(self):
  s=(ROOT/"docs/42_stage1_17_codestructure_autorange.md").read_text(encoding="utf-8")
  self.assertIn("getAIE2()",s)
  self.assertIn("getAIE1()",s)
 def test_audit_reproduces(self):
  p=subprocess.run([sys.executable,"-S",str(ROOT/"tools/audit_codestructure_autorange.py"),str(DLL)],
                   capture_output=True,text=True)
  self.assertEqual(p.returncode,0,p.stdout+p.stderr)
if __name__=="__main__":unittest.main()
