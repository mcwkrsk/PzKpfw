import unittest
from types import SimpleNamespace
from unittest.mock import MagicMock

from is2_re.matrix_canvas import MatrixCanvas, visible_range, wheel_steps


class MatrixViewportTests(unittest.TestCase):
    def test_visible_range_handles_partial_rows_and_end(self):
        self.assertEqual(visible_range(0, 80, 20, 100), (0, 4))
        self.assertEqual(visible_range(9, 80, 20, 100), (0, 5))
        self.assertEqual(visible_range(1980, 80, 20, 100), (99, 100))
        self.assertEqual(visible_range(0, 80, 20, 0), (0, 0))

    def test_scroll_only_changes_offset_and_requests_redraw(self):
        canvas = SimpleNamespace(edges=[0,100,200,300], rows=[('a',)]*100, row_height=20,
            offset_x=0, offset_y=0, _dimensions=lambda:(100,80), _clamp=MagicMock(),
            _sync_scrollbars=MagicMock(), _schedule=MagicMock())
        MatrixCanvas._view(canvas, 'y', ('scroll', 2, 'units'))
        self.assertEqual(canvas.offset_y, 40)
        self.assertEqual(len(canvas.rows), 100)
        canvas._schedule.assert_called_once()
        MatrixCanvas._view(canvas, 'x', ('moveto', .5))
        self.assertEqual(canvas.offset_x, 150)

    def test_hit_testing_respects_scroll_offsets(self):
        canvas = SimpleNamespace(header_height=28, offset_y=40, row_height=20,
                                 rows=[()] * 10, edges=[0,70,160,226], offset_x=40,
                                 headers=('A','B','C'))
        self.assertEqual(MatrixCanvas.identify_row(canvas, 29), 'matrix2')
        self.assertEqual(MatrixCanvas.identify_row(canvas, 20), '')
        self.assertEqual(MatrixCanvas.identify_column(canvas, 130), '#3')
        self.assertEqual(MatrixCanvas.identify_column(canvas, 500), '')

    def test_draw_work_is_limited_to_viewport(self):
        widths = [60] * 300
        row = tuple('*' if i % 8 == 0 else '' for i in range(300))
        calls = MagicMock()
        canvas = SimpleNamespace(_pending='pending', winfo_ismapped=lambda:True,
            theme=lambda:'dark', _dimensions=lambda:(600,400), winfo_height=lambda:428,
            row_height=20, header_height=28, rows=(row,)*10000,
            headers=tuple('A' for _ in widths), widths=widths,
            edges=[i*60 for i in range(301)], offset_x=0, offset_y=0,
            selected_row=0, selected_column=2, font='font', heading_font='font',
            _used={}, configure=MagicMock(), _finish_items=MagicMock())
        canvas._item = lambda layer, kind, *args, **kwargs: getattr(calls, kind)(*args, **kwargs)
        MatrixCanvas._draw(canvas)
        # 10,000 × 300 entries, but only 20 × 10 cells can affect the viewport.
        self.assertLess(calls.text.call_count, 100)
        self.assertLess(calls.line.call_count, 50)

    def test_canvas_items_are_reused_on_next_frame(self):
        fake = SimpleNamespace(_items={}, _used={}, _item_cache={}, _layers_dirty=False, create_text=MagicMock(return_value=42),
                               coords=MagicMock(), itemconfigure=MagicMock())
        MatrixCanvas._item(fake, 'body_text', 'text', 4, 8, text='first')
        fake._used.clear()
        MatrixCanvas._item(fake, 'body_text', 'text', 9, 12, text='second')
        fake.create_text.assert_called_once()
        fake.coords.assert_called_once_with(42, 9, 12)
        fake.itemconfigure.assert_called_once_with(42, text='second')

    def test_unchanged_items_do_not_call_tk_again(self):
        fake = SimpleNamespace(_items={}, _used={}, _item_cache={}, _layers_dirty=False,
                               create_text=MagicMock(return_value=42), coords=MagicMock(), itemconfigure=MagicMock())
        MatrixCanvas._item(fake, 'body_text', 'text', 4, 8, text='same')
        fake._used.clear()
        MatrixCanvas._item(fake, 'body_text', 'text', 4, 8, text='same')
        fake.coords.assert_not_called()
        fake.itemconfigure.assert_not_called()

    def test_windows_touchpad_delta_is_not_promoted_to_full_notch(self):
        self.assertEqual(wheel_steps(120, 'win32'), 1)
        self.assertEqual(wheel_steps(15, 'win32'), .125)
        self.assertEqual(wheel_steps(0, 'win32'), 0)
        self.assertEqual(wheel_steps(1, 'aqua'), 1)


if __name__ == '__main__':
    unittest.main()
