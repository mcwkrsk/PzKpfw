# PM_params.dll

- **Роль:** Objects and parameters editing.
- **Уверенность назначения:** HIGH (имена классов/шаблоны/зависимости).
- **Типы RTTI/имена:** `PM_params_module`, `ObjectsEditWidget`, `ParamsWidget`, `ObjectDelegate`, `NumberDelegate`, `GroupDelegate`, `AutoCodeDelegate`.
- **Зависимости:** `MAIWmodels.dll` + Qt5Core/Gui/Widgets.

## Подтвержденное

- Плагин экспортирует `loadModule` как единственный именованный экспорт.
- Плагин импортирует `MAIWmodels.dll`, связывая UI-модуль с общим ядром.
- Более точные импорт/экспорт данные находятся в PE reports и таблице экспортов ядра.

## План восстановления функциональности

Reverse data binding between object/parameter tables and `ObjectsList`/`ParametersList`; establish coding rules, grouping, sort order, duplicate policy, validation, delegate editors and project save integration.

## Ограничения

Фактический запуск модуля и проверка пользовательских сценариев в Windows не проводились; нижеописанные функциональные пункты — направления исследования, а не заявление о завершённой реконструкции.

## Cross-module call analysis (Stage 1.3)

`MAIWmodels.dll` import surface: 33 unique symbols, 86 statically resolved call sites. Mutators/CRUD include `addObject`, `deleteObjectById`, `addParameter`, `deleteParameter`, `setName`, `setCodingType`, `setGroup`, `setNumber`, `setSign`, `setObject`, and `switchElements`. This confirms direct editing of object/parameter structures.
