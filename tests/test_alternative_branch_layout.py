import unittest
import xml.etree.ElementTree as ET
from types import SimpleNamespace
from unittest.mock import patch
from is2_re.coursework import create_course_project, build_course_scene, scene_svg
from is2_re.course_gui import CourseworkPanel

class Font:
    def __init__(self, root, family, size, weight=None): self.size = abs(size)
    def measure(self, text): return len(text)*self.size*.6
    def metrics(self, name): return self.size+2
class Canvas:
    def __init__(self): self.items = []
    def delete(self, *args): self.items = []
    def configure(self, **kwargs): pass
    def winfo_width(self): return 1200
    def winfo_height(self): return 800
    def create_text(self, *coords, **opts): self.items.append(('text', coords, opts))
    def create_line(self, *coords, **opts): self.items.append(('line', coords, opts))
    def create_rectangle(self, *coords, **opts): self.items.append(('rect', coords, opts))

class AlternativeLayoutTests(unittest.TestCase):
    def setUp(self):
        self.doc = create_course_project('p', 'root')
        self.doc.add_action('Условие', action_type=1, parent_id='1', symbol='122', level=2, number=1)

    def test_two_centered_cells_and_code_above(self):
        for scale in (.55, 1, 2.5):
            with self.subTest(scale=scale), patch('is2_re.course_gui.tkfont.Font', Font):
                panel = CourseworkPanel.__new__(CourseworkPanel)
                panel.app = SimpleNamespace(theme_name=SimpleNamespace(get=lambda: 'dark'), doc=self.doc)
                panel.canvas=Canvas();panel.focus_id=None;panel.depth_limit=2;panel.zoom=scale;panel.selected_id=None
                panel.mode_label=SimpleNamespace(configure=lambda **kw:None)
                panel._draw()
                node=next(n for n in panel._scene.nodes if n.ident=='2')
                items=[it for it in panel.canvas.items if 'course-action:2' in it[2].get('tags', ())]
                texts={o['text']:(coords,o) for kind,coords,o in items if kind=='text'}
                self.assertIn('1',texts);self.assertIn('2',texts);self.assertIn('z21',texts)
                self.assertAlmostEqual(texts['1'][0][0],(node.x+panel._scene.node_width/4)*scale)
                self.assertAlmostEqual(texts['2'][0][0],(node.x+3*panel._scene.node_width/4)*scale)
                self.assertLess(texts['z21'][0][1],texts['1'][0][1])
                self.assertTrue(any(kind=='line' and coords[0]==coords[2] for kind,coords,o in items))

    def test_export_has_two_cells_and_numbers(self):
        scene=build_course_scene(self.doc)
        root=ET.fromstring(scene_svg(scene))
        ns={'s':'http://www.w3.org/2000/svg'}
        groups=root.findall('s:g',ns)
        group=next(g for g in groups if any(t.text=='z21' for t in g.findall('s:text',ns)))
        texts={t.text:t for t in group.findall('s:text',ns)}
        self.assertIn('1',texts); self.assertIn('2',texts)
        self.assertLess(float(texts['1'].get('x')),float(texts['2'].get('x')))
        self.assertLess(float(texts['z21'].get('y')),float(texts['1'].get('y')))
        self.assertTrue(group.findall('s:path',ns))

if __name__ == '__main__': unittest.main()
