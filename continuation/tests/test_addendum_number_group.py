import json, pathlib, subprocess, sys, unittest
ROOT = pathlib.Path(__file__).resolve().parents[1]

class TestNumberGroupAlgorithm(unittest.TestCase):
    def test_static_audit_passes(self):
        p = subprocess.run([sys.executable, "-S", str(ROOT/"tools/audit_number_group_algorithm.py")],
                           capture_output=True, text=True)
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        d = json.loads(p.stdout)
        self.assertEqual(d["status"], "PASS")
        self.assertEqual((d["passed"], d["total"]), (17,17))
    def test_reserved_tuple_and_auto_bucket_are_distinct(self):
        d=json.loads((ROOT/"analysis/number_group_algorithm_audit.json").read_text(encoding="utf-8"))
        self.assertEqual(d["confirmed"]["reserved_index"]["key"], ["class","group","number"])
        self.assertEqual(d["confirmed"]["automatic_number_index"]["key"], ["class","group"])
    def test_class_specific_group_rules(self):
        d=json.loads((ROOT/"analysis/number_group_algorithm_audit.json").read_text(encoding="utf-8"))
        self.assertIn("parent.number",d["confirmed"]["class_rules"]["class_5_object"])
        self.assertIn("grandparent.group",d["confirmed"]["class_rules"]["class_4_component"])
    def test_four_part_autorange_filter(self):
        d=json.loads((ROOT/"analysis/number_group_algorithm_audit.json").read_text(encoding="utf-8"))
        a=d["confirmed"]["auto_range"]
        self.assertEqual(a["binding_endpoint_index"],0)
        self.assertEqual(a["link_type"],3)
        self.assertTrue(a["endpoint_slot_2_null"])
        self.assertTrue(a["autoRange_nonzero"])
    def test_report_preserves_uncertainties(self):
        s=(ROOT/"docs/43_stage1_17_subjectcategory_number_group_algorithm.md").read_text(encoding="utf-8")
        self.assertIn("CodingType==0",s)
        self.assertIn("не доказывает",s)
        self.assertIn("Windows runtime",s)

if __name__=="__main__":
    unittest.main()
