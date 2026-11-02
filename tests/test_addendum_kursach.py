import unittest
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from audit_kursach_is2 import audit

class KursachIS2AuditTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.result = audit(ROOT / "samples" / "kursach.is2")

    def test_action_and_link_counts(self):
        self.assertEqual(self.result["action_count"], 68)
        self.assertEqual(self.result["unique_action_ids"], 68)
        self.assertEqual(self.result["link_count"], 134)
        self.assertEqual(self.result["link_type_counts"], {"2": 67, "3": 67})

    def test_composition_tree_is_well_formed(self):
        self.assertEqual(self.result["composition_roots"], [1])
        self.assertEqual(self.result["composition_edges"], 67)
        self.assertEqual(self.result["dangling_link_references"], [])
        self.assertEqual(self.result["level_violations"], [])

    def test_sibling_chains(self):
        self.assertEqual(self.result["sibling_chain_parent_count"], 24)
        self.assertEqual(self.result["sibling_chain_valid_count"], 24)
        self.assertTrue(all(x["valid"] for x in self.result["sibling_chains"]))

    def test_sample_scope(self):
        self.assertEqual(self.result["primary_parameters"], 0)
        self.assertEqual(self.result["primary_objects"], 0)
        self.assertEqual(self.result["alternatives"], 0)

if __name__ == "__main__":
    unittest.main()
