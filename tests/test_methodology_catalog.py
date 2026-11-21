import unittest

from is2_re.methodology import (
    METHODOLOGY_TOPICS,
    calculation_route,
    recommend_topics,
    recommendation_text,
)


class MethodologyCatalogTests(unittest.TestCase):
    def test_all_supported_assignment_combinations_have_topics(self):
        expected_modes = {
            "flat_belt": ("design", "verification", "geometry"),
            "v_belt": ("design", "verification", "geometry"),
            "toothed_belt": ("design", "verification", "geometry"),
            "chain": ("design", "verification", "geometry"),
            "cylindrical": ("design", "verification", "geometry"),
            "bevel": ("design", "verification", "geometry"),
            "worm": ("design", "verification", "geometry"),
        }
        for transmission, modes in expected_modes.items():
            for mode in modes:
                with self.subTest(transmission=transmission, mode=mode):
                    self.assertTrue(recommend_topics(transmission, mode))

    def test_cylindrical_supplement_is_manually_verified(self):
        matches = recommend_topics("cylindrical", "design")
        verified = [item for item in matches if item.verification == "manually_verified"]
        self.assertEqual(len(verified), 1)
        self.assertEqual(verified[0].page_label, "57–58")
        self.assertIn("проверено вручную", recommendation_text("cylindrical", "design"))

    def test_catalog_contains_official_30_topics_plus_supplement(self):
        official = [item.number for item in METHODOLOGY_TOPICS if item.number is not None]
        self.assertEqual(official, list(range(1, 31)))
        self.assertEqual(len(METHODOLOGY_TOPICS), 31)

    def test_cylindrical_route_separates_verified_expressions_from_ocr_references(self):
        route = calculation_route("cylindrical", "verification")
        self.assertGreaterEqual(len(route), 6)
        formula_623 = next(item for item in route if item.reference == "формула (6.23)")
        self.assertEqual(formula_623.verification, "manually_verified")
        self.assertIn("T_1max", formula_623.expression)
        formula_622 = next(item for item in route if item.reference == "формула (6.22)")
        self.assertEqual(formula_622.verification, "manually_verified")
        self.assertEqual(formula_622.page_label, "56")
        self.assertIn("√", formula_622.expression)
        contact = next(item for item in route if item.reference == "формула (6.13)")
        self.assertEqual(contact.verification, "manually_verified")
        self.assertIsNotNone(contact.expression)

    def test_design_formulas_61_and_62_are_manually_verified(self):
        route = calculation_route("cylindrical", "design")
        formula_61 = next(item for item in route if item.reference == "формула (6.1)")
        formula_62 = next(item for item in route if item.reference == "формула (6.2)")

        self.assertEqual(formula_61.verification, "manually_verified")
        self.assertEqual(formula_61.page_label, "44")
        self.assertIn("K_a", formula_61.expression)
        self.assertEqual(formula_62.verification, "manually_verified")
        self.assertEqual(formula_62.page_label, "46")
        self.assertIn("K_d", formula_62.expression)

    def test_contact_formulas_63_through_67_are_manually_verified(self):
        route = calculation_route("cylindrical", "design")
        expected_pages = {
            "формула (6.3)": "46",
            "формула (6.4)": "48",
            "формула (6.5)": "49",
            "формула (6.6)": "49",
            "формула (6.7)": "50",
        }
        for reference, page in expected_pages.items():
            with self.subTest(reference=reference):
                item = next(entry for entry in route if entry.reference == reference)
                self.assertEqual(item.verification, "manually_verified")
                self.assertEqual(item.page_label, page)
                self.assertIsNotNone(item.expression)

    def test_bending_formulas_68_through_612_are_manually_verified(self):
        route = calculation_route("cylindrical", "design")
        expected_pages = {
            "формула (6.8)": "50",
            "формула (6.9)": "50",
            "формула (6.10)": "50",
            "формула (6.11)": "52",
            "формула (6.12)": "52",
        }
        for reference, page in expected_pages.items():
            with self.subTest(reference=reference):
                item = next(entry for entry in route if entry.reference == reference)
                self.assertEqual(item.verification, "manually_verified")
                self.assertEqual(item.page_label, page)
                self.assertIsNotNone(item.expression)

    def test_contact_check_formulas_613_through_616_are_manually_verified(self):
        route = calculation_route("cylindrical", "verification")
        expected_pages = {
            "формула (6.13)": "53",
            "формула (6.14)": "54",
            "формула (6.15)": "54",
            "формула (6.16)": "55",
        }
        for reference, page in expected_pages.items():
            with self.subTest(reference=reference):
                item = next(entry for entry in route if entry.reference == reference)
                self.assertEqual(item.verification, "manually_verified")
                self.assertEqual(item.page_label, page)
                self.assertIsNotNone(item.expression)

    def test_bending_check_formulas_617_through_621_are_manually_verified(self):
        route = calculation_route("cylindrical", "verification")
        for number in range(17, 22):
            reference = f"формула (6.{number})"
            with self.subTest(reference=reference):
                item = next(entry for entry in route if entry.reference == reference)
                self.assertEqual(item.verification, "manually_verified")
                self.assertEqual(item.page_label, "56")
                self.assertIsNotNone(item.expression)

    def test_every_supported_transmission_has_non_evaluating_routes(self):
        for transmission in ("flat_belt", "v_belt", "toothed_belt", "chain", "bevel", "worm"):
            with self.subTest(transmission=transmission):
                route = calculation_route(transmission, "design")
                self.assertTrue(route)
                self.assertTrue(all(item.expression is None for item in route))


if __name__ == "__main__":
    unittest.main()
