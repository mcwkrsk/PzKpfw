import unittest
from types import SimpleNamespace
from unittest.mock import MagicMock
from is2_re.coursework import build_course_scene, create_course_project
from is2_re.decomposition_view import primitives, structural_mark
from is2_re.ui_performance import CoalescedCallback
from is2_re.gui import Is2Studio

class FakeScheduler:
    def __init__(self):
        self.jobs = []
        self.alive = True
        self.destroy_handler = None
    def bind(self, event, handler, add=None):
        self.destroy_handler = handler
    def after_cancel(self, job):
        self.jobs.clear()
    def after(self, delay, callback):
        self.jobs.append((delay, callback))
        return len(self.jobs)
    def winfo_exists(self):
        return self.alive
    def run_next(self):
        _, callback = self.jobs.pop(0)
        callback()

class PerformanceBehaviorTests(unittest.TestCase):
    def test_zoom_events_coalesce_and_keep_final_value(self):
        scheduler = FakeScheduler()
        app = SimpleNamespace(diagram_zoom=1.0)
        drawn = []
        app._diagram_zoom_redraw = CoalescedCallback(scheduler, lambda: drawn.append(app.diagram_zoom), 30)
        for _ in range(20):
            Is2Studio._diagram_scale(app, 1.01)
        self.assertEqual(len(scheduler.jobs), 1)
        scheduler.run_next()
        self.assertAlmostEqual(drawn[0], 1.01 ** 20)

    def test_hidden_views_are_refreshed_once_when_mapped(self):
        diagram = MagicMock()
        graph = MagicMock()
        app = SimpleNamespace(_deferred_views=set(), doc=object(),
                              _refresh_diagram=diagram, _refresh_graph=graph)
        hidden = SimpleNamespace(winfo_ismapped=lambda:False)
        for _ in range(10):
            Is2Studio._refresh_or_defer(app, 'graph', hidden, graph)
        graph.assert_not_called()
        Is2Studio._flush_deferred_view(app, 'graph')
        Is2Studio._flush_deferred_view(app, 'graph')
        graph.assert_called_once()
        self.assertEqual(app._deferred_views, set())

    def test_graph_drag_batches_redraw_and_flushes_final_position(self):
        canvas = SimpleNamespace(canvasx=lambda x:x, canvasy=lambda y:y)
        redraw = MagicMock()
        app = SimpleNamespace(graph_canvas=canvas, graph_zoom=1.0,
            graph_drag={'key':'node', 'start_x':0, 'start_y':0, 'origin':(5, 50), 'moved':False},
            graph_positions={}, _graph_drag_redraw=redraw, _refresh_graph=MagicMock(),
            _save_graph_view_state=MagicMock(), status=MagicMock())
        for i in range(1, 50):
            Is2Studio._graph_motion(app, SimpleNamespace(x=i, y=i))
        self.assertEqual(app.graph_positions['node'], (54.0, 99.0))
        app._refresh_graph.assert_not_called()
        Is2Studio._graph_release(app, None)
        redraw.cancel.assert_called_once()
        app._refresh_graph.assert_called_once()
        app._save_graph_view_state.assert_called_once()

    def test_many_resize_events_share_one_redraw_and_keep_latest_state(self):
        widget = FakeScheduler()
        width = [10]
        drawn = []
        redraw = CoalescedCallback(widget, lambda: drawn.append(width[0]))
        for value in range(100):
            width[0] = value
            redraw.request()
        self.assertEqual(len(widget.jobs), 1)
        widget.run_next()
        self.assertEqual(drawn, [99])
        width[0] = 123
        redraw.request()
        widget.run_next()
        self.assertEqual(drawn, [99, 123])

    def test_destroyed_widget_skips_pending_callback(self):
        widget = FakeScheduler()
        drawn = []
        redraw = CoalescedCallback(widget, lambda: drawn.append(True))
        redraw.request()
        widget.alive = False
        widget.run_next()
        self.assertEqual(drawn, [])

    def test_reordering_and_edits_are_visible_without_stale_cache(self):
        doc = create_course_project('test', 'root')
        a = doc.add_action('A', action_type='0', parent_id='1', symbol='122', level=2, number=1)
        b = doc.add_action('B', action_type='0', parent_id='1', symbol='122', level=2, number=2)
        self.assertEqual(structural_mark(doc, b), ']')
        doc.reorder_children('1', [b, a])
        doc.action(a).set('name', 'changed')
        scene = build_course_scene(doc)
        nodes = {node.ident: node for node in scene.nodes}
        self.assertLess(nodes[b].x, nodes[a].x)
        self.assertEqual(nodes[a].title, 'changed')
        self.assertEqual(structural_mark(doc, a), ']')
        ops, _, _ = primitives(doc)
        self.assertTrue(any(op[0] == 'text' and op[3] == ']' for op in ops))

if __name__ == '__main__':
    unittest.main()
