import unittest
from is2_re.coursework import create_course_project
from is2_re.graph import build_relationship_graph
from is2_re.graph_layout import automatic_relationship_layout
from is2_re.gui_models import action_diagram_layout


class AdvancedDiagramLayoutTests(unittest.TestCase):
    def test_compact_graph_positions_do_not_overlap_or_change_document(self):
        doc = create_course_project('Test', 'Root')
        obj = doc.add_object('Object')
        for index in range(12):
            doc.add_action('Action ' + str(index), action_type='0', parent_id='1')
            doc.add_parameter({'name': 'Parameter ' + str(index), 'group': 5, 'number': index + 1, 'o': obj})
        before = doc.to_bytes()
        positions = automatic_relationship_layout(build_relationship_graph(doc))
        occupied_x = sorted({x for x, _ in positions.values()})
        self.assertEqual(occupied_x, [30.0 + 360 * i for i in range(len(occupied_x))])
        values = list(positions.values())
        for index, (x, y) in enumerate(values):
            for x2, y2 in values[index + 1:]:
                self.assertTrue(abs(x - x2) >= 280 or abs(y - y2) >= 82)
        self.assertEqual(before, doc.to_bytes())

    def test_technical_diagram_has_room_for_readable_nodes(self):
        doc = create_course_project('Test', 'Root')
        for index in range(3):
            doc.add_action('Child ' + str(index), action_type='0', parent_id='1')
        rows, positions, _, _ = action_diagram_layout(doc)
        self.assertEqual(len(rows), 4)
        values = list(positions.values())
        for index, (x, y) in enumerate(values):
            for x2, y2 in values[index + 1:]:
                self.assertTrue(abs(x - x2) >= 250 or abs(y - y2) >= 94)


if __name__ == '__main__':
    unittest.main()
