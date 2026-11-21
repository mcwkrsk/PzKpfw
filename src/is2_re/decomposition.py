"""Conservative XML-level action transformations based on observed AFStructure APIs.

These commands reproduce observed *structural* effects, not an ABI-compatible
implementation of native codeStructure() or all Qt widget branches.  Every edit
runs on a clone first; a rejected transformation leaves the document intact.
"""
from __future__ import annotations

from .document import ProjectDocument
from .i18n import tr

# Numeric enum assignments established by the supplied native code analysis.
CONVERSIONS = {
    'elementary': ('0', '0', '0', 0),
    'alternative': ('1', '1', '0', 2),
    'sequence': ('2', '1', '2', 2),
    'iteration': ('3', '1', '0', 1),
}


def _commit(doc: ProjectDocument, staged: ProjectDocument) -> None:
    issues = staged.validate(deep=True)
    if issues:
        raise ValueError('conversion would produce an invalid model: ' + '; '.join(issues))
    # Validate the serializer as well as the in-memory model before committing.
    p = staged.serialization_preflight()
    if not (p['semantic_preserved'] and p['writer_idempotent'] and not p['validation_issues']):
        raise ValueError('serialization preflight failed')
    doc.root = staged.root


def _remove_content_links(doc: ProjectDocument, action_id: str, *, allow: bool) -> int:
    node = doc.root.find('models/ConceptModel/content')
    if node is None:
        return 0
    matches = [n for n in node if n.get('e1') == action_id]
    if matches and not allow:
        raise ValueError('action has ConceptModel/content links; pass drop_content=True to remove them')
    if any(not isinstance(n.tag, str) or n.tag != 'AElement' or n.get('e1') is None or n.get('e2') is None for n in node):
        raise ValueError('opaque ConceptModel/content records: conversion refused')
    if allow:
        for n in matches:
            node.remove(n)
    return len(matches) if allow else 0


def _guard_matrix_for_non_elementary(doc: ProjectDocument, action_id: str) -> None:
    matrix = doc.root.find('models/primaryModel/matrix')
    if matrix is not None and any(n.get('e1') == action_id for n in matrix):
        raise ValueError('action has primaryModel/matrix links; remove them explicitly before converting')


def convert_action(
    doc: ProjectDocument, action_id: str | int, kind: str, *,
    replace_children: bool = False, drop_content: bool = False,
    child_names: list[str] | None = None,
) -> dict[str, object]:
    """Change an action structure with native-observed type/status/formalization.

    Composite conversions create two children (alternative, sequence) or one
    (iteration). Native child naming, symbolic coding and number redistribution
    remain unknown: auto-generated children intentionally have no invented code.
    Destructive operations require independent explicit opt-ins.
    """
    if kind not in CONVERSIONS:
        raise ValueError(f'unknown conversion {kind!r}; expected one of {list(CONVERSIONS)}')
    ident = str(action_id)
    typ, status, formalization, count = CONVERSIONS[kind]
    if child_names is not None and (len(child_names) != count or any(not name.strip() for name in child_names)):
        raise ValueError(f'{kind} requires {count} nonempty child names')
    staged = doc.clone()
    node = staged.action(ident)
    children = staged.sibling_order(ident)
    if children and not replace_children:
        raise ValueError('action already has children; replacement requires replace_children=True')
    if count:
        _guard_matrix_for_non_elementary(staged, ident)
    removed_content = _remove_content_links(staged, ident, allow=drop_content)
    if children:
        for child in list(children):
            staged.delete_action(child, cascade=True, cascade_content=drop_content)
    node.set('type', typ)
    node.set('status', status)
    node.set('formalization', formalization)
    added = []
    for index in range(count):
        name = child_names[index] if child_names is not None else tr('Новое действие {index}').format(index=index + 1)
        added.append(staged.add_action(name, action_type='0', status='0', formalization='0', parent_id=ident))
    _commit(doc, staged)
    return {
        'action_id': ident, 'target': kind, 'created_child_ids': added,
        'removed_children': children, 'removed_content_links': removed_content,
        'original_code_structure_recalculation': 'NOT_IMPLEMENTED',
        'native_runtime_acceptance': 'NOT_TESTED',
    }


def insert_sibling(
    doc: ProjectDocument, anchor_id: str | int, *, after: bool,
    name: str, action_type: str = '0',
) -> dict[str, str]:
    """Insert an action before/after a sibling in the observed type-3 chain."""
    if not name.strip():
        raise ValueError('new action name must not be empty')
    ident = str(anchor_id)
    staged = doc.clone()
    staged.action(ident)
    parents = [n.get('afe1') for n in staged.links if n.get('type') == '2' and n.get('afe2') == ident]
    if len(parents) != 1:
        raise ValueError('only actions with exactly one composition parent can be inserted alongside')
    parent = parents[0]
    original_order = staged.sibling_order(parent)
    if ident not in original_order:
        raise ValueError('anchor is missing from arrangement chain')
    new_id = staged.add_action(name, action_type=action_type, parent_id=parent)
    ordered = list(original_order)
    ordered.insert(original_order.index(ident) + (1 if after else 0), new_id)
    staged.reorder_children(parent, ordered)
    _commit(doc, staged)
    return {'created_action_id': new_id, 'anchor_id': ident,
            'parent_id': parent, 'placement': 'after' if after else 'before',
            'original_code_structure_recalculation': 'NOT_IMPLEMENTED'}
