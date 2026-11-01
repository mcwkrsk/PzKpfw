# IS-2 Reverse Engineering & Open-Source Fork — Research Kit

**Status: STAGE 1 CLOSED; STAGE 2 IN PROGRESS (1 November 2026).** The first Stage 2 implementation slice is delivered: editable XML-backed reader, graph validator, conservative UTF-8 writer, action/parameter/object operations, CLI, and semantic round-trip tests over all five golden project files. `docs/53_stage2_reader_writer_mvp.md` defines the exact implementation boundary. This is not yet full original-runtime parity. The authoritative decision, exit criteria and Stage 2 backlog are in `docs/51_stage1_closeout_2026-11-01.md`; machine-readable final checks and original PE hashes are in `analysis/stage1_closeout_validation.json`.

**Latest verified checks:** Python regression suite **137/137**; native C++ ABI/layout programs **8/8**; SHA-pinned plugin shutdown **33/33**, parent lifecycle **31/31**, concrete widget lifecycle **49/49**, ConceptModel writer/reader **42/42**, project writer **21/21**, ConceptStructure **26/26**, auto-range **18/18**, number/group **17/17**, primaryModel/spd **21/21**, nested-tree topology **38/38**, and post-erase ownership **30/30**. Seven principal PE32 files match the pinned SHA-256 manifest. This is static evidence, not live runtime testing.

This package contains:
- a verified archive manifest and SHA-256 inventory;
- the Stage 1.17 native `kursach_.is2` structural audit snapshot and its reproducible parser (`docs/46_stage1_17_native_sample_and_plugin_lifecycle.md`, `analysis/kursach_native_sample_audit.json`, `tools/audit_native_is2_sample.py`);
- PE/ABI/dependency evidence, MSVC RTTI hierarchy, 54 vftable candidates, private field layouts and exported-symbol inventory;
- reproducible RTTI extraction script pinned to the analyzed DLL SHA-256;
- x86 C++ ABI layout header with compile-time size/offset assertions;
- Stage 1.2 lifecycle/ownership and copy-semantics analysis for AFStructure, AIStructure, AbstractModel and element-private types;
- Stage 1.3 cross-module imports/call-site map, plugin RTTI extractor, three-slot `IsModule` vtable reconstruction, plugin factory/widget creation evidence and host loader disassembly;
- Stage 1.6 full MainForm MOC method-index/handler map, `on_workWidget_destroyed()` implementation trace including confirmed Qt `QListData::detach` before `remove(index)`, module registry lifetime analysis, corrected `QListData` ownership interpretation, SHA-pinned recovery tool and disassembly export;
- Stage 1.7 SHA-pinned five-plugin `IsModule` ABI reconstruction: exact observed 28-byte object prefix, QMap/QList shared-null IAT imports, 12-byte descriptor field layout and resolved strings, three virtual slot targets, factory initialization differences, machine-readable JSON/TSV snapshot and C++ layout header;
- Stage 1.9 host-side consumption of `IsModule+0x0c`: verified Qt QList snapshot/iteration helpers, per-widget registration, `WorkWidget+0x18` owner back-pointer, and the fact that the bounded destroy handler removes only from `MainForm+0x30` rather than the module list;
- Stage 1.17 plugin shutdown boundary (`docs/48_stage1_17_plugin_module_shutdown_boundary.md`): SHA-pinned 33/33-check audit of loader slot order, widget registration, `destroyed()` cleanup, module-registry backing-store release, five plugin exports and direct `GetProcAddress` targets;
- Stage 1.17 WorkWidget/MenuWidget parent lifecycle (`docs/49_stage1_17_workwidget_menuwidget_parent_lifecycle.md`): SHA-pinned 31/31-check audit of reciprocal raw pointers, MainForm→QFrame→QFrame→QGridLayout/WorkWidget QObject parent chain, tab-navigation handler, absence of standard closable-tab imports, `QTabWidget` page ownership/removal, all five plugin `MenuWidget+0xB4` stubs, empty MenuWidget MOC method tables, and the potential stale backlink/hidden-page lifetime hazard;
- Stage 1.17 concrete WorkWidget destruction (`docs/50_stage1_17_concrete_workwidget_destruction_paths.md`): SHA-pinned 49/49-check audit of all five concrete deleting-destructor vtable entries, all host `QObject::deleteLater` references, the `ControlFrom` QMap cleanup call graph, and the nested PM_auto/PM_params deferred-deletion receivers; it explicitly does not claim runtime destruction of top-level pages;
- final static `.is2` evidence: `docs/38`–`docs/45` and `docs/52`, with five XML projects, 82/82 valid sibling chains, exact primaryModel/spd reader/writer mapping, auto-range and number/group algorithms;
- a reconciled `ConceptModel` writer/reader conclusion: `docs/47` is authoritative; `docs/44` is retained but explicitly marked superseded after full `0x0040AC20` wrapper inspection;
- an initial architecture, core-model and `.is2` format specification;
- notes for each observed plugin;
- the Stage 2 Python XML reader/editor/validator/writer (`ProjectDocument`) with a CLI and semantic round-trip tests;
- private reference copies of the original project samples; the final `samples/` corpus adds five hash-pinned projects, including the user-supplied `kursach_.is2` and a screenshot contact sheet.

## Quick start

```bash
python -m venv .venv
# Windows: .venv\Scripts\activate
# Linux/macOS: source .venv/bin/activate
pip install -e . pytest
python tools/analyze_is2.py reference-private/samples/schaefer.is2 reference-private/samples/untitled.is2 reference-private/samples/kaka2.xml
python -m is2_re validate samples/kursach_user_supplied_42_actions.is2
python -m is2_re roundtrip samples/kursach_user_supplied_42_actions.is2 /tmp/roundtrip.is2
python -m is2_re add-action samples/kursach_user_supplied_42_actions.is2 /tmp/edited.is2 --name "New step" --type 0 --parent-id 9
pytest -q
# Compile-time ABI/layout check (g++ or clang++):
g++ -std=c++17 -Wall -Wextra -Werror -pedantic -I. tests/native/abi_layout_check.cpp -o abi_layout_check
./abi_layout_check
# Re-run RTTI recovery only against the exact supplied build (SHA-pinned):
python tools/recover_msvc_rtti.py /path/to/MAIWmodels.dll --exports analysis/imports-exports/MAIWmodels_exports.tsv --out analysis/rtti
# Re-run plugin RTTI recovery for the five DLLs:
python tools/recover_plugin_rtti.py /path/to/IS2_PMauto_beta --out analysis/plugins
# Re-run static cross-module call xrefs:
python tools/analyze_module_calls.py /path/to/IS2_PMauto_beta --out analysis/cross_module
# Re-run Stage 1.9 host-side widget-list consumption audit (exact pinned IS.exe only):
python tools/audit_host_widget_list_consumption.py /path/to/IS2_PMauto_beta
# Re-run Stage 1.14 PM_auto content/name handler audit (exact pinned PM_auto + MAIWmodels only):
python tools/audit_pm_auto_content_handlers.py /path/to/IS2_PMauto_beta/modules/PM_auto.dll /path/to/IS2_PMauto_beta/MAIWmodels.dll
# Re-run Stage 1.15 structural editing audit (exact pinned PM_auto + MAIWmodels only):
python tools/audit_pm_auto_structural_edit_commands.py /path/to/IS2_PMauto_beta/modules/PM_auto.dll /path/to/IS2_PMauto_beta/MAIWmodels.dll

# Stage 1.16 audit against the exact supplied binaries:
python tools/audit_pm_auto_stage116.py --root /path/to/IS2_PMauto_beta --samples reference-private/samples/schaefer.is2 reference-private/samples/untitled.is2 reference-private/samples/kaka2.xml --out-json analysis/pm_auto/stage116_audit.json --out-asm analysis/disassembly/pm_auto_stage116_model_views_and_context.asm
# Re-run the structural audit for the user-provided native .is2 sample:
python tools/audit_native_is2_sample.py /path/to/kursach_.is2 --json
# Re-run the Stage 1.17 plugin loader/shutdown boundary audit (all exact supplied binaries):
python tools/audit_stage117_plugin_shutdown.py
# Audit WorkWidget/MenuWidget raw links, tab-page parent retention and close handling:
python tools/audit_stage117_widget_parent_lifecycle.py
# Audit concrete plugin WorkWidget destructors and nested QObject deleteLater paths:
python tools/audit_stage117_concrete_widget_lifecycle.py
# Re-run the Stage 1.17 ConceptModel reader/writer tree symmetry audit (SHA-pinned IS.exe):
python tools/audit_stage117_conceptmodel_tree.py /path/to/IS.exe --out analysis/project_writer/conceptmodel_tree_audit.json --snapshot-dir analysis/disassembly
# Re-run the Stage 1.17 AIStructure nested-tree topology audit (SHA-pinned MAIWmodels.dll):
python tools/audit_stage117_aistructure_nested_tree.py /path/to/MAIWmodels.dll --out analysis/pm_params/aistructure_nested_tree_topology.json
# Re-run Qt 5 MOC metadata and dispatch inventory:
python tools/recover_qt_moc_contracts.py /path/to/IS2_PMauto_beta --out analysis/plugins
# Correlate on_<objectName>_<signal> slots with UTF-16LE widget-name strings:
python tools/audit_qt_autoconnect_object_names.py /path/to/IS2_PMauto_beta --moc-json analysis/plugins/qt_moc_contracts.json --out analysis/plugins
# Re-run Stage 1.7 IsModule object/descriptor ABI checks (exact pinned DLLs only):
python tools/recover_plugin_module_abi.py /path/to/IS2_PMauto_beta --out analysis/plugins --asm-out analysis/disassembly/is_module_abi_stage17.asm
# Additional native ABI compile/run checks:
g++ -std=c++17 -Wall -Wextra -Werror -pedantic -I. tests/native/is_module_contract_check.cpp -o is_module_contract_check
./is_module_contract_check
```

The parser is intentionally read-only. It preserves the parsed ElementTree in memory but does not save files, because the exact writer semantics and canonicalisation rules have not yet been recovered.

## Evidence labels
- **CONFIRMED** — directly verified in supplied bytes or in a cited excerpt from the supplied dissertation.
- **HIGH** — supported by multiple independent artifacts, but a detail remains to be validated.
- **MEDIUM** — credible inference, not yet proven in machine code or runtime.
- **LOW** — provisional lead only.

## Stage plan

- **Stage 1: CLOSED** — static reverse-engineering baseline, pinned source binaries and sample corpus.
- **Stage 2:** formal `.is2` reader/writer reconstruction and compatibility, with Windows golden-sample round-trip as an acceptance gate.
- **Stage 3:** independent C++/Qt core; **Stage 4:** Plugin SDK; **Stage 5:** five functional plugin analogues; **Stage 6:** Open Source Fork completion and release/legal gate.

## Hard limitations
No Windows runtime, Ghidra, IDA, or equivalent full decompiler was available in the analysis environment. The native app was not executed. Disassembly below is GNU `objdump` output analysed manually, not Ghidra decompilation. Stage 1 now includes manual recovery of RTTI, vftable candidates and several private layouts; this is still not a substitute for full Ghidra/IDA decompilation. See `docs/07_maiwmodels_abi.md`, `docs/08_private_lifecycle_and_ownership.md`, `docs/09_cross_module_calls_and_plugin_lifecycle.md`, `docs/known_unknowns.md` and `docs/rebuild_guide.md`.

## Publication warning
The permission note in the starter pack explicitly says that Гаврилов А.Г. consents to decompilation. The wider rights required for public source/binary releases, branding, commercial use, and third-party components are not fully specified in that sentence. Keep this research private until the scope is confirmed.

## Stage 1.5 — host/WorkWidget ABI

- `docs/11_workwidget_host_interface.md` — межмодульный контракт `WorkWidget`/`MenuWidget`, HostContext и последовательность регистрации виджетов.
- `tools/recover_workwidget_contract.py` — воспроизводимое извлечение RTTI/vtable контрактов host + пяти plugin DLL.
- `analysis/host_interface/workwidget_interface.json` и `workwidget_vtables.tsv` — машинно-читаемые primary/secondary vtable и все восстановленные слоты.
- `analysis/host_interface/host_registration_context.asm` и `plugin_workwidget_factories.asm` — дизассемблирование host registration, context setters, menu factories/constructors.
- `src/native/workwidget_contract_x86.hpp` — частичные ABI-layout fragments с opaque-полями и compile-time assertions.


## Stage 1.6 — MainForm MOC and plugin shutdown

- `docs/12_moc_dispatch_and_plugin_shutdown.md` — all nine MainForm MOC slots, exact `qt_static_metacall` routing, WorkWidget destruction handler, QTabWidget removal semantics, module pointer registry and lifecycle risks.
- `tools/recover_mainform_lifecycle.py` — SHA-256-pinned PE32 MOC/registry recovery and GNU objdump evidence exporter.
- `analysis/host_interface/mainform_lifecycle.json` — method map, direct-xref lists and machine-readable evidence.
- `analysis/disassembly/mainform_lifecycle.asm` — address-labelled disassembly extracts for MOC dispatch, registration, destroy handler, module loading and static destructors.
- `tests/test_mainform_lifecycle_snapshot.py` — snapshot regression tests for MOC mapping, the corrected container ownership model, and detach-before-remove ordering.
- `analysis/stage16_validation.txt` and `analysis/sample_parser_stage16.json` — Stage 1.6 test record and machine-readable parser summaries for the three reference projects.

**Important correction:** `IsModule+0x0c` is not supported as a `QSharedPointer<WorkWidget>`. Producer code in `PM_auto.dll` appends raw `WorkWidget*` through Qt `QListData::append`; host copy/detach helpers operate on ref-counted container storage. The destroy handler uses `QListData::detach` before `remove(index)` when storage is shared; this is Qt copy-on-write, not widget deletion. See Stage 1.6 report.


## Stage 1.17 — Parameter/Object post-erase lifetime

- `docs/31_stage1_17_post_erase_element_ownership.md` — compares both PM_params deletion paths with AIStructure erase/destructor behavior; classifies detached allocations as high-confidence orphan/leak candidates, not proven runtime leaks.
- `tools/audit_stage117_post_erase_ownership.py` — SHA-256-pinned 30-fingerprint audit for factories, erasers, deleting destructors, vtable slot 0 and PM_params UI ordering.
- `analysis/pm_params/post_erase_ownership.json` / `.txt` — machine-readable result and validation log.
- `analysis/disassembly/pm_params_*delete*`, `aistructure_element_*`, `primary_model_*`, `abstract_model_*`, `aistructure_private_*`, `aebinarylink_*` — address-labelled disassembly snapshots.
- `tests/test_stage117_post_erase_ownership.py` — regression test for the pinned audit.

**Important limit:** the detached object has no deleting-destructor call in the inspected UI/erase path, but a separate owner or deferred reclaimer has not been ruled out. Do not call this a proven runtime leak without whole-program ownership tracing and a Windows heap trace.

## Stage 1.17 — ConceptStructure class domain and auto-range refinement

- `docs/36_stage1_17_subject_category_domains_and_autorange_contract.md` — documents the seven binary class codes against the thesis' formal domain, the GUI/F1/formal-domain scope difference, relation constraints, endpoint column layout, distinct `CodingType`/`CStype`/`CategoryStatus` contracts, and the exact `codeStructure` auto-range predicate.
- `analysis/disassembly/concept_structure_endpoint_and_range_contract.asm` — raw evidence for `ALinkBinding`, `getAutoRange`, class-character mapping, `getType`, `getCodingType` and `getStatus` accessors.
- `analysis/concept_structure/code_structure_tree_audit.json` and `concept_structure_audit_result.json` — machine-readable findings and SHA-pinned 26/26 binary check result.
- `tools/audit_stage117_concept_structure.py` / `tests/test_stage117_concept_structure.py` — expanded fingerprints and regression checks.

The thesis documents F2 relation evaluation as `99`, `1/99` or rank/`99`, but does not define the natural-language meaning of `1` versus `99`. F1's category evaluation is a different quantity (potential cardinality) and is not mapped to `SCBinaryLink::range` here. Original Windows runtime remains untested.

## Stage 1.7 — `IsModule` object and descriptor ABI

- `docs/13_is_module_object_and_descriptor_abi.md` — detailed ABI evidence for the 28-byte `IsModule` wrapper, 12-byte descriptor record, host call sequence, five factory/widget implementations and remaining lifetime unknowns.
- `tools/recover_plugin_module_abi.py` — SHA-256-pinned extractor for all five plugin DLLs; validates Qt shared-null imports, RTTI/vtable slots, descriptor allocation/strings, widget collection append path and factory allocation pattern.
- `analysis/plugins/is_module_abi.json` / `.tsv` — machine-readable per-plugin field/slot/descriptor snapshot.
- `analysis/disassembly/is_module_abi_stage17.asm` — raw GNU objdump excerpts from the five `loadModule`, `IsModule` virtual implementations and descriptor factories.
- `src/native/is_module_contract_x86.hpp` and `tests/native/is_module_contract_check.cpp` — evidence-oriented 32-bit structure declarations and compile/run layout test.
- `tests/test_plugin_module_abi_snapshot.py` — regression checks for all five records, string pairs, float bits, QListData-backed widget collection and opaque-tail initialization.
- `analysis/stage17_validation.txt` — test/compile/hash-guard/ZIP validation results.

**Stage 1.7 limitations:** descriptor field semantics and deallocation path remain unknown; `IsModule+0x10..+0x1b` remain opaque; no runtime plugin loading, destruction or ABI compatibility test was performed.


## Stage 1.8 — abstract `IsModule` base vtable and widget-list ownership

- `docs/14_plugin_ownership_stage18.md` — analysis of the base `IsModule` vtable, pure-virtual slot, per-plugin QList append helpers, raw widget pointers, host module-registry cleanup, descriptor/module retention and remaining ownership questions.
- `tools/audit_module_vtable_ownership.py` — SHA-256-pinned audit. It verifies the base `IsModule` slot-2 thunk resolves to `_purecall` in all five DLLs, both default slots are `RET`, each derived create-widget slot passes `this+0x0c` to its helper, and each helper calls `QListData::append`.
- `analysis/plugins/module_ownership_audit.json` / `is_module_base_vtable.tsv` — machine-readable vtable and ownership findings.
- `analysis/disassembly/module_ownership_audit.asm` — raw disassembly of all five base vtables, create-widget entrypoints and append helpers, plus the host module-registry cleanup routine.
- `src/native/is_module_vtable_contract_x86.hpp` — 12-byte three-slot ABI layout and observed base-interface shape.
- `sdk/README.md` — experimental SDK boundary, compatibility warnings and safer direction for a new versioned C ABI.
- `tests/test_module_ownership_audit.py` and `tests/native/is_module_vtable_contract_check.cpp` — snapshot and C++ layout checks.

**Stage 1.8 conclusion:** the base interface is abstract at slot `+0x08`; the concrete modules implement a descriptor getter there. Slot `+0x04` creates widgets and appends raw `WorkWidget*` values to a Qt `QListData` member at `IsModule+0x0c`. The host's bounded global-registry cleanup releases QList backing storage but does not iterate/delete module objects. No virtual deleting destructor or verified module/descriptor deallocation path was found. Treat these objects as retained for application lifetime in the observed path; intentional retention versus a leak-like implementation is unresolved.

**Stage 1.8 limitations:** the source-level names of the three virtual methods remain partly unknown; descriptor fields remain semantically unnamed; the `QMap` member at `+0x08`, opaque bytes `+0x10..+0x1b`, and exact widget-list cleanup path remain unresolved. No Windows runtime/plugin-load test was performed.


## Stage 1.9 — host consumption of plugin widget lists

- `docs/15_host_module_widget_list_consumption.md` — follows the `IsModule+0x0c` QList from plugin append into host snapshot, iteration and per-widget registration; distinguishes module-side and MainForm-side lists.
- `tools/audit_host_widget_list_consumption.py` — SHA-256-pinned audit of the host copy/range helpers, list enumeration, `WorkWidget+0x18` module back-pointer and `on_workWidget_destroyed()` removal scope.
- `analysis/host_interface/module_widget_consumption.json` and `analysis/disassembly/module_widget_consumption.asm` — machine-readable result and supporting disassembly.
- `sdk/legacy_is_module_abi.hpp` — evidence-oriented 32-bit module/descriptor/work-widget prefix layouts; unknown fields remain opaque.
- `tests/test_host_module_widget_consumption.py` and `tests/native/legacy_is_module_abi_check.cpp` — snapshot and compile/run layout checks.
- `analysis/stage19_validation.txt` — Stage 1.9 validation record.

**Stage 1.9 finding:** the host copies and enumerates `IsModule+0x0c` after the three virtual calls, registers every raw `WorkWidget*`, and stores the owning `IsModule*` at `WorkWidget+0x18`. The bounded destroy handler uses `WorkWidget+0x20` and removes the widget from `MainForm+0x30`, but does not use the owner pointer or touch the module-side list. A stale module-side list entry is therefore a static risk if a widget is destroyed after registration; this is not yet a runtime-confirmed defect, and other indirect cleanup paths are not excluded.

## Stage 1.10 — Qt MOC contracts across all plugins

- `docs/16_qt_moc_contracts.md` — full all-section QMetaObject inventory, recovered signatures, class-parent pointers, selected static metacall dispatch and old-style signal/slot connections.
- `tools/recover_qt_moc_contracts.py` — Python 3 / GNU objdump parser for Qt 5 MOC revision-7 structures in both `.rdata` and `.data`; decodes relative `QByteArrayData` strings, methods, argument types and names.
- `analysis/plugins/qt_moc_contracts.json` and `qt_moc_contracts.tsv` — 28 static metaobjects, 44 own methods and 6 signals across the five supplied DLLs.
- `analysis/plugins/qt_moc_dispatch.json` — selected method index to dispatch target mapping.
- `analysis/plugins/qt_moc_connections.tsv` — confirmed `connectSlotsByName` callsites and explicit legacy connect pairs.
- `analysis/disassembly/qt_moc_dispatch.asm` — raw disassembly excerpts for recovered static metacalls and connect callsites.
- `tests/test_qt_moc_contracts_snapshot.py` — regression checks for metadata counts, the `.data`-resident QMetaObjects, recovered signals and slot signatures.
- `analysis/stage20_validation.txt` — test, parser snapshot, C++ layout and archive validation record.

**Stage 1.10 correction:** Stage 1.4's printable-string scan was incomplete as a MOC inventory. The all-section metadata parser also finds `ObjectsEditWidget`, `Deca::QDecomposeTab`, `BaseDiagram`, `CbWithBtn` and `CbWithBtnContainer`, and recovers their formal method tables. The old string report is retained as historical triage, but the Stage 1.10 structured metadata is authoritative for this supplied build.

## Stage 1.11 — Qt auto-connect endpoint correlation

- `docs/17_qt_autoconnect_object_names.md` — maps 20 MOC `on_<objectName>_<signal>` slots to matching UTF-16LE object-name candidate strings.
- `tools/audit_qt_autoconnect_object_names.py` — reproducible string/metadata correlator using the PE section map.
- `analysis/plugins/qt_autoconnect_candidates.json` and `.tsv` — 20/20 candidate names found in the corresponding DLL data sections.

This is a high-confidence static auto-connect map, not a runtime trace of QObject instances or signal delivery.
- `analysis/stage21_validation.txt` — reproduced MOC counts, 20/20 UTF-16LE name matches, 23 Python tests and five C++ compile/run checks.


## Stage 1.12 — PM_auto typed Qt signal/slot graph

- `docs/18_pm_auto_typed_connections.md` — traces `QObject::connectImpl`, member-function slot adapters, closure/QSlotObject callbacks, FunctionalDiagram signals, DecompositionWidget controls and the `CbWithBtn` helper widgets.
- `tools/audit_pm_auto_typed_connections.py` — SHA-256-pinned audit of the exact PM_auto.dll build; counts the 17 static IAT call instructions to `QObject::connectImpl`, verifies key Qt/core imports and checks recovered callback address tokens.
- `analysis/plugins/pm_auto_typed_connections.json/.tsv` — 26 logical typed/member/closure connection records, their sender offsets, signal signatures, wrapper/callback addresses and evidence.
- `analysis/disassembly/pm_auto_typed_connections.asm` — objdump extracts for adapter builders, DecompositionWidget constructor callsites, callback dispatchers and CbWithBtn constructors.
- `sdk/pm_auto_typed_connections_x86.hpp` — evidence-only address/offset reference; constants are image VAs, not callable portable symbols.
- `tests/test_pm_auto_typed_connections.py` and `analysis/stage22_validation.txt` — regression snapshot, SHA guard, Python tests and native ABI compile/run results.

**Stage 1.12 caution:** 17 is the count of static instructions calling the imported `QObject::connectImpl` IAT entry, not a count of live Qt connections. Wrapper callsites are generic and reused by multiple constructor paths. Typed closure callbacks are retained as raw addresses; anonymous helper functions are not given invented C++ names. No Windows runtime delivery/disconnection test was performed.


## Stage 1.13 — PM_auto business-logic recovery: diagram movement and selection

- `docs/19_stage1_13_pm_auto_drag_reorder.md` — reconstruction of `FunctionalDiagram::itemDraged` receiver `0x100064F0`, `AFStructure::movieElementTo`, drag ordering and the double-click/selection chain.
- `analysis/pm_auto/drag_reorder.json/.tsv` — machine-readable call and model-operation map.
- `analysis/pm_auto/drag_reorder.asm` and related audit output — disassembly evidence from the exact PM_auto/MAIWmodels build.
- `tools/audit_pm_auto_drag_reorder.py` — SHA-pinned disassembly fingerprint audit.
- `sdk/diagram_block_observed_x86.hpp` — evidence-only partial `DiagramBlock` layout, with opaque prefix bytes.

**Stage 1.13 findings:** the drag callback moves a real `AFElement` within an `AFStructure`, adjusts composition/arrangement links through `movieElementTo`, and calls `codeStructure()`. The double-click path resolves a block from stored coordinates and emits `FunctionalDiagram::selectionChanged(DiagramBlock*)`. Cross-owner/other-parent edge cases and actual runtime UI behavior remain unresolved.

## Stage 1.14 — PM_auto content-link and name-edit handlers

- `docs/20_stage1_14_pm_auto_content_and_name_handlers.md` — analyses content-link creation/removal, marker replacement, and element-name editing.
- `analysis/pm_auto/content_handlers.json` — machine-readable evidence map for five handlers.
- `analysis/pm_auto/content_handlers_audit.json` — SHA-pinned fingerprint audit output.
- `analysis/disassembly/pm_auto_content_handlers.asm` — disassembly for `0x10005890`, `0x100059C0`, `0x10005F00`, `0x10006BF0`, and `0x10006DC0`.
- `tools/audit_pm_auto_content_handlers.py` — reproducible audit for exact PM_auto.dll and MAIWmodels.dll builds.
- `tests/test_pm_auto_content_handlers.py` — regression checks for the handler snapshot and opaque marker semantics.

**Stage 1.14 findings:** handlers add `AContentStructure` links using marker bytes `+` (`0x2B`), `.` (`0x2E`) and `*` (`0x2A`); a separate handler removes the selected `AEContentLink` through `unlink(true)` and `removeFromList()`. The `*` handler removes existing `*` links for the selected `AFElement` before optionally adding the newly selected `AIElement`. A text-change callback normalises the edited string and calls `AElement::setName(MString)`. Marker meanings, boolean parameter semantics, helper names and runtime persistence remain unknown.

**Stage 1.14 validation:** 35 Python tests passed; seven C++ ABI/layout checks compiled with `-Wall -Wextra -Werror -pedantic` and executed successfully. The static content-handler audit passed against the exact pinned DLL hashes. No Windows runtime test was performed.


## Stage 1.15 — PM_auto structural editing commands

- `docs/21_stage1_15_pm_auto_structural_edit_commands.md` — trace of `newAlt`, `newSeq`, `newLoop`, `toElementary`, insert-before/after and delete commands from MOC slot to `AFStructure` APIs.
- `analysis/pm_auto/structural_edit_commands.json` — structured command/API map, raw setter arguments and unresolved nested branches.
- `tools/audit_pm_auto_structural_edit_commands.py` — SHA-256-pinned static audit of eight PM_auto ranges, six core implementation ranges and seven required exports.
- `analysis/pm_auto/structural_edit_audit.json` — machine-readable audit result.
- `analysis/disassembly/pm_auto_structural_edit_commands.asm` — raw GNU objdump excerpts from PM_auto and MAIWmodels.
- `tests/test_pm_auto_structural_edit_commands.py` — structural-command snapshot and evidence-boundary tests.
- `analysis/pm_auto/stage115_validation.txt` — validation record (40 Python tests and seven native ABI checks).

**Stage 1.15 findings:** the principal UI commands map directly to `AFStructure::makeAlternative`, `makeSequanse`, `makeIteration`, `makeElementary`, `pasteNewAFElement` and `removeAFElement`. Insert-before/after share `pasteNewAFElement(parent, anchor)`; the anchor is the selected element for insert-after and the previous sibling for insert-before. `makeAlternative` and `makeSequanse` receive child count `2` in their principal diagram branches. These are static observations, not runtime-verified edit/save results.


## Stage 1.16 — PM_auto model projections, context modes and nested diagrams

- `docs/22_stage1_16_pm_auto_remaining_paths_model_views_and_context.md` — analysis of helper `0x1000A360`, the two independent Qt model/index pairs, name-projection refresh, context selection at `DecompositionWidget+0x2c`, widget-enable matrix, property-panel visibility toggle, nested-diagram creation/deletion path and the static Undo/Redo surface audit.
- `tools/audit_pm_auto_stage116.py` — SHA-256-pinned static audit for the exact PM_auto/MAIWmodels build; extracts disassembly ranges, inspects imports/tokens related to undo and summarizes optional project samples without modifying them.
- `analysis/pm_auto/stage116_audit.json` — main machine-readable findings, binary hashes, Undo/Redo search results and three sample-project summaries.
- `analysis/pm_auto/stage116_context_modes.json`, `stage116_undo_redo_surface.json`, `stage116_sample_invariants.json` — focused evidence snapshots.
- `analysis/disassembly/pm_auto_stage116_model_views_and_context.asm` — supporting GNU objdump excerpts for model cleanup, context routing, enablement and nested diagram paths.
- `sdk/pm_auto_view_projection_x86.hpp` — evidence-only offset/constants reference; it is not a complete object layout or a portable runtime ABI.
- `tests/test_pm_auto_stage116.py` and `tests/native/pm_auto_stage116_contract_check.cpp` — snapshot and compile/run checks.
- `analysis/pm_auto/stage116_validation.txt` — Stage 1.16 validation protocol.

**Stage 1.16 findings:** helper `0x1000A360` removes one `AFElement` and its direct-child representation entries from two QMap/QStandardItemModel projection pairs at offsets `(+0x140,+0x120)` and `(+0x144,+0x128)`. Renaming refreshes both projections independently. `DecompositionWidget+0x2c` stores an internal context value selected from observed status/type predicates; the associated code enables four mode-specific groups of child widgets. `changeProps_slot` only shows/hides the properties panel. `decomposeToNewList_slot` creates and links a secondary diagram view through `DiagramBlock+0x1c4/+0x1d8`; `delList_slot` performs associated cleanup and clears the forward reference/flag. The latter's QMessageBox uses only the `Ok` button (`0x400`), not a Yes/No confirmation gate.

**Undo/Redo finding:** no `QUndoStack`, `QUndoCommand`, `undo` or `redo` import/token was found in the seven supplied images. PM_auto imports `QAbstractItemModel::revert/submit`, but in this build their IAT slots are referenced only by two forwarding jump thunks and have no direct application callsites in the disassembly. This does not exclude custom undo logic.

**Sample cross-check:** the three provided XML samples parse and pass duplicate-ID/missing-link validation. For every sample, the distinct `(afe1,afe2)` endpoint pairs in link type `2` match those in type `3` (6, 6 and 72 pairs respectively); link-type semantics are not assigned from this correlation alone.

**Stage 1.16 validation:** 46 Python tests passed; all eight native C++ ABI/reference checks compiled with `-Wall -Wextra -Werror -pedantic` and ran; PM_auto and MAIWmodels SHA-256 guards passed; three XML samples validated. Static only; no Windows runtime, Ghidra/IDA pseudocode or writer/round-trip test was performed.


## Stage 1.17 — interim nested-diagram and enum findings

- `docs/23_stage1_17_nested_diagram_lifecycle_and_enum_correlation.md` records the `DiagramBlock` recursive destruction path (`0x100182B0` / `0x10018380`), the `delList_slot()` cleanup effects, and evidence-based correlations for action type, status, formalization and XML link types.
- `analysis/pm_auto/stage117_audit.json` is the machine-readable static snapshot; `analysis/disassembly/pm_auto_stage117_nested_diagram_lifecycle.asm` contains the relevant disassembly excerpts.
- `analysis/stage117_validation.txt` records the rerun results and limitations.
- Historical checkpoint note (superseded 1 Nov 2026): Stage 1 was subsequently **CLOSED** as the static baseline by `docs/51_stage1_closeout_2026-11-01.md`. Remaining enum/serializer coverage and Windows runtime ownership validation are Stage 2 backlog, not Stage 1 blockers.


## Stage 1.17 — host activation refresh и ParametersList lifecycle

- `docs/28_stage1_17_host_activation_refresh_and_parameter_lifecycle.md` — восстановление общей цепочки `PluginHostContext -> appState -> PrimaryModel`, host tab-change callback, virtual slot 47, lazy refresh списка параметров в PM_auto и ограничений ownership для ParametersList.
- `analysis/host_interface/pm_auto_host_refresh.json` — machine-readable snapshot: 31 SHA-pinned static checks.
- `analysis/disassembly/pm_auto_host_context_refresh.asm` — дизассемблирование host tab handler, plugin context getters, refresh модели и add/delete/destructor путей ParametersList.
- `tools/audit_pm_auto_host_refresh.py` — воспроизводимый аудит для точных SHA-256 `IS.exe`, `PM_auto.dll`, `PM_params.dll` и `MAIWmodels.dll`.
- `tests/test_pm_auto_stage117_host_refresh.py` — регрессионные тесты нового snapshot.

**Stage 1.17 findings:** PM_auto и PM_params разрешают один `PrimaryModel` через общий host context. При смене вкладки `IS.exe` вызывает slot 47 текущего `WorkWidget`; полный объект PM_auto overrides slot 47 и перестраивает общий параметрный picker, а PM_params slot 47 является RET stub. PM_params `deleteParameter` удаляет указатель из первого pointer-vector через erase/memmove, но в этом пути не вызывает deleting-destructor. Деструктор `ParametersList` уничтожает объекты, остающиеся в обоих его pointer-vectors. Судьба/ownership удалённого из первого vector `Parameter*` остаётся открытой; утечка не утверждается.

**Ограничения этого исторического checkpoint:** статический PE32-анализ; оригинал не запускался в Windows. Поведение stale pointer, paint scheduling, динамическое удаление параметров и окончательное владение `Parameter` требуют runtime/heap-тестов Stage 2. Статическая Stage 1 формально закрыта документом `docs/51_stage1_closeout_2026-11-01.md`.


## Stage 1.17 — PM_params parameter-table synchronization and deletion cleanup

- `docs/29_stage1_17_parameter_table_sync_and_link_cleanup.md` — maps all six editable parameter-table columns to the actual `Parameter`/`AIElement` setters; traces the `QAbstractItemModel::dataChanged` signal adapter, parameter creation and deletion, LinkType 4 cleanup, object-reference clearing, and post-erase ownership limitations.
- `analysis/disassembly/pm_params_parameter_table_sync.asm`, `pm_params_parameter_slots.asm`, `pm_params_data_changed_connection.asm` and `pm_params_objects_edit_handlers.asm` — disassembly excerpts from the exact PM_params build.
- `tools/audit_pm_params_parameter_table.py` — SHA-256-pinned audit of PM_params.dll and MAIWmodels.dll; checks the Qt dataChanged callback route, six column branches, setter imports, add/delete parameter operations and LinkType 4 unlink path.
- `analysis/pm_params/parameter_table_sync_audit.json` — 32/32 static fingerprint checks.
- `tests/test_pm_params_parameter_table_sync.py` — regression coverage for the report, column mapping and disassembly snapshots.

**Stage 1.17 findings:** the six table columns write group, coding type, number, associated Object pointer, sign and name to the corresponding core fields. Deleting a Parameter removes its LinkType 4 links (`unlink(true)`, `removeFromList()`, deleting destructor), then erases the Parameter pointer from `ParametersList` and removes its Qt row. The `LinkType==4` filter is resolved to the `AEContentLink` class: endpoint 0 is `AFElement*`, endpoint 1 is `AIElement*`, marker is at private `+0x2C`, and `power` at `+0x30`. Post-erase ownership remains unresolved. The Object-delete handler clears matching `Parameter::Object*` references before erasing the Object by ID.

**Validation for this update:** 32/32 parameter-editor fingerprints and 19/19 AEContentLink fingerprints; 61 Python tests; 8 distinct C++ ABI/layout programs compiled with `-Wall -Wextra -Werror -pedantic` and executed. No Windows runtime or heap-lifetime test was performed.


## Stage 1.17 — AEContentLink / LinkType 4 resolution

- `docs/30_stage1_17_linktype4_aecontentlink_contract.md` — proves that LinkType 4 is the `AEContentLink` class; documents the constructor/vtable, endpoint indices, marker, power, duplicate-add behavior and PM_params cleanup path.
- `analysis/pm_params/aecontentlink_type4_audit.json` — 19/19 SHA-pinned static checks against the supplied `MAIWmodels.dll` and `PM_params.dll`.
- `analysis/disassembly/maiwmodels_aecontentlink_factory_and_dedup.asm` and `maiwmodels_aecontentlink_endpoints_and_fields.asm` — exact PE32 disassembly excerpts.
- `tools/audit_aecontentlink_type4.py` — reproducible audit script; `tests/test_stage117_aecontentlink_type4.py` — regression tests.

The LinkType 4 class identity and endpoint data contract are resolved. Wider semantics of other LinkType values, power semantics beyond duplicate-add counting and post-erase Parameter ownership remain open. Static analysis only; no original Windows runtime or heap instrumentation was performed.

- `analysis/stage117_native_validation.txt` — eight C++ ABI/layout programs compiled with warnings-as-errors and run successfully.


## Stage 1.17 — AIStructure nested tree topology (1 November 2026)

`AIStructurePrivate+0x04..+0x0b` is an inline outer 8-byte `TreeHandle32`; each 0x1c-byte outer node embeds another 8-byte `TreeHandle32` at `+0x14..+0x1b`: DWORD `[0]` is a separately allocated 0x18-byte nested-header pointer, DWORD `[1]` is nested-tree node_count. Nested headers and nodes are 0x18 bytes; payload semantics remain unknown. The earlier `node-local vector` wording is superseded. See `docs/32_stage1_17_aistructure_nested_tree_topology.md` and the 38-check SHA-pinned audit in `tools/audit_stage117_aistructure_nested_tree.py`.


**Stage 1.17 tree-count proof:** outer and nested insertion paths (`0x1000EC70`, `0x10013210`) increment `TreeHandle32+0x04`; matching erase paths (`0x1000E020`, `0x10001D10`) decrement it with an underflow guard. The nested-tree audit now checks 38 fingerprints.


## Stage 1.17 — ConceptStructure category re-indexing

- `docs/33_stage1_17_concept_structure_category_reindexing.md` records `SubjectCategory::SCcompare`, class-character codes, category construction defaults, the three `SCBinaryLink` factories, and the bounded reconstruction of `ConceptStructure::codeStructure`.
- `analysis/disassembly/concept_structure_stage117.asm` contains literal objdump excerpts from the SHA-pinned `MAIWmodels.dll`.
- `analysis/concept_structure/code_structure_tree_audit.json` stores the machine-readable contract and remaining unknowns.
- `tools/audit_stage117_concept_structure.py` performs the evidence-contract audit; optionally pass `--binary /path/to/MAIWmodels.dll` to enforce the source SHA-256.
- `tests/test_stage117_concept_structure.py` verifies the static evidence contract.


### Stage 1.17 — SCBinaryLink layout and relation type contracts

- `docs/34_stage1_17_scbinarylink_layout_and_relation_types.md` records the two independent 0x30-byte allocations (outer object block and AIEBinaryLink private record), cross-checked against SCBinaryLink vtable slot 0 (`0x1000F740`), three endpoint slots, setter-specific link type values, range defaults and the type-3-only auto-range path.
- `analysis/disassembly/scbinarylink_allocation_and_typed_endpoints.asm` contains literal excerpts for the factories, constructors, deleting destructor, endpoint setters/getters and type getter.
- `analysis/concept_structure/code_structure_tree_audit.json` records the corresponding machine-readable contracts.
- The SHA-pinned ConceptStructure audit now requires the SCBinaryLink excerpts and verifies the factory allocation / deleting-destructor size pair.

**Caution:** range values `1` and `99` are preserved as observed numeric values; their higher-level domain names are not established. The persistent `AIStructurePrivate+0x04` tree remains semantically unresolved.


#### Stage 1.17 — SCBinaryLink display-method contract

The latest analysis now covers `SCBinaryLink::getCode()` (`0x10010800`) and `getName()` (`0x100109E0`). The former composes the three indexed endpoint-code positions and uses `-` for missing endpoints. The latter confirms the localized labels for relation types 1/2/3: `Упорядочивание`, `Состав`, `Компоновка`. These methods do not read `range`; the meaning of numeric values 1 and 99 remains an open question. See `docs/34_stage1_17_scbinarylink_layout_and_relation_types.md` and `analysis/disassembly/scbinarylink_display_methods.asm`.


#### Stage 1.17 — SCBinaryLink display-name contract and range boundary

`SCBinaryLink::getName()` confirms the original Russian labels: type 1 `Упорядочивание`, type 2 `Состав`, type 3 `Компоновка`. `getCode()` composes endpoint-code strings in slots 0/1/2 and uses `-` for a null endpoint. Neither method reads `range` (`private+0x2C`). A bounded `objdump -p` scan of the host and five plugins found no exact decorated-symbol references to `getRange`/`setRange`; dynamic resolution and ordinal imports remain outside this scan. The numeric meanings of range values 1 and 99 remain unresolved. See `docs/35_stage1_17_scbinarylink_display_names_and_range_boundary.md`.


**SCBinaryLink display/range update validation (1 November 2026):** 70/70 Python tests; 8/8 native C++ ABI/layout programs compiled and executed; 20/20 SHA-pinned ConceptStructure/SCBinaryLink evidence checks; 6/6 supplied host/plugin files passed the bounded named-symbol scan with exact SHA-256 matches. The three sample projects have empty `ConceptModel/cs` collections, so they do not validate `SCBinaryLink` range values. Original Windows runtime, dynamic symbol resolution and heap profiling remain untested.


## Stage 1.17 — SubjectCategory domain and arrangement auto-range

- `docs/36_stage1_17_subject_category_domains_and_autorange_contract.md` documents the seven-value DLL class-character domain while keeping the five GUI choices, six F1 labels and seven formal-model levels separate. It also records thesis-derived relation constraints, three distinct category properties (`CodingType`, `CStype`, `CategoryStatus`), and the exact two-pass `ConceptStructure::codeStructure` behavior.
- `analysis/disassembly/concept_structure_endpoint_and_range_contract.asm` contains SHA-pinned PE32 excerpts for the class map, category accessors, link-binding APIs and auto-range support.
- `analysis/concept_structure/code_structure_tree_audit.json` is the machine-readable evidence contract; the ConceptStructure audit now checks 25 fingerprints against the supplied `MAIWmodels.dll`.
- The auto-range pass is restricted to categories with `autoRange!=0` and type-3 links where the current category occupies binding endpoint index 0 and endpoint slot 2 is null. Candidates are ordered by endpoint 1 `(class,group,number)` and assigned ranks 1..N. It is independent of the earlier `CodingType==0` tuple-index pass.

**Validation (1 November 2026):** 74 Python tests; 26/26 ConceptStructure evidence checks; 38/38 nested-tree checks; 30/30 ownership checks; 19/19 AEContentLink checks; 14 PM_auto static checks; 8/8 native C++ ABI/layout programs. Seven principal source PE32 files match their pinned SHA-256 values. Static analysis only; original Windows runtime, heap trace and `.is2` serializer round-trip have not been performed.


## Stage 1.17 — IS-2 project writer and range persistence (1 November 2026)

- `docs/37_stage1_17_is2_project_writer_and_range_persistence.md` — identifies the shared `IS.exe` project writer at `0x0040B9D0` (RVA `0xB9D0`), its two MainForm save call sites, output path, and bounded ConceptModel serializer behavior.
- `analysis/disassembly/isexe_project_writer_0040b9d0.asm` — literal GNU objdump excerpts for save handlers, the top-level DOM writer, ConceptModel category/link traversal, range writer, and category writer.
- `analysis/project_writer/project_writer_audit.json` — machine-readable SHA-pinned evidence result.
- `tools/audit_stage117_project_writer.py` — reproducible 21-check static audit against the exact supplied `IS.exe` SHA-256.
- `tests/test_stage117_project_writer.py` — regression coverage for the new report and audit snapshot.

**New findings:** the original host writes projects using `QFile::WriteOnly`, a `QTextStream` configured to UTF-8, and `QDomDocument::toString(1)`. The ConceptModel link writer directly reads `AIEBinaryLinkPrivate+0x2C` and persists it as XML attribute `range`; the matching reader at `0x00406380` reads that attribute back into the same private field. This corrects the scope of the previous bounded decorated-import scan: no named `getRange/setRange` import was found, but direct private-field serialization is present. `range=1/99` semantics remain unresolved. The SubjectCategory writer serializes `class`, `group`, `number`, `status`, `autoRange`, and `codingType` and sets the element tag to `pk`.

**Validation:** 21/21 project-writer fingerprints; the complete Stage 1.17 Python suite is rerun after restoring the exact original binaries from the supplied RAR. No original Windows runtime save/reopen or `.is2` round-trip was performed. All three supplied projects still have empty `ConceptModel/cs/elemets` and `ConceptModel/cs/links` collections, so they do not provide a golden test for these serializer branches.


## Stage 1.17 — ConceptModel writer/reader tree symmetry

- `docs/47_stage1_17_conceptmodel_writer_reader_tree_symmetry.md` — maps the writer-created `ConceptModel` root and its direct `cs`, `spz`, `content` children to the corresponding reader path; documents the `FStructure` → `cs` and `IStructure` → `spz` intermediate DOM tag renames and the reciprocal metadata/range fields.
- `tools/audit_stage117_conceptmodel_tree.py` — 42-fingerprint SHA-256-pinned static audit against the supplied `IS.exe`.
- `analysis/project_writer/conceptmodel_tree_audit.json` — machine-readable 42/42 PASS snapshot.
- `analysis/disassembly/conceptmodel_*.asm` — address-labelled writer, helper, reader and caller excerpts for both directions.
- `tests/test_stage117_conceptmodel_tree.py` — regression tests for the new audit and its evidence boundary.

**Historical finding:** the outer `ConceptModel` XML tree and selected metadata fields are statically symmetric. The supplied projects still have empty `cs/elemets` and `cs/links`, and no original Windows load-save-load test was performed. Runtime round-trip validation is transferred to Stage 2; see `docs/51_stage1_closeout_2026-11-01.md`.
