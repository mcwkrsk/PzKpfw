import json, pathlib, subprocess, sys, unittest
ROOT = pathlib.Path(__file__).resolve().parents[1]
BINARY = ROOT.parent / "original" / "IS.exe"

class TestPrimaryModelSPD(unittest.TestCase):
    def test_audit_snapshot(self):
        d = json.loads((ROOT / "analysis/primarymodel_spd_audit.json").read_text(encoding="utf-8"))
        self.assertEqual(d["status"], "PASS")
        self.assertEqual((d["passed"], d["total"]), (21, 21))
        self.assertEqual(d["type_mapping"]["2"], "AFStructure::addCompositionLink(afe1, afe2)")
        self.assertEqual(d["type_mapping"]["3"], "AFStructure::addArragmentLink(afe1, afe2, afe3)")
    def test_report_has_both_function_addresses(self):
        s = (ROOT / "docs/40_stage1_17_primarymodel_spd_reader_writer.md").read_text(encoding="utf-8")
        self.assertIn("0x0040ACD0", s)
        self.assertIn("0x004071C0", s)
        self.assertIn("actions.lastID", s)
        self.assertIn("addCompositionLink", s)
        self.assertIn("addArragmentLink", s)
    def test_binary_audit_reproduces_or_uses_published_static_evidence(self):
        if BINARY.exists():
            p = subprocess.run([sys.executable, str(ROOT / "tools/audit_primarymodel_spd.py"), str(BINARY)],
                               capture_output=True, text=True)
            self.assertEqual(p.returncode, 0, p.stdout + p.stderr)
        else:
            # Public source archives intentionally omit original proprietary binaries.
            audit = json.loads((ROOT / "analysis/primarymodel_spd_audit.json").read_text(encoding="utf-8"))
            self.assertTrue(audit["static_only"])
            self.assertEqual(audit["sha256"], "ed526d51da184685dab5ddd89eae0e486b37001ed5781e623cb25f9166410dc2")
            self.assertEqual(audit["status"], "PASS")
            self.assertEqual((audit["passed"], audit["total"]), (21, 21))
            notice = (ROOT / "RESEARCH_MATERIALS_NOTICE.md").read_text(encoding="utf-8")
            self.assertIn("deliberately excludes the original", notice)

if __name__ == "__main__":
    unittest.main()
