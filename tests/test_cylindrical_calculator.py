import unittest

from is2_re.methodology import (
    CylindricalCalculationError,
    CylindricalGeometryInput,
    LoadSpectrumStep,
    calculate_allowable_contact_stress_63,
    calculate_allowable_bending_stress_69,
    calculate_bending_life_factor_610,
    calculate_bending_helix_factor,
    calculate_bending_transverse_factor_619,
    calculate_bending_dynamic_load_621,
    calculate_bending_dynamic_factor_620,
    calculate_bending_specific_load_618,
    calculate_bending_module_68,
    calculate_center_distance_61,
    calculate_contact_dynamic_factor_615,
    calculate_contact_dynamic_load_616,
    calculate_contact_geometry_factor,
    calculate_contact_life_factor_64,
    calculate_contact_ratio_factor,
    calculate_contact_specific_load_614,
    calculate_elasticity_factor,
    calculate_equivalent_cycles_65,
    calculate_equivalent_cycles_66,
    calculate_equivalent_bending_cycles_611,
    calculate_forces,
    calculate_geometry,
    calculate_pinion_diameter_62,
    calculate_minimum_bending_module_612,
    bending_design_coefficients,
    combine_allowable_contact_stress_67,
    check_contact_stress_613,
    check_bending_stress_617,
    check_maximum_bending,
    check_maximum_contact,
    parse_engagement,
    parse_contact_life_category,
    parse_load_spectrum,
    parse_tooth_form,
    round_standard_module,
    values_by_symbol,
)


class CylindricalCalculatorTests(unittest.TestCase):
    def test_zero_shift_straight_gear_geometry_and_forces(self):
        geometry = calculate_geometry(CylindricalGeometryInput(
            z1=20, z2=60, module_mm=2.0, beta_deg=0.0, x1=0.0, x2=0.0,
        ))
        self.assertAlmostEqual(geometry.ratio, 3.0)
        self.assertAlmostEqual(geometry.center_distance_mm, 80.0)
        self.assertAlmostEqual(geometry.transverse_pressure_angle_deg, 20.0)
        self.assertAlmostEqual(geometry.working_pressure_angle_deg, 20.0)
        self.assertAlmostEqual(geometry.pitch_diameter_1_mm, 40.0)
        self.assertAlmostEqual(geometry.tip_diameter_1_mm, 44.0)
        self.assertAlmostEqual(geometry.root_diameter_1_mm, 35.0)

        forces = calculate_forces(geometry, beta_deg=0.0, power_kw=5.0, speed_rpm=1000.0)
        self.assertAlmostEqual(forces.torque_nm, 47.75)
        self.assertAlmostEqual(forces.tangential_force_n, 2387.5)
        self.assertAlmostEqual(forces.axial_force_n, 0.0)

    def test_given_center_distance_must_match_shift_sum(self):
        with self.assertRaisesRegex(CylindricalCalculationError, "conflicts with aw"):
            calculate_geometry(CylindricalGeometryInput(
                z1=20, z2=60, module_mm=2.0, beta_deg=0.0,
                x1=0.0, x2=0.0, center_distance_mm=82.0,
            ))

    def test_symbol_and_decimal_comma_parsing(self):
        values = values_by_symbol({"β": "12,5", "z₁": "20", "N": "5"})
        self.assertEqual(values, {"beta": 12.5, "z1": 20.0, "power": 5.0})

    def test_force_calculation_requires_torque_or_power_and_speed(self):
        geometry = calculate_geometry(CylindricalGeometryInput(
            z1=20, z2=60, module_mm=2, beta_deg=0, x1=0, x2=0,
        ))
        with self.assertRaisesRegex(CylindricalCalculationError, "provide T1"):
            calculate_forces(geometry, beta_deg=0)

    def test_verified_formula_623_reports_pass_and_utilization(self):
        result = check_maximum_bending(
            operating_stress_mpa=120,
            maximum_torque_nm=300,
            operating_torque_nm=200,
            allowable_maximum_stress_mpa=240,
        )
        self.assertAlmostEqual(result.maximum_stress_mpa, 180)
        self.assertAlmostEqual(result.utilization, 0.75)
        self.assertTrue(result.passes)

        failed = check_maximum_bending(
            operating_stress_mpa=200,
            maximum_torque_nm=300,
            operating_torque_nm=200,
            allowable_maximum_stress_mpa=240,
        )
        self.assertFalse(failed.passes)

    def test_verified_formula_622_reports_pass_and_utilization(self):
        result = check_maximum_contact(
            operating_stress_mpa=100,
            maximum_torque_nm=400,
            operating_torque_nm=100,
            allowable_maximum_stress_mpa=250,
        )
        self.assertEqual(result.maximum_stress_mpa, 200)
        self.assertEqual(result.utilization, 0.8)
        self.assertTrue(result.passes)

        failed = check_maximum_contact(
            operating_stress_mpa=150,
            maximum_torque_nm=400,
            operating_torque_nm=100,
            allowable_maximum_stress_mpa=250,
        )
        self.assertFalse(failed.passes)

    def test_verified_formula_61_handles_external_and_internal_gearing(self):
        external = calculate_center_distance_61(
            coefficient_ka=100,
            ratio=3,
            torque_nm=27,
            load_distribution_factor=1,
            face_width_ratio_ba=1,
            allowable_contact_stress_mpa=3,
            internal_gearing=False,
        )
        internal = calculate_center_distance_61(
            coefficient_ka=100,
            ratio=3,
            torque_nm=27,
            load_distribution_factor=1,
            face_width_ratio_ba=1,
            allowable_contact_stress_mpa=3,
            internal_gearing=True,
        )

        self.assertAlmostEqual(external.center_distance_mm, 400)
        self.assertAlmostEqual(internal.center_distance_mm, 200)

    def test_verified_formula_62_places_gearing_span_under_cube_root(self):
        external = calculate_pinion_diameter_62(
            coefficient_kd=100,
            ratio=3,
            torque_nm=6.75,
            load_distribution_factor=1,
            face_width_ratio_bd=1,
            allowable_contact_stress_mpa=3,
            internal_gearing=False,
        )
        internal = calculate_pinion_diameter_62(
            coefficient_kd=100,
            ratio=3,
            torque_nm=13.5,
            load_distribution_factor=1,
            face_width_ratio_bd=1,
            allowable_contact_stress_mpa=3,
            internal_gearing=True,
        )

        self.assertAlmostEqual(external.pinion_diameter_mm, 100)
        self.assertAlmostEqual(internal.pinion_diameter_mm, 100)

    def test_design_formulas_validate_engagement_and_ratio(self):
        self.assertFalse(parse_engagement("внешнее"))
        self.assertTrue(parse_engagement("internal"))
        with self.assertRaisesRegex(CylindricalCalculationError, "engagement"):
            parse_engagement("неизвестное")
        with self.assertRaisesRegex(CylindricalCalculationError, "greater than 1"):
            calculate_center_distance_61(
                coefficient_ka=100,
                ratio=1,
                torque_nm=27,
                load_distribution_factor=1,
                face_width_ratio_ba=1,
                allowable_contact_stress_mpa=3,
                internal_gearing=True,
            )

    def test_contact_stress_and_life_formulas_63_and_64(self):
        factor = calculate_contact_life_factor_64(
            base_cycles=64_000_000,
            equivalent_cycles=1_000_000,
            category="steel_through",
        )
        self.assertAlmostEqual(factor.uncapped_factor, 2)
        self.assertAlmostEqual(factor.factor, 2)
        self.assertFalse(factor.capped)
        self.assertAlmostEqual(
            calculate_allowable_contact_stress_63(base_stress_mpa=600, life_factor=factor.factor),
            1200,
        )

        capped = calculate_contact_life_factor_64(
            base_cycles=729_000_000,
            equivalent_cycles=1_000_000,
            category="steel_surface",
        )
        self.assertAlmostEqual(capped.uncapped_factor, 3)
        self.assertAlmostEqual(capped.factor, 1.8)
        self.assertTrue(capped.capped)
        self.assertEqual(
            calculate_contact_life_factor_64(
                base_cycles=1_000_000,
                equivalent_cycles=2_000_000,
                category="cast_iron",
            ).factor,
            1,
        )

    def test_equivalent_cycles_formulas_65_and_66(self):
        self.assertEqual(
            calculate_equivalent_cycles_65(operating_hours=1000, speed_rpm=100),
            6_000_000,
        )
        spectrum = calculate_equivalent_cycles_66(
            reference_torque_nm=100,
            steps=(
                LoadSpectrumStep(100, 1000),
                LoadSpectrumStep(50, 8000),
            ),
        )
        self.assertEqual(spectrum.total_cycles, 9000)
        self.assertEqual(spectrum.equivalent_cycles, 2000)
        self.assertEqual(
            parse_load_spectrum("100:1000; 50:8000"),
            (LoadSpectrumStep(100, 1000), LoadSpectrumStep(50, 8000)),
        )

    def test_formula_67_selects_spur_minimum_and_limits_helical_average(self):
        spur = combine_allowable_contact_stress_67(
            stress_1_mpa=600, stress_2_mpa=800, tooth_form="spur",
        )
        self.assertEqual(spur.allowable_stress_mpa, 600)
        self.assertFalse(spur.limited)

        helical = combine_allowable_contact_stress_67(
            stress_1_mpa=400, stress_2_mpa=1000, tooth_form="helical",
        )
        self.assertEqual(helical.uncapped_stress_mpa, 630)
        self.assertEqual(helical.limit_stress_mpa, 492)
        self.assertEqual(helical.allowable_stress_mpa, 492)
        self.assertTrue(helical.limited)

    def test_contact_formula_text_categories_are_strict(self):
        self.assertEqual(parse_contact_life_category("чугун"), "cast_iron")
        self.assertEqual(parse_tooth_form("шевронная"), "herringbone")
        with self.assertRaises(CylindricalCalculationError):
            parse_contact_life_category("неизвестно")
        with self.assertRaises(CylindricalCalculationError):
            parse_load_spectrum("100 без циклов")

    def test_bending_formulas_68_and_69(self):
        module = calculate_bending_module_68(
            coefficient_kma=1,
            torque_nm=1,
            ratio=3,
            tooth_form_factor=1,
            center_distance_mm=4,
            face_width_mm=1,
            allowable_bending_stress_mpa=1,
            internal_gearing=False,
        )
        self.assertEqual(module, 1)
        self.assertEqual(
            calculate_allowable_bending_stress_69(base_stress_mpa=200, life_factor=1.5),
            300,
        )

    def test_bending_life_and_spectrum_formulas_610_and_611(self):
        life = calculate_bending_life_factor_610(
            base_cycles=64_000_000,
            equivalent_cycles=1_000_000,
            exponent=6,
        )
        self.assertEqual(life.factor, 2)
        self.assertFalse(life.capped)

        capped = calculate_bending_life_factor_610(
            base_cycles=729_000_000,
            equivalent_cycles=1_000_000,
            exponent=6,
        )
        self.assertEqual(capped.factor, 2.08)
        self.assertTrue(capped.capped)

        spectrum = calculate_equivalent_bending_cycles_611(
            reference_torque_nm=100,
            exponent=6,
            steps=(LoadSpectrumStep(100, 1000), LoadSpectrumStep(50, 64_000)),
        )
        self.assertEqual(spectrum.total_cycles, 65_000)
        self.assertEqual(spectrum.equivalent_cycles, 2000)

    def test_minimum_module_612_coefficients_and_standard_rounding(self):
        module = calculate_minimum_bending_module_612(
            coefficient_km=10,
            torque_nm=4,
            load_distribution_factor=1,
            tooth_form_factor=1,
            pinion_teeth=2,
            face_width_ratio_bd=1,
            allowable_bending_stress_mpa=1,
        )
        self.assertEqual(module, 10)
        self.assertEqual(bending_design_coefficients(tooth_form="spur").kma, 1400)
        self.assertEqual(bending_design_coefficients(tooth_form="spur").km, 14)
        self.assertEqual(
            bending_design_coefficients(tooth_form="helical", overlap_ratio=0.8).kma,
            1100,
        )
        self.assertEqual(
            bending_design_coefficients(tooth_form="helical", overlap_ratio=1.2).km,
            11.2,
        )
        self.assertEqual(bending_design_coefficients(tooth_form="herringbone").km, 11.2)
        self.assertEqual(round_standard_module(2.1, prefer_first_series=True), 2.5)
        self.assertEqual(round_standard_module(2.1, prefer_first_series=False), 2.25)

    def test_contact_load_chain_formulas_614_through_616(self):
        dynamic_load = calculate_contact_dynamic_load_616(
            delta_h=1,
            pitch_difference_factor=1,
            velocity_m_s=1,
            center_distance_mm=4,
            ratio=1,
            limit_n_per_mm=1.5,
        )
        self.assertEqual(dynamic_load.uncapped_load_n_per_mm, 2)
        self.assertEqual(dynamic_load.specific_load_n_per_mm, 1.5)
        self.assertTrue(dynamic_load.limited)

        dynamic_factor = calculate_contact_dynamic_factor_615(
            dynamic_specific_load_n_per_mm=1,
            face_width_mm=2,
            tangential_force_n=4,
            transverse_load_factor=1,
            face_load_factor=1,
        )
        self.assertEqual(dynamic_factor, 1.5)
        self.assertEqual(
            calculate_contact_specific_load_614(
                tangential_force_n=4,
                face_width_mm=2,
                transverse_load_factor=1,
                face_load_factor=1,
                dynamic_factor=dynamic_factor,
            ),
            3,
        )

    def test_contact_stress_formula_613_reports_utilization(self):
        result = check_contact_stress_613(
            geometry_factor=1,
            elasticity_factor=1,
            contact_ratio_factor=1,
            specific_load_n_per_mm=3,
            ratio=3,
            pinion_working_diameter_mm=4,
            allowable_stress_mpa=2,
            internal_gearing=False,
        )
        self.assertEqual(result.stress_mpa, 1)
        self.assertEqual(result.utilization, 0.5)
        self.assertTrue(result.passes)

    def test_contact_stress_auxiliary_factors(self):
        self.assertAlmostEqual(
            calculate_contact_geometry_factor(
                base_helix_angle_deg=0,
                working_pressure_angle_deg=45,
            ),
            2**0.5,
        )
        elasticity = calculate_elasticity_factor(
            modulus_1_mpa=210_000,
            modulus_2_mpa=210_000,
            poisson_ratio=0.3,
        )
        self.assertGreater(elasticity, 0)
        self.assertAlmostEqual(
            calculate_contact_ratio_factor(
                transverse_contact_ratio=1,
                axial_contact_ratio=0,
            ),
            1,
        )
        self.assertAlmostEqual(
            calculate_contact_ratio_factor(
                transverse_contact_ratio=2,
                axial_contact_ratio=1,
            ),
            2**-0.5,
        )

    def test_bending_factors_follow_tooth_form_rules(self):
        self.assertEqual(
            calculate_bending_helix_factor(tooth_form="spur", helix_angle_deg=20),
            1,
        )
        self.assertAlmostEqual(
            calculate_bending_helix_factor(tooth_form="helical", helix_angle_deg=14),
            0.9,
        )
        self.assertEqual(
            calculate_bending_transverse_factor_619(
                tooth_form="spur",
                axial_contact_ratio=0,
                transverse_contact_ratio=2,
                accuracy_grade=7,
            ),
            1,
        )
        self.assertEqual(
            calculate_bending_transverse_factor_619(
                tooth_form="helical",
                axial_contact_ratio=1.1,
                transverse_contact_ratio=2,
                accuracy_grade=7,
            ),
            0.75,
        )

    def test_bending_load_chain_formulas_618_through_621(self):
        dynamic_load = calculate_bending_dynamic_load_621(
            delta_f=1,
            pitch_difference_factor=1,
            velocity_m_s=1,
            center_distance_mm=4,
            ratio=1,
            limit_n_per_mm=1,
        )
        self.assertEqual(dynamic_load.uncapped_load_n_per_mm, 2)
        self.assertEqual(dynamic_load.specific_load_n_per_mm, 1)
        self.assertTrue(dynamic_load.limited)

        dynamic_factor = calculate_bending_dynamic_factor_620(
            dynamic_specific_load_n_per_mm=1,
            face_width_mm=2,
            tangential_force_n=4,
            transverse_load_factor=1,
            face_load_factor=1,
        )
        self.assertEqual(dynamic_factor, 1.5)
        self.assertEqual(
            calculate_bending_specific_load_618(
                tangential_force_n=4,
                face_width_mm=2,
                transverse_load_factor=1,
                face_load_factor=1,
                dynamic_factor=dynamic_factor,
            ),
            3,
        )

    def test_bending_stress_formula_617_reports_utilization(self):
        result = check_bending_stress_617(
            tooth_form_factor=1,
            overlap_factor=1,
            helix_factor=1,
            specific_load_n_per_mm=3,
            module_mm=3,
            allowable_stress_mpa=2,
        )
        self.assertEqual(result.stress_mpa, 1)
        self.assertEqual(result.utilization, 0.5)
        self.assertTrue(result.passes)


if __name__ == "__main__":
    unittest.main()
