import unittest
import xml.etree.ElementTree as ET
from is2_re.coursework import create_course_project
from is2_re.is2_spd_view import build_is2_spd_scene,is2_connectors,is2_parameter_marks,is2_spd_svg
from is2_re.specifications import add_primary_link

class IS2SheetTests(unittest.TestCase):
    def setUp(self):
        self.doc=create_course_project('test','root')
        self.a=self.doc.add_action('first sheet',action_type='2',parent_id='1',symbol='122',level=2,number=1)
        self.b=self.doc.add_action('second sheet',action_type='2',parent_id='1',symbol='122',level=2,number=2)
        self.x=self.doc.add_action('first child',action_type='0',parent_id=self.a,symbol='122',level=3,number=1)
        self.alt=self.doc.add_action('check',action_type='1',parent_id=self.a,symbol='122',level=3,number=2)
        self.left=self.doc.add_action('yes',action_type='0',parent_id=self.alt,symbol='122',level=4,number=1)
        self.right=self.doc.add_action('no',action_type='0',parent_id=self.alt,symbol='122',level=4,number=2)
        obj=self.doc.add_object('detail');self.param=self.doc.add_parameter({'name':'diameter','group':'5','number':'3','o':obj})
        add_primary_link(self.doc,self.x,self.param,'*')

    def test_root_sheet_and_focused_subtree_have_correct_levels_and_no_overlap(self):
        before=self.doc.to_bytes()
        root=build_is2_spd_scene(self.doc)
        self.assertEqual({n.ident for n in root.nodes},{'1',self.a,self.b})
        focused=build_is2_spd_scene(self.doc,self.a)
        nodes={n.ident:n for n in focused.nodes}
        self.assertEqual(set(nodes),{self.a,self.x,self.alt,self.left,self.right})
        self.assertEqual(nodes[self.a].x,nodes[self.x].x)
        self.assertEqual(nodes[self.x].depth,nodes[self.alt].depth)
        self.assertEqual(nodes[self.alt].x,nodes[self.left].x)
        self.assertLess(nodes[self.left].x,nodes[self.right].x)
        self.assertEqual(len({(n.x,n.y) for n in nodes.values()}),len(nodes))
        self.assertEqual(before,self.doc.to_bytes())

    def test_actual_parameter_marks_and_svg(self):
        before=self.doc.to_bytes(); scene=build_is2_spd_scene(self.doc,self.a)
        marks=is2_parameter_marks(self.doc)
        self.assertEqual(marks[self.x],'*A5.3')
        self.assertNotIn(self.alt,marks)
        self.assertGreaterEqual(len(list(is2_connectors(scene))),4)
        svg=is2_spd_svg(self.doc,scene,self.x)
        xml=ET.fromstring(svg)
        texts=[x.text for x in xml.findall('.//{http://www.w3.org/2000/svg}text')]
        self.assertIn('*A5.3',texts);self.assertIn('1',texts);self.assertIn('2',texts)
        self.assertEqual(before,self.doc.to_bytes())

    def test_full_view_includes_every_action_and_missing_focus_raises(self):
        self.assertEqual(len(build_is2_spd_scene(self.doc,max_depth=None).nodes),len(self.doc.actions))
        with self.assertRaises(KeyError): build_is2_spd_scene(self.doc,'missing')

    def test_root_loop_shows_body_and_branches_but_not_separate_composite_sheet(self):
        doc = create_course_project('test', 'root')
        doc.action('1').set('type', '3')
        body = doc.add_action('body', action_type='2', parent_id='1')
        simple = doc.add_action('simple', action_type='0', parent_id=body)
        separate = doc.add_action('separate sheet', action_type='2', parent_id=body)
        hidden = doc.add_action('separate contents', action_type='0', parent_id=separate)
        alt = doc.add_action('choice', action_type='1', parent_id=body)
        left = doc.add_action('left', action_type='2', parent_id=alt)
        right = doc.add_action('right', action_type='0', parent_id=alt)
        left_child = doc.add_action('inside left', action_type='0', parent_id=left)
        before = doc.to_bytes()
        for focus in (None, '1'):
            scene = build_is2_spd_scene(doc, focus)
            self.assertEqual({node.ident for node in scene.nodes},
                             {'1', body, simple, separate, alt, left, right, left_child})
            self.assertNotIn(hidden, {node.ident for node in scene.nodes})
            self.assertEqual(len({(n.x, n.y) for n in scene.nodes}), len(scene.nodes))
            self.assertEqual(len(scene.edges), 7)
            self.assertIn('>+</text>', is2_spd_svg(doc, scene))
        self.assertEqual(before, doc.to_bytes())

if __name__=='__main__':unittest.main()
