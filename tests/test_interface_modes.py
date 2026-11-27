"""Simple/full interface modes rearrange the same widgets; nothing is lost."""
import os
import tempfile
import tkinter as tk
import unittest
from unittest import mock

from is2_re import ui_theme


class RecentFilesTests(unittest.TestCase):
    def test_recent_files_dedupe_and_limit(self):
        with tempfile.TemporaryDirectory() as folder, \
                mock.patch.object(ui_theme, '_preferences_path', lambda: __import__('pathlib').Path(folder) / 'a.json'):
            for i in range(12):
                ui_theme.remember_recent_file(os.path.join(folder, f'p{i}.is2'))
            ui_theme.remember_recent_file(os.path.join(folder, 'p5.is2'))
            items = ui_theme.load_recent_files()
            self.assertEqual(len(items), ui_theme.RECENT_FILES_LIMIT)
            self.assertTrue(items[0].endswith('p5.is2'))
            self.assertEqual(len(set(items)), len(items))
            self.assertEqual(ui_theme.load_interface_mode(), 'simple')
            ui_theme.save_interface_mode('full')
            self.assertEqual(ui_theme.load_interface_mode(), 'full')


class InterfaceModeTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.patch = mock.patch.dict(os.environ, {'XDG_CONFIG_HOME': self.tmp.name, 'APPDATA': self.tmp.name,
                                                  'XDG_DATA_HOME': self.tmp.name, 'LOCALAPPDATA': self.tmp.name})
        self.patch.start()
        try:
            from is2_re.gui import Is2Studio
            self.app = Is2Studio()
        except tk.TclError as exc:
            self.patch.stop()
            self.tmp.cleanup()
            self.skipTest(f'no display: {exc}')
        self.app.update()

    def tearDown(self):
        self.app.dirty = False
        self.app.destroy()
        self.patch.stop()
        self.tmp.cleanup()

    def mapped(self, widget):
        self.app.update()
        return bool(widget.winfo_ismapped())

    def menubar_labels(self):
        bar = self.app._menubar
        return [bar.entrycget(i, 'label') for i in range(bar.index('end') + 1)]

    def test_default_is_simple_and_switching_keeps_every_command(self):
        app, panel = self.app, self.app.course_panel
        self.assertEqual(app.interface_mode, 'simple')
        for _ in range(3):
            app.set_interface_mode('full', save=False)
            self.assertTrue(self.mapped(app._full_toolbar))
            self.assertTrue(self.mapped(panel._title_row))
            self.assertTrue(self.mapped(panel._view_buttons['svg']))
            self.assertTrue(self.mapped(app._matrix_csv_button) or not self.mapped(app.matrix_page))
            self.assertFalse(self.mapped(app.menu_button))
            self.assertNotIn('Повторить', self.menubar_labels()[-1:])
            app.set_interface_mode('simple', save=False)
            self.assertFalse(self.mapped(app._full_toolbar))
            self.assertFalse(self.mapped(panel._title_row))
            self.assertFalse(self.mapped(panel._view_buttons['svg']))
            self.assertTrue(self.mapped(app.menu_button))
            self.assertEqual(self.menubar_labels()[-2:], ['Отменить', 'Повторить'])
            for widget in panel._structure_buttons + [panel._view_buttons['root'], panel._view_buttons['full'],
                                                      panel._is2_mode_button, panel._focus_button, app.theme_button,
                                                      app.tooltip_button, app.interface_button]:
                self.assertTrue(widget.winfo_exists())
        self.assertEqual(sum(1 for b in panel._structure_buttons if self.mapped(b)), len(panel._structure_buttons))

    def test_side_menu_opens_with_all_sections(self):
        app = self.app
        sections = [title for title, _items in app._side_menu_entries()]
        self.assertEqual(sections, ['Проект', 'Последние файлы', 'Проверка', 'Экспорт', 'Вид'])
        callables = [cb for _t, items in app._side_menu_entries() for _l, cb in items if cb is not None]
        self.assertTrue(all(callable(cb) for cb in callables))
        app.side_menu.open()
        self.assertTrue(self.mapped(app.side_menu))
        app._escape_diagram_focus()
        self.assertFalse(app.side_menu.is_open)

    def test_tree_toggle_and_sheet_strip(self):
        from is2_re.coursework import create_course_project
        app, panel = self.app, self.app.course_panel
        doc = create_course_project('t', 'root')
        seq = doc.add_action('seq', action_type='2', parent_id='1')
        doc.add_action('a', action_type='0', parent_id=seq)
        doc.add_action('b', action_type='0', parent_id=seq)
        from is2_re.specifications import action_code
        for param in doc.root.iter('param'):
            if param.get('decStr') is not None:
                param.set('decStr', action_code(doc.action(seq)) + ';')   # seq is a sheet head
        app.doc = doc
        app._reset_history(saved=True)
        app.refresh_all()
        app._set_enabled(True)
        self.assertFalse(panel._tree_visible())                 # hidden by default in simple mode
        panel._tree_button.invoke()
        self.assertTrue(panel._tree_visible())
        self.assertTrue(ui_theme.load_spd_tree_visible())
        panel._tree_button.invoke()
        self.assertFalse(panel._tree_visible())
        sheets = panel._sheet_list()
        self.assertEqual(sheets[0][0], None)                    # «Общая схема»
        self.assertIn(seq, [key for key, _label in sheets])
        panel._select_sheet(seq)
        self.assertEqual((panel.focus_id, panel.depth_limit), (seq, 'spd-sheet'))
        self.assertIn('selected', panel._sheet_strip._buttons[seq].state())
        panel._select_sheet(None)
        self.assertIsNone(panel.focus_id)
        app.set_interface_mode('full', save=False)
        self.assertTrue(panel._tree_visible())                  # the classic layout always shows the tree
        self.assertFalse(self.mapped(panel._sheet_strip))
        app.set_interface_mode('simple', save=False)
        self.assertFalse(panel._tree_visible())
        self.assertTrue(self.mapped(panel._sheet_strip))

    def test_right_group_alignment_and_menu_overlay(self):
        app, panel = self.app, self.app.course_panel
        for width in (2400, 1300):
            app.geometry(f'{width}x900')
            for _ in range(5):
                self.app.update()
            # Right group: on the command row if it fits, else at the end of the sheet strip.
            buttons = [panel._renumber_button, panel._is2_mode_button, panel._focus_button]
            for left, right in zip(buttons, buttons[1:]):
                gap = right.winfo_rootx() - (left.winfo_rootx() + left.winfo_width())
                self.assertGreaterEqual(gap, 3, width)
            self.assertTrue(all(b.winfo_ismapped() for b in buttons))
            first = panel._tree_button
            self.assertLessEqual(abs(first.winfo_rootx() - app.menu_button.winfo_rootx()), 1, width)
            self.assertLessEqual(abs(panel._sheet_strip.winfo_rootx() - first.winfo_rootx()), 1)
        first_tab = next(iter(app.navigation_buttons.values()))
        before = first_tab.winfo_rootx()
        app.side_menu.open()
        self.app.update()
        self.assertEqual(first_tab.winfo_rootx(), before)          # the menu lies over the row
        self.assertLessEqual(app.side_menu.winfo_rooty(), app.menu_button.winfo_rooty())
        app.side_menu.close()
        self.app.update()
        self.assertTrue(app.menu_button.winfo_ismapped())

    def test_mode_is_saved(self):
        self.app.toggle_interface_mode()
        self.assertEqual(ui_theme.load_interface_mode(), 'full')
        self.assertIn('полный', self.app.interface_button.cget('text'))


if __name__ == '__main__':
    unittest.main()
