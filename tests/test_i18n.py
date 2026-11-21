import ast
import json
import tempfile
import unittest
from unittest import mock
from pathlib import Path

from is2_re import i18n


class LocalizationTests(unittest.TestCase):
    def setUp(self):
        self.previous = i18n.get_language()

    def tearDown(self):
        i18n.set_language(self.previous, persist=False)

    def test_all_requested_builtin_languages_are_discovered(self):
        locales = {item.locale for item in i18n.available_languages()}
        self.assertTrue({"ru", "en", "uk", "de", "fr", "es", "he", "el", "ru_pre1918"}.issubset(locales))

    def test_repair_diagnostics_and_policy_reasons_follow_active_locale(self):
        from is2_re.repair import RepairError, _DOMAIN_LABELS, _can_clear, parse_repair_selector

        for locale in ("en", "uk", "de", "fr", "es", "he", "el", "ru_pre1918"):
            i18n.set_language(locale, persist=False)
            with self.assertRaises(RepairError) as caught:
                parse_repair_selector("not-a-selector")
            self.assertEqual(
                str(caught.exception),
                i18n.tr("Селектор должен иметь формат KIND:INDEX:SLOT; получено: {value}").format(value=repr("not-a-selector")),
            )
            allowed, reason = _can_clear({"relation_kind": "aie_binary_link", "slot": "e1"}, None)
            self.assertTrue(allowed)
            self.assertNotEqual(i18n.tr(reason), reason)
            for label in _DOMAIN_LABELS.values():
                self.assertTrue(i18n.tr(label).strip())

    def test_dynamic_status_messages_are_translated_without_changing_identifiers(self):
        cases = [
            ("Создан объект {ident}", {"ident": "obj-17"}),
            ("Удалена связь через граф: {kind} [{index}]", {"kind": "SCBinaryLink", "index": "3"}),
            ("Пересчитан AutoRange: {count} связей в {groups} группах", {"count": "12", "groups": "4"}),
            ("Сохранено: {path}", {"path": "C:/project.is2"}),
            ("Количество записей ModuleParams / Module: {count}", {"count": "2"}),
        ]
        for locale in ("en", "uk", "de", "fr", "es", "he", "el", "ru_pre1918"):
            i18n.set_language(locale, persist=False)
            for template, values in cases:
                source = template.format(**values)
                expected = i18n.tr(template).format(**values)
                actual = i18n.tr_dynamic(source)
                self.assertEqual(actual, expected, f"{locale}: {template}")
                for value in values.values():
                    self.assertIn(value, actual)
            self.assertEqual(i18n.tr_dynamic("Пользовательский текст не переводится"), "Пользовательский текст не переводится")

    def test_language_switch_and_russian_fallback(self):
        i18n.set_language("en", persist=False)
        self.assertEqual(i18n.tr("Файл"), "File")
        self.assertEqual(i18n.tr("Строка без перевода"), "Строка без перевода")
        i18n.set_language("de", persist=False)
        self.assertEqual(i18n.tr("Сохранить"), "Speichern")

    def test_source_language_is_complete_by_definition(self):
        translated, total = i18n.translation_stats("ru")
        self.assertEqual(translated, total)
        self.assertGreater(total, 300)
        self.assertEqual(i18n.validate_pack(i18n._builtin_dir() / "ru"), [])

    def test_hebrew_pack_declares_rtl(self):
        self.assertEqual(i18n.get_language_info("he").direction, "rtl")

    def test_hebrew_and_greek_catalogues_do_not_contain_foreign_scripts(self):
        hebrew = i18n.get_language_info("he").messages
        self.assertTrue(any("\u0590" <= char <= "\u05ff" for value in hebrew.values() for char in value))
        self.assertFalse(
            any("\u0600" <= char <= "\u06ff" for value in hebrew.values() for char in value),
            "Hebrew catalogue contains Arabic-script text",
        )
        greek = i18n.get_language_info("el").messages
        self.assertTrue(any("\u0370" <= char <= "\u03ff" for value in greek.values() for char in value))
        self.assertFalse(
            any("\u0400" <= char <= "\u04ff" for value in greek.values() for char in value),
            "Greek catalogue contains Cyrillic text",
        )

    def test_repair_dialog_dynamic_column_title_is_localized(self):
        for locale, expected in {
            "en": "New ID", "uk": "Новий ID", "de": "Neue ID", "fr": "Nouvel ID",
            "es": "Nuevo ID", "he": "מזהה חדש", "el": "Νέο ID", "ru_pre1918": "Новый ID",
        }.items():
            i18n.set_language(locale, persist=False)
            self.assertEqual(i18n.tr("Новый ID"), expected)

    def test_save_preference_does_not_switch_running_process(self):
        previous = i18n.get_language()
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "appearance.json"
            with mock.patch.object(i18n, "preferences_path", return_value=path):
                self.assertTrue(i18n.save_language_preference("en"))
                self.assertEqual(i18n.get_language(), previous)
                self.assertEqual(json.loads(path.read_text(encoding="utf-8"))["language"], "en")

    def test_plural_categories(self):
        self.assertEqual(i18n.plural_category("uk", 1), "one")
        self.assertEqual(i18n.plural_category("uk", 3), "few")
        self.assertEqual(i18n.plural_category("uk", 12), "many")
        self.assertEqual(i18n.plural_category("he", 2), "two")

    def test_pack_validation_detects_placeholder_mismatch(self):
        with tempfile.TemporaryDirectory() as tmp:
            folder = Path(tmp) / "xx"
            folder.mkdir()
            (folder / "language.json").write_text(json.dumps({
                "format_version": 1, "locale": "xx", "native_name": "X", "english_name": "X", "direction": "ltr"
            }), encoding="utf-8")
            (folder / "messages.json").write_text(json.dumps({"Item {name}": "Elemento {other}"}), encoding="utf-8")
            errors = i18n.validate_pack(folder, source_messages=["Item {name}"])
            self.assertTrue(any("placeholders differ" in item for item in errors))

    def test_user_language_pack_can_be_discovered_without_code_changes(self):
        self.addCleanup(i18n.discover_languages)
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            folder = root / "pt_BR"
            folder.mkdir()
            (folder / "language.json").write_text(json.dumps({
                "format_version": 1, "locale": "pt_BR", "native_name": "Português (Brasil)",
                "english_name": "Portuguese (Brazil)", "direction": "ltr"
            }), encoding="utf-8")
            (folder / "messages.json").write_text(json.dumps({"Файл": "Arquivo"}), encoding="utf-8")
            with mock.patch.object(i18n, "user_locales_dir", return_value=root):
                i18n.discover_languages()
                self.assertIn("pt_BR", {item.locale for item in i18n.available_languages()})
                self.assertEqual(i18n.get_language_info("pt_BR").messages["Файл"], "Arquivo")

    def test_course_editor_strings_are_translated_in_all_requested_locales(self):
        source = [
            "Альтернатива", "Общая схема", "+ Корневое", "+ Дочернее", "Вставить до",
            "Вставить после", "Условия ветвей…", "Вся декомпозиция", "Проверить модель",
            "Сохранить SVG…", "Сохранить все…", "Полная диаграмма", "Аналитическая",
            "Алгоритмическая", "Промежуточное", "(без названия)", "Весь проект",
            "Варианты альтернативы", "Показано: {shown} из {total}",
            "Вид ИС-2 · {title} · {zoom}%", "Изменены свойства действия {action_id}",
            "Подписи альтернативы {action_id}",
            "Обработано действий: {count}\nИзменено: {changed}",
            "Действий: {actions} (элементарных: {elementary}); параметров: {parameters}; объектов: {objects}",
            "Формы: {forms}", "Схема SVG сохранена: {path}",
            "Сохранено SVG-файлов: {count}", "Новое действие {index}",
            "Неизвестный класс {class_id}", "Неизвестная связь {link_type}",
        ]
        for locale in ("en", "uk", "de", "fr", "es", "he", "el", "ru_pre1918"):
            pack = i18n.get_language_info(locale)
            for message in source:
                translated = pack.messages.get(message)
                self.assertIsInstance(translated, str, f"{locale}: missing {message!r}")
                self.assertTrue(translated.strip(), f"{locale}: empty {message!r}")
                self.assertEqual(i18n._placeholders(message), i18n._placeholders(translated),
                                 f"{locale}: placeholder mismatch for {message!r}")

    def test_every_tooltip_call_has_a_translation_in_all_requested_locales(self):
        tooltip_path = Path(__file__).parents[1] / "src" / "is2_re" / "tooltips.py"
        tree = ast.parse(tooltip_path.read_text(encoding="utf-8"))
        messages = {
            node.args[0].value
            for node in ast.walk(tree)
            if isinstance(node, ast.Call)
            and isinstance(node.func, ast.Name)
            and node.func.id == "tr"
            and node.args
            and isinstance(node.args[0], ast.Constant)
            and isinstance(node.args[0].value, str)
        }
        for locale in ("en", "uk", "de", "fr", "es", "he", "el", "ru_pre1918"):
            pack = i18n.get_language_info(locale)
            for message in messages:
                translated = pack.messages.get(message)
                self.assertIsInstance(translated, str, f"{locale}: missing tooltip {message!r}")
                self.assertTrue(translated.strip(), f"{locale}: empty tooltip {message!r}")
                self.assertEqual(i18n._placeholders(message), i18n._placeholders(translated),
                                 f"{locale}: placeholder mismatch for tooltip {message!r}")

    def test_primary_ui_call_sites_have_translations_in_all_locales(self):
        source_root = Path(__file__).parents[1] / "src" / "is2_re"
        files = ("gui.py", "course_gui.py", "decomposition_view.py", "tooltips.py")
        messages = set()
        for filename in files:
            tree = ast.parse((source_root / filename).read_text(encoding="utf-8"))
            messages.update(
                node.args[0].value
                for node in ast.walk(tree)
                if isinstance(node, ast.Call)
                and isinstance(node.func, ast.Name)
                and node.func.id == "tr"
                and node.args
                and isinstance(node.args[0], ast.Constant)
                and isinstance(node.args[0].value, str)
            )
        for locale in ("en", "uk", "de", "fr", "es", "he", "el", "ru_pre1918"):
            pack = i18n.get_language_info(locale)
            for message in messages:
                translated = pack.messages.get(message)
                self.assertTrue(translated and translated.strip(), f"{locale}: untranslated UI string {message!r}")
                self.assertEqual(i18n._placeholders(message), i18n._placeholders(translated),
                                 f"{locale}: placeholder mismatch for {message!r}")

    def test_record_dialog_titles_labels_and_choice_values_are_translated(self):
        source = Path(__file__).parents[1] / "src" / "is2_re" / "gui.py"
        tree = ast.parse(source.read_text(encoding="utf-8"))
        messages = set()

        def collect_field_specs(node):
            if isinstance(node, (ast.List, ast.Tuple)):
                for item in node.elts:
                    if not isinstance(item, (ast.List, ast.Tuple)):
                        continue
                    if len(item.elts) >= 2 and isinstance(item.elts[1], ast.Constant) and isinstance(item.elts[1].value, str):
                        messages.add(item.elts[1].value)
                    if len(item.elts) >= 4 and isinstance(item.elts[3], (ast.List, ast.Tuple)):
                        messages.update(
                            choice.value for choice in item.elts[3].elts
                            if isinstance(choice, ast.Constant) and isinstance(choice.value, str)
                        )

        for node in ast.walk(tree):
            if isinstance(node, ast.Assign) and any(isinstance(target, ast.Name) and target.id in {"fields", "field"} for target in node.targets):
                collect_field_specs(node.value)
            if isinstance(node, ast.Call) and ast.unparse(node.func).endswith("RecordDialog"):
                if len(node.args) >= 2:
                    title = node.args[1]
                    candidates = [title.body, title.orelse] if isinstance(title, ast.IfExp) else [title]
                    for candidate in candidates:
                        if isinstance(candidate, ast.Constant) and isinstance(candidate.value, str):
                            messages.add(candidate.value)
                if len(node.args) >= 3:
                    collect_field_specs(node.args[2])

        for locale in ("en", "uk", "de", "fr", "es", "he", "el", "ru_pre1918"):
            pack = i18n.get_language_info(locale)
            for message in messages:
                translated = pack.messages.get(message)
                self.assertTrue(translated and translated.strip(), f"{locale}: untranslated dialog string {message!r}")
                self.assertEqual(i18n._placeholders(message), i18n._placeholders(translated),
                                 f"{locale}: placeholder mismatch for dialog string {message!r}")

    def test_destructive_confirmation_strings_are_translated_in_all_locales(self):
        messages = [
            "Удалить выбранную запись {kind} [{index}]?",
            "Удалить запись spz/links[{index}]?",
            "Удалить запись content[{index}]?",
            "AElement {ident} используется в {count} spz-связях. Удалить также эти связи?\n\n{dependency_note}",
            "Удалить AElement {ident}?\n\n{dependency_note}",
            "Применить {count} исправлений одной операцией?\n\nДокумент изменится только в памяти редактора. Файл на диске не перезаписывается.",
            "Параметр {ident} нельзя безопасно удалить: ConceptModel/content содержит {count} записей, а связь этих записей с параметрами не подтверждена. Никаких изменений не внесено.",
            "Удалить параметр {ident}?\n\nПроверка: зависимые content-записи отсутствуют.",
            "Объект {ident} назначен параметрам: {ids}.\n\nУдалить объект и снять атрибут @o у перечисленных параметров?\nОперация будет одной записью Undo.",
            "Действие {ident} имеет дочерние элементы (всего в поддереве: {count}). Удалить всё поддерево?\n\n{dependency_note}",
            "С действиями поддерева связано {count} AEContentLink. Удалить и эти связи?\n\n{dependency_note}",
            "Удалить категорию {ident}?\n\n{dependency_note}",
        ]
        for locale in ("en", "uk", "de", "fr", "es", "he", "el", "ru_pre1918"):
            pack = i18n.get_language_info(locale)
            for message in messages:
                translated = pack.messages.get(message)
                self.assertTrue(translated and translated.strip(), f"{locale}: missing confirmation {message!r}")
                self.assertEqual(i18n._placeholders(message), i18n._placeholders(translated),
                                 f"{locale}: placeholder mismatch for {message!r}")

    def test_every_literal_tr_call_has_a_translation_in_all_locales(self):
        source_root = Path(__file__).parents[1] / "src" / "is2_re"
        messages = set()
        for source_file in source_root.glob("*.py"):
            tree = ast.parse(source_file.read_text(encoding="utf-8"))
            messages.update(
                node.args[0].value
                for node in ast.walk(tree)
                if isinstance(node, ast.Call)
                and isinstance(node.func, ast.Name)
                and node.func.id == "tr"
                and node.args
                and isinstance(node.args[0], ast.Constant)
                and isinstance(node.args[0].value, str)
            )
        for locale in ("en", "uk", "de", "fr", "es", "he", "el", "ru_pre1918"):
            pack = i18n.get_language_info(locale)
            for message in messages:
                translated = pack.messages.get(message)
                self.assertTrue(translated and translated.strip(), f"{locale}: untranslated message {message!r}")
                self.assertEqual(i18n._placeholders(message), i18n._placeholders(translated),
                                 f"{locale}: placeholder mismatch for {message!r}")

    def test_html_exports_and_matrix_descriptions_follow_active_locale(self):
        from is2_re.coursework import create_course_project
        from is2_re.exports import export_report, export_matrix_csv
        from is2_re.matrix_view import grouped_matrix, cell_description
        from is2_re.specifications import form_html

        doc = create_course_project("localized-export", "Root")
        parameter_id = doc.add_parameter({"name": "Input", "group": 1, "number": 1})

        i18n.set_language("en", persist=False)
        report = export_report(doc)
        self.assertIn('<html lang="en" dir="ltr">', report)
        self.assertIn("IS-2 project overview", report)
        self.assertNotIn("Обзор проекта ИС-2", report)
        self.assertIn("relation type", export_matrix_csv(doc).splitlines()[0].lower())
        form = form_html(doc)
        self.assertIn('<html lang="en" dir="ltr">', form)
        self.assertIn("Specifications and matrix diagram", form)
        headers, _rows, _ids, _warnings = grouped_matrix(doc)
        self.assertEqual(headers[0], "Struct.")
        self.assertIn("No stored relation", cell_description(doc, "1", parameter_id))

        i18n.set_language("he", persist=False)
        self.assertIn('<html lang="he" dir="rtl">', export_report(doc))
        self.assertIn('<html lang="he" dir="rtl">', form_html(doc))

    def test_placeholder_action_audit_recognizes_localized_names(self):
        from is2_re.document import ProjectDocument
        from is2_re.coursework import course_checklist

        doc = ProjectDocument.new_empty("localization-test")
        for locale in ("en", "uk", "de", "fr", "es", "he", "el", "ru_pre1918"):
            i18n.set_language(locale, persist=False)
            name = i18n.tr("Новое действие {index}").format(index=1)
            doc.add_action(name, action_type="0", status="0", formalization="0")
            self.assertIn(str(len(doc.actions)), course_checklist(doc)["placeholder_actions"])

    def test_pack_loader_rejects_folder_locale_mismatch(self):
        with tempfile.TemporaryDirectory() as tmp:
            folder = Path(tmp) / "xx"
            folder.mkdir()
            (folder / "language.json").write_text(json.dumps({
                "format_version": 1, "locale": "yy", "native_name": "Y", "english_name": "Y", "direction": "ltr"
            }), encoding="utf-8")
            (folder / "messages.json").write_text("{}", encoding="utf-8")
            with self.assertRaises(i18n.LocalizationError):
                i18n._load_pack(folder)


    def test_all_builtin_translation_catalogs_are_complete_and_in_sync(self):
        template_path = i18n._builtin_dir() / "_template" / "messages.json"
        source_messages = json.loads(template_path.read_text(encoding="utf-8"))
        self.assertGreaterEqual(len(source_messages), 900)
        for locale in ("en", "uk", "de", "fr", "es", "he", "el", "ru_pre1918"):
            pack = i18n.get_language_info(locale)
            self.assertEqual(set(pack.messages), set(source_messages), f"{locale}: catalog keys differ from template")
            for message in source_messages:
                translated = pack.messages.get(message)
                self.assertTrue(translated and translated.strip(), f"{locale}: empty translation for {message!r}")
                self.assertEqual(i18n._placeholders(message), i18n._placeholders(translated),
                                 f"{locale}: placeholder mismatch for {message!r}")
            self.assertEqual(i18n.validate_pack(pack.path), [], f"{locale}: package validation failed")


    def test_feature_audit_content_is_translated_in_all_locales(self):
        from is2_re.document import ProjectDocument
        from is2_re.feature_audit import feature_audit

        report = feature_audit(ProjectDocument.new_empty("localization-audit"))
        messages = [item[2] for item in __import__("is2_re.feature_audit", fromlist=["CAPABILITIES"]).CAPABILITIES]
        messages.extend(item["needed"] for item in report["missing_reference_data"])
        for locale in ("en", "uk", "de", "fr", "es", "he", "el", "ru_pre1918"):
            pack = i18n.get_language_info(locale)
            for message in messages:
                translated = pack.messages.get(message)
                self.assertTrue(translated and translated.strip(), f"{locale}: missing feature-audit text {message!r}")
                self.assertEqual(i18n._placeholders(message), i18n._placeholders(translated),
                                 f"{locale}: feature-audit placeholder mismatch for {message!r}")

    def test_dynamic_button_label_loops_are_translated(self):
        source_root = Path(__file__).parents[1] / "src" / "is2_re"
        messages = set()
        for source_file in source_root.glob("*.py"):
            tree = ast.parse(source_file.read_text(encoding="utf-8"))
            for node in ast.walk(tree):
                if not isinstance(node, ast.For) or not isinstance(node.target, ast.Tuple) or not node.target.elts:
                    continue
                first_target = node.target.elts[0]
                if not isinstance(first_target, ast.Name):
                    continue
                variable = first_target.id
                translated_in_body = any(
                    isinstance(call, ast.Call)
                    and isinstance(call.func, ast.Name)
                    and call.func.id == "tr"
                    and call.args
                    and isinstance(call.args[0], ast.Name)
                    and call.args[0].id == variable
                    for call in ast.walk(node)
                )
                if not translated_in_body:
                    continue
                for value in ast.walk(node.iter):
                    if isinstance(value, ast.Constant) and isinstance(value.value, str) and any(ch.isalpha() for ch in value.value):
                        messages.add(value.value)
        for locale in ("en", "uk", "de", "fr", "es", "he", "el", "ru_pre1918"):
            pack = i18n.get_language_info(locale)
            for message in messages:
                translated = pack.messages.get(message)
                self.assertTrue(translated and translated.strip(), f"{locale}: untranslated dynamic label {message!r}")
                self.assertEqual(i18n._placeholders(message), i18n._placeholders(translated),
                                 f"{locale}: placeholder mismatch for {message!r}")


if __name__ == "__main__":
    unittest.main()
