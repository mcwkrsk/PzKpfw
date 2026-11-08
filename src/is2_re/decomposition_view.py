"""Read-only decomposition diagrams with full view and local action sheets.

Independent reconstruction from the project structure; native geometry and
structural code generation have not been verified against IS-2.
"""
from __future__ import annotations
from html import escape
from pathlib import Path
import textwrap
import re
import tkinter as tk
from tkinter import ttk, filedialog, messagebox, font as tkfont

from .coursework import build_course_scene, _wrapped_lines
from .gui_models import action_tree_rows
from .specifications import action_code
from .button_notebook import ButtonNotebook


def sheet_scene(doc, focus=None):
    """Return scene and display geometry without editing the document."""
    if focus is None:
        base = build_course_scene(doc, max_depth=None)
        width, height, stepx, stepy = 82, 44, 116, 86
        lines = {n.ident: [n.code] for n in base.nodes}
    else:
        root = doc.action(focus)
        # A cycle sheet also exposes the body sequence, as in the reference.
        depth = 2 if root.get('type') == '3' else 1
        base = build_course_scene(doc, focus, max_depth=depth)
        width, stepx = 280, 340
        lines = {n.ident: (textwrap.wrap(n.title or '(без названия)', width=33,
                              break_long_words=True, break_on_hyphens=False) or ['(без названия)']) for n in base.nodes}
        height = max(110, max((len(v) for v in lines.values()), default=1)*19+50)
        stepy = height+95
    geom={n.ident: (35+(n.x-30)/215*stepx, 30+n.depth*stepy, width, height) for n in base.nodes}
    return base, geom, lines


def structural_mark(doc, ident):
    """Approximate display-only structural signs, not serialized."""
    node=doc.action(ident)
    mark={'2':'[','1':'?','3':'{'}.get(node.get('type'), '')
    parent=next((l.get('afe1') for l in doc.links if l.get('type')=='2' and l.get('afe2')==ident), None)
    if parent:
        try:
            siblings=doc.sibling_order(parent)
            kind=doc.action(parent).get('type')
            if kind=='2' and siblings and siblings[-1]==ident: mark += ']'
            if kind=='1': mark += '/'
        except (KeyError,ValueError):
            pass
    return mark


def primitives(doc, focus=None, *, show_codes=True, show_symbols=True):
    """Generate common graphics for the canvas and SVG export."""
    scene, geom, lines = sheet_scene(doc, focus)
    nodes={n.ident:n for n in scene.nodes}
    children={ident:[] for ident in nodes}
    for edge in scene.edges:
        children[edge.source].append(edge.target)
    for parent in children:
        children[parent].sort(key=lambda ident:geom[ident][0])
    ops=[]
    for ident,kids in children.items():
        if not kids: continue
        x,y,w,h=geom[ident]; kind=nodes[ident].kind
        if kind == '2':
            x1,y1,kw,kh=geom[kids[0]]
            start=(x+w*.32,y+h); end=(x1+kw/2,y1)
            mid=(start[1]+end[1])/2
            ops.append(('path',[start,(start[0],mid),(end[0],mid),end],True))
            if len(kids)>1:
                xl,yl,lw,lh=geom[kids[-1]]
                start=(xl+lw/2,yl); end=(x+w*.68,y+h)
                mid=(start[1]+end[1])/2
                ops.append(('path',[start,(start[0],mid),(end[0],mid),end],True))
            for a,b in zip(kids,kids[1:]):
                xa,ya,wa,ha=geom[a];xb,yb,wb,hb=geom[b]
                ops.append(('path',[(xa+wa,ya+ha/2),(xb,yb+hb/2)],True))
        else:
            for index,kid in enumerate(kids):
                kx,ky,kw,kh=geom[kid]
                origin_x=x+w*((index+.5)/len(kids)) if kind=='1' else x+w/2
                mid=(y+h+ky)/2
                ops.append(('path',[(origin_x,y+h),(origin_x,mid),(kx+kw/2,mid),(kx+kw/2,ky)],True))
                if kind=='3': ops.append(('text',origin_x+10,y+h+12,'+',12,'start'))
    for n in scene.nodes:
        x,y,w,h=geom[n.ident]
        ops.append(('rect',x,y,w,h,n.ident))
        branch_h=32 if focus is not None and n.kind=='1' else (14 if n.kind=='1' else 0)
        if branch_h:
            ops.append(('path',[(x,y+h-branch_h),(x+w,y+h-branch_h)],False))
            ops.append(('path',[(x+w/2,y+h-branch_h),(x+w/2,y+h)],False))
            alts=doc.action(n.ident).findall('alts')
            for i in range(2):
                label=(alts[i].get('text','') if i<len(alts) else '') or str(i+1)
                if focus is None: label=str(i+1)
                branch_lines = _wrapped_lines(label, line_width=18, max_lines=2) if focus is not None else [label]
                for j, line in enumerate(branch_lines):
                    line_y = y+h-branch_h/2 + (j-(len(branch_lines)-1)/2)*12
                    ops.append(('text',x+w*(i+.5)/2,line_y,line,11 if focus is not None else 8,'middle'))
        contents=lines[n.ident] if (focus is not None or show_codes) else []
        font=14 if focus is not None else 12
        line_height=18 if focus is not None else 14
        content_y=y+(h-branch_h-len(contents)*line_height)/2+line_height/2
        for i,line in enumerate(contents):ops.append(('text',x+w/2,content_y+i*line_height,line,font,'middle'))
        if focus is not None and show_codes:
            ops.append(('text',x+w+7,y+h-4,n.code,12,'start'))
        if focus is None and not show_codes:
            # The compact view uses codes as its content; retain them for identity.
            pass
        if show_symbols:
            symbol=structural_mark(doc,n.ident)
            if symbol: ops.append(('text',x+w+7,y+8,symbol,11,'start'))
    extent_w=max((x+w+75 for x,y,w,h in geom.values()),default=800)
    extent_h=max((y+h+45 for x,y,w,h in geom.values()),default=500)
    return ops, extent_w, extent_h


def diagram_svg(doc,focus=None,*,show_codes=True,show_symbols=True):
    ops,w,h=primitives(doc,focus,show_codes=show_codes,show_symbols=show_symbols)
    result=[f'<svg xmlns="http://www.w3.org/2000/svg" width="{w:.0f}" height="{h:.0f}" viewBox="0 0 {w:.0f} {h:.0f}">',
            '<rect width="100%" height="100%" fill="white"/>',
            '<defs><marker id="arr" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto"><path d="M0 0 L8 4 L0 8 Z" fill="#222"/></marker></defs>']
    for op in ops:
        if op[0]=='rect':
            _,x,y,w0,h0,_=op;result.append(f'<rect x="{x}" y="{y}" width="{w0}" height="{h0}" fill="white" stroke="#222"/>')
        elif op[0]=='path':
            _,points,arrow=op;points=' '.join(f'{x},{y}' for x,y in points)
            result.append(f'<polyline points="{points}" fill="none" stroke="#222"'+(' marker-end="url(#arr)"' if arrow else '')+'/>')
        else:
            _,x,y,value,size,anchor=op
            result.append(f'<text x="{x}" y="{y}" font-family="Arial,sans-serif" font-size="{size}" text-anchor="{anchor}" dominant-baseline="middle">{escape(value)}</text>')
    result.append('</svg>')
    return '\n'.join(result)


class DecompositionPanel(ttk.Frame):
    def __init__(self,master,app):
        super().__init__(master);self.app=app;self.focus=None;self.zoom=1.;self._ids=[]
        self.show_codes=tk.BooleanVar(value=True);self.show_symbols=tk.BooleanVar(value=True)
        bar=ttk.Frame(self,padding=(6,6));bar.pack(fill='x')
        for title,fn in [('◀',lambda:self.step(-1)),('▶',lambda:self.step(1)),('−',lambda:self.scale(.8)),('+',lambda:self.scale(1.25)),('Вписать',self.fit),('Сохранить SVG…',self.export),('Сохранить все…',self.export_all)]:
            ttk.Button(bar,text=title,command=fn).pack(side='left',padx=(0,5))
        ttk.Checkbutton(bar,text='Коды блоков',variable=self.show_codes,command=self.draw).pack(side='left',padx=8)
        ttk.Checkbutton(bar,text='Структурные символы',variable=self.show_symbols,command=self.draw).pack(side='left',padx=8)
        ttk.Label(self,text='Полная диаграмма и листы действий · структурные символы приблизительные',style='Muted.TLabel',padding=(8,2)).pack(anchor='w')
        self.tabs=ButtonNotebook(self);self.tabs.pack(fill='x',padx=6)
        self.tabs.bind('<<NotebookTabChanged>>',self._tab_changed)
        holder=ttk.Frame(self);holder.pack(fill='both',expand=True,padx=6,pady=6)
        self.canvas=tk.Canvas(holder,background='#1b1b29',highlightthickness=0)
        self.canvas.bind('<Configure>', lambda _event: self.draw())
        self.canvas.bind('<ButtonPress-2>', lambda e: self.canvas.scan_mark(e.x, e.y))
        self.canvas.bind('<B2-Motion>', lambda e: self.canvas.scan_dragto(e.x, e.y, gain=1))
        sx=ttk.Scrollbar(holder,orient='horizontal',command=self.canvas.xview)
        sy=ttk.Scrollbar(holder,orient='vertical',command=self.canvas.yview)
        self.canvas.configure(xscrollcommand=sx.set,yscrollcommand=sy.set)
        self.canvas.grid(row=0,column=0,sticky='nsew');sy.grid(row=0,column=1,sticky='ns');sx.grid(row=1,column=0,sticky='ew')
        holder.columnconfigure(0,weight=1);holder.rowconfigure(0,weight=1)
        self.canvas.bind('<Double-1>',self._open_node)
        self.canvas.bind('<Control-MouseWheel>',lambda e:self.scale(1.2 if e.delta>0 else 1/1.2))
        self.refresh()

    def refresh(self):
        doc=self.app.doc
        ids=[] if doc is None else [r.action_id for r in action_tree_rows(doc) if doc.composition_children(r.action_id)]
        signature=tuple((ident, action_code(doc.action(ident))) for ident in ids) if doc is not None else ()
        if signature!=getattr(self, '_signature', None) or not self.tabs.tabs():
            previous=self.focus
            for item in self.tabs.tabs():self.tabs.forget(item)
            self._frames={}
            for ident in [None]+ids:
                frame=ttk.Frame(self.tabs);self._frames[str(frame)]=ident
                self.tabs.add(frame,text='Полная диаграмма' if ident is None else action_code(doc.action(ident)))
            self._ids=ids
            self._signature=signature
            frame=next((k for k,v in self._frames.items() if v==previous),None)
            if frame:self.tabs.select(frame)
            else:self.focus=None
        self.draw()

    def _tab_changed(self,_event=None):
        self.focus=self._frames.get(self.tabs.select())
        self.zoom=1.
        self.draw()
        self.canvas.xview_moveto(0);self.canvas.yview_moveto(0)

    def step(self,direction):
        tabs=self.tabs.tabs()
        if tabs:self.tabs.select(tabs[max(0,min(len(tabs)-1,self.tabs.index('current')+direction))])

    def scale(self,factor):
        self.zoom=max(.25,min(2.5,self.zoom*factor));self.draw();return 'break'

    def fit(self):
        if self.app.doc is None:return
        _,w,h=primitives(self.app.doc,self.focus,show_codes=self.show_codes.get(),show_symbols=self.show_symbols.get())
        self.canvas.update_idletasks();self.zoom=max(.25,min(1.5,(self.canvas.winfo_width()-20)/max(1,w),(self.canvas.winfo_height()-20)/max(1,h)))
        self.draw();self.canvas.xview_moveto(0);self.canvas.yview_moveto(0)

    def draw(self):
        canvas = self.canvas
        canvas.delete('all')
        dark = self.app.theme_name.get() == 'dark'
        canvas.configure(background='#1b1b29' if dark else '#ffffff')
        ink = '#f3f3f8' if dark else '#242536'
        muted = '#aaaabd' if dark else '#65697d'
        line = '#9da9c4' if dark else '#526c88'
        grid = '#303041' if dark else '#e4eaf2'
        if self.app.doc is None:
            canvas.create_text(25, 25, anchor='nw', text='Откройте или создайте проект', fill=muted)
            return
        try: ops,w,h=primitives(self.app.doc,self.focus,show_codes=self.show_codes.get(),show_symbols=self.show_symbols.get())
        except (KeyError,ValueError): return
        z=self.zoom; self._fonts={}
        grid_w=max(w*z,canvas.winfo_width()); grid_h=max(h*z,canvas.winfo_height())
        step=max(24, 80*z, grid_w/1200, grid_h/1200)
        for i in range(int(grid_w/step)+2):
            canvas.create_line(i*step,0,i*step,grid_h,fill=grid,tags=('grid',))
        for i in range(int(grid_h/step)+2):
            canvas.create_line(0,i*step,grid_w,i*step,fill=grid,tags=('grid',))
        for op in ops:
            if op[0]=='rect':
                _,x,y,w0,h0,ident=op
                canvas.create_rectangle(x*z+2,y*z+3,(x+w0)*z+2,(y+h0)*z+3,fill='#12121d' if dark else '#e8edf5',outline='')
                kind=self.app.doc.action(ident).get('type')
                outline=('#70cfcb' if dark else '#207a75') if kind=='1' else ('#72758d' if dark else '#526c88')
                canvas.create_rectangle(x*z,y*z,(x+w0)*z,(y+h0)*z,fill='#282836' if dark else '#ffffff',outline=outline,width=1.4,tags=('node', 'node:'+ident))
            elif op[0]=='path':
                _,points,arrow=op;coords=[c*z for point in points for c in point]
                canvas.create_line(*coords,fill=('#70cfcb' if dark else '#4874ad') if arrow else line,width=1,arrow='last' if arrow else 'none')
            else:
                _,x,y,value,size,anchor=op
                sz=max(6,round(size*z))
                if sz not in self._fonts:self._fonts[sz]=tkfont.Font(root=canvas,family='Arial',size=-sz)
                canvas.create_text(x*z,y*z,text=value,font=self._fonts[sz],fill=ink,anchor={'start':'w','middle':'center','end':'e'}[anchor])
        canvas.configure(scrollregion=(0,0,grid_w,grid_h))

    def _open_node(self,event):
        x,y=self.canvas.canvasx(event.x),self.canvas.canvasy(event.y)
        items=self.canvas.find_overlapping(x,y,x,y)
        for item in reversed(items):
            ident=next((x[5:] for x in self.canvas.gettags(item) if x.startswith('node:')),None)
            if ident in self._ids:
                frame=next((k for k,v in self._frames.items() if v==ident),None)
                if frame:self.tabs.select(frame)
                break

    def export(self):
        if self.app.doc is None:return
        path=filedialog.asksaveasfilename(parent=self,defaultextension='.svg',filetypes=[('SVG','*.svg')])
        if not path:return
        try:Path(path).write_text(diagram_svg(self.app.doc,self.focus,show_codes=self.show_codes.get(),show_symbols=self.show_symbols.get()),encoding='utf-8')
        except (OSError,ValueError) as exc:messagebox.showerror('Экспорт',str(exc),parent=self)

    def export_all(self):
        if self.app.doc is None:return
        folder=filedialog.askdirectory(parent=self,title='Папка для диаграмм SVG')
        if not folder:return
        targets=[(Path(folder)/'00_full_diagram.svg',None)]
        for ident in self._ids:
            code=action_code(self.app.doc.action(ident))
            safe=re.sub(r'[^A-Za-z0-9_.-]+','_',code).strip('._') or 'action'
            targets.append((Path(folder)/f'sheet_{ident}_{safe}.svg',ident))
        if any(path.exists() for path,_ in targets):
            if not messagebox.askyesno('Экспорт','Некоторые SVG-файлы уже существуют. Перезаписать?',parent=self):return
        try:
            for path,ident in targets:
                path.write_text(diagram_svg(self.app.doc,ident,show_codes=self.show_codes.get(),show_symbols=self.show_symbols.get()),encoding='utf-8')
            messagebox.showinfo('Экспорт',f'Сохранено SVG-файлов: {len(targets)}',parent=self)
        except (OSError,ValueError) as exc:messagebox.showerror('Экспорт',str(exc),parent=self)
