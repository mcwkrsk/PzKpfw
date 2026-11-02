# PM_auto.dll

- **Роль:** Functional decomposition / process modeling.
- **Уверенность назначения:** HIGH (имена классов/шаблоны/зависимости).
- **Типы RTTI/имена:** `DecompositionWidget`, `FunctionalDiagram`, `BaseDiagram`, `DiagramBlock`, `AFEProps`, `AFEAltProps`, `AFEsortModel`, `ArgumentsWidget`.
- **Зависимости:** `MAIWmodels.dll` + Qt5Core/Gui/Widgets.

## Подтвержденное

- Плагин экспортирует `loadModule` как единственный именованный экспорт.
- Плагин импортирует `MAIWmodels.dll`, связывая UI-модуль с общим ядром.
- Более точные импорт/экспорт данные находятся в PE reports и таблице экспортов ядра.

## План восстановления функциональности

Сопоставить UI node actions с `AFStructure` transformations; проверить sequence/alternative/iteration, sorting, move/paste, validation, properties and argument tables. `makeElementary` and `makeIteration` are implemented in the core; UI plugin likely calls these APIs.

## Ограничения

Фактический запуск модуля и проверка пользовательских сценариев в Windows не проводились; нижеописанные функциональные пункты — направления исследования, а не заявление о завершённой реконструкции.

## Cross-module call analysis (Stage 1.3)

`MAIWmodels.dll` import surface: 59 unique symbols, 285 statically resolved direct/import-thunk call sites. Concrete mutators include `makeAlternative`, `makeElementary`, `makeIteration`, `makeSequanse`, `setType`, `setStatus`, `setFormalization`, `pasteNewAFElement`, `removeAFElement`, `addContentLink`, `removeContentLink`, `unlink`, and `movieElementTo`. This confirms that PM_auto is an editing module for functional-decomposition structures, not a read-only viewer.
