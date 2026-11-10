import unittest
from types import SimpleNamespace
from is2_re.focus_view import PackSnapshot, restored_sash_positions
from is2_re.course_gui import CourseworkPanel
from is2_re.gui import Is2Studio


class FakeChild:
    def __init__(self, parent, name, **options):
        self.parent, self.name, self.options = parent, name, options
        parent.children.append(self)
    def pack_info(self): return dict(self.options)
    def pack_forget(self):
        if self in self.parent.children: self.parent.children.remove(self)
    def pack(self, **options):
        self.options = options
        self.parent.children.append(self)

class FakeParent:
    def __init__(self): self.children=[]
    def pack_slaves(self): return tuple(self.children)

class FocusViewTests(unittest.TestCase):
    def test_snapshot_restores_order_and_options_after_hide(self):
        parent=FakeParent()
        a=FakeChild(parent,'header',side='top',padx=5)
        b=FakeChild(parent,'diagram',side='top',fill='both',expand=1)
        c=FakeChild(parent,'status',side='bottom')
        snapshot=PackSnapshot(parent)
        snapshot.hide_except({b})
        self.assertEqual(parent.children,[b])
        b.options={'side':'top','fill':'x'}
        snapshot.restore()
        self.assertEqual(parent.children,[a,b,c])
        self.assertEqual(b.options,{'side':'top','fill':'both','expand':1})
        self.assertEqual(a.options,{'side':'top','padx':5})

    def test_sash_restore_scales_and_keeps_right_panel_visible(self):
        self.assertEqual(restored_sash_positions(2000, 2000, (320, 1700)), (320, 1700))
        self.assertEqual(restored_sash_positions(1000, 2000, (320, 1700)), (160, 850))
        first, second = restored_sash_positions(1000, 2000, (320, 1999))
        self.assertLessEqual(second, 880)
        self.assertLess(first, second)

    def test_exit_restores_sashes_after_geometry_and_right_panel(self):
        class Panes:
            def __init__(self): self.positions=[]; self.operations=[]
            def insert(self, *a, **kw): self.operations.append('left')
            def add(self, *a, **kw): self.operations.append('right')
            def winfo_exists(self): return True
            def update_idletasks(self): self.operations.append('layout')
            def winfo_width(self): return 1000
            def sashpos(self, index, value): self.positions.append((index,value))
        panes=Panes(); callbacks=[]
        panel=SimpleNamespace(_focus_return_bar=SimpleNamespace(pack_forget=lambda:None),
            _focus_panes=panes,_focus_left=object(),_focus_right=SimpleNamespace(winfo_width=lambda:150),
            _canvas_help=SimpleNamespace(grid=lambda:None),_focus_layout=SimpleNamespace(restore=lambda:None),
            _focus_sashes=[320,1700],_focus_pane_width=2000,_focus_restore_token=1,
            app=SimpleNamespace(_diagram_focus=None),after_idle=callbacks.append)
        CourseworkPanel.exit_focus_view(panel)
        self.assertEqual(panes.positions, [])
        callbacks.pop()()
        self.assertEqual(panes.positions, [(1,850),(0,160),(1,850)])
        self.assertIn('layout',panes.operations)

    def test_escape_only_exits_when_focused(self):
        seen=[]
        app=SimpleNamespace(_diagram_focus=None,exit_diagram_focus=lambda:seen.append('exit'))
        self.assertIsNone(Is2Studio._escape_diagram_focus(app))
        app._diagram_focus=object()
        self.assertEqual(Is2Studio._escape_diagram_focus(app),'break')
        self.assertEqual(seen,['exit'])

if __name__=='__main__': unittest.main()
