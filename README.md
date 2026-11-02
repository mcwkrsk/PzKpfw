# PzKpfw Desktop Alpha 0.7.9 "Aachen"

**Status: STAGE 1 CLOSED; STAGE 2 ACTIVE — PzKpfw Desktop Alpha 0.7.9.**

**PzKpfw is an open-source desktop editor and XML toolkit for IS-2 project files.** It is an independent fork/tooling project, not the original IS-2 application. The release is source-first: Python source, tests, technical documentation, native contract checks, build scripts and CI configuration are included.

> **Compatibility status:** structural XML compatibility is tested. 

## Core functionality retained from 0.7.7

- PrimaryModel parameters and objects are first-class graph entities. Native `param/@o` assignments are rendered as virtual Parameter → Object relations without adding synthetic XML records.
- Link repair can batch multiple explicit endpoint fixes in one previewed, atomic Undo transaction.
- The metadata-only operation journal records UTC timestamps, grouped operations, SHA-256 state fingerprints and compressed-snapshot sizes, and can be exported as JSON.
- Projects can be backed up exactly outside `.is2`; changed saves create verified backups, and restore creates a rollback copy before replacing an existing project.
- Parameter/object assignment is editable in the GUI and CLI. Target object IDs are validated; deleting an object with parameter references requires explicit clearing and is atomic.
- Graph columns can be collapsed/expanded from their headings. Collapsed groups are saved per project and restored on reopen; `Развернуть всё` reopens every group.
- The per-project editor sidecar restores active tab, tree and graph selections, window geometry, graph filter/search, node positions, zoom and collapsed graph groups. Schema v3 migrates older v1/v2 preferences and remains separate from native `.is2` XML.
- Added CLI commands `set-parameter-object` and `delete-object`; graph export supports `parameter_object`.
- Added CLI regression tests for parameter/object references, explicit clear-before-delete behavior and preservation of native project bytes by view-only actions.


## What is new in 0.7.9

- **Three-way merge:** combine a common base, your local project and an incoming project. Independent edits merge automatically. Concurrent edits, delete/modify cases, same-ID additions and ambiguous repeated anonymous records become stable conflict rows. Choose `ours`, `theirs` or `base` for each conflict; unresolved conflicts prevent output creation.
- **Visual graph comparison:** compare two recovered relationship graphs side by side. Changed entities and rewired endpoint slots are highlighted; added/removed nodes and edges are shown separately. Index-based link identities and opaque records are explicitly warned about.
- **Dependency-aware restore bundles:** enable “Включать связанные записи” in the version-comparison window, or use `restore-diff --include-related`. Starting from a removed object, the bundle follows known typed links and adds only related objects/relations that are missing from the current project. A final user review, ambiguity opt-in and validation preflight are still required.
- **Safer native IDs:** `id="0"` is treated as a sentinel instead of a stable unique identity. This matters for native relationship records that reuse zero IDs.
- Added GUI tools **Project → Сравнить графы связей…** and **Project → Объединить три версии…**, plus CLI commands `graph-diff` and `merge`.
- All merge/restore results are previews until explicitly applied in the GUI or written to a separate CLI output. No PzKpfw metadata is inserted into native `.is2` files.

## What was new in 0.7.8


- Added semantic comparison of two `.is2` projects. Stable nonzero `@id` values and `Module/@name` are used to identify records; anonymous repeated XML nodes are positionally matched and explicitly marked ambiguous.
- Added a GUI comparison workspace under **Project → Сравнить с другой версией…** with a change list, XML paths, old/current values, ambiguity warnings and selective restoration.
- Added selective restore of nodes missing from the current project and old values for modified attributes/text. Newer-only nodes are shown but are not removed unless the user explicitly enables reverting additions.
- Restores apply to an in-memory clone, compare validation issue counts, check writer idempotence and remain one Undo transaction. Files are never written automatically from the GUI.
- Added CLI commands `diff` and `restore-diff`; CLI writes only to separate output paths and requires explicit diff operation IDs. Positional restoration and reverting additions require explicit flags.
- No PzKpfw metadata is written into native `.is2` XML. Public Git hosting and contribution workflow remain deferred.

## Link integrity and repair retained from 0.7.6

- Added a typed link-integrity inspector for dangling endpoints in `SCBinaryLink`, `AIEBinaryLink`, `AEContentLink` and native `PrimaryModel param/@o` references.
- Added a conservative repair wizard under **Project → Исправление повреждённых ссылок**. It lists the expected endpoint domain and existing candidate IDs; users must explicitly choose the target. The wizard never guesses an intended ID.
- Repair operations run against a cloned document, preserve unknown attributes/nested XML, and enter the existing Undo/Redo history as one operation.
- Added explicit clearing only for endpoint slots whose recovered native contract allows null (`AIEBinaryLink` slots, `PrimaryModel param/@o`, and `SCBinaryLink type=3 e3`). Required `AEContentLink` endpoints and required `SCBinaryLink` slots cannot be cleared.
- Added CLI commands `link-integrity` and `repair-links`. Repair mode is dry-run by default. Writing requires `--apply` and a separate `--output` path; the source project can never be overwritten by the repair command. Existing destinations require `--overwrite`.
- Reports include duplicate IDs, opaque records, candidate target IDs and post-repair validation results. Any remaining validation issues block CLI output writing.

## Backups and operation history retained from 0.7.7

- Added a batch link-repair workflow in the GUI: queue multiple explicit endpoint remaps/clears, preview the combined candidate, then commit all changes as one atomic Undo entry.
- Extended the operation journal with UTC timestamps, action kinds, sub-operation details, compressed-snapshot sizes and SHA-256 state fingerprints. The journal is metadata-only, bounded to 500 events by default, and exportable as JSON.
- Added exact external project backups under `.pzkpfw-backups/<project filename>/`. Save creates a verified backup before replacing different bytes; identical saves do not create duplicates.
- Added validated backup listing and atomic restore with automatic rollback backup of an existing destination.
- Added CLI commands `backup`, `list-backups` and `restore-backup`; overwrite requires an explicit flag.
- Backups and journals are stored outside `.is2`; no PzKpfw-specific XML markup is introduced.

## Features retained from 0.7.4

- Interactive relationship graph for `AFElement`, `SubjectCategory`, spz `AElement` and the recovered relationship records `SCBinaryLink`, `AIEBinaryLink` and `AEContentLink`.
- Create, edit and delete supported relationship records directly from the graph. Relationship nodes keep their endpoint slots (`e1`, `e2`, `e3`) explicit; the UI does not invent direction for multi-endpoint records.
- Drag nodes to arrange the view, pan with the middle mouse button, zoom with the toolbar or Ctrl+mouse wheel, and fit the current layout. Automatic layout places the three known relationship families in separate columns.
- Node coordinates and zoom persist in `<project>.is2.pzkpfw-view.json`; view preferences never enter the native `.is2` document. The sidecar can be deleted without affecting the project.
- Double-click a relation node to edit it; double-click an entity to navigate to its editor. Use the graph's relation filter and search box to narrow the view.
- Live **Edit → History** timeline lists undo and redo operations. Graph edits use the same bounded (50-state) snapshot history as the rest of the document. `Ctrl+Z`, `Ctrl+Y` and `Ctrl+Shift+Z` are available.
- Dependency preflight report with per-entity risk levels, known inbound references, dangling endpoints and opaque-record warnings before destructive operations. Model-level deletion methods remain the final atomic guard.
- ConceptModel class/group filtering, atomic multi-category group edits, an extended catalog report, and advanced JSON editing of extra XML attributes while preserving IDs and nested unknown XML children. Group edits are represented as one atomic history operation.
- Compound edit history entries for bulk operations and direct navigation to undo/redo timeline boundaries. The History window exposes the current undo and redo order.
- Safe XML writer preflight: re-open serialized XML, compare the semantic tree, check idempotent serialization and validate the reopened document before replacing a project file.
- CLI commands for project summary, validation, graph export, dependency audit, compatibility audit, round-trip writing and supported model edits.
- MIT license for original PzKpfw-authored code, tests, build scripts and documentation, subject to the scope notes in `LICENSE` and `RESEARCH_MATERIALS_NOTICE.md`.

## Quick start

Requirements: Python 3.10 or newer. The desktop UI uses the standard-library `tkinter` module and a working Tcl/Tk installation. No third-party Python runtime packages are required.

### Windows

```powershell
py -3 -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip setuptools
python -m pip install -e ".[test]"
python -m is2_re.gui
```

Or use the included `Запустить_PzKpfw.bat` after installing the package, or `run_pzkpfw.bat` to launch directly from `src/`.

### Linux

```bash
python3 -m venv .venv
. .venv/bin/activate
python -m pip install --upgrade pip setuptools
python -m pip install -e '.[test]'
python -m is2_re.gui
```

Or run `./run_pzkpfw.sh` from this directory.

## Build from source

The source tree is the canonical build input. To run tests and produce an installable wheel:

```bash
python -m pip install -e '.[test]'
python -m pytest -q
python -m pip wheel . --no-deps --no-build-isolation --wheel-dir dist
```

Convenience scripts: `tools/build_from_source.sh` and `tools/build_from_source.ps1`. To create the clean public ZIP/TAR.GZ source archives (excluding private references and original EXE/DLL binaries), run:

```bash
python tools/package_source_release.py --output-dir ../release
```

See [`docs/build_from_source.md`](docs/build_from_source.md) for offline/local builds, native checks and reproducibility notes.

## Tests

```bash
python -m pytest -q
```

For a GUI smoke test on Linux, run under a display server or Xvfb:

```bash
xvfb-run -a python tools/smoke_gui.py samples/kursach_user_supplied_42_actions.is2
python tools/create_synthetic_relationship_fixture.py
xvfb-run -a python tools/smoke_project_diff_gui.py
```

To run the complete validation script (Python suite, sample round-trip, compatibility report, C++ ABI/layout contract checks and GUI smoke test):

```bash
./tools/validate_desktop_alpha.sh
```

Some GUI tests are skipped by the full validation script when `xvfb-run` is unavailable; the script reports the skip. Windows runtime acceptance with the original IS-2 must be done separately; see [`docs/windows_runtime_acceptance.md`](docs/windows_runtime_acceptance.md) and `tools/windows_runtime_acceptance.ps1`.

## CLI

```bash
pzkpfw-project summary path/to/project.is2
pzkpfw-project validate path/to/project.is2 --json
pzkpfw-project graph path/to/project.is2 --output graph.json
pzkpfw-project layout path/to/project.is2 --output layout.json
pzkpfw-project concept-report path/to/project.is2 --output concept.json
pzkpfw-project dependencies path/to/project.is2 --output dependencies.json
pzkpfw-project link-integrity path/to/project.is2 --output link-integrity.json
pzkpfw-project repair-links path/to/project.is2 --set aie_binary_link:0:e2=2
pzkpfw-project repair-links path/to/project.is2 --set aie_binary_link:0:e2=2 --apply --output repaired.is2
pzkpfw-project backup path/to/project.is2
pzkpfw-project list-backups path/to/project.is2
pzkpfw-project restore-backup path/to/backup.is2.bak restored.is2
pzkpfw-project diff reference.is2 current.is2 --output changes.json
pzkpfw-project restore-diff reference.is2 current.is2 restored.is2 --select D000003 --include-related --allow-ambiguous
pzkpfw-project graph-diff reference.is2 current.is2 --output graph-changes.json
pzkpfw-project merge base.is2 ours.is2 theirs.is2 merged.is2 --report merge-report.json
pzkpfw-project merge base.is2 ours.is2 theirs.is2 merged.is2 --resolve M000001=theirs
pzkpfw-project set-parameter-object input.is2 output.is2 PARAMETER_ID --object-id OBJECT_ID
pzkpfw-project set-parameter-object input.is2 output.is2 PARAMETER_ID --clear
pzkpfw-project delete-object input.is2 output.is2 OBJECT_ID --clear-parameter-references
pzkpfw-project compatibility path/to/project.is2
pzkpfw-project roundtrip input.is2 output.is2
```

The `dependencies` report is advisory: it lists recovered references and opaque-record risk; deletion APIs still perform their own checks and may block edits they cannot prove safe. Link repair is also conservative: `repair-links` previews by default, supports multiple repeated `--set`/`--clear` entries in one transaction and writes only to a separate destination when `--apply` is supplied. No fuzzy ID matching or automatic endpoint guessing is performed. `backup`, `list-backups` and `restore-backup` manage exact external snapshots; restoring over an existing file requires `--overwrite` and creates a rollback backup by default. The `diff` command creates a semantic comparison report; `restore-diff` selectively restores chosen changes into a separate output file after dependency and writer preflight. See [`docs/project_diff_restore.md`](docs/project_diff_restore.md) for match rules, ambiguity handling and examples.

## Source layout

- `src/is2_re/` — all PzKpfw runtime Python source (no closed Python modules).
- `tests/` — complete Python regression suite and native C++ contract checks.
- `tools/` — build, validation, GUI smoke and research utility scripts.
- `docs/` — technical format, model, plugin-contract, GUI, build and compatibility notes.
- `sdk/` — reconstructed ABI contract headers authored for this project; not an original vendor SDK.
- `analysis/` — reverse-engineering observations used to document and test recovered contracts; see research notice.
- `samples/` — sanitized regression project fixtures plus `synthetic_relationships_0.7.3.is2`, a generated fixture with all three recovered relationship kinds; see research notice.

`reference-private/`, original EXE/DLL files, private screenshots and commercial runtimes are deliberately excluded from this distribution.

## Compatibility and known limits

PzKpfw reads and writes the supported IS-2 XML envelope, preserves unknown XML nodes/attributes and validates its own writer round-trip. It does **not** claim that every recovered plug-in/module setting is fully editable. Some `ModuleParams` values are project-specific and are not fabricated for new projects. Opaque/unknown relationship records are preserved and protected from typed edits.

The original Windows application has not been launched in this Linux environment. Before relying on a modified file in an IS-2 installation, test a copy using the Windows acceptance harness and checklist. Never overwrite your only source project. A public Git repository, Git version history and contribution workflow are deliberately deferred and are not part of this release.
