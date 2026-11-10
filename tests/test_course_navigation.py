import unittest
from types import SimpleNamespace
from is2_re.coursework import create_course_project
from is2_re.course_gui import CourseworkPanel


class FakeCanvas:
    def __init__(self): self.x = .3; self.y = .2
    def xview(self): return (self.x, 1.0)
    def yview(self): return (self.y, 1.0)
    def xview_moveto(self, x): self.x=x
    def yview_moveto(self, y): self.y=y

class FakeButton:
    def __init__(self): self.state = None
    def configure(self, state): self.state=state

class Panel:
    _view_state=CourseworkPanel._view_state
    _navigate_scene=CourseworkPanel._navigate_scene
    _back_scene=CourseworkPanel._back_scene
    _update_navigation_controls=CourseworkPanel._update_navigation_controls
    _focus_scene=CourseworkPanel._focus_scene
    _root_scene=CourseworkPanel._root_scene
    _full_scene=CourseworkPanel._full_scene
    def __init__(self, doc):
        self.doc=doc; self.focus_id=None; self.depth_limit=None; self.zoom=.8
        self.selected_id=None; self.canvas=FakeCanvas(); self._navigation_history=[]
        self._navigation_back_button=FakeButton();self.draws=0
    def _draw(self): self.draws+=1

class NavigationTests(unittest.TestCase):
    def setUp(self):
        self.doc=create_course_project('test','root')
        self.child=self.doc.add_action('child',action_type='0',parent_id='1')
        self.grandchild=self.doc.add_action('grandchild',action_type='0',parent_id=self.child)
        self.panel=Panel(self.doc)

    def test_back_returns_through_views_without_touching_document(self):
        before=self.doc.to_bytes();p=self.panel
        p.selected_id=self.child;p._focus_scene()
        self.assertEqual(p.focus_id,self.child)
        self.assertEqual(p._navigation_back_button.state,'normal')
        p.zoom=1.2;p.canvas.x=.6;p.selected_id=self.grandchild;p._focus_scene()
        p._back_scene()
        self.assertEqual((p.focus_id,p.zoom,p.canvas.x),(self.child,1.2,.6))
        p._back_scene()
        self.assertEqual((p.focus_id,p.depth_limit,p.zoom,p.canvas.x),(None,None,.8,.3))
        self.assertEqual(p._navigation_back_button.state,'disabled')
        self.assertEqual(before,self.doc.to_bytes())

    def test_already_focused_view_can_navigate_to_actual_parent(self):
        p=self.panel;p.focus_id=self.grandchild;p.depth_limit=2
        p._back_scene();self.assertEqual(p.focus_id,self.child)
        p._back_scene();self.assertEqual(p.focus_id,'1')
        p._back_scene();self.assertIsNone(p.focus_id)
        self.assertEqual(p._navigation_back_button.state,'disabled')

    def test_same_view_does_not_add_history(self):
        p=self.panel;p.selected_id=self.child;p._focus_scene();p._focus_scene()
        self.assertEqual(len(p._navigation_history),1)

    def test_missing_previous_action_skipped(self):
        p=self.panel;p._navigation_history=[(None,2,1,.1,.1),('deleted',2,1,.5,.5)]
        p._back_scene();self.assertEqual((p.focus_id,p.depth_limit),(None,2))

if __name__=='__main__':unittest.main()
