import json
import tempfile
import unittest
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch
from is2_re.tooltips import ButtonTooltips, button_hint
from is2_re import ui_theme


class FakeButton:
    def __init__(self, text): self.text = text
    def cget(self, name): return self.text
    def winfo_exists(self): return True

class FakeRoot:
    def __init__(self): self.jobs = {}; self.bindings = {}; self.counter = 0
    def bind_all(self, event, callback, add): self.bindings[event] = callback
    def after(self, delay, callback):
        self.counter += 1; self.jobs[self.counter] = callback; return self.counter
    def after_cancel(self, job): self.jobs.pop(job, None)

class FakeValue:
    def __init__(self, value): self.value = value
    def get(self): return self.value

class TooltipTests(unittest.TestCase):
    def test_settings_preserve_theme_tooltip_and_unknown_fields(self):
        with tempfile.TemporaryDirectory() as folder:
            path = Path(folder) / 'appearance.json'
            with patch.object(ui_theme, '_preferences_path', return_value=path):
                path.write_text('{"theme":"light", "other": 7}', encoding='utf-8')
                self.assertTrue(ui_theme.save_tooltips(False))
                self.assertEqual(ui_theme.load_theme(), 'light')
                self.assertFalse(ui_theme.load_tooltips())
                self.assertTrue(ui_theme.save_theme('dark'))
                self.assertEqual(json.loads(path.read_text(encoding='utf-8')), {'theme':'dark','button_tooltips':False,'other':7})
                self.assertFalse(ui_theme.load_tooltips())

    def test_hover_cancellation_disable_and_single_pending_job(self):
        root=FakeRoot(); enabled=FakeValue(True); theme=FakeValue('dark')
        with patch('is2_re.tooltips.ttk.Button', FakeButton), patch('is2_re.tooltips.tk.Button', FakeButton), patch('is2_re.tooltips.ttk.Menubutton', FakeButton):
            manager=ButtonTooltips(root, enabled, theme)
            a=FakeButton('Сохранить'); b=FakeButton('Удалить')
            manager._enter(SimpleNamespace(widget=a))
            self.assertEqual(len(root.jobs),1)
            old=manager._job
            manager._enter(SimpleNamespace(widget=b))
            self.assertNotIn(old,root.jobs)
            self.assertEqual(len(root.jobs),1)
            manager._leave(SimpleNamespace(widget=b))
            self.assertEqual(root.jobs,{})
            enabled.value=False
            manager._enter(SimpleNamespace(widget=a))
            self.assertEqual(root.jobs,{})

    def test_button_hints_for_controls_and_dynamic_action_tabs(self):
        self.assertIn('код', button_hint('Перенумеровать z…'))
        self.assertIn('лист действия z6.10', button_hint('z6.10'))
        self.assertIn('тем', button_hint('☼ Светлая'))
        self.assertEqual(button_hint(''), '')

if __name__ == '__main__': unittest.main()
