import unittest
import xml.etree.ElementTree as ET

from is2_re.coursework import create_course_project
from is2_re.specifications import add_primary_link, project_forms


class SpecificationFormsTests(unittest.TestCase):
    def test_order_labels_and_branch_default_are_read_only(self):
        doc = create_course_project('Test', 'Root')
        alternative = doc.add_action('Choice', action_type=1, parent_id='1', symbol='122', level=2, number=2)
        first = doc.add_action('First', action_type=0, parent_id=alternative, symbol='122', level=3, number=1, formalization='1')
        second = doc.add_action('Second', action_type=0, parent_id=alternative, symbol='122', level=3, number=2, formalization='3')
        earlier = doc.add_action('Earlier', action_type=0, parent_id='1', symbol='122', level=2, number=1)
        p = doc.add_parameter({'name': 'Частота', 'sign': 'n', 'group': 8, 'number': 2})
        output = doc.add_parameter({'name': 'Результат', 'sign': 'r', 'group': 5, 'number': 1})
        matrix = doc.root.find('./models/primaryModel/matrix')
        ET.SubElement(matrix, 'AElement', {'id':'0', 'type':'4', 'e1':alternative, 'e2':p, 'char':str(ord('?')), 'power':'1'})
        add_primary_link(doc, first, output, '*')
        add_primary_link(doc, first, p, '+')
        add_primary_link(doc, second, p, '.')
        before = doc.to_bytes()
        forms, _ = project_forms(doc)
        self.assertEqual(before, doc.to_bytes())
        self.assertEqual([r[0] for r in forms['B'][1]], ['z11', 'z21', 'z22', 'z31', 'z32'])
        b = {r[0]: r for r in forms['B'][1]}
        self.assertEqual(b['z31'][3], 'Э')
        self.assertEqual(b['z32'][3], 'С')
        d = {r[0]: r for r in forms['D'][1]}
        self.assertEqual(d['z31'][3], 'Результат, r')
        self.assertIn('-/Частота, n', d['z31'][4])
        self.assertEqual(forms['D2'][0], ['Код ПД', 'Код параметра', 'Роль параметра'])
        rows = [r for r in forms['D2'][1] if r[0] == 'z31']
        self.assertEqual(rows, [['z31','A5.1','Функция'], ['z31','A8.2','Аргумент'],
                                ['z31','A8.2','Аргумент по умолчанию']])
        rows = [r for r in forms['D2'][1] if r[0] == 'z32']
        self.assertEqual(rows, [['z32','A8.2','Аргумент по умолчанию']])


if __name__ == '__main__':
    unittest.main()
