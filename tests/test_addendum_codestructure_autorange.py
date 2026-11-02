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
 def test_audit_reproduces_or_uses_published_static_evidence(self):
  if DLL.is_file():
   p=subprocess.run([sys.executable,"-S",str(ROOT/"tools/audit_codestructure_autorange.py"),str(DLL)],
                    capture_output=True,text=True)
   self.assertEqual(p.returncode,0,p.stdout+p.stderr)
  else:
   # Public source releases intentionally exclude proprietary IS-2 binaries.
   # Verify the committed, SHA-pinned static-analysis result instead.
   audit=json.loads((ROOT/"analysis/codestructure_autorange_audit.json").read_text(encoding="utf-8"))
   self.assertTrue(audit["static_only"])
   self.assertEqual(audit["dll_sha256"],"80ccc6678bdf057152f473369a56eb3b76a1ce643edca2832345f7b53e09c525")
   self.assertEqual(audit["status"],"PASS")
   self.assertEqual((audit["passed"],audit["total"]),(18,18))
   notice=(ROOT/"RESEARCH_MATERIALS_NOTICE.md").read_text(encoding="utf-8")
   self.assertIn("deliberately excludes the original",notice)
if __name__=="__main__":unittest.main()
