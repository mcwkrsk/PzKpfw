"""Editable coursework report generated from the current project, without changing it."""
from __future__ import annotations

from dataclasses import dataclass
from io import BytesIO
from pathlib import Path
import math
import os
import tempfile
from datetime import date

from .decomposition_view import primitives
from .gui_models import action_tree_rows
from .matrix_view import grouped_matrix
from .specifications import FORM_NAMES, action_code, project_forms


@dataclass(frozen=True)
class ReportOptions:
    author: str = ''
    group: str = 'ИДБ-24-17'
    topic: str = ''
    diagrams: bool = True
    forms: bool = True
    matrix: bool = True
    placeholders: bool = True


def _dependencies():
    try:
        import docx
        from PIL import Image, ImageDraw, ImageFont
    except ImportError as exc:
        raise RuntimeError('Для экспорта DOCX установите зависимости: python -m pip install -r requirements.txt') from exc
    return docx, Image, ImageDraw, ImageFont


def _font(ImageFont, size):
    candidates = [Path(os.environ.get('WINDIR', 'C:/Windows')) / 'Fonts' / 'arial.ttf',
                  Path('/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf'),
                  Path('/System/Library/Fonts/Supplemental/Arial.ttf')]
    for path in candidates:
        if path.is_file():
            return ImageFont.truetype(str(path), size=size)
    try:
        return ImageFont.truetype('arial.ttf', size=size)
    except OSError as exc:
        raise RuntimeError('Не найден шрифт с поддержкой кириллицы для схем.') from exc


def _tile_ranges(extent, limit, intervals):
    """Prefer cuts in spaces between blocks; split a block only if unavoidable."""
    result = []
    start = 0
    while start < extent:
        target = min(extent, start + limit)
        if target == extent:
            result.append((start, extent))
            break
        candidates = {target}
        candidates.update(int(left) - 3 for left, _right in intervals if start < left <= target)
        candidates.update(math.ceil(right) + 3 for _left, right in intervals if start < right < target)
        safe = [cut for cut in candidates if start < cut <= target and
                not any(left - 2 < cut < right + 2 for left, right in intervals)]
        cut = max(safe) if safe else target
        result.append((start, cut))
        start = cut
    return result


def diagram_tiles(doc, focus, *, max_width=1300, max_height=1450):
    """Rasterize the application's own primitives in bounded tiles, not a screenshot."""
    _, Image, ImageDraw, ImageFont = _dependencies()
    ops, width, height = primitives(doc, focus)
    width, height = max(1, math.ceil(width)), max(1, math.ceil(height))
    rectangles = [op for op in ops if op[0] == 'rect']
    x_ranges = _tile_ranges(width, max_width, [(x, x+w) for _,x,y,w,h,_ in rectangles])
    y_ranges = _tile_ranges(height, max_height, [(y, y+h) for _,x,y,w,h,_ in rectangles])
    nx, ny = len(x_ranges), len(y_ranges)
    if nx * ny > 100:
        raise ValueError('Схема слишком большая для отчёта. Выключите диаграммы в настройках экспорта.')
    fonts = {}
    for ty, (oy, bottom) in enumerate(y_ranges):
        for tx, (ox, right) in enumerate(x_ranges):
            tw, th = right - ox, bottom - oy
            image = Image.new('RGB', (tw, th), 'white')
            draw = ImageDraw.Draw(image)
            for op in ops:
                if op[0] == 'rect':
                    _, x, y, w, h, _ = op
                    draw.rectangle((x-ox, y-oy, x+w-ox, y+h-oy), outline='black', width=2)
                elif op[0] == 'path':
                    _, points, arrow = op
                    points = [(x-ox, y-oy) for x, y in points]
                    if len(points) < 2: continue
                    draw.line(points, fill='black', width=2)
                    if arrow:
                        (x1, y1), (x2, y2) = points[-2:]
                        angle = math.atan2(y2-y1, x2-x1)
                        triangle = [(x2, y2)] + [(x2-10*math.cos(angle+d), y2-10*math.sin(angle+d)) for d in (-.45, .45)]
                        draw.polygon(triangle, fill='black')
                elif op[0] == 'text':
                    _, x, y, value, size, anchor = op
                    if not value: continue
                    containing = [w for _,rx,ry,w,h,_ in rectangles if rx < x < rx+w and ry < y < ry+h]
                    if containing:
                        max_text_width = min(containing) - 16
                        while size > 8:
                            if size not in fonts:
                                fonts[size] = _font(ImageFont, int(size))
                            if fonts[size].getlength(str(value)) <= max_text_width:
                                break
                            size -= 1
                    if size not in fonts:
                        fonts[size] = _font(ImageFont, int(size))
                    font = fonts[size]
                    draw.text((x-ox, y-oy), str(value), font=font, fill='black',
                              anchor='mm' if anchor == 'middle' else 'lm')
            stream = BytesIO()
            image.save(stream, format='PNG')
            stream.seek(0)
            yield stream, (tx + 1, ty + 1, nx, ny, tw, th)


def _style_document(document):
    from docx.shared import Cm, Pt, RGBColor
    from docx.oxml.ns import qn
    sec = document.sections[0]
    sec.page_width, sec.page_height = Cm(21), Cm(29.7)
    sec.left_margin, sec.right_margin = Cm(3), Cm(1.5)
    sec.top_margin = sec.bottom_margin = Cm(2)
    normal = document.styles['Normal']
    normal.font.name = 'Times New Roman'
    normal.font.size = Pt(12)
    normal._element.rPr.rFonts.set(qn('w:eastAsia'), 'Times New Roman')
    normal.paragraph_format.space_after = Pt(3)
    for name in ('Heading 1', 'Heading 2'):
        style = document.styles[name]
        style.font.name = 'Times New Roman'
        style.font.color.rgb = RGBColor(0, 0, 0)
        style._element.get_or_add_rPr().get_or_add_rFonts().set(qn('w:eastAsia'), 'Times New Roman')


def _table(document, headers, rows, *, font_size=9):
    from docx.shared import Pt
    from docx.oxml import OxmlElement
    from docx.oxml.ns import qn
    table = document.add_table(rows=1, cols=len(headers))
    table.style = 'Table Grid'
    table.autofit = True
    repeat = OxmlElement('w:tblHeader')
    repeat.set(qn('w:val'), 'true')
    table.rows[0]._tr.get_or_add_trPr().append(repeat)
    for cell, value in zip(table.rows[0].cells, headers):
        cell.text = str(value)
        for run in cell.paragraphs[0].runs: run.bold = True
    for row in rows:
        cells = table.add_row().cells
        for cell, value in zip(cells, row):
            cell.text = str(value or '')
    for row in table.rows:
        for cell in row.cells:
            for paragraph in cell.paragraphs:
                paragraph.paragraph_format.space_after = Pt(0)
                for run in paragraph.runs: run.font.size = Pt(font_size)
    return table


def create_report(doc, options=ReportOptions()):
    """Build a Word document from in-memory model projections; does not write the .is2."""
    docx, _, _, _ = _dependencies()
    from docx.enum.text import WD_ALIGN_PARAGRAPH
    from docx.shared import Cm, Pt
    document = docx.Document()
    _style_document(document)
    def center(text, size=12, bold=False):
        para = document.add_paragraph()
        para.alignment = WD_ALIGN_PARAGRAPH.CENTER
        run = para.add_run(text)
        run.bold, run.font.size = bold, Pt(size)
        return para
    center('МИНОБРНАУКИ РОССИИ')
    center('ФГАОУ ВО «МГТУ «СТАНКИН»')
    center('Институт информационных технологий')
    for _ in range(4): document.add_paragraph()
    center('ОТЧЁТ О ВЫПОЛНЕНИИ', 16, True)
    center('КУРСОВОЙ РАБОТЫ', 16, True)
    center('ПО ДИСЦИПЛИНЕ «БАЗЫ ДАННЫХ»', 13, True)
    document.add_paragraph()
    center('Студент: ' + (options.author.strip() or '________________________________'))
    center('Группа: ' + options.group.strip())
    document.add_paragraph()
    center('НА ТЕМУ', 12, True)
    center(options.topic.strip() or doc.root.get('name', '') or '________________________________', 13, True)
    for _ in range(5): document.add_paragraph()
    center(f'МОСКВА {date.today().year}')
    document.add_page_break()
    section = 0
    def heading(title):
        nonlocal section
        section += 1
        document.add_heading(f'{section}. {title}', level=1)
    if options.diagrams:
        heading('Функциональная диаграмма (декомпозиция)')
        parent_ids = {link.get('afe1', '') for link in doc.links if link.get('type') == '2'}
        actions = {node.get('id', ''): node for node in doc.actions}
        sheets = [None] + [row.action_id for row in action_tree_rows(doc) if row.action_id in parent_ids]
        for ident in sheets:
            label = 'Полная диаграмма' if ident is None else f'Лист {action_code(actions[ident])}: {actions[ident].get("name", "")}'
            document.add_paragraph(label, style='Heading 2')
            for image, (x, y, nx, ny, tw, th) in diagram_tiles(doc, ident):
                if nx * ny > 1: document.add_paragraph(f'Часть {y}.{x} из {ny} × {nx}')
                scale_width = 15.8 * tw / 1300 if nx > 1 else 15.8
                document.add_picture(image, width=Cm(min(scale_width, 23 * tw / th)))
    forms, warnings = project_forms(doc)
    if options.forms:
        for key in ('A', 'B', 'D', 'D1', 'D2'):
            if key == 'D' and options.placeholders:
                heading('Форма C: классификация информации')
                document.add_paragraph('Заполните по материалам работы и требованиям преподавателя.')
            heading(FORM_NAMES[key])
            headers, rows = forms[key]
            if rows: _table(document, headers, rows)
            else: document.add_paragraph('Данные для формы отсутствуют.')
    if options.matrix:
        heading('Матричная диаграмма')
        document.add_paragraph('Структурные обозначения рассчитаны по данным проекта; проверьте их соответствие ИС-2.')
        headers, rows, _, matrix_warnings = grouped_matrix(doc)
        if not rows or len(headers) <= 2:
            document.add_paragraph('Матрица пуста или слишком велика для отображения. Проверьте проект и экспорт CSV.')
        else:
            for start in range(2, len(headers), 6):
                indices = list(range(start, min(start + 6, len(headers))))
                document.add_paragraph(f'Параметры {start-1}–{indices[-1]-1}')
                _table(document, headers[:2] + [headers[i] for i in indices],
                       [row[:2] + [row[i] for i in indices] for row in rows], font_size=8)
    if options.placeholders:
        heading('Схема данных')
        document.add_paragraph('Связь объектов и параметров проекта. Схему базы данных дополните вручную.')
        if forms['D1'][1]:
            _table(document, forms['D1'][0], forms['D1'][1])
        else:
            document.add_paragraph('Объекты и параметры в проекте не заданы.')
        for title, body in (
            ('Описание таблиц постоянной информации', 'Добавьте необходимые таблицы из исходных данных.'),
            ('Программная реализация', 'Добавьте описание реализации и её изображения.'),
            ('Приложение', 'Добавьте необходимые материалы.'),
        ):
            heading(title)
            document.add_paragraph(body)
    return document


def write_docx_report(doc, destination, options=ReportOptions(), *, source_path=None):
    destination = Path(destination)
    if source_path and (destination.resolve() == Path(source_path).resolve() or
                        (destination.exists() and Path(source_path).exists() and destination.samefile(source_path))):
        raise ValueError('Нельзя сохранять отчёт поверх проекта .is2')
    document = create_report(doc, options)
    destination.parent.mkdir(parents=True, exist_ok=True)
    tmp = None
    try:
        with tempfile.NamedTemporaryFile(prefix='.pzk-report-', suffix='.docx', dir=destination.parent, delete=False) as stream:
            tmp = Path(stream.name)
            document.save(stream)
        os.replace(tmp, destination)
    finally:
        if tmp is not None and tmp.exists(): tmp.unlink()
    return destination
