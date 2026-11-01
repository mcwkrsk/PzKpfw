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
    def test_binary_audit_reproduces(self):
        if not BINARY.exists():
            self.skipTest("original IS.exe is not mounted in this environment")
        p = subprocess.run([sys.executable, str(ROOT / "tools/audit_primarymodel_spd.py"), str(BINARY)],
                           capture_output=True, text=True)
        self.assertEqual(p.returncode, 0, p.stdout + p.stderr)

if __name__ == "__main__":
    unittest.main()
