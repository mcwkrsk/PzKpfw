"""Только чтение, explicitly labelled exports of the observed primary-model structure."""
from __future__ import annotations
from .i18n import tr, get_language, get_language_info

import csv
import html
import io
from pathlib import Path
from xml.sax.saxutils import escape, quoteattr

from .gui_models import action_tree_rows, action_diagram_layout
from .specifications import form_html

TYPE_LABEL_KEYS = {'0': 'Элементарное', '1': 'Альтернатива', '2': 'Последовательность', '3': 'Цикл'}
TYPE_LABELS = {key: tr(message) for key, message in TYPE_LABEL_KEYS.items()}

def _type_label(code):
    return tr(TYPE_LABEL_KEYS.get(code, 'Неизвестный'))


def _esc(value):
    return html.escape('' if value is None else str(value), quote=True)


def export_report(doc):
    """Printable report of raw fields; not a reconstruction of native specifications."""
    rows = action_tree_rows(doc)
    nodes = {n.get('id', ''): n for n in doc.actions}
    issues = doc.validate()
    parts = ['<!doctype html><html lang="' + _esc(get_language().split('_', 1)[0]) + '" dir="' + get_language_info().direction + '"><head><meta charset="utf-8">',
             '<title>' + tr('Обзор проекта ИС-2') + '</title><style>body{font:14px Arial,sans-serif;margin:2em;color:#222}'
             'table{border-collapse:collapse;width:100%;margin:1em 0}th,td{border:1px solid #888;padding:5px;text-align:left}'
             'th{background:#eee}h2{margin-top:2em} .note{background:#fff5dc;padding:1em}'
             '@media print{body{margin:1cm}tr{break-inside:avoid}}</style></head><body>',
             '<h1>' + tr('Обзор проекта ИС-2') + '</h1>',
             '<p class="note">' + tr('Справочный отчёт PzKpfw по прочитанным XML-данным.') + ' ' +
             tr('Не является оригинальной спецификацией ИС-2; не все поля и связи интерпретированы.') + '</p>',
             '<h2>' + tr('Паспорт') + '</h2><p>' + tr('Название:') + ' ' + _esc(doc.root.get('name')) + '</p>',
             '<p>' + tr('Действий: {actions}; параметров: {parameters}; объектов: {objects}').format(
                 actions=len(doc.actions), parameters=len(doc.params_node), objects=len(doc.objects_node)) + '</p>',
             '<h2>' + tr('Декомпозиция') + '</h2><table><thead><tr>' + ''.join('<th>' + tr(label) + '</th>' for label in ('ID', 'Родитель', 'Уровень дерева', 'Название', 'Тип', 'Статус (код)', 'Формализация (код)')) + '</tr></thead><tbody>']
    for row in rows:
        n = nodes[row.action_id]
        code = n.get('type', '')
        vals = [row.action_id, row.parent_id, row.depth, n.get('name', ''),
                _type_label(code) + ' (' + code + ')' , n.get('status', ''), n.get('formalization', '')]
        parts.append('<tr>' + ''.join('<td>' + _esc(v) + '</td>' for v in vals) + '</tr>')
    parts.append('</tbody></table>')
    parts.append('<h2>' + tr('Карточки действий') + '</h2>')
    for row in rows:
        node = nodes[row.action_id]
        parts.append('<h3>ID ' + _esc(row.action_id) + ': ' + _esc(node.get('name')) + '</h3>')
        parts.append('<p>' + tr('Атрибуты XML:') + ' ' + _esc('; '.join(f'{k}={v}' for k, v in node.attrib.items())) + '</p>')
        alternatives = [alt.get('text', '') for alt in node.findall('alts')]
        if alternatives:
            parts.append('<p>' + tr('Подписи альтернатив:') + ' ' + _esc('; '.join(alternatives)) + '</p>')
    for title, collection in [(tr('Параметры'), doc.params_node), (tr('Объекты'), doc.objects_node)]:
        parts.append('<h2>' + title + '</h2><table><tr>' + ''.join('<th>' + tr(label) + '</th>' for label in ('ID', 'Название', 'Атрибуты XML')) + '</tr>')
        for node in collection:
            if not isinstance(node.tag, str):
                continue
            attrs = '; '.join(f'{k}={v}' for k, v in node.attrib.items() if k not in ('id', 'name'))
            parts.append('<tr>' + ''.join('<td>' + _esc(v) + '</td>' for v in (node.get('id'), node.get('name'), attrs)) + '</tr>')
        parts.append('</table>')
    parts.append('<h2>' + tr('Проверка структуры') + '</h2>')
    parts.append('<ul>' + ''.join('<li>' + _esc(x) + '</li>' for x in issues) + '</ul>' if issues else '<p>' + tr('Замечаний реализованной проверки нет.') + '</p>')
    parts.append('</body></html>')
    return '\n'.join(parts)


def _csv_text(value):
    text = str(value or "")
    # Spreadsheet applications may execute cells starting with formula markers.
    return "'" + text if text.lstrip(" \t\r\n").startswith(("=", "+", "-", "@")) else text


def export_matrix_csv(doc):
    """Sparse relation table avoids quadratic allocations for large models."""
    nodes = {n.get('id', ''): n for n in doc.actions}
    stream = io.StringIO(newline='')
    writer = csv.writer(stream, lineterminator='\n')
    writer.writerow([tr(label) for label in ('вид связи', 'ID источника', 'источник', 'ID назначения', 'назначение')])
    for link in doc.links:
        typ = link.get('type')
        if typ == '2':
            a, b, label = link.get('afe1', ''), link.get('afe2', ''), tr('состав')
        elif typ == '3' and link.get('afe3', '') not in ('', '0'):
            a, b, label = link.get('afe2', ''), link.get('afe3', ''), tr('порядок соседей')
        else:
            continue
        writer.writerow([_csv_text(v) for v in (label, a, nodes[a].get('name', '') if a in nodes else '', b, nodes[b].get('name', '') if b in nodes else '')])
    return stream.getvalue()


def export_primary_matrix_csv(doc):
    """Export *every* primaryModel/matrix XML row, including opaque records.

    This is a lossless *inspection projection* of serialized attributes (not a
    writer or a claim about native matrix presentation). Preserve raw codes
    alongside decoded markers; prevent spreadsheet formula injection.
    """
    stream = io.StringIO(newline='')
    writer = csv.writer(stream, lineterminator='\n')
    writer.writerow(['row', 'XML tag', 'type', 'action e1', 'action name',
                     'parameter e2', 'parameter name', 'char raw', 'marker',
                     'power', 'extra attributes', 'status'])
    actions = {a.get('id'): a.get('name', '') for a in doc.actions}
    params = {p.get('id'): p.get('name', '') for p in doc.params_node.findall('param')}
    matrix = doc.root.find('models/primaryModel/matrix')
    if matrix is None:
        return stream.getvalue()
    for idx, node in enumerate(matrix):
        if not isinstance(node.tag, str):
            continue
        raw = node.get('char', '')
        try:
            num = int(raw)
            symbol = chr(num) if 32 <= num <= 126 else f'code {num}'
        except (ValueError, OverflowError):
            symbol = f'unknown {raw}'
        a, p = node.get('e1', ''), node.get('e2', '')
        native_shape = node.tag == 'AElement' and node.get('type') == '4' and a in actions and p in params
        raw_attrs = sorted((k, v) for k, v in node.attrib.items()
                           if k not in ('id', 'name', 'type', 'e1', 'e2', 'char', 'power'))
        values = [idx, node.tag, node.get('type', ''), a, actions.get(a, ''),
                  p, params.get(p, ''), raw, symbol, node.get('power', ''),
                  repr(raw_attrs), 'recognised_shape' if native_shape else 'opaque_or_invalid']
        writer.writerow([_csv_text(value) for value in values])
    return stream.getvalue()


def export_composition_matrix(doc):
    """Direct type-2 composition adjacency, not the original IS-2 matrix."""
    rows = action_tree_rows(doc)
    if len(rows) > 1000:
        raise ValueError(tr('Матрица ограничена 1000 действиями; используйте таблицу связей CSV'))
    ids = [row.action_id for row in rows]
    edges = {(l.get('afe1', ''), l.get('afe2', '')) for l in doc.links if l.get('type') == '2'}
    stream = io.StringIO(newline='')
    writer = csv.writer(stream, lineterminator='\n')
    writer.writerow(['ID родителя / ID потомка'] + [_csv_text(x) for x in ids])
    for a in ids:
        writer.writerow([_csv_text(a)] + [('1' if (a, b) in edges else '0') for b in ids])
    return stream.getvalue()


def export_diagram_svg(doc):
    rows, pos, composition, sequence = action_diagram_layout(doc)
    width = max((x for x, y in pos.values()), default=0) + 270
    height = max((y for x, y in pos.values()), default=0) + 160
    width, height = max(width, 400), max(height, 200)
    nodes = {n.get('id', ''): n for n in doc.actions}
    lines = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
             '<title>' + tr('Схема состава и порядка действий') + '</title>',
             '<desc>' + tr('Справочная схема PzKpfw; обозначения не воспроизводят диаграмму оригинальной ИС-2.') + '</desc>',
             '<defs><marker id="arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto"><path d="M0,0 L8,4 L0,8 Z" fill="#334155"/></marker></defs>',
             f'<rect width="{width}" height="{height}" fill="white"/>',
             '<text x="20" y="25" font-family="sans-serif" font-size="13">' + tr('Состав — сплошная линия; порядок соседей — пунктир') + '</text>']
    for edges, dashed in ((composition, False), (sequence, True)):
        for a, b in edges:
            ax, ay = pos[a]; bx, by = pos[b]
            x1, y1, x2, y2 = (ax+190, ay+31, bx, by+31) if not dashed else (ax+95, ay+62, bx+95, by)
            dash = ' stroke-dasharray="6 4"' if dashed else ''
            lines.append(f'<line x1="{x1}" y1="{y1}" x2="{x2}" y2="{y2}" stroke="#334155" stroke-width="2"{dash} marker-end="url(#arrow)"/>')
    for row in rows:
        x, y = pos[row.action_id]; node = nodes[row.action_id]
        title = node.get('name', '') or tr('(без названия)')
        # SVG text is clipped to its box rather than being allowed to overlap neighbours.
        clip = 'clip' + str(len(lines))
        lines.append(f'<clipPath id="{clip}"><rect x="{x+5}" y="{y+4}" width="180" height="32"/></clipPath>')
        lines.append(f'<rect x="{x}" y="{y}" width="190" height="62" rx="4" fill="#f8fafc" stroke="#475569"/>')
        lines.append(f'<text x="{x+8}" y="{y+21}" font-family="sans-serif" font-size="12" clip-path="url(#{clip})">{escape(title)}</text>')
        label = f"ID {row.action_id} · {_type_label(node.get('type', '')) if node.get('type', '') in TYPE_LABEL_KEYS else tr('тип {type}').format(type=node.get('type', '?'))}"
        lines.append(f'<text x="{x+8}" y="{y+48}" font-family="sans-serif" font-size="10">{escape(label)}</text>')
    lines.append('</svg>')
    return '\n'.join(lines)


def write_export(doc, destination, kind, *, source_path=None, overwrite=False):
    """Never replace source project; callers must opt in to replacing output."""
    path = Path(destination)
    if source_path and (path.resolve() == Path(source_path).resolve() or
                        (path.exists() and Path(source_path).exists() and path.samefile(source_path))):
        raise ValueError(tr('Нельзя сохранять экспорт поверх проекта .is2'))
    if path.exists() and not overwrite:
        raise ValueError(tr('Файл экспорта уже существует'))
    generators = {'report': export_report, 'relations': export_matrix_csv, 'diagram': export_diagram_svg, 'matrix': export_composition_matrix, 'primary-matrix': export_primary_matrix_csv, 'specifications': form_html}
    payload = generators[kind](doc)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(payload, encoding='utf-8-sig' if kind in ('relations', 'matrix', 'primary-matrix') else 'utf-8', newline='')
    return path
