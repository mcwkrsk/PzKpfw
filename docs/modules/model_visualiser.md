# Model_Visualiser.dll

- **Роль:** Diagram rendering / model visualization.
- **Уверенность назначения:** HIGH (имена классов/шаблоны/зависимости).
- **Типы RTTI/имена:** `ModelVisualizerModule`, `Model_Visualiser`, `Deca::ActionNode`, `Deca::AlternateBlock`, `Deca::Iteration`; QPainter/QImage APIs appear.
- **Зависимости:** `MAIWmodels.dll` + Qt5 Widgets/Gui/Core; no WebEngineWidgets import observed.

## Подтвержденное

- Плагин экспортирует `loadModule` как единственный именованный экспорт.
- Плагин импортирует `MAIWmodels.dll`, связывая UI-модуль с общим ядром.
- Более точные импорт/экспорт данные находятся в PE reports и таблице экспортов ядра.

## План восстановления функциональности

Determine graph layout, geometry, action-node shapes and semantics for alternative/iteration, pan/zoom/navigation, labels and image export. PNG export is a hypothesis from type/API clues until runtime or code path confirms it.

## Ограничения

Фактический запуск модуля и проверка пользовательских сценариев в Windows не проводились; нижеописанные функциональные пункты — направления исследования, а не заявление о завершённой реконструкции.

## Cross-module call analysis (Stage 1.3)

`MAIWmodels.dll` import surface: 11 unique symbols, 14 statically resolved call sites. The observed model API is narrowly read-oriented: dynamic structure, action lookup, children, alternatives, names, type and structure symbols. No core setter/CRUD imports were found.
