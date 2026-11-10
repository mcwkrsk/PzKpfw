import unittest
from types import SimpleNamespace
from unittest.mock import patch
from is2_re.button_notebook import ButtonNotebook
from is2_re.gui import Is2Studio
from is2_re.ui_resources import canvas_tag_at, persistent_menu
from is2_re.ui_performance import CoalescedCallback


class FakeMenu:
    instances = []
    def __init__(self, owner, tearoff):
        self.entries = []
        self.destroyed = False
        self.instances.append(self)
    def add_command(self, **kwargs): self.entries.append(kwargs)
    def add_separator(self): self.entries.append(None)
    def destroy(self): self.destroyed = True


class FakeCanvas:
    def __init__(self, tags): self.tags = tags
    def canvasx(self, value): return value + 4
    def canvasy(self, value): return value + 7
    def find_overlapping(self, *args): return tuple(self.tags)
    def gettags(self, item): return self.tags[item]
    def focus_set(self): pass


class LifecycleTests(unittest.TestCase):
    def test_persistent_menu_reuses_entries_and_callbacks(self):
        owner = SimpleNamespace()
        calls = []
        with patch('is2_re.ui_resources.tk.Menu', FakeMenu):
            menu = persistent_menu(owner, '_menu', [('Open', lambda: calls.append('open')), None])
            for _ in range(1000):
                self.assertIs(persistent_menu(owner, '_menu', [('Other', lambda: None)]), menu)
        self.assertEqual(len(menu.entries), 2)
        self.assertFalse(menu.destroyed)
        menu.entries[0]['command']()
        self.assertEqual(calls, ['open'])

    def test_menu_setup_failure_releases_partial_menu(self):
        class BrokenMenu(FakeMenu):
            def add_command(self, **kwargs): raise ValueError('bad command')
        owner = SimpleNamespace()
        with patch('is2_re.ui_resources.tk.Menu', BrokenMenu):
            with self.assertRaises(ValueError): persistent_menu(owner, '_menu', [('Bad', None)])
        self.assertTrue(BrokenMenu.instances[-1].destroyed)
        self.assertFalse(hasattr(owner, '_menu'))

    def test_dynamic_notebook_rebuild_destroys_each_old_page(self):
        class Page:
            def __init__(self): self.destroyed = False
            def destroy(self): self.destroyed = True
        class Book:
            def __init__(self): self.pages = {}
            def tabs(self): return tuple(self.pages)
            def nametowidget(self, key): return self.pages[key]
            def forget(self, key): self.pages.pop(key)
        book = Book()
        pages = []
        for cycle in range(100):
            for n in range(10):
                page = Page(); pages.append(page); book.pages[f'{cycle}-{n}'] = page
            ButtonNotebook.clear_pages(book)
            self.assertFalse(book.pages)
        self.assertTrue(all(page.destroyed for page in pages))

    def test_canvas_hit_testing_prefers_topmost(self):
        canvas = FakeCanvas({1: ('graph-key:lower',), 2: ('graph-group:relation:cs',)})
        event = SimpleNamespace(x=2, y=3)
        self.assertEqual(canvas_tag_at(canvas, event, 'graph-group:'), 'relation:cs')
        self.assertEqual(canvas_tag_at(canvas, event, 'graph-key:'), 'lower')
        self.assertIsNone(canvas_tag_at(canvas, event, 'missing:'))

    def test_graph_header_click_dispatches_without_per_item_binding(self):
        canvas = FakeCanvas({1: ('graph-group-header','graph-group:parameter')})
        called=[]
        app=SimpleNamespace(graph_canvas=canvas,graph_drag={'key':'old'},
                            _toggle_graph_group=called.append)
        self.assertEqual(Is2Studio._graph_press(app, SimpleNamespace(x=1,y=1)), 'break')
        self.assertEqual(called, ['parameter'])
        self.assertIsNone(app.graph_drag)

    def test_pending_resize_is_cancelled_on_widget_destruction(self):
        class Widget:
            def __init__(self): self.events={}; self.cancelled=[]
            def bind(self, name, callback, add): self.events[name]=callback
            def after(self, delay, callback): return 'job1'
            def after_cancel(self, job): self.cancelled.append(job)
        widget=Widget()
        callback=CoalescedCallback(widget, lambda: None)
        callback.request()
        widget.events['<Destroy>'](SimpleNamespace(widget=widget))
        self.assertEqual(widget.cancelled, ['job1'])
        self.assertIsNone(callback._job)

class InvalidProjectHandlingTests(unittest.TestCase):
    def test_broken_order_uses_existing_safe_fallback(self):
        from is2_re.coursework import create_course_project, build_course_scene
        from is2_re.gui_models import action_tree_rows
        from is2_re.matrix_view import inferred_structural_marks
        doc = create_course_project('test', 'root')
        child = doc.add_action('child', action_type='0', parent_id='1')
        records = [link for link in doc.links if link.get('type') == '3']
        for record in records:
            doc.links_node.remove(record)
        before = doc.to_bytes()
        self.assertIn(child, [row.action_id for row in action_tree_rows(doc)])
        self.assertIn(child, [node.ident for node in build_course_scene(doc).nodes])
        self.assertEqual(inferred_structural_marks(doc), {})
        self.assertEqual(before, doc.to_bytes())

if __name__ == '__main__': unittest.main()
