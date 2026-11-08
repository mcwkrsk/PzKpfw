import unittest

from is2_re.action_input import KIND_LABELS, encode_action_symbol, display_action_symbol
from is2_re.coursework import create_course_project
from is2_re.decomposition import convert_action
from is2_re.specifications import action_code

class ActionInputTests(unittest.TestCase):
    def test_symbol_letters_and_legacy_codes(self):
        self.assertEqual(encode_action_symbol('z'), '122')
        self.assertEqual(encode_action_symbol('122'), '122')
        self.assertEqual(display_action_symbol('122'), 'z')
        self.assertEqual(encode_action_symbol('Ж'), str(ord('Ж')))
        for bad in ('word', '0', '65536', '😀'):
            with self.subTest(bad=bad), self.assertRaises(ValueError):
                encode_action_symbol(bad)

    def test_construction_and_symbol_round_trip(self):
        for label, expected, count in [('Элементарное', '0', 0), ('Последовательность', '2', 2), ('Альтернатива', '1', 2), ('Цикл', '3', 1)]:
            with self.subTest(label=label):
                doc = create_course_project('test', 'root')
                ident = doc.add_action('child', action_type=0, parent_id='1', symbol=encode_action_symbol('z'), level=2, number=1)
                if KIND_LABELS[label] != 'elementary':
                    convert_action(doc, ident, KIND_LABELS[label])
                self.assertEqual(doc.action(ident).get('type'), expected)
                self.assertEqual(action_code(doc.action(ident)), 'z21')
                self.assertEqual(len(doc.composition_children(ident)), count)
                self.assertEqual(doc.validate(deep=True), [])
                self.assertTrue(doc.serialization_preflight()['semantic_preserved'])

    def test_existing_children_not_removed_implicitly(self):
        doc = create_course_project('test', 'root')
        doc.add_action('child', action_type=0, parent_id='1')
        before = doc.to_bytes()
        with self.assertRaises(ValueError):
            convert_action(doc, '1', 'alternative')
        self.assertEqual(doc.to_bytes(), before)

if __name__ == '__main__':
    unittest.main()
