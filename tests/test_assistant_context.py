import unittest

from is2_re.assistant import model_project_context, summarize_project
from is2_re.coursework import create_course_project
from is2_re.specifications import add_primary_link


class AssistantContextTests(unittest.TestCase):
    def test_summary_contains_bounded_structural_facts_not_xml(self):
        document = create_course_project("Контрольный проект", "Главная работа")
        action_id = document.add_action("Расчет", action_type=0, parent_id="1")
        parameter_id = document.add_parameter({"name": "Результат", "sign": "y"})
        document.add_object("Передача")
        add_primary_link(document, action_id, parameter_id, "*")

        summary = summarize_project(document)

        self.assertEqual(summary["project_name"], "Контрольный проект")
        self.assertEqual(summary["counts"], {
            "actions": 2,
            "parameters": 1,
            "objects": 1,
            "matrix_links": 1,
        })
        self.assertEqual(summary["action_types"], {"0": 1, "2": 1})
        self.assertEqual(summary["validation_issue_count"], 0)
        self.assertNotIn("xml", summary)

    def test_summary_rejects_non_document(self):
        with self.assertRaises(TypeError):
            summarize_project({})

    def test_model_context_omits_project_name_and_issue_text(self):
        document = create_course_project("Личное название проекта", "Главная работа")
        context = model_project_context(document)

        self.assertNotIn("project_name", context)
        self.assertNotIn("validation_issues", context)
        self.assertIn("counts", context)

    def test_variant_22_adds_trusted_bevel_methodology_and_structural_ids(self):
        document = create_course_project("Личное название проекта", "Главная работа")

        context = model_project_context(document, "Подготовь вариант 22")

        self.assertEqual(context["methodology"]["variant"], 22)
        self.assertEqual(context["methodology"]["transmission_kind"], "bevel")
        self.assertEqual(context["methodology"]["calculation_mode"], "verification")
        self.assertEqual(context["methodology"]["steps"][0]["key"], "bevel_contact")
        self.assertIn("σ_H", context["methodology"]["steps"][0]["expression"])
        self.assertFalse(context["methodology"]["coursework_output"]["calculate_numeric_values"])
        self.assertIn("Form D2", context["methodology"]["coursework_output"]["required_artifacts"][-2])
        self.assertEqual(context["actions"][0]["id"], "1")
        self.assertNotIn("name", context["actions"][0])


if __name__ == "__main__":
    unittest.main()
