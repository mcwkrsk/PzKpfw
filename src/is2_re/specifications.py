"""Primary-model forms and action/parameter matrix reconstructed from IS-2 evidence.

The source is read-only; a form is a projection, not a claim of exact runtime parity.
"""
from __future__ import annotations
from .i18n import tr, get_language, get_language_info
import html
from collections import defaultdict
from .gui_models import action_tree_rows

ACTION_TYPES={'0':tr('Элементарное'),'1':tr('Альтернатива'),'2':tr('Последовательность'),'3':tr('Цикл')}
STATUS={'0':'Э','1':'П'}
FORMAL={'0':'Ан.','1':'Э','2':'Ал.','3':'С'}
FORMAL_D={'0':'ан','1':'эм','2':'ал','3':'ст'}
ROLES={'*':tr('Функция'),'+':tr('Аргумент'),'.':tr('Аргумент по умолчанию')}
FORM_NAME_KEYS={'A':'Форма A — структура действий','B':'Форма B — предметные действия',
                'D1':'Форма D1 — параметры','D':'Форма D — элементарные действия',
                'D2':'Форма D2 — потоки данных','M':'Матричная диаграмма — действия × параметры'}
FORM_NAMES={key:tr(message) for key, message in FORM_NAME_KEYS.items()}


def action_code(node):
    """Best-effort code from serialized symbol, level and number; show ID otherwise."""
    try:
        symbol=int(node.get('symbol',''))
        if not 32 <= symbol <= 0x10ffff: raise ValueError()
        level=node.get('level',''); number=node.get('number','')
        if not level or not number: raise ValueError()
        return f'{chr(symbol)}{level}{"." if int(number) >= 10 else ""}{number}'
    except (ValueError, OverflowError):
        return 'ID '+node.get('id','?')


def parameter_code(node):
    group=node.get('group'); number=node.get('number')
    return f'A{group}.{number}' if group is not None and number is not None else 'ID '+node.get('id','?')


def _sort_number(value):
    try: return (0,int(value))
    except (ValueError,TypeError): return (1,str(value or ''))


def action_sort_key(node):
    return (_sort_number(node.get('level')), _sort_number(node.get('number')),
            _sort_number(node.get('id')))


def parameter_description(node):
    name = node.get('name', '')
    sign = node.get('sign', '')
    return f'{name}, {sign}' if name and sign else name or sign or parameter_code(node)


def _char(node):
    raw=node.get('char','')
    try:
        code=int(raw)
        return chr(code) if 32 <= code <= 126 else f'код {code}'
    except ValueError:
        return raw if len(raw)==1 else f'код {raw or "?"}'


def primary_links(doc):
    """Return recovered matrix entries, preserving invalid/unknown entries as warnings."""
    matrix=doc.root.find('./models/primaryModel/matrix')
    acts={n.get('id',''):n for n in doc.actions}
    params={n.get('id',''):n for n in doc.params_node.findall('param')}
    result=[]; warnings=[]
    if matrix is None:
        return result,[tr('В проекте отсутствует раздел primaryModel/matrix.')]
    for i,n in enumerate(matrix,1):
        if not isinstance(n.tag,str): continue
        a=n.get('e1',''); p=n.get('e2',''); marker=_char(n)
        if n.tag != 'AElement' or n.get('type') != '4' or a not in acts or p not in params:
            warnings.append(tr('Запись matrix №{index} ({tag}): действие {action}, параметр {parameter}; тип или ссылка не распознаны. Запись не включена в формы.').format(index=i, tag=n.tag, action=a or '?', parameter=p or '?'))
            continue
        result.append((a,p,marker,n.get('power','1')))
    return result,warnings


def project_forms(doc):
    nodes={n.get('id',''):n for n in doc.actions}
    actions=[nodes[r.action_id] for r in action_tree_rows(doc)]
    params=sorted(doc.params_node.findall('param'),key=lambda n: (_sort_number(n.get('group')),_sort_number(n.get('number')),_sort_number(n.get('id'))))
    param_by_id={n.get('id',''):n for n in params}
    objects={n.get('id',''):n.get('name','') for n in doc.objects_node.findall('object')}
    links,warnings=primary_links(doc)
    grouped=defaultdict(list)
    for a,p,mark,power in links: grouped[(a,p)].append((mark,power))
    order_by_id={n.get('id',''):i for i,n in enumerate(actions)}
    p_order={n.get('id',''):i for i,n in enumerate(params)}
    links.sort(key=lambda x:(order_by_id.get(x[0],len(actions)),p_order.get(x[1],len(params)),x[2]))
    forms={}
    parents_with_links = {link.get('afe1', '') for link in doc.links if link.get('type') in ('2', '3')}
    rows=[]
    for parent in sorted(actions, key=action_sort_key):
        pid=parent.get('id','')
        if pid not in parents_with_links:
            continue
        try: children=doc.sibling_order(pid)
        except Exception as exc:
            warnings.append(tr('Порядок потомков действия {id} не восстановлен: {error}').format(id=pid, error=exc))
            continue
        kind=parent.get('type')
        name={'2':tr('Последовательность'),'1':tr('Альтернатива'),'3':tr('Цикл')}.get(kind,tr('Другое'))
        if kind == '2':
            # Reference screenshot: parent z11, (z21,z22), (z22,z23), (z23,z24).
            pairs = list(zip(children, children[1:])) if len(children)>1 else [(c,None) for c in children]
        else:
            # Alternatives and iterations are represented by one child per row.
            pairs = [(c,None) for c in children]
        for first, second in pairs:
            rows.append([action_code(parent),action_code(nodes[first]),
                         action_code(nodes[second]) if second in nodes else '—',name])
    forms['A']=([tr(label) for label in ('Код ПД1','Код ПД2','Код ПД3','Вид компоновки')],rows)
    forms['B']=([tr(label) for label in ('Код','Наименование','Статус','Степень формализации')],[
        [action_code(n),n.get('name',''),STATUS.get(n.get('status'),'код '+n.get('status','?')),
         FORMAL.get(n.get('formalization'),'код '+n.get('formalization','?'))] for n in sorted(actions, key=action_sort_key)])
    forms['D1']=([tr(label) for label in ('Код','Наименование','Обозначение','Объект')],[
        [parameter_code(n),n.get('name',''),n.get('sign',''),objects.get(n.get('o',''),'—')] for n in params])
    links_by_action = defaultdict(list)
    for a, p, mark, power in links:
        links_by_action[a].append((param_by_id[p], mark))
    rows=[]
    for n in sorted(actions, key=action_sort_key):
        if n.get('type')!='0': continue
        aid=n.get('id','')
        related=links_by_action[aid]
        functions='; '.join(parameter_description(p) for p,m in related if m=='*')
        args='; '.join(('-' if m == '+' else '-/') + parameter_description(p) for p,m in related if m in ('+','.'))
        rows.append([action_code(n),n.get('name',''),FORMAL_D.get(n.get('formalization'),'код '+n.get('formalization','?')),functions,args,n.get('mark','')])
    forms['D']=([tr(label) for label in ('Код ПД','Наименование','Форм.','Функция','Аргументы','Примечание')],rows)
    # IS-2 examples show the condition of an alternative as a default argument
    # on each immediate elementary branch. Keep explicit links and their order.
    direct_children = defaultdict(list)
    for link in doc.links:
        if link.get('type') == '2':
            direct_children[link.get('afe1', '')].append(link.get('afe2', ''))
    by_action = defaultdict(list)
    for a, p, mark, power in links:
        by_action[a].append((p, mark, power))
    defaults = defaultdict(list)
    inferred_conditions = set()
    for a, p, mark, power in links:
        if mark == '?' and nodes[a].get('type') == '1':
            children = direct_children[a]
            if children and all(c in nodes and nodes[c].get('type') == '0' for c in children):
                for child in children:
                    defaults[child].append(p)
                inferred_conditions.add((a, p, mark, power))
    d2_rows = []
    for node in actions:
        aid = node.get('id', '')
        entries = sorted(by_action[aid], key=lambda entry: 0 if entry[1] == '*' else 1)
        for pid, mark, power in entries:
            if (aid, pid, mark, power) in inferred_conditions:
                continue
            role = ROLES.get(mark, tr('Другая ({mark})').format(mark=mark))
            if power not in ('', '1'):
                role += f' × {power}'
            d2_rows.append([action_code(node), parameter_code(param_by_id[pid]), role])
        for pid in defaults[aid]:
            if not any(p == pid and mark == '.' for p, mark, _ in entries):
                d2_rows.append([action_code(node), parameter_code(param_by_id[pid]), tr('Аргумент по умолчанию')])
    forms['D2']=([tr(label) for label in ('Код ПД','Код параметра','Роль параметра')],d2_rows)
    for node, row in zip((n for n in sorted(actions, key=action_sort_key) if n.get('type') == '0'), forms['D'][1]):
        aid = node.get('id', '')
        inferred = ['-/' + parameter_description(param_by_id[pid]) for pid in defaults[aid]
                    if not any(p == pid and mark == '.' for p, mark, _ in by_action[aid])]
        if inferred:
            row[4] = '; '.join(filter(None, [row[4], *inferred]))
    headers=[tr('Структ.'), tr('Код ПД')]+[parameter_code(p) for p in params]
    rows=[]
    if len(actions)*len(params)>250_000:
        warnings.append(tr('Плотная матрица превышает 250 000 ячеек: показ отключён для экономии памяти. Используйте команду primary-links (разреженный список).'))
    else:
        for n in actions:
            aid=n.get('id',''); cell=[]
            for p in params:
                entries=grouped.get((aid,p.get('id','')),[])
                cell.append(' '.join(mark if power in ('1','') else f'{mark}×{power}' for mark,power in entries))
            rows.append([('[' if n.get('type')=='2' else '#?' if n.get('type')=='1' else '/' if n.get('type')=='3' else ''), action_code(n)]+cell)
    forms['M']=(headers,rows)
    if len({parameter_code(n) for n in params}) != len(params): warnings.append(tr('Есть повторяющиеся отображаемые коды параметров; в матрице дополнительно указаны ID.'))
    if len({action_code(n) for n in actions}) != len(actions): warnings.append(tr('Есть повторяющиеся отображаемые коды действий; проверьте исходные level/number.'))
    warnings.append('Коды вычислены по полям XML; точное соответствие getCode/getStructureSymbols и формам конкретной сборки ИС-2 требуется проверить.')
    warnings.append(tr('Неподтверждённые значения степени формализации и роли показываются числовым кодом или исходным символом.'))
    return forms,warnings


def form_html(doc, selection='all'):
    """Self-contained printable/progressive web view; not an original Qt template."""
    forms,warnings=project_forms(doc)
    chosen=list(FORM_NAMES) if selection=='all' else [selection]
    if any(k not in FORM_NAMES for k in chosen):
        raise ValueError(tr('Неизвестный выбор формы'))
    esc=lambda x:html.escape(str(x),quote=True)
    css='\n:root{font-family:system-ui,Arial,sans-serif;color:#172a3b;background:white}\nbody{margin:2em;line-height:1.4}h1{margin-top:0}h2{margin-top:2.5em}\n.caption{font-size:.85em;color:#4b5563}table{border-collapse:collapse;margin:.75em 0 1.5em;width:max-content;min-width:100%;font-size:.93em}\nth,td{border:1px solid #aeb6bf;padding:.5em .65em;text-align:left;vertical-align:top;max-width:480px;overflow-wrap:anywhere}\nth{background:#edf2f7;position:sticky;top:0}tbody tr:nth-child(even){background:#f8fafc}\n.hovered-cell,.hovered-column,.hovered-row{background:#d9eaf8!important}\n.warn{border-left:3px solid #c19c47;background:#fff8e8;padding:1em;max-width:85em}\n.controls{position:sticky;top:0;background:white;padding:10px 0;z-index:3;border-bottom:1px solid #ddd}\n.controls button{margin-right:.5em;padding:.45em .8em;cursor:pointer}\n.form-table{overflow:auto;max-width:100%}\n@media print{body{margin:1cm;font-size:10pt}.controls{display:none}th{position:static}tr{break-inside:avoid}h2{break-after:avoid}.form-table{overflow:visible}table{width:100%}}\n'
    script="\n(function(){\n  var scale=100;\n  var main=document.getElementById('forms-content');\n  window.setFormZoom=function(delta){scale=Math.max(60,Math.min(160,scale+delta));main.style.fontSize=scale+'%';document.getElementById('zoom-label').textContent=scale+'%';};\n  document.querySelectorAll('table').forEach(function(table){\n    var previous=[];\n    table.addEventListener('mouseover',function(ev){\n      var td=ev.target.closest('td');if(!td || !table.contains(td))return;\n      previous.forEach(function(n){n.classList.remove('hovered-cell','hovered-column','hovered-row');});previous=[];\n      var col=td.cellIndex;\n      table.querySelectorAll('tbody tr').forEach(function(tr){\n        if(tr.cells[col]){tr.cells[col].classList.add('hovered-column');previous.push(tr.cells[col]);}\n      });\n      Array.prototype.forEach.call(td.parentElement.cells,function(c){c.classList.add('hovered-row');previous.push(c);});\n      td.classList.add('hovered-cell');previous.push(td);\n    });\n    table.addEventListener('mouseleave',function(){previous.forEach(function(n){n.classList.remove('hovered-cell','hovered-column','hovered-row');});previous=[];});\n  });\n})();\n"
    pieces=['<!doctype html><html lang="' + html.escape(get_language().split('_', 1)[0], quote=True) + '" dir="' + get_language_info().direction + '"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">',
            '<title>' + tr('Формы ИС-2 — экспериментальная реконструкция') + '</title>',
            '<style>'+css+'</style></head><body>',
            '<div class="controls"><button type="button" onclick="setFormZoom(-10)">−</button>'
            '<span id="zoom-label">100%</span> <button type="button" onclick="setFormZoom(10)">+</button>'
            '<button type="button" onclick="window.print()">' + tr('Печать') + '</button></div>',
            '<h1>' + tr('Спецификации и матричная диаграмма') + '</h1>',
            '<p class="caption">' + tr('Самостоятельное представление PzKpfw. Не является копией оригинального HTML/Qt-окна ИС-2.') + '</p>',
            '<div class="warn"><b>' + tr('Экспериментальная реконструкция.') + '</b> ' + tr('Совпадение с оригинальной ИС-2 и заполненные связи matrix в оригинале не проверены.') + ' ' + ' '.join(esc(w) for w in warnings) + '</div>',
            '<div id="forms-content">']
    for key in chosen:
        headers,rows=forms[key]
        pieces.append('<section><h2>'+esc(tr(FORM_NAME_KEYS[key]))+'</h2><div class="form-table"><table data-form="'+esc(key)+'"><thead><tr>'+''.join('<th scope="col">'+esc(v)+'</th>' for v in headers)+'</tr></thead><tbody>')
        for row in rows:
            pieces.append('<tr>'+''.join('<td title="'+esc(v)+'">'+esc(v)+'</td>' for v in row)+'</tr>')
        pieces.append('</tbody></table></div></section>')
    pieces.extend(['</div>','<script>'+script+'</script>','</body></html>'])
    return '\n'.join(pieces)


def add_primary_link(doc, action_id, parameter_id, marker, *, power=1):
    """Explicit conservative writer-shaped link; runtime IS-2 acceptance unverified."""
    if marker not in ('*','+','.'):
        raise ValueError(tr('Роль должна быть *, + или .'))
    power = _validated_power(power)
    action = doc.action(action_id)
    doc.parameter(parameter_id)
    if action.get('type') != '0':
        raise ValueError(tr('Связи функции и аргументов здесь доступны только элементарным действиям'))
    matrix=doc.root.find('./models/primaryModel/matrix')
    if matrix is None:
        raise ValueError(tr('Раздел primaryModel/matrix отсутствует; запись заблокирована'))
    for n in matrix:
        if not isinstance(n.tag, str): continue
        if n.tag != 'AElement' or n.get('type') != '4' or any(n.get(k) is None for k in ('e1','e2','char','power')):
            raise ValueError('Раздел matrix содержит нераспознанные записи; изменение заблокировано')
        if n.get('e1') == str(action_id) and n.get('e2') == str(parameter_id) and n.get('char') == str(ord(marker)):
            raise ValueError(tr('Такая связь уже существует'))
        if marker == '*' and n.get('e1') == str(action_id) and n.get('char') == str(ord('*')):
            raise ValueError(tr('Функция уже назначена; сначала удалите прежнюю связь'))
    import xml.etree.ElementTree as ET
    ET.SubElement(matrix,'AElement',{'id':'0','name':'','type':'4','e1':str(action_id),'e2':str(parameter_id),'char':str(ord(marker)),'power':str(power)})


def remove_primary_link(doc, action_id, parameter_id, marker):
    matrix=doc.root.find('./models/primaryModel/matrix')
    if matrix is None: raise ValueError(tr('Раздел matrix отсутствует'))
    matches=[n for n in matrix if n.tag=='AElement' and n.get('type')=='4' and n.get('e1')==str(action_id) and n.get('e2')==str(parameter_id) and n.get('char')==str(ord(marker))]
    if len(matches)!=1: raise ValueError(tr('Найдена не одна запись: удаление заблокировано'))
    node=matches[0]
    if set(node.attrib)-{'id','name','type','e1','e2','char','power'} or len(node):
        raise ValueError(tr('Запись содержит дополнительные данные; удаление заблокировано'))
    matrix.remove(node)


def _validated_power(power):
    """The recovered serialized power field is a signed 32-bit integer."""
    try:
        value = int(str(power), 10)
    except (TypeError, ValueError) as exc:
        raise ValueError(tr('Значение power должно быть целым десятичным числом')) from exc
    if not -(2**31) <= value < 2**31:
        raise ValueError(tr('Значение power выходит за пределы знакового 32-битного диапазона'))
    return value


def set_primary_link_power(doc, action_id, parameter_id, marker, power):
    """Update only @power on one precisely identified, simple native-shaped row."""
    if marker not in ('*', '+', '.'):
        raise ValueError(tr('Неподдерживаемый маркер для редактируемых связей'))
    value = _validated_power(power)
    matrix = doc.root.find('./models/primaryModel/matrix')
    if matrix is None:
        raise ValueError(tr('Раздел primaryModel/matrix отсутствует'))
    doc.action(action_id)
    doc.parameter(parameter_id)
    for node in matrix:
        if not isinstance(node.tag, str) or node.tag != 'AElement' or node.get('type') != '4' or any(node.get(k) is None for k in ('e1', 'e2', 'char', 'power')):
            raise ValueError(tr('Непрозрачная строка матрицы блокирует редактирование'))
    matches = [n for n in matrix if n.get('e1') == str(action_id) and n.get('e2') == str(parameter_id) and n.get('char') == str(ord(marker))]
    if len(matches) != 1:
        raise ValueError(tr('Ожидалась ровно одна соответствующая запись матрицы'))
    node = matches[0]
    if set(node.attrib) - {'id', 'name', 'type', 'e1', 'e2', 'char', 'power'} or len(node):
        raise ValueError(tr('Запись матрицы содержит непрозрачные дополнительные данные'))
    node.set('power', str(value))
    return value
