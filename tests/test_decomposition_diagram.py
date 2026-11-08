import unittest
import xml.etree.ElementTree as ET
from is2_re.coursework import create_course_project
from is2_re.decomposition_view import sheet_scene, primitives, diagram_svg

class DecompositionDiagramTests(unittest.TestCase):
    def make_doc(self):
        doc=create_course_project('test','Основная задача')
        a=doc.add_action('Шаг один',action_type='0',parent_id='1',symbol='122',level=2,number=1)
        b=doc.add_action('Проверка условия',action_type='1',parent_id='1',symbol='122',level=2,number=2,alternatives=['При наличии','При отсутствии'])
        doc.add_action('Первое',action_type='0',parent_id=b,symbol='122',level=3,number=1)
        doc.add_action('Второе',action_type='0',parent_id=b,symbol='122',level=3,number=2)
        return doc,a,b
    def test_full_and_local_selection(self):
        doc,a,b=self.make_doc();before=doc.to_bytes()
        scene,geom,lines=sheet_scene(doc);self.assertEqual(len(scene.nodes),5)
        scene,geom,lines=sheet_scene(doc,b);self.assertEqual({n.ident for n in scene.nodes},{b,'4','5'})
        ops,_,_=primitives(doc,b);labels=[o[3] for o in ops if o[0]=='text']
        self.assertIn('При наличии',labels);self.assertIn('При отсутствии',labels)
        self.assertEqual(before,doc.to_bytes())
    def test_svg_and_toggle(self):
        doc,a,b=self.make_doc();root=ET.fromstring(diagram_svg(doc,b))
        ns={'s':'http://www.w3.org/2000/svg'}
        self.assertEqual(len(root.findall('s:rect',ns)),4)
        texts=[x.text for x in root.findall('s:text',ns)]
        self.assertIn('z22',texts);self.assertIn('?]',texts)
        no=diagram_svg(doc,b,show_codes=False,show_symbols=False)
        self.assertNotIn('>z22<',no);self.assertNotIn('>?]</text>',no)
    def test_compact_mode_can_hide_codes(self):
        doc,_,_=self.make_doc()
        ops,_,_=primitives(doc,show_codes=False,show_symbols=False)
        self.assertFalse(any(op[0]=='text' and op[3].startswith('z') for op in ops))

if __name__=='__main__':unittest.main()
