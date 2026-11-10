"""IS-2-inspired SPD sheet layout; does not alter or reinterpret XML."""
from collections import defaultdict
from dataclasses import replace
from html import escape

from .coursework import build_course_scene, _wrapped_lines
from .specifications import parameter_code, primary_links


def build_is2_spd_scene(doc, focus=None, *, max_depth=2):
    roots = {node.get('id', '') for node in doc.actions}
    roots -= {link.get('afe2', '') for link in doc.links if link.get('type') == '2'}
    # Like the examples, a root overview shows direct children; the other
    # sheets can expose their entire subtree. The full view remains available.
    node_types = {node.get('id', ''): node.get('type', '0') for node in doc.actions}
    overview_roots = roots if focus is None else {focus}
    inline_cycle = (max_depth is not None and bool(overview_roots)
                    and all(node_types.get(root) == '3' for root in overview_roots))
    if max_depth is None or inline_cycle:
        limit = None
    elif focus is None or focus in roots:
        limit = 1
    else:
        limit = None
    source = build_course_scene(doc, focus, max_depth=limit)
    if inline_cycle:
        # A loop on the root sheet includes its body and the body's direct
        # actions. Composite actions remain separate sheets except branches of
        # an alternative, whose contents are part of the choice diagram.
        all_children = defaultdict(list)
        for edge in source.edges:
            all_children[edge.source].append(edge.target)
        keep = set(overview_roots)
        def expand_branch(ident, visited):
            if ident in visited:
                return
            visited.add(ident)
            for child in all_children.get(ident, ()):
                keep.add(child)
                if node_types.get(child) in ('1', '3'):
                    expand_branch(child, visited)
        for root in overview_roots:
            for body in all_children.get(root, ()):
                keep.add(body)
                for child in all_children.get(body, ()):
                    keep.add(child)
                    if node_types.get(child) in ('1', '3'):
                        expand_branch(child, set())
                        if node_types.get(child) == '1':
                            for branch in all_children.get(child, ()):
                                expand_branch(branch, set())
        source = replace(source, nodes=tuple(n for n in source.nodes if n.ident in keep),
                         edges=tuple(e for e in source.edges if e.source in keep and e.target in keep))
    nodes = {node.ident: node for node in source.nodes}
    children = defaultdict(list)
    parent_of = {}
    for edge in source.edges:
        children[edge.source].append(edge.target)
        parent_of[edge.target] = edge.source
    for values in children.values():
        values.sort(key=lambda ident: nodes[ident].x)
    roots = sorted((n for n in source.nodes if n.ident not in parent_of), key=lambda n: n.x)
    next_column = defaultdict(int)
    columns = {}

    def place_group(parent_id):
        parent = nodes[parent_id]
        group = children.get(parent_id, ())
        for child_id in group:
            depth = nodes[child_id].depth
            col = max(next_column[depth], columns[parent_id])
            columns[child_id] = col
            next_column[depth] = col + 1
        for child_id in group:
            place_group(child_id)

    for root in roots:
        col = next_column[root.depth]
        columns[root.ident] = col
        next_column[root.depth] = col + 1
        place_group(root.ident)
    placed = tuple(replace(n, x=30 + columns[n.ident]*215, y=44+n.depth*150) for n in source.nodes)
    ncols = max(6, max(columns.values(), default=0)+1)
    nrows = max(6, max((n.depth for n in placed), default=0)+1)
    return replace(source, nodes=placed, width=ncols*215, height=nrows*150)


def is2_connectors(scene):
    """Return simple lines for composition and sibling sequence rails."""
    nodes = {node.ident: node for node in scene.nodes}
    children = defaultdict(list)
    for edge in scene.edges:
        children[edge.source].append(nodes[edge.target])
    for ident, kids in children.items():
        parent = nodes[ident]
        kids.sort(key=lambda node: node.x)
        if parent.kind == '1':
            for index, child in enumerate(kids):
                fraction = .25 if index == 0 else .75
                yield (parent.x+scene.node_width*fraction, parent.y+scene.node_height,
                       child.x+scene.node_width/2, child.y)
        else:
            for child in (kids if len(kids) <= 2 else (kids[0], kids[-1])):
                yield (parent.x+scene.node_width/2, parent.y+scene.node_height,
                       child.x+scene.node_width/2, child.y)
        if parent.kind == '2':
            for left, right in zip(kids, kids[1:]):
                yield (left.x+scene.node_width,left.y+scene.node_height/2,
                       right.x,right.y+scene.node_height/2)


def is2_parameter_marks(doc):
    """Labels come only from existing matrix records, not inferred links."""
    params = {p.get('id', ''): p for p in doc.params_node.findall('param')}
    links, _ = primary_links(doc)
    grouped = defaultdict(list)
    for action, parameter, marker, power in links:
        label = marker + parameter_code(params[parameter])
        if power not in ('', '1'):
            label += '×' + power
        grouped[action].append(label)
    return {ident: ', '.join(labels) for ident, labels in grouped.items()}


def is2_spd_svg(doc, scene, selected=None):
    w,h=scene.node_width,scene.node_height
    output=[f'<svg xmlns="http://www.w3.org/2000/svg" width="{scene.width}" height="{scene.height}" viewBox="0 0 {scene.width} {scene.height}">',
            '<rect width="100%" height="100%" fill="white"/>']
    for x in range(0,scene.width+1,scene.column_width):
        output.append(f'<path d="M{x},0 V{scene.height}" stroke="#a7a7a7" fill="none"/>')
    for y in range(0,scene.height+1,scene.row_height):
        output.append(f'<path d="M0,{y} H{scene.width}" stroke="#a7a7a7" fill="none"/>')
    for x1,y1,x2,y2 in is2_connectors(scene):
        output.append(f'<line x1="{x1}" y1="{y1}" x2="{x2}" y2="{y2}" stroke="#555"/>')
    nodes = {node.ident: node for node in scene.nodes}
    for edge in scene.edges:
        parent, child = nodes[edge.source], nodes[edge.target]
        if parent.kind == '3':
            output.append(f'<text x="{parent.x+w/2+5}" y="{(parent.y+h+child.y)/2}" font-size="11">+</text>')
    marks = is2_parameter_marks(doc)
    for n in scene.nodes:
        color='#14842a' if n.ident==selected else '#202020'
        output.append(f'<g><rect x="{n.x}" y="{n.y}" width="{w}" height="{h}" fill="white" stroke="{color}"/>')
        if n.kind=='1':
            y=n.y+h-15
            output.append(f'<path d="M{n.x},{y} h{w} M{n.x+w/2},{y} v15" stroke="{color}"/>')
            for i,value in enumerate(('1','2')):
                output.append(f'<text x="{n.x+w*(.25+.5*i)}" y="{n.y+h-3}" text-anchor="middle" font-size="9">{value}</text>')
        lines = _wrapped_lines(n.title,line_width=32,max_lines=5 if n.kind!='1' else 4)
        for i,line in enumerate(lines):
            output.append(f'<text x="{n.x+w/2}" y="{n.y+15+i*10}" text-anchor="middle" font-family="Arial,sans-serif" font-size="9">{escape(line)}</text>')
        y=n.y+h-(18 if n.kind=='1' else 4)
        if n.ident in marks:
            label = _wrapped_lines(marks[n.ident],line_width=18,max_lines=1)[0]
            output.append(f'<text x="{n.x+4}" y="{y}" font-size="9">{escape(label)}</text>')
        output.append(f'<text x="{n.x+w-4}" y="{y}" text-anchor="end" font-size="10">{escape(n.code)}</text></g>')
    output.append('</svg>')
    return '\n'.join(output)
