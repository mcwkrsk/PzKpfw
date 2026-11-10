import unittest
from types import SimpleNamespace
from unittest.mock import MagicMock, patch

from is2_re.coursework import create_course_project
from is2_re.gui import Is2Studio


class ObjectEditorTests(unittest.TestCase):
    def setUp(self):
        self.doc = create_course_project('Test', 'Root')
        self.ident = self.doc.add_object('Старое имя', attributes={'vendor': 'kept'})
        self.node = self.doc.object(self.ident)
        self.app = SimpleNamespace(doc=self.doc, object_tree=MagicMock(),
            _selected_attrs=lambda *args: (self.ident, self.node),
            wait_window=lambda dialog: None, _mark_dirty=MagicMock(), refresh_all=MagicMock())

    def test_rename_preserves_id_attributes_and_references(self):
        param = self.doc.add_parameter({'name': 'p', 'o': self.ident})
        with patch('is2_re.gui.ObjectDialog', return_value=SimpleNamespace(result={'name': 'Новое имя'})):
            Is2Studio.edit_object(self.app)
        self.assertEqual(self.node.attrib, {'name': 'Новое имя', 'id': self.ident, 'vendor': 'kept'})
        self.assertEqual(self.doc.parameter(param).get('o'), self.ident)
        self.app._mark_dirty.assert_called_once()

    def test_cancel_does_not_modify_model(self):
        before = self.doc.to_bytes()
        with patch('is2_re.gui.ObjectDialog', return_value=SimpleNamespace(result=None)):
            Is2Studio.edit_object(self.app)
        self.assertEqual(before, self.doc.to_bytes())
        self.app._mark_dirty.assert_not_called()

    def test_double_click_only_edits_a_row(self):
        tree, edit = MagicMock(), MagicMock()
        tree.identify_row.return_value = self.ident
        Is2Studio._edit_record_at(self.app, tree, SimpleNamespace(y=1), edit)
        tree.selection_set.assert_called_once_with(self.ident)
        edit.assert_called_once()
        tree.identify_row.return_value = ''
        edit.reset_mock()
        Is2Studio._edit_record_at(self.app, tree, SimpleNamespace(y=100), edit)
        edit.assert_not_called()


if __name__ == '__main__':
    unittest.main()
