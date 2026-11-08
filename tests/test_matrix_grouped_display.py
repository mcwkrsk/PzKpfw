import unittest
import xml.etree.ElementTree as ET
from types import SimpleNamespace
from is2_re.coursework import create_course_project
from is2_re.gui import Is2Studio
from is2_re.matrix_view import grouped_matrix, cell_description, inferred_structural_marks
from is2_re.specifications import add_primary_link, project_forms

class FakeTree:
    def __init__(self):self.rows=[]
    def get_children(self):return ()
    def delete(self,*a):self.rows=[]
    def insert(self, parent, position, iid, values):self.rows.append((iid,values))

class MatrixDisplayTests(unittest.TestCase):
    def setUp(self):
        self.doc=create_course_project('p','main')
        self.act=self.doc.add_action('Расчёт',action_type=0,parent_id='1',symbol='122',level=2,number=1)
        self.detail=self.doc.add_object('Деталь');self.unit=self.doc.add_object('Узел')
        self.param_unit=self.doc.add_parameter({'name':'Нагрузка','group':9,'number':1,'o':self.unit})
        self.param_detail=self.doc.add_parameter({'name':'Диаметр','group':5,'number':2,'o':self.detail})
        add_primary_link(self.doc,self.act,self.param_unit,'+',power=2)
        add_primary_link(self.doc,self.act,self.param_detail,'*')

    def test_grouped_columns_and_hover_follow_correct_parameter(self):
        before=self.doc.to_bytes()
        headers,rows,ids,warnings=grouped_matrix(self.doc)
        self.assertEqual(ids,[self.param_detail,self.param_unit])
        self.assertEqual(headers[2:],['Деталь\nA5.2','Узел\nA9.1'])
        self.assertEqual(rows[1][2:],['* ]~','+×2'])
        tip=cell_description(self.doc,self.act,self.param_unit)
        self.assertIn('Нагрузка',tip);self.assertIn('аргумент',tip);self.assertIn('кратность 2',tip)
        self.assertEqual(before,self.doc.to_bytes())

    def test_inferred_symbols_are_marked_read_only_and_not_guessed_when_ambiguous(self):
        root = '1'
        before = self.doc.to_bytes()
        marks = inferred_structural_marks(self.doc)
        self.assertIn('[', marks[(root, self.param_detail)])
        self.assertIn(']', marks[(self.act, self.param_detail)])
        self.assertEqual(before, self.doc.to_bytes())
        # Multiple possible function outputs cannot choose a sequence result.
        matrix = self.doc.root.find('./models/primaryModel/matrix')
        ET.SubElement(matrix, 'AElement', {'type':'4','id':'0','e1':self.act,
                         'e2':self.param_unit,'char':str(ord('*')),'power':'1'})
        marks = inferred_structural_marks(self.doc)
        self.assertNotIn((root, self.param_detail), marks)
        self.assertNotIn((root, self.param_unit), marks)

    def test_unknown_records_are_not_silently_deleted(self):
        matrix=self.doc.root.find('./models/primaryModel/matrix')
        ET.SubElement(matrix,'VendorRecord',{'id':'9'})
        before=self.doc.to_bytes()
        _,_,_,warnings=grouped_matrix(self.doc)
        self.assertTrue(any('Запись matrix' in warning for warning in warnings))
        self.assertEqual(before,self.doc.to_bytes())

    def test_object_row_number_is_distinct_from_id_and_parameter_shows_name(self):
        self.doc.objects_node.set('LastID','1')
        # Keep an existing file's valid non-consecutive IDs intact.
        detail_node, unit_node = list(self.doc.objects_node)
        detail_node.set('id','2'); unit_node.set('id','3')
        self.doc.objects_node.set('LastID','3')
        self.doc.parameter(self.param_detail).set('o','2');self.doc.parameter(self.param_unit).set('o','3')
        obj=SimpleNamespace(doc=self.doc,param_tree=FakeTree(),object_tree=FakeTree())
        Is2Studio._refresh_params(obj);Is2Studio._refresh_objects(obj)
        self.assertEqual(obj.object_tree.rows[0][1][:3],(1,'2','Деталь'))
        self.assertEqual(obj.param_tree.rows[1][1][-1],'Деталь (ID 2)')

    def test_loop_label(self):
        self.doc.add_action('Цикл',action_type=3,parent_id='1')
        forms,_=project_forms(self.doc)
        # Include a nested child so the structural table has a row for the loop.
        loop=self.doc.actions[-1].get('id');self.doc.add_action('Тело',action_type=0,parent_id=loop)
        forms,_=project_forms(self.doc)
        self.assertTrue(any(row[-1]=='Цикл' for row in forms['A'][1]))

if __name__ == '__main__':unittest.main()
