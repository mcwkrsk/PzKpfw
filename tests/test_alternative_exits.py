import unittest
import xml.etree.ElementTree as ET
from is2_re.coursework import create_course_project, build_course_scene, edge_paths, scene_svg

class AlternativeExitTests(unittest.TestCase):
    def test_overview_shows_real_exits_at_depth_boundary(self):
        doc = create_course_project('test', 'root')
        parent = doc.add_action('sequence', action_type='2', parent_id='1')
        alt = doc.add_action('condition', action_type='1', parent_id=parent)
        first = doc.add_action('yes', action_type='0', parent_id=alt)
        second = doc.add_action('no', action_type='0', parent_id=alt)
        hidden = doc.add_action('deeper', action_type='0', parent_id=first)
        before = doc.to_bytes()
        scene = build_course_scene(doc, max_depth=2)
        nodes = {node.ident: node for node in scene.nodes}
        self.assertIn(first, nodes); self.assertIn(second, nodes)
        self.assertNotIn(hidden, nodes)
        paths = [(e, p) for e, p in edge_paths(scene) if e.source == alt]
        self.assertEqual([e.target for e, _ in paths], [first, second])
        self.assertEqual(paths[0][1][0], nodes[alt].x + scene.node_width / 4)
        self.assertEqual(paths[1][1][0], nodes[alt].x + scene.node_width * 3 / 4)
        self.assertEqual(before, doc.to_bytes())
        xml = ET.fromstring(scene_svg(scene))
        paths = xml.findall('{http://www.w3.org/2000/svg}path')
        self.assertEqual(sum('marker-end' in p.attrib for p in paths), 2)

    def test_no_children_produces_no_invented_exits(self):
        doc = create_course_project('test', 'root')
        alt = doc.add_action('condition', action_type='1', parent_id='1')
        scene = build_course_scene(doc, max_depth=2)
        self.assertFalse(any(edge.source == alt for edge, _ in edge_paths(scene)))

if __name__ == '__main__': unittest.main()
