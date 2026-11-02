# PM_spec_WEB.dll

- **Роль:** Specification / form rendering.
- **Уверенность назначения:** HIGH (имена классов/шаблоны/зависимости).
- **Типы RTTI/имена:** `PM_spec_Module`, `PM_spec_widget`, `Am_spec_widget`, `FormAndPanel`, `AFsettings`; imports Qt5WebEngineWidgets.
- **Зависимости:** `MAIWmodels.dll`, Qt5 Widgets and Qt WebEngine Widgets.

## Подтвержденное

- Плагин экспортирует `loadModule` как единственный именованный экспорт.
- Плагин импортирует `MAIWmodels.dll`, связывая UI-модуль с общим ядром.
- Более точные импорт/экспорт данные находятся в PE reports и таблице экспортов ядра.

## План восстановления функциональности

Trace how specification queries the model and generates HTML; inspect formA template placeholder `%formA%`, Windows-1251 declaration, print/export and tab settings.

## Ограничения

Фактический запуск модуля и проверка пользовательских сценариев в Windows не проводились; нижеописанные функциональные пункты — направления исследования, а не заявление о завершённой реконструкции.

## Cross-module call analysis (Stage 1.3)

`MAIWmodels.dll` import surface: 32 unique symbols, 119 statically resolved call sites. The imported API is composed of getters for dynamic structures, action types/status/formalization, binary-link endpoints, subject operations, arguments, parameters and objects; no core setter/CRUD imports were found. This is evidence for query/presentation behavior, not proof that no mutation can occur through any indirect interface.
