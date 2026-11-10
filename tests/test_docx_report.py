import tempfile
import unittest
from pathlib import Path
from zipfile import ZipFile

from docx import Document
from is2_re.coursework import create_course_project
from is2_re.docx_report import ReportOptions, _tile_ranges, write_docx_report
from is2_re.specifications import add_primary_link


class DocxReportTests(unittest.TestCase):
    def setUp(self):
        self.doc = create_course_project('Тема проекта', 'Корневое действие')
        action = self.doc.add_action('Элементарное действие', action_type='0', parent_id='1', symbol='122', level=2, number=1)
        obj = self.doc.add_object('Деталь')
        parameter = self.doc.add_parameter({'name':'Диаметр', 'sign':'d', 'group':'5', 'number':'1', 'o':obj})
        add_primary_link(self.doc, action, parameter, '*')

    def test_export_has_editable_forms_images_and_no_model_mutation(self):
        before = self.doc.to_bytes()
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / 'report.docx'
            write_docx_report(self.doc, path)
            document = Document(path)
            text = '\n'.join(p.text for p in document.paragraphs)
            self.assertIn('ИДБ-24-17', text)
            self.assertIn('Тема проекта', text)
            self.assertIn('Форма C', text)
            self.assertNotIn('Харин', text)
            self.assertGreaterEqual(len(document.inline_shapes), 2)
            tables = [[[cell.text for cell in row.cells] for row in table.rows] for table in document.tables]
            self.assertTrue(any(row[:2] == ['A5.1', 'Диаметр'] for table in tables for row in table))
            self.assertTrue(any('Код ПД1' in table[0] for table in tables))
            self.assertIsNone(ZipFile(path).testzip())
        self.assertEqual(self.doc.to_bytes(), before)

    def test_selection_and_cannot_overwrite_source(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / 'source.is2'
            path.write_bytes(b'original')
            with self.assertRaises(ValueError):
                write_docx_report(self.doc, path, source_path=path)
            self.assertEqual(path.read_bytes(), b'original')
            out = path.with_suffix('.docx')
            write_docx_report(self.doc, out, ReportOptions(diagrams=False, forms=True, matrix=False, placeholders=False))
            document = Document(out)
            self.assertFalse(document.inline_shapes)
            self.assertEqual(len(document.tables), 5)

    def test_tile_cuts_avoid_blocks_and_cover_entire_extent(self):
        intervals = [(20, 290), (350, 620), (680, 950)]
        ranges = _tile_ranges(1000, 500, intervals)
        self.assertEqual(ranges[0][0], 0)
        self.assertEqual(ranges[-1][1], 1000)
        for (_, end), (start, _) in zip(ranges, ranges[1:]):
            self.assertEqual(end, start)
            self.assertFalse(any(left < end < right for left, right in intervals))


if __name__ == '__main__':
    unittest.main()
