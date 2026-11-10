"""Friendly parameter entry, shared by the parameter and SPD workspaces."""
from __future__ import annotations

import tkinter as tk
from tkinter import messagebox, ttk

# Names visible in the IS-2 examples; unknown groups remain editable by code.
GROUP_NAMES = {
    '0': 'Признаки связи', '1': 'Идентификаторы', '2': 'Наименование',
    '3': 'Классификационные', '5': 'Размерные', '6': 'Временные',
    '8': 'Кинематические', '9': 'Динамические',
}


def group_label(code):
    return f'{code} — {GROUP_NAMES[code]}' if code in GROUP_NAMES else str(code)


def next_group_number(params, group):
    return max((int(p.get('number', '')) for p in params
                if p.get('group', '') == group and p.get('number', '').isdigit()), default=0) + 1


class ParameterDialog(tk.Toplevel):
    def __init__(self, master, doc, node=None):
        super().__init__(master)
        self.title('Изменить параметр' if node is not None else 'Новый параметр')
        self.result = None
        self.resizable(True, False)
        self.doc, self.node = doc, node
        values = node.attrib if node is not None else {}
        self.original_object = values.get('o', '')
        self.objects = {'Нет': ''}
        for obj in doc.objects_node:
            ident = obj.get('id', '')
            if ident:
                self.objects[f"{obj.get('name', '') or 'Без названия'} (ID {ident})"] = ident
        if self.original_object and self.original_object not in ('0', *self.objects.values()):
            self.objects[f'Не найден (ID {self.original_object})'] = self.original_object
        group = values.get('group', '5')
        codes = list(dict.fromkeys([str(i) for i in range(10)] +
                                   [p.get('group', '') for p in doc.params_node.findall('param') if p.get('group')]))
        self.group_values = {group_label(code): code for code in codes}
        self.group_values.setdefault(group_label(group), group)
        initial_object = next((label for label, ident in self.objects.items() if ident == self.original_object), 'Нет')
        self.variables = {key: tk.StringVar(value=value) for key, value in {
            'name': values.get('name', ''), 'group': group_label(group),
            'number': values.get('number', str(next_group_number(doc.params_node.findall('param'), group))),
            'object': initial_object, 'sign': values.get('sign', ''),
            'codingType': values.get('codingType', '1'),
        }.items()}
        body = ttk.Frame(self, padding=14)
        body.grid(sticky='nsew')
        fields = [('name', 'Наименование', None),
                  ('group', 'Группа', tuple(self.group_values)),
                  ('number', 'Номер в группе', None),
                  ('object', 'Объект', tuple(self.objects)),
                  ('sign', 'Обозначение', None),
                  ('codingType', 'Тип кодирования (код)', None)]
        for row, (key, label, choices) in enumerate(fields):
            ttk.Label(body, text=label).grid(row=row, column=0, sticky='w', padx=(0, 12), pady=4)
            if choices:
                widget = ttk.Combobox(body, textvariable=self.variables[key], values=choices,
                                      state='readonly', width=40)
                if key == 'group' and node is None:
                    widget.bind('<<ComboboxSelected>>', self._group_changed)
            else:
                widget = ttk.Entry(body, textvariable=self.variables[key], width=43)
            widget.grid(row=row, column=1, sticky='ew', pady=4)
            if key == 'name': self.name_entry = widget
        ttk.Label(body, text='Номер предлагается автоматически при выборе группы; его можно изменить.' if node is None
                  else 'ID и дополнительные XML-атрибуты сохраняются.', wraplength=430).grid(
                      row=len(fields), column=0, columnspan=2, sticky='w', pady=(8, 0))
        buttons = ttk.Frame(body)
        buttons.grid(row=len(fields)+1, column=0, columnspan=2, sticky='e', pady=(10, 0))
        ttk.Button(buttons, text='Отмена', command=self.destroy).pack(side='right', padx=(6, 0))
        ttk.Button(buttons, text='Сохранить', command=self._accept).pack(side='right')
        body.columnconfigure(1, weight=1)
        self.transient(master)
        self.grab_set()
        self.bind('<Escape>', lambda _e: self.destroy())
        self.bind('<Return>', lambda _e: self._accept())
        self.wait_visibility()
        self.name_entry.focus_set()

    def _group_changed(self, _event=None):
        group = self.group_values[self.variables['group'].get()]
        self.variables['number'].set(str(next_group_number(self.doc.params_node.findall('param'), group)))

    def _accept(self):
        data = {key: value.get() for key, value in self.variables.items()}
        if not data['name'].strip():
            messagebox.showerror('Параметр', 'Укажите наименование параметра.', parent=self)
            return
        if not data['number'].isdigit() or int(data['number']) < 1:
            messagebox.showerror('Параметр', 'Номер должен быть положительным целым числом.', parent=self)
            return
        if not data['codingType'].strip():
            messagebox.showerror('Параметр', 'Укажите код типа кодирования.', parent=self)
            return
        self.result = {'name': data['name'].strip(), 'group': self.group_values[data['group']],
                       'number': data['number'], 'sign': data['sign'],
                       'codingType': data['codingType'], 'o': self.objects[data['object']]}
        self.destroy()
