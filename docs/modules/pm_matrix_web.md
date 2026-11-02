# PM_matrix_web.dll

- **Роль:** Matrix presentation.
- **Уверенность назначения:** HIGH (имена классов/шаблоны/зависимости).
- **Типы RTTI/имена:** `PM_matrix_Module`, `Pm_matrix_web`, `Am_matrix_web`; imports Qt5WebEngineWidgets.
- **Зависимости:** `MAIWmodels.dll`, Qt5 Widgets and Qt WebEngine Widgets.

## Подтвержденное

- Плагин экспортирует `loadModule` как единственный именованный экспорт.
- Плагин импортирует `MAIWmodels.dll`, связывая UI-модуль с общим ядром.
- Более точные импорт/экспорт данные находятся в PE reports и таблице экспортов ядра.

## План восстановления функциональности

Trace matrix generation, row/column mapping, selected-cell context and tooltip data. Template contains `%matrix-table%` and `%hov_color%`, jQuery click behavior for row/column highlighting; `style.css` referenced but absent from archive.

## Ограничения

Фактический запуск модуля и проверка пользовательских сценариев в Windows не проводились; нижеописанные функциональные пункты — направления исследования, а не заявление о завершённой реконструкции.

## Cross-module call analysis (Stage 1.3)

`MAIWmodels.dll` import surface: 24 unique symbols, 57 statically resolved call sites. It reads static/dynamic structures, actions, auto arguments, content links, objects and parameters. `sortParams(Parameter*, Parameter*)` is a comparison helper; no core setter/CRUD imports were found.
