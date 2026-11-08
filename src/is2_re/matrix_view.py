"""Read-only, object-grouped matrix projection with cell descriptions."""
from .specifications import project_forms, primary_links, parameter_code, action_code, _sort_number
from .gui_models import action_tree_rows

def inferred_structural_marks(doc):
    """Conservative visual hints only; never modify XML or claim native parity."""
    actions = {n.get('id',''):n for n in doc.actions}
    links, _ = primary_links(doc)
    by_action = {}
    for action, param, mark, _ in links:
        by_action.setdefault(action, []).append((param, mark))
    children = {}
    for ident in actions:
        try: children[ident] = doc.sibling_order(ident)
        except Exception: children[ident] = []
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
                for kid in kids: add(kid,next(iter(inputs)),'/')
            if len(results)==1: add(ident,next(iter(results)),'#')
        elif kind=='3' and len(results)==1:
            param=next(iter(results));add(ident,param,'{')
            end=last_leaf(kids[-1])
            if end is not None: add(end,param,'}')
    return marks

def grouped_matrix(doc):
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
        obj = object_names.get(obj_id, f'Объект ID {obj_id}' if obj_id and obj_id != '0' else 'Без объекта')
        labels.append(obj + '\n' + parameter_code(params[i]))
    if rows:
        actions = {n.get('id',''): n for n in doc.actions}
        ordered_actions = [actions[r.action_id] for r in action_tree_rows(doc)]
        inferred = {'2':'~[', '1':'~?', '3':'~{'}
        derived = inferred_structural_marks(doc)
        new_rows=[]
        for row,node in zip(rows,ordered_actions):
            cells=[]
            for i in order:
                raw=row[2+i]
                hints=''.join(sorted(derived.get((node.get('id',''),params[i].get('id','')),set())))
                cells.append(raw + ((' ' if raw else '') + hints + '~' if hints else ''))
            new_rows.append([inferred.get(node.get('type'), ''), row[1]] + cells)
        rows=new_rows
    return ['Структ. ≈', headers[1]]+labels, rows, [params[i].get('id','') for i in order], warnings

def cell_description(doc, action_id, parameter_id):
    action, param = doc.action(action_id), doc.parameter(parameter_id)
    links, _ = primary_links(doc)
    roles = {'*':'функция', '+':'аргумент', '.':'аргумент по умолчанию', '?':'аргумент альтернативы', '!':'счётчик цикла'}
    entries = [(m,power) for a,p,m,power in links if a==str(action_id) and p==str(parameter_id)]
    details = ', '.join(f"{m} — {roles.get(m, 'значение не расшифровано')}" + (f"; кратность {power}" if power not in ('','1') else '') for m,power in entries) or 'Записанная связь отсутствует'
    hints = inferred_structural_marks(doc).get((str(action_id),str(parameter_id)), set())
    if hints:
        details += '\n' + ''.join(sorted(hints)) + ' — предполагаемые структурные знаки; в XML не записаны'
    return f"{action_code(action)}  {action.get('name','')}\n{parameter_code(param)}  {param.get('name','')}\n{details}"
