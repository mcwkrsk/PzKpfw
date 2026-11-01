import unittest
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from audit_kursach_is2 import audit

class Kaka2ReferenceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.result = audit(ROOT / "samples" / "kaka2_reference.xml")

    def test_reference_counts(self):
        self.assertEqual(self.result["action_count"], 73)
        self.assertEqual(self.result["link_count"], 144)
        self.assertEqual(self.result["link_type_counts"], {"2": 72, "3": 72})

    def test_all_reference_sibling_chains(self):
        self.assertEqual(self.result["sibling_chain_parent_count"], 40)
        self.assertEqual(self.result["sibling_chain_valid_count"], 40)
        self.assertEqual(self.result["dangling_link_references"], [])
        self.assertEqual(self.result["level_violations"], [])

if __name__ == "__main__":
    unittest.main()
