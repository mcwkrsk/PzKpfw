import unittest
from is2_re.coursework import build_course_scene, create_course_project

class CourseLevelLayoutTests(unittest.TestCase):
    def test_depth_limit_does_not_promote_hidden_descendants(self):
        doc = create_course_project('test', 'root')
        first = doc.add_action('level 2', action_type=0, parent_id='1')
        second = doc.add_action('level 3', action_type=0, parent_id=first)
        hidden = doc.add_action('level 4', action_type=0, parent_id=second)
        also_hidden = doc.add_action('level 5', action_type=0, parent_id=hidden)
        other = doc.add_action('another root', action_type=0)
        before = doc.to_bytes()
        limited = build_course_scene(doc, max_depth=2)
        self.assertEqual({n.ident:n.depth for n in limited.nodes}, {'1':0, first:1, second:2, other:0})
        full = build_course_scene(doc)
        self.assertEqual({n.ident:n.depth for n in full.nodes}[also_hidden], 4)
        focused = build_course_scene(doc, focus=first, max_depth=1)
        self.assertEqual({n.ident:n.depth for n in focused.nodes}, {first:0, second:1})
        self.assertEqual(before, doc.to_bytes())


if __name__ == '__main__': unittest.main()
