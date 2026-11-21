"""Только чтение, object-grouped matrix projection with cell descriptions."""
from .i18n import tr
from .specifications import project_forms, primary_links, parameter_code, action_code, _sort_number
from .gui_models import action_tree_rows
from collections import defaultdict

def inferred_structural_marks(doc, *, links=None):
    """Conservative visual hints only; never modify XML or claim native parity."""
    actions = {n.get('id',''):n for n in doc.actions}
    if links is None:
        links, _ = primary_links(doc)
    by_action = {}
    for action, param, mark, _ in links:
        by_action.setdefault(action, []).append((param, mark))
    children = {}
    parents_with_links = {link.get('afe1', '') for link in doc.links if link.get('type') in ('2', '3')}
    for ident in actions:
        if ident not in parents_with_links:
            children[ident] = []
            continue
        try: children[ident] = doc.sibling_order(ident)
        except (ValueError, KeyError): children[ident] = []
    def output(ident, seen=frozenset()):
        if ident in seen or ident not in actions:
            return set()
        direct = {p for p,m in by_action.get(ident, ()) if m == '*'}
        if direct: return direct
        kids = children[ident]
        if not kids: return set()
        kind = actions[ident].get('type')
        if kind in ('2','3'):
            return output(kids[-1], seen | {ident})
        if kind == '1':
            branch = [output(k, seen | {ident}) for k in kids]
            return branch[0] if branch and len(branch[0]) == 1 and all(v == branch[0] for v in branch) else set()
        return set()
    def last_leaf(ident, seen=frozenset()):
        if ident in seen or ident not in actions: return None
        kids=children[ident]
        return last_leaf(kids[-1], seen | {ident}) if kids else ident
    marks={}
    def add(a,p,mark):
        marks.setdefault((a,p),set()).add(mark)
    for ident,node in actions.items():
        kids=children[ident]; kind=node.get('type')
        if not kids: continue
        results=output(ident)
        if kind=='2' and len(results)==1:
            param=next(iter(results));add(ident,param,'[');add(kids[-1],param,']')
        elif kind=='1':
            inputs={p for p,m in by_action.get(ident,()) if m=='?'}
            if len(inputs)==1:
                for kid in kids:
                    add(kid,next(iter(inputs)),'/')
                    if actions.get(kid) is not None and actions[kid].get('type') == '0':
                        add(kid,next(iter(inputs)),'.')
            if len(results)==1: add(ident,next(iter(results)),'#')
        elif kind=='3' and len(results)==1:
            param=next(iter(results));add(ident,param,'{')
            end=last_leaf(kids[-1])
            if end is not None: add(end,param,'}')
    return marks

def matrix_context(doc):
    """Build a bounded lookup for one refresh; contains no document reference."""
    links, _ = primary_links(doc)
    by_cell = defaultdict(list)
    for action, parameter, marker, power in links:
        by_cell[(action, parameter)].append((marker, power))
    return by_cell, inferred_structural_marks(doc, links=links)


def grouped_matrix(doc, *, context=None):
    forms, warnings = project_forms(doc)
    headers, rows = forms['M']
    params = sorted(doc.params_node.findall('param'), key=lambda p: (_sort_number(p.get('group')), _sort_number(p.get('number')), _sort_number(p.get('id'))))
    objects = list(doc.objects_node)
    object_order = {n.get('id',''):i for i,n in enumerate(objects)}
    object_names = {n.get('id',''):n.get('name','') for n in objects}
    order = sorted(range(len(params)), key=lambda i: (object_order.get(params[i].get('o',''),len(objects)), _sort_number(params[i].get('group')), _sort_number(params[i].get('number')), _sort_number(params[i].get('id'))))
    labels = []
    for i in order:
        obj_id = params[i].get('o','')
        obj = object_names.get(obj_id, tr('Объект ID {id}').format(id=obj_id) if obj_id and obj_id != '0' else tr('Без объекта'))
        labels.append(obj + '\n' + parameter_code(params[i]))
    if rows:
        actions = {n.get('id',''): n for n in doc.actions}
        ordered_actions = [actions[r.action_id] for r in action_tree_rows(doc)]
        row_marks = structural_row_marks(doc, ordered_actions)
        derived = context[1] if context is not None else inferred_structural_marks(doc)
        new_rows=[]
        for row,node in zip(rows,ordered_actions):
            cells=[]
            for i in order:
                raw=row[2+i]
                hints=derived.get((node.get('id',''),params[i].get('id','')),set())
                mark_order = '.#][{}/' if node.get('type') == '1' else '.][{}#/'
                cells.append(raw + ''.join(mark for mark in mark_order if mark in hints and mark not in raw))
            new_rows.append([row_marks.get(node.get('id',''), ''), row[1]] + cells)
        rows=new_rows
    return [tr('Структ.'), headers[1]]+labels, rows, [params[i].get('id','') for i in order], warnings

def structural_row_marks(doc, actions):
    """Reconstruct observed sequence boundaries and alternative branches for display."""
    nodes = {n.get('id', ''): n for n in actions}
    parent = {}
    for link in doc.links:
        if link.get('type') == '2':
            parent[link.get('afe2', '')] = link.get('afe1', '')
    children = {}
    for ident in set(parent.values()):
        try:
            children[ident] = doc.sibling_order(ident)
        except (ValueError, KeyError):
            continue
    result = {}
    for ident, node in nodes.items():
        parent_id = parent.get(ident)
        parent_node = nodes.get(parent_id)
        prefix = '/' if parent_node is not None and parent_node.get('type') == '1' else ''
        close = ']' if (parent_node is not None and parent_node.get('type') == '2'
                        and children.get(parent_id) and children[parent_id][-1] == ident) else ''
        own = {'2':'[', '1':'#?', '3':'{'}.get(node.get('type'), '') if children.get(ident) else ''
        result[ident] = prefix + (own + close if node.get('type') == '1' else close + own)
    return result

def cell_description(doc, action_id, parameter_id, *, context=None):
    action, param = doc.action(action_id), doc.parameter(parameter_id)
    roles = {'*':tr('функция'), '+':tr('аргумент'), '.':tr('аргумент по умолчанию'), '?':tr('аргумент альтернативы'), '!':tr('счётчик цикла'),
             '[':tr('начало последовательности'), ']':tr('конец последовательности'), '#':tr('альтернатива'),
             '/':tr('ветвь альтернативы'), '{':tr('начало цикла'), '}':tr('конец цикла')}
    key = (str(action_id), str(parameter_id))
    if context is None:
        links, _ = primary_links(doc)
        entries = [(m,power) for a,p,m,power in links if (a,p)==key]
        marks = inferred_structural_marks(doc, links=links)
    else:
        entries = context[0].get(key, ())
        marks = context[1]
    details = ', '.join(f"{m} — {roles.get(m, tr('значение не расшифровано'))}" + (tr('; кратность {power}').format(power=power) if power not in ('','1') else '') for m,power in entries) or tr('Записанная связь отсутствует')
    hints = marks.get(key, set())
    if hints:
        explanations = {'[':tr('начало последовательности'), ']':tr('конец последовательности'),
                        '#':tr('альтернатива'), '/':tr('ветвь альтернативы'),
                        '.':tr('аргумент по умолчанию'), '{':tr('начало цикла'), '}':tr('конец цикла')}
        details += '\n' + '; '.join(f'{mark} — {explanations[mark]}' for mark in '.[]{}#/' if mark in hints)
        details += tr(' (вычислено для отображения; в XML отдельно не записано)')
    return f"{action_code(action)}  {action.get('name','')}\n{parameter_code(param)}  {param.get('name','')}\n{details}"
