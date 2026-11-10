import unittest
from types import SimpleNamespace
from unittest.mock import MagicMock, patch

from is2_re.coursework import create_course_project
from is2_re.gui import Is2Studio
from is2_re.parameter_dialog import group_label, next_group_number


class ParameterEditorTests(unittest.TestCase):
    def setUp(self):
        self.doc = create_course_project('Test', 'Root')

    def test_number_is_calculated_per_group(self):
        for group, number in [('5', '2'), ('5', '8'), ('8', '30'), ('5', 'not-a-number')]:
            self.doc.add_parameter({'name': 'p', 'group': group, 'number': number})
        params = self.doc.params_node.findall('param')
        self.assertEqual(next_group_number(params, '5'), 9)
        self.assertEqual(next_group_number(params, '8'), 31)
        self.assertEqual(next_group_number(params, '3'), 1)
        self.assertEqual(group_label('5'), '5 — Размерные')
        self.assertEqual(group_label('42'), '42')

    def test_edit_keeps_unknown_attributes_and_unresolved_object(self):
        ident = self.doc.add_parameter({'name': 'old', 'group': '5', 'number': '1',
                                        'codingType': '1', 'sign': 'a', 'vendor': 'preserve'})
        node = self.doc.parameter(ident)
        node.set('o', '999')  # Existing damaged references must not be silently removed.
        app = SimpleNamespace(doc=self.doc, param_tree=MagicMock(),
                              _selected_attrs=lambda *args: (ident, node),
                              wait_window=lambda dialog: None, _mark_dirty=MagicMock(),
                              refresh_all=MagicMock())
        result = {'name': 'new', 'group': '5', 'number': '1', 'codingType': '1',
                  'sign': 'a', 'o': '999'}
        with patch('is2_re.gui.ParameterDialog', return_value=SimpleNamespace(result=result)):
            Is2Studio.edit_parameter(app)
        self.assertEqual(node.get('name'), 'new')
        self.assertEqual(node.get('vendor'), 'preserve')
        self.assertEqual(node.get('o'), '999')
        app._mark_dirty.assert_called_once()


if __name__ == '__main__':
    unittest.main()
