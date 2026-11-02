import pathlib, sys, unittest
ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from audit_spd_link_semantics import audit

class TestSPDFiveSamples(unittest.TestCase):
    def test_schaefer(self):
        r = audit(ROOT / "samples" / "schaefer.is2")
        self.assertEqual((r["actions"], r["links"], r["parent_groups"], r["valid_sibling_chains"]), (7, 12, 3, 3))
    def test_untitled(self):
        r = audit(ROOT / "samples" / "untitled.is2")
        self.assertEqual((r["actions"], r["links"], r["parent_groups"], r["valid_sibling_chains"]), (7, 12, 3, 3))
    def test_kaka2(self):
        r = audit(ROOT / "samples" / "kaka2.xml")
        self.assertEqual((r["actions"], r["links"], r["parent_groups"], r["valid_sibling_chains"]), (73, 144, 40, 40))
    def test_kursach(self):
        r = audit(ROOT / "samples" / "kursach.is2")
        self.assertEqual((r["actions"], r["links"], r["parent_groups"], r["valid_sibling_chains"]), (68, 134, 24, 24))
        self.assertEqual(r["pd_id_gaps"], [16, 69, 70])
    def test_user_supplied_native_kursach_sample(self):
        r = audit(ROOT / "samples" / "kursach_user_supplied_42_actions.is2")
        self.assertEqual((r["actions"], r["links"], r["parent_groups"], r["valid_sibling_chains"]), (42, 82, 12, 12))
        self.assertGreater(len(r["pd_id_gaps"]), 0)  # Sparse IDs are preserved; lastID is not a density guarantee.

    def test_all_samples_have_matching_membership_and_chains(self):
        for name in ("schaefer.is2", "untitled.is2", "kaka2.xml", "kursach.is2", "kursach_user_supplied_42_actions.is2"):
            r = audit(ROOT / "samples" / name)
            self.assertTrue(r["all_sibling_chains_valid"], name)
            self.assertTrue(r["all_type2_afe3_zero"], name)
            self.assertEqual(r["dangling_endpoints"], [], name)
            self.assertEqual(r["unknown_link_types"], [], name)
    def test_pd_ids_are_unique_and_ascending(self):
        for name in ("schaefer.is2", "untitled.is2", "kaka2.xml", "kursach.is2", "kursach_user_supplied_42_actions.is2"):
            r = audit(ROOT / "samples" / name)
            self.assertTrue(r["pd_ids_unique"], name)
            self.assertTrue(r["pd_ids_sorted_ascending"], name)

if __name__ == "__main__":
    unittest.main()
