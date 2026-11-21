import json
import tempfile
import unittest
from pathlib import Path

from is2_re.coursework import create_course_project
from is2_re.ocr_report import (
    OcrRecognition,
    OcrReportError,
    OcrToken,
    build_explanatory_report,
    export_report_bundle,
    parse_page_selection,
    parse_tesseract_tsv,
    run_selected_page_ocr,
)


class FakeRenderer:
    def page_count(self, pdf_path):
        return 8

    def render(self, pdf_path, page_number, image_path):
        image_path.parent.mkdir(parents=True, exist_ok=True)
        image_path.write_bytes(f"PNG page {page_number}".encode())


class FakeEngine:
    name = "fake-ocr"

    def recognize(self, image_path):
        page = int(image_path.stem.split("-")[-1])
        return OcrRecognition(
            text=f"sigma = {page} 1 2 3 4 5 6",
            tokens=(OcrToken("sigma", 95, 1), OcrToken(str(page), 40, 1)),
            mean_confidence=67.5,
        )


class OcrReportTests(unittest.TestCase):
    def _temporary(self):
        parent = Path.cwd() / "tmp" / "test_temp"
        parent.mkdir(parents=True, exist_ok=True)
        temporary = tempfile.TemporaryDirectory(dir=parent)
        self.addCleanup(temporary.cleanup)
        return Path(temporary.name)

    def test_page_selection_accepts_explicit_pages_and_ranges(self):
        self.assertEqual(parse_page_selection("5, 2-3, 3", page_count=10), (2, 3, 5))
        with self.assertRaisesRegex(OcrReportError, "between 1 and 10"):
            parse_page_selection("11", page_count=10)
        with self.assertRaisesRegex(OcrReportError, "no more than"):
            parse_page_selection("1-21", page_count=30)

    def test_tesseract_tsv_parser_preserves_lines_and_confidence(self):
        payload = (
            "level\tpage_num\tblock_num\tpar_num\tline_num\tword_num\tleft\ttop\twidth\theight\tconf\ttext\n"
            "5\t1\t1\t1\t1\t1\t0\t0\t1\t1\t95.0\tРасчет\n"
            "5\t1\t1\t1\t1\t2\t0\t0\t1\t1\t55.0\tвала\n"
            "5\t1\t1\t1\t2\t1\t0\t0\t1\t1\t85.0\tФормула\n"
        )
        result = parse_tesseract_tsv(payload)
        self.assertEqual(result.text, "Расчет вала\nФормула")
        self.assertAlmostEqual(result.mean_confidence, 235 / 3)
        self.assertEqual(result.tokens[1].confidence, 55)

    def test_selected_page_ocr_keeps_page_image_and_review_reasons(self):
        root = self._temporary()
        source = root / "method.pdf"
        source.write_bytes(b"fake pdf")

        result = run_selected_page_ocr(
            source,
            "2,4",
            root / "ocr",
            engine=FakeEngine(),
            renderer=FakeRenderer(),
            confidence_threshold=70,
        )

        self.assertEqual([page.page_number for page in result.pages], [2, 4])
        self.assertTrue(Path(result.pages[0].image_path).is_file())
        self.assertEqual(result.pages[0].low_confidence_tokens, ("2",))
        self.assertTrue(any("формулы" in item for item in result.pages[0].review_reasons))

    def test_report_bundle_exports_markdown_manifest_and_checks(self):
        root = self._temporary()
        source = root / "method.pdf"
        source.write_bytes(b"fake pdf")
        ocr = run_selected_page_ocr(
            source, "3", root / "ocr", engine=FakeEngine(), renderer=FakeRenderer(),
        )
        document = create_course_project("Курсовая", "Главная работа")
        document.add_parameter({"name": "Передаточное отношение", "sign": "u", "value": "3", "unit": "-"})

        report = build_explanatory_report(
            document,
            ocr=ocr,
            assumptions=("Материал задан предварительно",),
            manual_checks=("Проверить коэффициент",),
        )
        bundle = export_report_bundle(
            root / "report",
            document,
            ocr=ocr,
            assumptions=("Материал задан предварительно",),
            manual_checks=("Проверить коэффициент",),
        )

        self.assertIn("Передаточное отношение", report)
        self.assertIn("Страница PDF 3", report)
        self.assertIn("ручная проверка", report.casefold())
        self.assertTrue(bundle.report_path.is_file())
        self.assertTrue(bundle.checks_path.is_file())
        self.assertTrue(bundle.manifest_path.is_file())
        manifest = json.loads(bundle.manifest_path.read_text(encoding="utf-8"))
        self.assertEqual(manifest["pages"][0]["page_number"], 3)
        self.assertIn("Проверить коэффициент", bundle.checks_path.read_text(encoding="utf-8"))


if __name__ == "__main__":
    unittest.main()

