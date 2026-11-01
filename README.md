# PzKpfw - IS-2 Reverse Engineering & Fork — Stage 2 Desktop Alpha

**Stage 1: CLOSED. Stage 2: IN PROGRESS. Current deliverable: IS-2 Studio Desktop Alpha (v0.3.0).**

This package now includes a runnable Tkinter desktop editor, a CLI, an XML-backed editable model, validation, and a conservative UTF-8 writer. Start at [`README_STAGE2_DESKTOP.txt`](README_STAGE2_DESKTOP.txt); on Windows, double-click [`Запустить_IS2_Studio.bat`](Запустить_IS2_Studio.bat).

## Implemented

- Empty-project creation from the recovered common XML envelope.
- Project/user metadata editing.
- Graph view of `PrimaryModel/spd` with composition (`type=2`) and sibling-order (`type=3`) edges.
- PrimaryModel/spd action hierarchy CRUD and maintenance of type-2 composition/type-3 sibling chains.
- Parameter and object record CRUD with ID safeguards.
- ConceptModel/cs typed SubjectCategory (`pk`) and SCBinaryLink (`link`) CRUD, validation and bounded AutoRange reconstruction.
- Read-only inspection of spz/content and XML; unknown nodes/attributes are retained.
- Atomic writer, semantic round-trip validation, five-sample regression corpus.

## Latest verification

- Python regression tests: **180 passed**.
- Native C++ ABI/layout programs: **8/8 compiled and executed**.
- Real sample projects: **5/5 load → validate → write → reopen → semantic compare**.
- Tk desktop smoke test under virtual display: **PASS** on the supplied `kursach_.is2` (42 actions, 10 parameters, 2 objects, 42 rendered diagram nodes; empty-project GUI smoke PASS).
- Editable package installation and CLI/GUI entry-point metadata: **PASS** (Python package v0.3.0).

These checks cover the independent fork implementation and static ABI contracts. The original Windows/Qt IS.exe has not yet been run against files written by the replacement. Full feature parity and byte-identical Qt XML serialization are not claimed.

## Main paths

- Application: `continuation/src/is2_re/gui.py`
- Document model/writer: `continuation/src/is2_re/document.py`
- ConceptModel editor model: `continuation/src/is2_re/concept.py`
- CLI: `continuation/src/is2_re/cli.py`
- Tests: `continuation/tests/`
- Evidence and static analysis: `continuation/analysis/`, `continuation/docs/`

## Not yet implemented

Full spz/content editing, primary matrix editing, original plugin-equivalent tools (PM_auto, PM_params, PM_spec_WEB, PM_matrix_web, Model_Visualiser), drag-to-reorder editing on the diagram, plugin-specific new-project defaults, original Windows runtime compatibility gate, and a standalone Windows executable/installer.

This remains a private research/development package. Do not externally distribute supplied original binaries, decompilation artifacts, branding, or derivative code until ownership and third-party licence permissions are confirmed. See `continuation/docs/attribution_and_licenses.md` and `continuation/reference-private/source-materials/author_permission_note.txt`.
