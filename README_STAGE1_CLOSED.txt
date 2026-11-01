IS-2 RESEARCH KIT — STAGE 1 CLOSED
Decision date: 1 November 2026
Status: CLOSED (static reverse-engineering baseline)

This package is the final Stage 1 handoff. It contains:
- original, hash-pinned PE32 binaries in ./original/ (IS.exe, MAIWmodels.dll, five plugin DLLs);
- the complete research project in ./continuation/ (reports, disassembly, source snippets, read-only tools, tests, sample projects, SDK/ABI notes);
- the formal closure report at ./continuation/docs/51_stage1_closeout_2026-11-01.md;
- the five-project sample corpus report at ./continuation/docs/52_stage1_sample_corpus_and_spd_final_validation.md;
- machine-readable final checks and all seven original PE SHA-256 values at ./continuation/analysis/stage1_closeout_validation.json.

Final verification recorded for this package:
- Python regression suite: 137/137 PASS.
- Native C++ ABI/layout checks: 8/8 PASS (C++17, -Wall -Wextra -Werror -pedantic).
- Active SHA-pinned audits: plugin shutdown 33/33; widget parent lifecycle 31/31; concrete widget lifecycle 49/49; ConceptModel tree symmetry 42/42; project writer 21/21; ConceptStructure 26/26; auto-range 18/18; number/group 17/17; nested tree 38/38; post-erase ownership 30/30; primaryModel/spd 21/21.
- Historical ConceptModel mismatch reconciliation: 5/5, status SUPERSEDED (not an active mismatch).
- Original PE32 identity: 7/7 SHA-256 PASS.
- XML corpus: 5 distinct projects; 82/82 sibling-order chains PASS.

Scope boundary:
Stage 1 is closed as a static research baseline. The original Windows application was NOT executed, and no real .is2 load-save-reopen round-trip was run. No claim of full runtime equivalence, no-leak behavior, safe plugin shutdown, or release readiness is made. The remaining Windows/Qt runtime, heap tracing, non-empty ConceptModel/cs golden sample, serializer parity, and legal/release-rights checks are explicit Stage 2 / release gates. See docs/51 for exact criteria.

Research/private package. Permission to decompile is not treated as blanket permission to publish original binaries, derived source, branding, or commercial distributions.

Start here: ./continuation/README.md
