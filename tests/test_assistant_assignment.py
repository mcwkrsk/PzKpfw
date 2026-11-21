import unittest

from is2_re.assistant import (
    AssistantProtocolError,
    CourseworkAssignment,
    build_assignment_plan,
    execute_plan,
    parse_assignment_inputs,
)
from is2_re.coursework import create_course_project


# This module exercises the optional developer calculation checker.  The
# application itself keeps that checker disabled unless the user opts in.
_CourseworkAssignment = CourseworkAssignment


def CourseworkAssignment(*args, **kwargs):
    kwargs.setdefault("perform_calculations", True)
    return _CourseworkAssignment(*args, **kwargs)


class AssistantAssignmentTests(unittest.TestCase):
    def test_coursework_default_builds_symbolic_scheme_without_calculation(self):
        document = create_course_project("Курсовая", "Главная работа")
        assignment = _CourseworkAssignment(
            title="Схема цилиндрической передачи",
            transmission_kind="cylindrical",
            calculation_mode="design",
            parent_action_id="1",
            inputs=parse_assignment_inputs("Передаточное отношение | u | | -"),
        )

        plan = build_assignment_plan(document, assignment)
        result = execute_plan(document, plan)

        self.assertTrue(plan.summary.startswith("Создать схему ИС-2:"))
        self.assertTrue(any("численные вычисления не выполняются" in item for item in plan.assumptions))
        self.assertEqual(result.candidate.parameter("1").get("value"), "")
        self.assertFalse(any(op.operation_id.startswith("calculated-parameter-") for op in plan.operations))

    def test_parse_and_build_executable_scaffold(self):
        document = create_course_project("Курсовая", "Главная работа")
        inputs = parse_assignment_inputs(
            "Передаточное отношение | u | 3.15 | -\n"
            "Крутящий момент | T1 | 250 | Н·м"
        )
        assignment = CourseworkAssignment(
            title="Расчет редуктора",
            transmission_kind="cylindrical",
            calculation_mode="design",
            parent_action_id="1",
            inputs=inputs,
        )

        plan = build_assignment_plan(document, assignment)
        result = execute_plan(document, plan)

        self.assertGreater(len(plan.operations), 4)
        self.assertTrue(any("Тема 16" in source.title for source in plan.sources))
        self.assertTrue(any("Дополнение" in source.title for source in plan.sources))
        self.assertTrue(any("OCR" in check for check in plan.manual_checks))
        self.assertEqual(len(result.candidate.objects_node.findall("object")), 1)
        self.assertEqual(len(result.candidate.params_node.findall("param")), 2)
        self.assertEqual(result.candidate.parameter("1").get("value"), "3.15")
        self.assertEqual(result.candidate.parameter("2").get("unit"), "Н·м")
        self.assertEqual(result.candidate.parameter("1").get("o"), "1")
        self.assertEqual(result.candidate.parameter("2").get("o"), "1")
        self.assertEqual(result.candidate.composition_children("1"), ["2"])
        self.assertGreater(len(result.candidate.composition_children("2")), 2)
        self.assertEqual(result.validation_issues_after, ())

    def test_input_rows_report_line_number(self):
        with self.assertRaisesRegex(AssistantProtocolError, "line 2"):
            parse_assignment_inputs("Мощность | N | 5 | кВт\nсломанная строка")

    def test_missing_parent_is_rejected_before_execution(self):
        document = create_course_project("Курсовая", "Главная работа")
        assignment = CourseworkAssignment(
            title="Расчет",
            transmission_kind="worm",
            calculation_mode="verification",
            parent_action_id="999",
            inputs=parse_assignment_inputs("Мощность | N | 5 | кВт"),
        )
        with self.assertRaisesRegex(AssistantProtocolError, "does not exist"):
            build_assignment_plan(document, assignment)

    def test_complete_cylindrical_inputs_add_verified_calculated_parameters(self):
        document = create_course_project("Курсовая", "Главная работа")
        inputs = parse_assignment_inputs(
            "z1 | z1 | 20 | -\n"
            "z2 | z2 | 60 | -\n"
            "m | m | 2 | мм\n"
            "beta | beta | 0 | град\n"
            "x1 | x1 | 0 | -\n"
            "x2 | x2 | 0 | -\n"
            "Мощность | N | 5 | кВт\n"
            "Частота | n1 | 1000 | мин⁻¹"
        )
        assignment = CourseworkAssignment(
            title="Геометрия",
            transmission_kind="cylindrical",
            calculation_mode="geometry",
            parent_action_id="1",
            inputs=inputs,
        )
        plan = build_assignment_plan(document, assignment)
        result = execute_plan(document, plan)
        by_sign = {
            node.get("sign"): node
            for node in result.candidate.params_node.findall("param")
        }
        self.assertEqual(by_sign["aw"].get("value"), "80")
        self.assertEqual(by_sign["da1"].get("value"), "44")
        self.assertEqual(by_sign["df1"].get("value"), "35")
        self.assertEqual(by_sign["Ft"].get("value"), "2387.5")
        self.assertTrue(any("таблице 6.15" in item for item in plan.manual_checks))
        self.assertTrue(any("необязательная численная проверка" in item for item in plan.assumptions))
        self.assertFalse(any("не выполняет инженерный расчет" in item for item in plan.assumptions))
        self.assertTrue(plan.summary.startswith("Создать схему и дополнительно проверить формулы:"))

    def test_user_supplied_aw_is_validated_but_not_duplicated(self):
        document = create_course_project("Курсовая", "Главная работа")
        inputs = parse_assignment_inputs(
            "z1 | z1 | 20 | -\n"
            "z2 | z2 | 60 | -\n"
            "m | m | 2 | мм\n"
            "beta | beta | 0 | град\n"
            "x1 | x1 | 0 | -\n"
            "x2 | x2 | 0 | -\n"
            "Межосевое расстояние | aw | 80 | мм"
        )
        plan = build_assignment_plan(document, CourseworkAssignment(
            title="Геометрия", transmission_kind="cylindrical",
            calculation_mode="geometry", parent_action_id="1", inputs=inputs,
        ))
        result = execute_plan(document, plan)
        aw_parameters = [
            node for node in result.candidate.params_node.findall("param")
            if node.get("sign") == "aw"
        ]
        self.assertEqual(len(aw_parameters), 1)

    def test_verification_assignment_applies_formula_623_when_inputs_exist(self):
        document = create_course_project("Курсовая", "Главная работа")
        inputs = parse_assignment_inputs(
            "Рабочее напряжение | sigmaF | 120 | МПа\n"
            "Максимальный момент | T1max | 300 | Н·м\n"
            "Рабочий момент | T1 | 200 | Н·м\n"
            "Допускаемое напряжение | sigmaFPmax | 240 | МПа"
        )
        plan = build_assignment_plan(document, CourseworkAssignment(
            title="Проверка", transmission_kind="cylindrical",
            calculation_mode="verification", parent_action_id="1", inputs=inputs,
        ))
        result = execute_plan(document, plan)
        by_sign = {node.get("sign"): node for node in result.candidate.params_node.findall("param")}
        self.assertEqual(by_sign["sigmaFmax"].get("value"), "180")
        self.assertEqual(by_sign["utilFmax"].get("value"), "0.75")
        self.assertTrue(any("условие выполнено" in item for item in plan.manual_checks))

    def test_explicit_formula_623_result_is_not_duplicated(self):
        document = create_course_project("Курсовая", "Главная работа")
        inputs = parse_assignment_inputs(
            "Рабочее напряжение | sigmaF | 120 | МПа\n"
            "Максимальный момент | T1max | 300 | Н·м\n"
            "Рабочий момент | T1 | 200 | Н·м\n"
            "Допускаемое напряжение | sigmaFPmax | 240 | МПа\n"
            "Готовый результат | sigmaFmax | 180 | МПа"
        )
        plan = build_assignment_plan(document, CourseworkAssignment(
            title="Проверка", transmission_kind="cylindrical",
            calculation_mode="verification", parent_action_id="1", inputs=inputs,
        ))

        signs = [
            operation.arguments["attributes"].get("sign")
            for operation in plan.operations
            if operation.type == "add_parameter"
        ]
        self.assertEqual(signs.count("sigmaFmax"), 1)

    def test_design_assignment_applies_verified_formulas_61_and_62(self):
        document = create_course_project("Курсовая", "Главная работа")
        inputs = parse_assignment_inputs(
            "Вид зацепления | engagement | external | -\n"
            "Передаточное отношение | u | 3 | -\n"
            "Крутящий момент | T1 | 6.75 | Н·м\n"
            "Коэффициент распределения | KHbeta | 1 | -\n"
            "Относительная ширина по aw | psi_ba | 1 | -\n"
            "Относительная ширина по dw1 | psi_bd | 1 | -\n"
            "Допускаемое контактное напряжение | sigmaHP | 3 | МПа\n"
            "Коэффициент межосевого расстояния | Ka | 100 | МПа^(1/3)\n"
            "Коэффициент диаметра | Kd | 100 | МПа^(1/3)"
        )
        plan = build_assignment_plan(document, CourseworkAssignment(
            title="Проектировочные размеры",
            transmission_kind="cylindrical",
            calculation_mode="design",
            parent_action_id="1",
            inputs=inputs,
        ))
        result = execute_plan(document, plan)
        by_sign = {
            node.get("sign"): node.get("value")
            for node in result.candidate.params_node.findall("param")
        }

        self.assertEqual(by_sign["aw_61"], "251.98421")
        self.assertEqual(by_sign["dw1_62"], "100")
        self.assertTrue(any("Формула (6.1), стр. 44" in item for item in plan.manual_checks))
        self.assertTrue(any("Формула (6.2), стр. 46" in item for item in plan.manual_checks))

    def test_contact_formula_chain_63_to_65_feeds_design_formula(self):
        document = create_course_project("Курсовая", "Главная работа")
        inputs = parse_assignment_inputs(
            "Вид зацепления | engagement | external | -\n"
            "Категория долговечности | life_category | steel_through | -\n"
            "Передаточное отношение | u | 3 | -\n"
            "Крутящий момент | T1 | 27 | Н·м\n"
            "Коэффициент распределения | KHbeta | 1 | -\n"
            "Относительная ширина | psi_ba | 1 | -\n"
            "Коэффициент расстояния | Ka | 100 | МПа^(1/3)\n"
            "Базовое напряжение | sigmaHPprime | 3 | МПа\n"
            "Базовое число циклов | NH0 | 384000000 | цикл\n"
            "Срок работы | th | 1000 | ч\n"
            "Частота вращения | n1 | 100 | мин⁻¹"
        )
        plan = build_assignment_plan(document, CourseworkAssignment(
            title="Контактная выносливость",
            transmission_kind="cylindrical",
            calculation_mode="design",
            parent_action_id="1",
            inputs=inputs,
        ))
        result = execute_plan(document, plan)
        by_sign = {
            node.get("sign"): node.get("value")
            for node in result.candidate.params_node.findall("param")
        }

        self.assertEqual(by_sign["NHE_65"], "6000000")
        self.assertEqual(by_sign["KHL_64"], "2")
        self.assertEqual(by_sign["sigmaHP_63"], "6")
        self.assertEqual(by_sign["aw_61"], "251.98421")

    def test_formula_66_and_67_are_available_from_assignment_form(self):
        document = create_course_project("Курсовая", "Главная работа")
        inputs = parse_assignment_inputs(
            "Ступени нагрузки | load_steps | 100:1000; 50:8000 | Н·м:цикл\n"
            "Расчетный момент | T1 | 100 | Н·м\n"
            "Форма зубьев | tooth_form | helical | -\n"
            "Напряжение шестерни | sigmaHP1 | 400 | МПа\n"
            "Напряжение колеса | sigmaHP2 | 1000 | МПа"
        )
        plan = build_assignment_plan(document, CourseworkAssignment(
            title="Циклограмма",
            transmission_kind="cylindrical",
            calculation_mode="verification",
            parent_action_id="1",
            inputs=inputs,
        ))
        result = execute_plan(document, plan)
        by_sign = {
            node.get("sign"): node.get("value")
            for node in result.candidate.params_node.findall("param")
        }

        self.assertEqual(by_sign["NSigma_66"], "9000")
        self.assertEqual(by_sign["NHE_66"], "2000")
        self.assertEqual(by_sign["sigmaHP_67"], "492")

    def test_bending_formula_chain_69_to_611(self):
        document = create_course_project("Курсовая", "Главная работа")
        inputs = parse_assignment_inputs(
            "Ступени нагрузки | load_steps | 100:1000; 50:64000 | Н·м:цикл\n"
            "Расчетный момент | T1 | 100 | Н·м\n"
            "Показатель кривой | mF | 6 | -\n"
            "Базовое число циклов | NF0 | 128000 | цикл\n"
            "Базовое напряжение изгиба | sigmaFPprime | 200 | МПа"
        )
        plan = build_assignment_plan(document, CourseworkAssignment(
            title="Изгибная долговечность",
            transmission_kind="cylindrical",
            calculation_mode="verification",
            parent_action_id="1",
            inputs=inputs,
        ))
        result = execute_plan(document, plan)
        by_sign = {
            node.get("sign"): node.get("value")
            for node in result.candidate.params_node.findall("param")
        }

        self.assertEqual(by_sign["NFE_611"], "2000")
        self.assertEqual(by_sign["KFL_610"], "2")
        self.assertEqual(by_sign["sigmaFP_69"], "400")

    def test_bending_modules_68_and_612_round_up_by_table_68(self):
        document = create_course_project("Курсовая", "Главная работа")
        inputs = parse_assignment_inputs(
            "Вид зацепления | engagement | external | -\n"
            "Форма зубьев | tooth_form | spur | -\n"
            "Передаточное отношение | u | 3 | -\n"
            "Расчетный момент | T1 | 4 | Н·м\n"
            "Коэффициент формы | YF1 | 1 | -\n"
            "Межосевое расстояние | aw | 4 | мм\n"
            "Ширина венца | bw | 1 | мм\n"
            "Допускаемое напряжение | sigmaFP1 | 1 | МПа\n"
            "Коэффициент формулы 6.8 | Kma | 0.25 | -\n"
            "Коэффициент формулы 6.12 | Km | 10 | -\n"
            "Коэффициент распределения | KFbeta | 1 | -\n"
            "Число зубьев | z1 | 2 | -\n"
            "Относительная ширина | psi_bd | 1 | -"
        )
        plan = build_assignment_plan(document, CourseworkAssignment(
            title="Проектировочный модуль",
            transmission_kind="cylindrical",
            calculation_mode="design",
            parent_action_id="1",
            inputs=inputs,
        ))
        result = execute_plan(document, plan)
        by_sign = {
            node.get("sign"): node.get("value")
            for node in result.candidate.params_node.findall("param")
        }

        self.assertEqual(by_sign["m_68"], "1")
        self.assertEqual(by_sign["m_612"], "10")
        self.assertEqual(by_sign["m_standard"], "10")

    def test_contact_check_chain_613_through_616(self):
        document = create_course_project("Курсовая", "Главная работа")
        inputs = parse_assignment_inputs(
            "Вид зацепления | engagement | external | -\n"
            "Передаточное отношение | u | 3 | -\n"
            "Начальный диаметр шестерни | dw1 | 4 | мм\n"
            "Окружная сила | Ft | 4 | Н\n"
            "Ширина венца | bw | 2 | мм\n"
            "Коэффициент KHalpha | KHalpha | 1 | -\n"
            "Коэффициент KHbeta | KHbeta | 1 | -\n"
            "Коэффициент deltaH | deltaH | 1 | -\n"
            "Коэффициент g0 | g0 | 1 | -\n"
            "Скорость | v | 1 | м/с\n"
            "Межосевое расстояние | aw | 4 | мм\n"
            "Предел динамической нагрузки | wHvLimit | 1 | Н/мм\n"
            "Коэффициент ZH | ZH | 1 | -\n"
            "Коэффициент ZM | ZM | 1 | МПа^0,5\n"
            "Коэффициент Zepsilon | Zepsilon | 1 | -\n"
            "Допускаемое напряжение | sigmaHP | 2 | МПа\n"
            "Рабочий момент | T1 | 100 | Н·м\n"
            "Максимальный момент | T1max | 400 | Н·м\n"
            "Максимальное допускаемое напряжение | sigmaHPmax | 2.5 | МПа"
        )
        plan = build_assignment_plan(document, CourseworkAssignment(
            title="Контактная проверка", transmission_kind="cylindrical",
            calculation_mode="verification", parent_action_id="1", inputs=inputs,
        ))
        result = execute_plan(document, plan)
        by_sign = {
            node.get("sign"): node.get("value")
            for node in result.candidate.params_node.findall("param")
        }

        self.assertEqual(by_sign["wHv_616"], "1")
        self.assertEqual(by_sign["KHv_615"], "1.5")
        self.assertEqual(by_sign["wHt_614"], "3")
        self.assertEqual(by_sign["sigmaH_613"], "1")
        self.assertEqual(by_sign["utilH_613"], "0.5")
        self.assertEqual(by_sign["sigmaHmax_622"], "2")
        self.assertEqual(by_sign["utilHmax_622"], "0.8")
        self.assertTrue(any("Формула (6.13), стр. 53: условие выполнено" in item for item in plan.manual_checks))
        self.assertTrue(any("Формула (6.22), стр. 56: условие выполнено" in item for item in plan.manual_checks))

    def test_bending_check_chain_617_through_621(self):
        document = create_course_project("Курсовая", "Главная работа")
        inputs = parse_assignment_inputs(
            "Форма зубьев | tooth_form | helical | -\n"
            "Передаточное отношение | u | 1 | -\n"
            "Модуль | m | 2.25 | мм\n"
            "Угол наклона | beta | 14 | град\n"
            "Окружная сила | Ft | 4 | Н\n"
            "Ширина венца | bw | 2 | мм\n"
            "Коэффициент KFbeta | KFbeta | 1 | -\n"
            "Коэффициент формы | YF1 | 1 | -\n"
            "Торцовое перекрытие | epsilonAlpha | 2 | -\n"
            "Осевое перекрытие | epsilonBeta | 1.1 | -\n"
            "Степень точности | accuracyGrade | 7 | -\n"
            "Коэффициент deltaF | deltaF | 1 | -\n"
            "Коэффициент g0 | g0 | 1 | -\n"
            "Скорость | v | 1 | м/с\n"
            "Межосевое расстояние | aw | 4 | мм\n"
            "Предел динамической нагрузки | wFvLimit | 1 | Н/мм\n"
            "Допускаемое напряжение | sigmaFP1 | 2 | МПа"
        )
        plan = build_assignment_plan(document, CourseworkAssignment(
            title="Проверка изгиба", transmission_kind="cylindrical",
            calculation_mode="verification", parent_action_id="1", inputs=inputs,
        ))
        result = execute_plan(document, plan)
        by_sign = {
            node.get("sign"): node.get("value")
            for node in result.candidate.params_node.findall("param")
        }

        self.assertEqual(by_sign["Ybeta_617"], "0.9")
        self.assertEqual(by_sign["Yepsilon_617"], "1")
        self.assertEqual(by_sign["KFalpha_619"], "0.75")
        self.assertEqual(by_sign["wFv_621"], "1")
        self.assertAlmostEqual(float(by_sign["KFv_620"]), 5 / 3)
        self.assertEqual(by_sign["wFt_618"], "2.5")
        self.assertEqual(by_sign["sigmaF_617"], "1")
        self.assertEqual(by_sign["utilF_617"], "0.5")
        self.assertTrue(any("Формула (6.17), стр. 56: условие выполнено" in item for item in plan.manual_checks))


if __name__ == "__main__":
    unittest.main()
