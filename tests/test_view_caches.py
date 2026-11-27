"""The speed-ups must not change what the views show (no GUI needed)."""
import random
import unittest
from types import SimpleNamespace

from is2_re.coursework import create_course_project, build_course_scene
from is2_re.course_gui import CourseworkPanel, _cached_measure, _fit_text_lines
from is2_re.document import ProjectDocument
from is2_re.gui_models import action_tree_rows
from is2_re.model import ProjectFormatError


def _project():
    doc = create_course_project('p', 'root')
    seq = doc.add_action('seq', action_type='2', parent_id='1')
    for i in range(4):
        doc.add_action(f'leaf {i}', action_type='0', parent_id=seq)
    alt = doc.add_action('alt', action_type='1', parent_id='1')
    doc.add_action('a', action_type='0', parent_id=alt)
    doc.add_action('b', action_type='0', parent_id=alt)
    return doc


def _linear_fit(value, measure, max_width, max_lines):
    """The previous character-by-character implementation."""
    remaining = value.strip()
    lines = []
    while remaining and len(lines) < max_lines:
        count = 0
        for i in range(1, len(remaining) + 1):
            if measure(remaining[:i]) > max_width:
                break
            count = i
        if not count:
            break
        if count < len(remaining):
            space = remaining.rfind(' ', 0, count + 1)
            if space > 0:
                count = space
        line, remaining = remaining[:count].rstrip(), remaining[count:].lstrip()
        lines.append(line)
    if remaining and lines:
        last = lines[-1].rstrip(' .')
        while last and measure(last + '…') > max_width:
            last = last[:-1]
        lines[-1] = last + '…' if measure(last + '…') <= max_width else ''
    return lines


class ReadSnapshotTests(unittest.TestCase):
    def test_same_results_inside_and_outside(self):
        doc = _project()
        ids = [a.get('id') for a in doc.actions]
        plain = ([doc.sibling_order(i) for i in ids], [doc.composition_children(i) for i in ids],
                 action_tree_rows(doc), build_course_scene(doc, max_depth=None))
        with doc.read_snapshot():
            with doc.read_snapshot():           # nested blocks share one index
                cached = ([doc.sibling_order(i) for i in ids], [doc.composition_children(i) for i in ids],
                          action_tree_rows(doc), build_course_scene(doc, max_depth=None))
            self.assertIsNotNone(doc._read_index)
        self.assertIsNone(doc._read_index)
        self.assertEqual(plain, cached)

    def test_returned_lists_are_copies(self):
        doc = _project()
        with doc.read_snapshot():
            first = doc.sibling_order('1')
            first.append('x')
            self.assertNotIn('x', doc.sibling_order('1'))

    def test_errors_are_raised_every_time(self):
        doc = _project()
        link = next(n for n in doc.links if n.get('type') == '3' and n.get('afe1') == '1')
        link.set('afe3', '999')
        with self.assertRaises(ProjectFormatError) as plain:
            doc.sibling_order('1')
        with doc.read_snapshot():
            for _ in range(2):
                with self.assertRaises(ProjectFormatError) as cached:
                    doc.sibling_order('1')
                self.assertEqual(str(cached.exception), str(plain.exception))

    def test_copy_made_inside_does_not_use_the_index(self):
        doc = _project()
        with doc.read_snapshot():
            copy = ProjectDocument.from_bytes(doc.to_bytes())
            copy.action('1').set('name', 'changed')
            self.assertEqual(copy.action('1').get('name'), 'changed')
            self.assertEqual(doc.action('1').get('name'), 'root')


class TextFitTests(unittest.TestCase):
    def test_binary_search_matches_previous_wrapping(self):
        rnd = random.Random(3)
        words = 'Определение параметров для текущей передачи D1 alpha1 {alpha1} WWW iii'.split()
        widths = {c: rnd.choice((3, 5, 7, 9, 12)) for c in set(''.join(words) + ' …')}
        measure = lambda text: sum(widths.get(c, 6) for c in text)
        for _ in range(800):
            text = ' '.join(rnd.choice(words) for _ in range(rnd.randint(1, 12)))
            width, lines = rnd.randint(1, 260), rnd.randint(1, 5)
            self.assertEqual(_fit_text_lines(text, measure, width, lines),
                             _linear_fit(text, measure, width, lines))

    def test_measure_cache_is_per_font(self):
        class Font:
            def __init__(self, size): self.size, self.calls = size, 0
            def measure(self, text): self.calls += 1; return len(text) * self.size
        small, large = Font(1), Font(3)
        m_small = _cached_measure(small, ('test-font', 1, None))
        m_large = _cached_measure(large, ('test-font', 3, None))
        self.assertEqual((m_small('abc'), m_small('abc'), m_large('abc')), (3, 3, 9))
        self.assertEqual((small.calls, large.calls), (1, 1))


class SceneCacheTests(unittest.TestCase):
    def _panel(self, doc, revision):
        panel = CourseworkPanel.__new__(CourseworkPanel)
        panel.app = SimpleNamespace(_doc_revision=revision, doc=doc)
        panel.focus_id, panel.depth_limit, panel._is2_view = None, None, False
        return panel

    def test_scene_reused_until_revision_changes(self):
        doc = _project()
        panel = self._panel(doc, 0)
        first = panel._display_scene()
        self.assertIs(panel._display_scene(), first)
        doc.add_action('new', action_type='0', parent_id='1')
        panel.app._doc_revision += 1
        second = panel._display_scene()
        self.assertIsNot(second, first)
        self.assertEqual(second, build_course_scene(doc, max_depth=None))

    def test_view_change_rebuilds(self):
        doc = _project()
        panel = self._panel(doc, 0)
        full = panel._display_scene()
        panel.depth_limit = 2
        self.assertEqual(panel._display_scene(), build_course_scene(doc, max_depth=2))
        self.assertIsNot(panel._display_scene(), full)

    def test_without_revision_nothing_is_cached(self):
        doc = _project()
        panel = self._panel(doc, None)
        self.assertIsNot(panel._display_scene(), panel._display_scene())


if __name__ == '__main__':
    unittest.main()
