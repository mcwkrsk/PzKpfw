IS-2 FORK — STAGE 2 READER/WRITER MVP
Date: 1 November 2026
Status: IMPLEMENTED FIRST MILESTONE; STAGE 2 CONTINUES

WHAT IS DELIVERED
- Stage 1 static reverse-engineering baseline and hash-pinned original PE references.
- Python editable XML document layer: continuation/src/is2_re/document.py
- CLI: continuation/src/is2_re/cli.py; source launcher: continuation/tools/is2_project.py
- Five-sample semantic reader/writer validator: continuation/tools/validate_stage2.py
- Tests: continuation/tests/test_stage2_document.py
- Implementation boundary: continuation/docs/53_stage2_reader_writer_mvp.md

VERIFICATION
- pytest: 156 passed
- Native C++ ABI/layout checks: 8/8 compiled and executed
- Five real sample files: 5/5 load + validate + write + reopen + semantic comparison
- CLI installation and smoke tests: PASS
- Detailed records: continuation/analysis/stage2_validation.txt,
  continuation/analysis/stage2_validation.json,
  continuation/analysis/stage2_sample_roundtrip.json

QUICK START (from continuation/)
  python -m pip install -e .
  is2-project validate samples/kursach_user_supplied_42_actions.is2
  is2-project roundtrip samples/kursach_user_supplied_42_actions.is2 /tmp/copy.is2
  is2-project add-action samples/kursach_user_supplied_42_actions.is2 /tmp/edited.is2 \
    --name "Новый шаг" --type 0 --parent-id 9 --level 5 --number 13
  pytest -q

IMPORTANT BOUNDARIES
- The writer preserves the complete XML tree and unknown fields, but byte-identical
  output to Qt QDomDocument::toString(1) is not claimed.
- primaryModel/spd type=2/type=3 editing is implemented and follows observed afe3 chains.
- Parameter/Object basic CRUD and serialized high-water IDs are implemented with
  conservative deletion guards.
- ConceptModel/cs, spz and content remain preserved opaque XML subtrees. Typed
  non-empty ConceptStructure serialization awaits an authentic golden sample.
- Original Windows/Qt executable runtime and original-app load-save-reopen parity
  have NOT been performed. Full runtime compatibility and release-readiness are NOT claimed.
- This is a private research/development package. Do not publish supplied binaries,
  decompilation artifacts, branding, or derivative code without confirming the
  exact scope of author permission and third-party licenses.

Stage 1 remains CLOSED. Stage 2 is IN PROGRESS; the reader/writer MVP is the first
implemented milestone, not completion of the entire fork.
