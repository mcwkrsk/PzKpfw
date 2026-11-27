import os
import tempfile
import unittest
from pathlib import Path
from unittest import mock

from is2_re.backups import backup_directory, create_project_backup, list_project_backups, legacy_backup_directory
from is2_re.coursework import SHEET_DEPTH, SPD_SHEET_DEPTH, build_course_scene, sheet_actions, spd_sheet_heads
from is2_re.document import ProjectDocument
from is2_re.specifications import action_code

SAMPLE = Path(__file__).parent / 'data' / 'is2_sheets_variant2.is2'


class SheetListTests(unittest.TestCase):
    def setUp(self):
        self.doc = ProjectDocument.from_bytes(SAMPLE.read_bytes())

    def test_sheets_match_is2(self):
        # The list IS-2 itself shows for this project (alternatives and loop
        # bodies have no sheet; order is level, then number).
        codes = [action_code(self.doc.action(i)) for i in sheet_actions(self.doc)]
        self.assertEqual(codes, 'z11 z32 z41 z42 z43 z44 z46 z47 z51 z5.10 z5.11 z5.13 z68'.split())

    def test_sheet_draws_alternatives_and_loop_body_inline(self):
        codes = lambda ident: {n.code for n in build_course_scene(self.doc, ident, max_depth=SHEET_DEPTH).nodes}
        self.assertEqual(codes('1'), {'z11', 'z21', 'z31', 'z32', 'z33', 'z47', 'z48'})
        self.assertEqual(codes('23'), {'z5.10', 'z69', 'z6.10', 'z6.11', 'z6.12', 'z74', 'z75', 'z83', 'z84'})


class SpdSheetTests(unittest.TestCase):
    def setUp(self):
        self.doc = ProjectDocument.from_bytes(SAMPLE.read_bytes())

    def test_spd_sheets_come_from_decstr(self):
        # «Формирование СПД» sheets are the root plus the heads stored in
        # ModuleParams/PrimaryModelAuto/@decStr ("z32;z43;z44;z46;z52;z5.12;z5.13;").
        codes = [action_code(self.doc.action(i)) for i in spd_sheet_heads(self.doc)]
        self.assertEqual(codes, 'z11 z32 z43 z44 z46 z52 z5.12 z5.13'.split())

    def test_spd_sheet_stops_at_other_heads(self):
        codes = [n.code for n in build_course_scene(self.doc, '9', max_depth=SPD_SHEET_DEPTH).nodes]
        self.assertIn('z5.12', codes)          # another sheet's head is drawn as a leaf
        self.assertNotIn('z6.15', codes)       # ...its children are on its own sheet
        self.assertIn('z6.12', codes)          # the rest of the subtree is on this sheet
        self.assertIn('z83', codes)


class BackupLocationTests(unittest.TestCase):
    def test_backups_go_to_the_app_folder_not_beside_the_project(self):
        with tempfile.TemporaryDirectory() as tmp:
            tmp = Path(tmp)
            project = tmp / 'downloads' / 'p.is2'
            project.parent.mkdir()
            project.write_bytes(SAMPLE.read_bytes())
            env = {'LOCALAPPDATA': str(tmp / 'local'), 'XDG_DATA_HOME': str(tmp / 'local')}
            with mock.patch.dict(os.environ, env):
                info = create_project_backup(project)
                self.assertFalse((project.parent / '.pzkpfw-backups').exists())
                self.assertTrue(str(info.path).startswith(str(tmp / 'local')))
                self.assertEqual((backup_directory(project) / 'source.txt').read_text(encoding='utf-8').strip(),
                                 str(project.resolve()))
                # Copies made by older versions beside the project are still listed.
                legacy = legacy_backup_directory(project)
                legacy.mkdir(parents=True)
                (legacy / '20200101T000000.000000Z_old.is2.bak').write_bytes(SAMPLE.read_bytes())
                self.assertEqual(len(list_project_backups(project)), 2)


if __name__ == '__main__':
    unittest.main()
