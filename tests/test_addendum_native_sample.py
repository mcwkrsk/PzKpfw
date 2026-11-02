import unittest
from pathlib import Path
import tempfile, xml.etree.ElementTree as ET
import sys
ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from audit_native_is2_sample import audit

class NativeSampleAuditTests(unittest.TestCase):
    def test_expected_counts(self):
        p = ROOT / "samples" / "kursach_user_supplied_42_actions.is2"
        if not p.exists():
            self.fail("original user sample must be bundled in the Stage 1 closeout package")
        r = audit(p)
        self.assertEqual(r["actions"], 42)
        self.assertEqual(r["unique_action_ids"], 42)
        self.assertEqual(r["links"], 82)
        self.assertEqual(r["link_type_counts"], {"2": 41, "3": 41})
        self.assertTrue(r["all_link_endpoints_resolve"])
        self.assertEqual(r["type2_roots"], [1])
        self.assertTrue(r["type2_level_consistent"])
        self.assertEqual(r["type3_broken_chains"], [])
        self.assertEqual(r["parameters"], 10)
        self.assertEqual(r["objects"], 2)
        self.assertTrue(r["concept_cs_direct_child"])
        self.assertEqual(r["concept_cs_elemets"], 0)
        self.assertEqual(r["concept_cs_links"], 0)

if __name__ == "__main__":
    unittest.main()
