"""Coursework workspace: reversible XML edits, presentation-only diagrams and checks.

The UI designs are based on user-provided IS-2 screenshots, not a claim that
we recovered the original layout / codeStructure implementation.
"""
from __future__ import annotations

from dataclasses import dataclass
from html import escape
from collections import defaultdict
import textwrap

from .document import ProjectDocument
from .i18n import tr, available_languages, get_language_info
from .gui_models import action_tree_rows
from .specifications import action_code, project_forms


@dataclass(frozen=True)
class CourseNode:
    ident: str
    code: str
    title: str
    kind: str
    x: float
    y: float
    depth: int


@dataclass(frozen=True)
class CourseEdge:
    source: str
    target: str
    kind: str


@dataclass(frozen=True)
class CourseScene:
    nodes: tuple[CourseNode, ...]
    edges: tuple[CourseEdge, ...]
    width: int
    height: int
    node_width: int = 186
    node_height: int = 76
    column_width: int = 215
    row_height: int = 150


def create_course_project(name: str, root_title: str, *, author: str = '', symbol: str = 'z') -> ProjectDocument:
    """A minimal editable course scaffold; does not invent native ModuleParams."""
    if not root_title.strip():
        raise ValueError(tr('Укажите название основной работы'))
    if len(symbol) != 1 or not symbol.isprintable() or symbol.isspace():
        raise ValueError(tr('Обозначение должно состоять из одного печатного символа'))
    doc = ProjectDocument.new_empty(name, user_name=author)
    doc.add_action(root_title.strip(), action_type='2', status='1', formalization='2',
                   symbol=str(ord(symbol)), level=1, number=1)
    return doc


def renumber_structure(doc: ProjectDocument, *, symbol: str = 'z') -> dict[str, object]:
    """Explicit PzKpfw code assignment: global numbering within each tree depth.

    Kept separate from ordinary save / editing. Existing action IDs and all links
    remain unchanged. This is NOT the original native codeStructure() algorithm.
    """
    if len(symbol) != 1 or not symbol.isprintable() or symbol.isspace():
        raise ValueError(tr('Необходим один печатный символ'))
    staged = doc.clone()
    before = staged.validate(deep=True)
    if before:
        raise ValueError(tr('Нельзя перенумеровать некорректный проект: {issues}').format(issues='; '.join(before)))
    rows = action_tree_rows(staged)
    counters: dict[int, int] = defaultdict(int)
    changes = []
    for row in rows:
        level = row.depth + 1
        counters[level] += 1
        n = staged.action(row.action_id)
        previous = (n.get('symbol'), n.get('level'), n.get('number'))
        values = (str(ord(symbol)), str(level), str(counters[level]))
        n.set('symbol', values[0]); n.set('level', values[1]); n.set('number', values[2])
        if previous != values:
            changes.append({'id': row.action_id, 'old': previous, 'code': action_code(n)})
    preflight = staged.serialization_preflight()
    if not (preflight['semantic_preserved'] and preflight['writer_idempotent'] and not preflight['validation_issues']):
        raise ValueError(tr('После перенумерации не прошла проверка записи'))
    doc.root = staged.root
    return {'reassigned': changes, 'action_count': len(rows),
            'algorithm': 'PzKpfw depth-global sequential numbering; NOT native codeStructure()'}


def course_checklist(doc: ProjectDocument) -> dict[str, object]:
    """Pragmatic completeness advisory, not a university's assessment rubric."""
    issues = doc.validate(deep=True)
    actions = list(doc.actions)
    params = doc.params_node.findall('param')
    objects = doc.objects_node.findall('object')
    missing_codes = [n.get('id', '?') for n in actions if action_code(n).startswith('ID ')]
    missing_names = [n.get('id', '?') for n in actions if not n.get('name', '').strip()]
    no_children = [n.get('id', '?') for n in actions if n.get('type') != '0' and not doc.composition_children(n.get('id', ''))]
    placeholder_prefixes = {'новое действие'}
    for language in available_languages():
        localized = get_language_info(language.locale).messages.get('Новое действие {index}', '')
        if isinstance(localized, str) and '{index}' in localized:
            prefix = localized.split('{index}', 1)[0].strip().casefold()
            if prefix:
                placeholder_prefixes.add(prefix)
    placeholders = [n.get('id', '?') for n in actions
                    if any(n.get('name', '').casefold().startswith(prefix) for prefix in placeholder_prefixes)]
    forms, form_warnings = project_forms(doc)
    result = {
        'name': doc.root.get('name', ''), 'actions': len(actions),
        'elementary_actions': sum(n.get('type') == '0' for n in actions),
        'parameters': len(params), 'objects': len(objects),
        'form_rows': {key: len(rows) for key, (_, rows) in forms.items()},
        'errors': issues, 'missing_codes': missing_codes, 'missing_names': missing_names,
        'empty_composite_actions': no_children, 'placeholder_actions': placeholders,
        'form_warnings': form_warnings,
        'remarks': [
            tr('Соответствие методическим указаниям и требованиям преподавателя проверяется отдельно.'),
            tr('Точное соответствие оригинальной ИС-2 не подтверждено испытанием в Windows.'),
            tr('Нумерация PzKpfw — отдельная явная команда, а не восстановленный native codeStructure().'),
        ],
    }
    return result


def build_course_scene(doc: ProjectDocument, focus: str | None = None, *, max_depth: int | None = None) -> CourseScene:
    """Tidy hierarchy with sequence rails. Focus selects an entire subtree."""
    nodes_by_id = {n.get('id', ''): n for n in doc.actions}
    if focus is not None:
        doc.action(focus)
    parent_of = {}
    children = {}
    for link in doc.links:
        if link.get('type') == '2':
            parent_of[link.get('afe2', '')] = link.get('afe1', '')
    # Leaves without any arrangement or composition links have no children.
    # Avoid scanning the entire link table once per leaf.
    parents_with_links = {link.get('afe1', '') for link in doc.links
                          if link.get('type') in ('2', '3')}
    for ident in nodes_by_id:
        if ident not in parents_with_links:
            children[ident] = []
            continue
        try:
            children[ident] = doc.sibling_order(ident)
        except (ValueError, KeyError):
            children[ident] = [n.get('afe2', '') for n in doc.links if n.get('type') == '2' and n.get('afe1') == ident]
    if focus is not None:
        roots = [focus]
    else:
        roots = [ident for ident in nodes_by_id if ident not in parent_of]
        if not roots and nodes_by_id:
            roots = list(nodes_by_id)
    positions = {}
    emitted = set()
    edges: list[CourseEdge] = []
    slot = 0

    def allocate(ident: str, depth: int, ancestry: frozenset[str], branch_preview: bool = False):
        nonlocal slot
        if ident in emitted or ident not in nodes_by_id or ident in ancestry:
            return None
        emitted.add(ident)
        # At the depth boundary show the immediate real children of an
        # alternative, so its two exits do not disappear from the overview.
        at_alternative_boundary = (max_depth is not None and depth == max_depth
                                   and nodes_by_id[ident].get('type') == '1')
        kids = children.get(ident, []) if not branch_preview and (max_depth is None or depth < max_depth or at_alternative_boundary) else []
        children_x = []
        for child in kids:
            x = allocate(child, depth + 1, ancestry | {ident}, at_alternative_boundary)
            if x is not None:
                children_x.append(x)
                edges.append(CourseEdge(ident, child, nodes_by_id[ident].get('type', '')))
        if children_x:
            x = (children_x[0] + children_x[-1]) / 2
        else:
            x = slot * 215 + 30
            slot += 1
        positions[ident] = (x, depth * 150 + 44, depth)
        return x

    # Track the whole reachable component independently of the visual depth
    # limit. Descendants intentionally hidden beyond max_depth must never be
    # mistaken for disconnected roots and drawn in the top row.
    covered = set()
    def cover_component(root):
        pending = [root]
        while pending:
            ident = pending.pop()
            if ident in covered or ident not in nodes_by_id:
                continue
            covered.add(ident)
            pending.extend(children.get(ident, ()))

    for root in roots:
        allocate(root, 0, frozenset())
        cover_component(root)
    if focus is None:
        for ident in nodes_by_id:
            if ident not in covered:
                allocate(ident, 0, frozenset())
                cover_component(ident)
    rendered = tuple(
        CourseNode(ident, action_code(n), n.get('name', ''), n.get('type', '0'), *positions[ident])
        for ident, n in nodes_by_id.items() if ident in positions
    )
    width = max(800, int(max((n.x + 215 for n in rendered), default=800)))
    height = max(550, int(max((n.y + 160 for n in rendered), default=400)))
    return CourseScene(rendered, tuple(edges), width, height)


def edge_paths(scene: CourseScene):
    """Return orthogonal paths; alternative exits originate in their own cells."""
    by_id = {node.ident: node for node in scene.nodes}
    groups = defaultdict(list)
    for edge in scene.edges:
        if edge.source in by_id and edge.target in by_id:
            groups[edge.source].append(edge)
    for parent_id, edges in groups.items():
        parent = by_id[parent_id]
        edges.sort(key=lambda edge: by_id[edge.target].x)
        for index, edge in enumerate(edges):
            child = by_id[edge.target]
            # Exactly two cells are visible; additional branches use the last
            # cell rather than inventing extra conditions.
            fraction = (0.25 if index == 0 else 0.75) if parent.kind == '1' else 0.5
            x1, y1 = parent.x + scene.node_width * fraction, parent.y + scene.node_height
            x2, y2 = child.x + scene.node_width / 2, child.y
            mid = (y1 + y2) / 2
            yield edge, (x1, y1, x1, mid, x2, mid, x2, y2)


def _wrapped_lines(value: str, line_width: int = 24, max_lines: int = 3) -> list[str]:
    lines = textwrap.wrap(value or tr('(без названия)'), width=line_width, break_long_words=True, break_on_hyphens=False)
    if len(lines) > max_lines:
        lines = lines[:max_lines]
        lines[-1] = lines[-1].rstrip(' .') + '…'
    return lines


def scene_svg(scene: CourseScene, *, selected: str | None = None, title: str | None = None) -> str:
    """Export a true, resolution-independent SVG (not an image screenshot)."""
    title = title if title is not None else tr('Курсовая — структурная схема')
    w, h = scene.node_width, scene.node_height
    by_id = {node.ident: node for node in scene.nodes}
    lines = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{scene.width}" height="{scene.height}" viewBox="0 0 {scene.width} {scene.height}">',
             f'<title>{escape(title)}</title>',
             '<rect width="100%" height="100%" fill="#fff"/>',
             '<defs><marker id="arrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse"><path d="M0,0 L10,5 L0,10 Z" fill="#555"/></marker></defs>']
    for edge, points in edge_paths(scene):
        x1,y1,_,mid,x2,_,_,y2 = points
        arrow = ' marker-end="url(#arrow)"' if edge.kind == '1' else ''
        lines.append(f'<path d="M{x1:.1f},{y1:.1f} V{mid:.1f} H{x2:.1f} V{y2:.1f}" stroke="#666" stroke-width="1.5" fill="none"{arrow}/>')
    # Sibling order is rendered as a rail for sequences; alternative branch
    # semantics are not automatically interpreted as control flow.
    for parent in scene.nodes:
        related = [by_id[e.target] for e in scene.edges if e.source == parent.ident]
        if len(related) < 2:
            continue
        related.sort(key=lambda n: n.x)
        if parent.kind == '2':
            y = related[0].y + h / 2
            for left, right in zip(related, related[1:]):
                lines.append(f'<line x1="{left.x+w:.1f}" y1="{y:.1f}" x2="{right.x:.1f}" y2="{y:.1f}" stroke="#777" stroke-width="1.2" marker-end="url(#arrow)"/>')
    for node in scene.nodes:
        outline = '#15803d' if node.ident == selected else '#1f2937'
        lines.append(f'<g><rect x="{node.x:.1f}" y="{node.y:.1f}" width="{w}" height="{h}" fill="white" stroke="{outline}" stroke-width="{2 if node.ident == selected else 1.5}"/>')
        if node.kind == '1':
            band_top = node.y+h-16
            lines.append(f'<path d="M{node.x:.1f},{band_top:.1f} h{w} M{node.x+w/2:.1f},{band_top:.1f} v16" stroke="{outline}"/>')
            lines.append(f'<text x="{node.x+w/4:.1f}" y="{node.y+h-4:.1f}" font-family="Arial,sans-serif" font-size="10" text-anchor="middle">1</text>')
            lines.append(f'<text x="{node.x+3*w/4:.1f}" y="{node.y+h-4:.1f}" font-family="Arial,sans-serif" font-size="10" text-anchor="middle">2</text>')
        for index, line in enumerate(_wrapped_lines(node.title, max_lines=2 if node.kind == '1' else 3)):
            lines.append(f'<text x="{node.x+w/2:.1f}" y="{node.y+20+index*15:.1f}" font-family="Arial,sans-serif" font-size="11" text-anchor="middle">{escape(line)}</text>')
        code_y = node.y+h-19 if node.kind == '1' else node.y+h-4
        lines.append(f'<text x="{node.x+w-6:.1f}" y="{code_y:.1f}" text-anchor="end" font-family="Arial,sans-serif" font-size="11" font-weight="bold">{escape(node.code)}</text>')
        lines.append('</g>')
    lines.append('</svg>')
    return '\n'.join(lines)


def set_alternative_labels(doc: ProjectDocument, action_id: str, labels: list[str]) -> None:
    """Edit the known native <alts text='…'/> child nodes of alternative pd.

    Only the simplest native shape is editable. Unknown attributes/children are
    preserved by rejecting the edit rather than reserializing them implicitly.
    """
    import xml.etree.ElementTree as ET
    if len(labels) != 2 or not all(isinstance(x, str) and x.strip() for x in labels):
        raise ValueError(tr('У альтернативы должны быть две непустые подписи'))
    staged = doc.clone()
    target = staged.action(action_id)
    if target.get('type') != '1':
        raise ValueError(tr('Подписи вариантов редактируются только у альтернативы'))
    children = list(target)
    if any(child.tag != 'alts' or set(child.attrib) - {'text'} or len(child) or
           (child.text or '').strip() for child in children):
        raise ValueError(tr('У альтернативы есть непонятные дочерние XML-данные; редактирование запрещено'))
    if len(children) > 2:
        raise ValueError(tr('Неподтверждённая форма альтернативы: более двух вариантов'))
    for child in children:
        target.remove(child)
    for label in labels:
        ET.SubElement(target, 'alts', {'text': label.strip()})
    checks = staged.serialization_preflight()
    if not (checks['semantic_preserved'] and checks['writer_idempotent'] and not checks['validation_issues']):
        raise ValueError(tr('Ошибка проверки формата после изменения вариантов'))
    doc.root = staged.root
