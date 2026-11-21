"""One shared, theme-aware tooltip controller for application buttons."""
from __future__ import annotations
from .i18n import tr
import re
import tkinter as tk
from tkinter import ttk
from .ui_theme import PALETTES


BUTTON_HINTS = {
    tr('+ Новый проект'): tr('Создать новый проект со структурой СПД.'),
    tr('Открыть .is2'): tr('Открыть существующий проект из файла .is2.'),
    tr('Сохранить'): tr('Сохранить текущий проект в файл.'),
    tr('Отменить'): tr('Отменить последнее изменение проекта.'),
    tr('Повторить'): tr('Повторить последнее отменённое изменение.'),
    tr('Проверить проект'): tr('Проверить структуру проекта и ссылки на ошибки.'),
    tr('Экспорт…'): tr('Открыть меню экспорта схем, форм и отчётов.'),
    tr('Формирование СПД'): tr('Открыть редактор структуры предметных действий.'),
    tr('Декомпозиция'): tr('Открыть диаграмму и листы декомпозиции.'),
    tr('Параметры'): tr('Открыть таблицу параметров проекта.'),
    tr('Объекты'): tr('Открыть таблицу объектов проекта.'),
    tr('Спецификации'): tr('Открыть формы спецификаций проекта.'),
    tr('Матричная диаграмма'): tr('Открыть связи действий с параметрами в матрице.'),
    tr('Дополнительно'): tr('Открыть дополнительные представления и инструменты.'),
    tr('+ Корневое'): tr('Создать новое корневое действие.'),
    tr('+ Дочернее'): tr('Создать действие внутри выбранного и выбрать его тип.'),
    tr('Вставить до'): tr('Вставить действие перед выбранным на том же уровне.'),
    tr('Вставить после'): tr('Вставить действие после выбранного на том же уровне.'),
    tr('Условия ветвей…'): tr('Изменить подписи двух ветвей выбранной альтернативы.'),
    '↑': tr('Переместить выбранный элемент выше.'),
    '↓': tr('Переместить выбранный элемент ниже.'),
    tr('Удалить'): tr('Удалить выбранный элемент в текущем разделе.'),
    tr('Перенумеровать z…'): tr('Переназначить коды действий по уровням структуры.'),
    tr('Изменить конструкцию ▾'): tr('Выбрать тип конструкции для выбранного действия.'),
    tr('Общая схема'): tr('Показать основные уровни проекта и выходы альтернатив.'),
    tr('Вся декомпозиция'): tr('Показать все уровни структуры действий.'),
    tr('Лист действия'): tr('Показать схему для выбранного действия.'),
    '−': tr('Уменьшить масштаб схемы.'),
    '+': tr('Увеличить масштаб схемы.'),
    '＋': tr('Увеличить масштаб схемы.'),
    tr('Вписать'): tr('Подобрать масштаб так, чтобы схема поместилась в окне.'),
    tr('Экспорт SVG'): tr('Сохранить текущую схему в формате SVG.'),
    tr('⛶ На весь экран'): tr('Скрыть панели и увеличить рабочую область схемы.'),
    tr('← Вернуться'): tr('Восстановить панели и кнопки приложения.'),
    tr('Проверить модель'): tr('Проверить структуру и полноту модели.'),
    '×': tr('Очистить строку поиска.'),
    tr('Сохранить свойства действия'): tr('Применить изменения свойств выбранного действия.'),
    tr('+ Функция (*)'): tr('Добавить выбранный параметр как функцию действия.'),
    tr('+ Аргумент (+)'): tr('Добавить выбранный параметр как аргумент действия.'),
    tr('Убрать выбранную связь'): tr('Удалить выделенную связь действия с параметром.'),
    tr('+ Новый параметр…'): tr('Создать новый параметр проекта.'),
    tr('+ Новый объект…'): tr('Создать новый объект проекта.'),
    tr('Диаграмма'): tr('Открыть графическое представление декомпозиции.'),
    tr('Дерево и редактирование'): tr('Открыть дерево действий и команды редактирования.'),
    tr('Полная диаграмма'): tr('Показать полную диаграмму декомпозиции.'),
    '◀': tr('Открыть предыдущий лист диаграммы.'),
    '▶': tr('Открыть следующий лист диаграммы.'),
    tr('Сохранить SVG…'): tr('Сохранить текущую диаграмму в SVG.'),
    tr('Сохранить все…'): tr('Сохранить полную диаграмму и все листы в SVG.'),
    tr('Паспорт'): tr('Открыть свойства проекта и сведения о пользователе.'),
    tr('Техническая схема'): tr('Открыть техническое представление структуры.'),
    tr('Категории (cs)'): tr('Открыть категории предметной области.'),
    tr('Связи (cs)'): tr('Открыть связи категорий предметной области.'),
    'spz / content': tr('Открыть данные и связи динамической структуры.'),
    tr('Граф связей'): tr('Открыть граф связей проекта.'),
    'XML': tr('Показать XML текущего проекта.'),
    tr('Обновить'): tr('Обновить данные текущего представления.'),
    tr('Закрыть'): tr('Закрыть это окно.'),
    tr('Отмена'): tr('Закрыть окно без применения изменений.'),
    tr('Добавить'): tr('Добавить элемент в текущем разделе.'),
    tr('Добавить…'): tr('Открыть окно добавления элемента.'),
    tr('Удалить…'): tr('Удалить выбранный элемент.'),
    tr('Изменить паспорт'): tr('Изменить сведения о проекте и пользователе.'),
    tr('Печатать все формы…'): tr('Подготовить все формы к печати.'),
    tr('Доп. XML…'): tr('Изменить дополнительные XML-атрибуты параметра.'),
    tr('Назначить объект…'): tr('Назначить объект выбранному параметру.'),
    tr('Снять объект'): tr('Убрать привязку выбранного параметра к объекту.'),
    tr('Обновить схему'): tr('Перестроить техническую схему по данным проекта.'),
    tr('Изменить выбранное действие'): tr('Открыть свойства выбранного действия.'),
    tr('Применить'): tr('Применить введённые изменения.'),
    tr('Новый корень'): tr('Добавить корневое действие.'),
    tr('Добавить дочерний'): tr('Добавить дочернее действие к выбранному.'),
    tr('Изменить'): tr('Изменить выбранный элемент.'),
    tr('Преобразовать…'): tr('Изменить тип конструкции выбранного действия.'),
    tr('Вставить до…'): tr('Вставить действие перед выбранным.'),
    tr('Вставить после…'): tr('Вставить действие после выбранного.'),
    tr('+ Связь…'): tr('Добавить связь действия и параметра.'),
    tr('− Связь…'): tr('Удалить связь действия и параметра.'),
    tr('Кратность…'): tr('Изменить кратность выбранной связи.'),
    'CSV…': tr('Экспортировать матрицу в CSV.'),
    tr('Автораскладка'): tr('Автоматически расположить узлы графа.'),
    tr('Развернуть всё'): tr('Развернуть все группы графа.'),
    tr('Показать'): tr('Применить фильтр и показать граф.'),
    tr('Сбросить'): tr('Сбросить фильтр графа.'),
    tr('Изменить выбранную'): tr('Изменить выбранную связь на графе.'),
    tr('Удалить выбранную'): tr('Удалить выбранную связь на графе.'),
    tr('＋ Создать на графе'): tr('Создать новую связь через граф.'),
}


def button_hint(caption: str) -> str:
    """Explain a button; retain a readable fallback for dynamic captions."""
    text = caption.strip()
    if text in BUTTON_HINTS:
        return BUTTON_HINTS[text]
    if text.startswith(('☼', '☾')):
        return tr('Переключить светлую и тёмную темы.')
    if re.fullmatch(r'[A-Za-zА-Яа-я]\d+(?:\.\d+)?', text):
        return tr('Открыть лист действия {code}.').format(code=text)
    if text.startswith(tr('Форма') + ' '):
        return tr('Показать выбранную форму спецификации.')
    if text.startswith('ID '):
        return tr('Открыть лист действия {code}.').format(code=text)
    if text:
        return tr('Команда: {command}.').format(command=text.rstrip('…'))
    return ''


class ButtonTooltips:
    """Schedule one hover window at a time, without per-button bindings."""
    def __init__(self, root, enabled, theme, *, delay_ms=600):
        self.root = root
        self.enabled = enabled
        self.theme = theme
        self.delay_ms = delay_ms
        self._job = None
        self._target = None
        self._window = None
        for event, callback in (('<Enter>', self._enter), ('<Leave>', self._leave),
                                ('<ButtonPress>', self._leave), ('<Destroy>', self._destroyed)):
            root.bind_all(event, callback, add='+')

    def _enter(self, event):
        widget = event.widget
        if not isinstance(widget, (ttk.Button, tk.Button, ttk.Menubutton)):
            return
        self.hide()
        if not self.enabled.get():
            return
        try:
            text = getattr(widget, '_tooltip_text', None) or button_hint(widget.cget('text'))
            if not text:
                return
            self._target = widget
            self._job = self.root.after(self.delay_ms, lambda: self._show(widget, text))
        except tk.TclError:
            self.hide()

    def _leave(self, event):
        if event.widget is self._target:
            self.hide()

    def _destroyed(self, event):
        if event.widget is self._target or event.widget is self.root:
            self.hide()

    def hide(self):
        if self._job is not None:
            job, self._job = self._job, None
            try:
                self.root.after_cancel(job)
            except tk.TclError:
                pass
        if self._window is not None:
            window, self._window = self._window, None
            try:
                window.destroy()
            except tk.TclError:
                pass
        self._target = None

    def _show(self, widget, text):
        self._job = None
        try:
            if not self.enabled.get() or widget is not self._target or not widget.winfo_exists():
                return
            palette = PALETTES.get(self.theme.get(), PALETTES['dark'])
            window = tk.Toplevel(self.root)
            self._window = window
            window.wm_overrideredirect(True)
            tk.Label(window, text=text, justify='left', wraplength=360,
                     background=palette['surface'], foreground=palette['ink'],
                     highlightbackground=palette['button_border'], highlightthickness=1,
                     padx=9, pady=6).pack()
            window.update_idletasks()
            x = min(widget.winfo_rootx(), max(0, window.winfo_screenwidth()-window.winfo_reqwidth()))
            below = widget.winfo_rooty()+widget.winfo_height()+5
            y = below if below+window.winfo_reqheight() <= window.winfo_screenheight() else max(0, widget.winfo_rooty()-window.winfo_reqheight()-5)
            window.wm_geometry(f'+{max(0,x)}+{max(0,y)}')
        except tk.TclError:
            self.hide()
