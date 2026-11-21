"""Selected-page OCR with provenance and coursework Markdown report export."""
from __future__ import annotations

import csv
from dataclasses import asdict, dataclass
import io
import json
from pathlib import Path
import re
import shutil
import subprocess
from typing import Iterable, Protocol

from .document import ProjectDocument


MAX_OCR_PAGES = 20
DEFAULT_CONFIDENCE_THRESHOLD = 70.0


class OcrReportError(ValueError):
    """Raised when OCR input, a dependency, or report output is invalid."""


@dataclass(frozen=True)
class OcrToken:
    text: str
    confidence: float
    line_number: int


@dataclass(frozen=True)
class OcrRecognition:
    text: str
    tokens: tuple[OcrToken, ...]
    mean_confidence: float | None


@dataclass(frozen=True)
class OcrPageResult:
    page_number: int
    image_path: str
    text: str
    mean_confidence: float | None
    low_confidence_tokens: tuple[str, ...]
    review_reasons: tuple[str, ...]


@dataclass(frozen=True)
class OcrBatchResult:
    source_pdf: str
    pages: tuple[OcrPageResult, ...]
    engine: str
    confidence_threshold: float


@dataclass(frozen=True)
class ReportBundle:
    report_path: Path
    checks_path: Path
    manifest_path: Path | None


class OcrEngine(Protocol):
    name: str

    def recognize(self, image_path: Path) -> OcrRecognition: ...


class PageRenderer(Protocol):
    def page_count(self, pdf_path: Path) -> int: ...

    def render(self, pdf_path: Path, page_number: int, image_path: Path) -> None: ...


class PopplerPageRenderer:
    """Render one explicit PDF page without reading or converting other pages."""

    def __init__(self, *, pdftoppm: str | None = None, pdfinfo: str | None = None, dpi: int = 220) -> None:
        self.pdftoppm = pdftoppm or shutil.which("pdftoppm")
        self.pdfinfo = pdfinfo or shutil.which("pdfinfo")
        if not self.pdftoppm or not self.pdfinfo:
            raise OcrReportError("Poppler tools pdftoppm and pdfinfo are required for PDF OCR")
        if not 100 <= dpi <= 600:
            raise ValueError("OCR render DPI must be between 100 and 600")
        self.dpi = dpi

    def page_count(self, pdf_path: Path) -> int:
        output = _run_command([self.pdfinfo, str(pdf_path)], "reading PDF information")
        match = re.search(r"^Pages:\s*(\d+)\s*$", output, re.MULTILINE | re.IGNORECASE)
        if not match:
            raise OcrReportError("pdfinfo did not report the number of pages")
        return int(match.group(1))

    def render(self, pdf_path: Path, page_number: int, image_path: Path) -> None:
        image_path.parent.mkdir(parents=True, exist_ok=True)
        prefix = image_path.with_suffix("")
        _run_command([
            self.pdftoppm,
            "-f", str(page_number),
            "-l", str(page_number),
            "-singlefile",
            "-png",
            "-r", str(self.dpi),
            str(pdf_path),
            str(prefix),
        ], f"rendering PDF page {page_number}")
        produced = prefix.with_suffix(".png")
        if not produced.is_file() or produced.stat().st_size == 0:
            raise OcrReportError(f"rendered page image was not created: {page_number}")
        if produced != image_path:
            produced.replace(image_path)


class TesseractOcrEngine:
    name = "tesseract"

    def __init__(self, *, executable: str | None = None, languages: str = "rus+eng") -> None:
        self.executable = executable or shutil.which("tesseract")
        if not self.executable:
            raise OcrReportError(
                "Tesseract OCR is not installed. Install Tesseract with Russian language data or choose another OCR engine."
            )
        if not re.fullmatch(r"[A-Za-z0-9_+.-]+", languages):
            raise ValueError("invalid Tesseract language list")
        self.languages = languages

    def recognize(self, image_path: Path) -> OcrRecognition:
        output = _run_command([
            self.executable,
            str(image_path),
            "stdout",
            "-l", self.languages,
            "tsv",
        ], f"recognizing {image_path.name}")
        return parse_tesseract_tsv(output)


def parse_page_selection(value: str, *, page_count: int, maximum: int = MAX_OCR_PAGES) -> tuple[int, ...]:
    if not isinstance(value, str) or not value.strip():
        raise OcrReportError("specify one or more PDF pages")
    if page_count <= 0:
        raise OcrReportError("PDF page count must be positive")
    pages: set[int] = set()
    for raw_part in value.split(","):
        part = raw_part.strip()
        if not part:
            continue
        if re.fullmatch(r"\d+", part):
            pages.add(int(part))
            continue
        match = re.fullmatch(r"(\d+)\s*-\s*(\d+)", part)
        if not match:
            raise OcrReportError(f"invalid page selection fragment: {part!r}")
        first, last = map(int, match.groups())
        if first > last:
            raise OcrReportError(f"page range must increase: {part!r}")
        pages.update(range(first, last + 1))
    ordered = tuple(sorted(pages))
    if not ordered:
        raise OcrReportError("specify one or more PDF pages")
    if ordered[0] < 1 or ordered[-1] > page_count:
        raise OcrReportError(f"selected pages must be between 1 and {page_count}")
    if len(ordered) > maximum:
        raise OcrReportError(f"select no more than {maximum} pages per OCR run")
    return ordered


def parse_tesseract_tsv(payload: str) -> OcrRecognition:
    reader = csv.DictReader(io.StringIO(payload), delimiter="\t")
    tokens: list[OcrToken] = []
    lines: dict[tuple[str, str, str, str], list[str]] = {}
    for row in reader:
        text = (row.get("text") or "").strip()
        if not text:
            continue
        try:
            confidence = float(row.get("conf", "-1"))
        except ValueError:
            confidence = -1
        if confidence < 0:
            continue
        line_key = (
            row.get("page_num", "1"),
            row.get("block_num", "0"),
            row.get("par_num", "0"),
            row.get("line_num", "0"),
        )
        line_number = int(row.get("line_num", "0") or 0)
        tokens.append(OcrToken(text, confidence, line_number))
        lines.setdefault(line_key, []).append(text)
    text = "\n".join(" ".join(words) for words in lines.values())
    mean = sum(item.confidence for item in tokens) / len(tokens) if tokens else None
    return OcrRecognition(text=text, tokens=tuple(tokens), mean_confidence=mean)


def run_selected_page_ocr(
    pdf_path: str | Path,
    page_selection: str,
    output_directory: str | Path,
    *,
    engine: OcrEngine | None = None,
    renderer: PageRenderer | None = None,
    confidence_threshold: float = DEFAULT_CONFIDENCE_THRESHOLD,
) -> OcrBatchResult:
    source = Path(pdf_path).resolve()
    if not source.is_file() or source.suffix.casefold() != ".pdf":
        raise OcrReportError("select an existing PDF file")
    if not 0 <= confidence_threshold <= 100:
        raise ValueError("confidence threshold must be between 0 and 100")
    page_renderer = renderer or PopplerPageRenderer()
    ocr_engine = engine or TesseractOcrEngine()
    selected = parse_page_selection(page_selection, page_count=page_renderer.page_count(source))
    output = Path(output_directory).resolve()
    output.mkdir(parents=True, exist_ok=True)
    page_results: list[OcrPageResult] = []
    for page_number in selected:
        image_path = output / f"page-{page_number:04d}.png"
        page_renderer.render(source, page_number, image_path)
        recognition = ocr_engine.recognize(image_path)
        low_tokens = tuple(dict.fromkeys(
            token.text for token in recognition.tokens if token.confidence < confidence_threshold
        ))
        reasons: list[str] = []
        if recognition.mean_confidence is None:
            reasons.append("текст не распознан")
        elif recognition.mean_confidence < confidence_threshold:
            reasons.append("низкая средняя уверенность OCR")
        if low_tokens:
            reasons.append("есть слова с низкой уверенностью OCR")
        if _looks_like_formula_or_table(recognition.text):
            reasons.append("формулы и числовые таблицы требуют ручной сверки со сканом")
        page_results.append(OcrPageResult(
            page_number=page_number,
            image_path=str(image_path),
            text=recognition.text,
            mean_confidence=recognition.mean_confidence,
            low_confidence_tokens=low_tokens[:64],
            review_reasons=tuple(reasons),
        ))
    return OcrBatchResult(
        source_pdf=str(source),
        pages=tuple(page_results),
        engine=ocr_engine.name,
        confidence_threshold=confidence_threshold,
    )


def build_explanatory_report(
    document: ProjectDocument,
    *,
    ocr: OcrBatchResult | None = None,
    assumptions: Iterable[str] = (),
    manual_checks: Iterable[str] = (),
) -> str:
    if not isinstance(document, ProjectDocument):
        raise TypeError("document must be a ProjectDocument")
    assumptions_clean = tuple(str(item).strip() for item in assumptions if str(item).strip())
    checks = list(dict.fromkeys(str(item).strip() for item in manual_checks if str(item).strip()))
    lines = [
        f"# {_markdown_text(document.root.get('name', '') or 'Пояснительная записка')}",
        "",
        "> Черновик сформирован PzKpfw. Инженерные результаты, формулы и OCR-фрагменты требуют проверки.",
        "",
        "## Структура проекта",
        "",
        f"- Действий: {len(document.actions)}",
        f"- Параметров: {len(document.params_node.findall('param'))}",
        f"- Объектов: {len(document.objects_node.findall('object'))}",
        "",
        "## Параметры",
        "",
        "| Обозначение | Наименование | Значение | Единица |",
        "|---|---|---:|---|",
    ]
    for node in document.params_node.findall("param"):
        lines.append("| " + " | ".join(
            _markdown_cell(node.get(field, ""))
            for field in ("sign", "name", "value", "unit")
        ) + " |")
    lines.extend(["", "## Допущения", ""])
    lines.extend(f"- {_markdown_text(item)}" for item in assumptions_clean)
    if not assumptions_clean:
        lines.append("- Допущения не указаны.")

    if ocr is not None:
        lines.extend(["", "## OCR выбранных страниц", ""])
        lines.append(f"Источник: `{_markdown_text(ocr.source_pdf)}`. Движок: `{ocr.engine}`.")
        for page in ocr.pages:
            confidence = "нет данных" if page.mean_confidence is None else f"{page.mean_confidence:.1f}%"
            lines.extend([
                "",
                f"### Страница PDF {page.page_number}",
                "",
                f"Изображение-источник: `{_markdown_text(page.image_path)}`. Средняя уверенность: {confidence}.",
                "",
            ])
            if page.review_reasons:
                lines.append("Требуется ручная проверка: " + "; ".join(page.review_reasons) + ".")
                checks.append(f"Сверить OCR страницы PDF {page.page_number}: " + "; ".join(page.review_reasons))
            safe_ocr_text = (page.text or "[текст не распознан]").replace("```", "` ` `")
            lines.extend(["", "```text", safe_ocr_text, "```"])

    lines.extend(["", "## Ручные проверки", ""])
    checks = list(dict.fromkeys(checks))
    lines.extend(f"- {_markdown_text(item)}" for item in checks)
    if not checks:
        lines.append("- Проверить обозначения, размерности и связи параметров по методичке.")
    lines.append("")
    return "\n".join(lines)


def export_report_bundle(
    output_directory: str | Path,
    document: ProjectDocument,
    *,
    ocr: OcrBatchResult | None = None,
    assumptions: Iterable[str] = (),
    manual_checks: Iterable[str] = (),
) -> ReportBundle:
    output = Path(output_directory).resolve()
    output.mkdir(parents=True, exist_ok=True)
    report = build_explanatory_report(
        document,
        ocr=ocr,
        assumptions=assumptions,
        manual_checks=manual_checks,
    )
    report_path = output / "coursework_report.md"
    checks_path = output / "manual_checks.txt"
    manifest_path = output / "ocr_manifest.json" if ocr is not None else None
    _atomic_write_text(report_path, report)

    check_lines = []
    for line in report.splitlines():
        if line == "## Ручные проверки":
            check_lines = report.splitlines()[report.splitlines().index(line) + 2:]
            break
    _atomic_write_text(checks_path, "\n".join(check_lines).rstrip() + "\n")
    if manifest_path is not None:
        payload = {
            "schema_version": 1,
            "source_pdf": ocr.source_pdf,
            "engine": ocr.engine,
            "confidence_threshold": ocr.confidence_threshold,
            "pages": [asdict(page) for page in ocr.pages],
        }
        _atomic_write_text(manifest_path, json.dumps(payload, ensure_ascii=False, indent=2) + "\n")
    return ReportBundle(report_path, checks_path, manifest_path)


def _looks_like_formula_or_table(text: str) -> bool:
    if re.search(r"[=<>±√∑σβεα]", text, re.IGNORECASE):
        return True
    numeric_tokens = re.findall(r"(?<!\w)\d+(?:[.,]\d+)?(?!\w)", text)
    return len(numeric_tokens) >= 6


def _markdown_text(value: str) -> str:
    return str(value).replace("\r", " ").replace("\n", " ").strip()


def _markdown_cell(value: str) -> str:
    return _markdown_text(value).replace("|", "\\|")


def _atomic_write_text(path: Path, text: str) -> None:
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(text, encoding="utf-8", newline="\n")
    temporary.replace(path)


def _run_command(arguments: list[str], activity: str) -> str:
    try:
        completed = subprocess.run(
            arguments,
            check=False,
            capture_output=True,
            timeout=180,
        )
    except (OSError, subprocess.TimeoutExpired) as exc:
        raise OcrReportError(f"OCR dependency failed while {activity}: {exc}") from exc
    stdout = completed.stdout.decode("utf-8", errors="replace")
    stderr = completed.stderr.decode("utf-8", errors="replace").strip()
    if completed.returncode != 0:
        raise OcrReportError(f"OCR dependency failed while {activity}: {stderr or completed.returncode}")
    return stdout

