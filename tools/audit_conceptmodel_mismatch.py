#!/usr/bin/env python3
"""Historical-evidence audit: confirms that docs/44 is superseded, not that a mismatch exists."""
from pathlib import Path
import json
ROOT = Path(__file__).resolve().parents[1]
history = (ROOT / "docs/44_stage1_17_conceptmodel_writer_reader_mismatch_proof.md").read_text(encoding="utf-8")
corrected = (ROOT / "docs/47_stage1_17_conceptmodel_writer_reader_tree_symmetry.md").read_text(encoding="utf-8")
factory = (ROOT / "analysis/disassembly/conceptmodel_cs_factory_0x40ac20.asm").read_text(encoding="utf-8").lower()
writer = (ROOT / "analysis/disassembly/conceptmodel_writer_0x40a6d0.asm").read_text(encoding="utf-8").lower()
checks = {
    "historical_report_marked_superseded": "Исторический отчёт, superseded" in history,
    "corrected_report_records_fstructure_to_cs_rename": "setTagName" in corrected and "FStructure" in corrected and "cs" in corrected,
    "factory_calls_fstructure_template": "call   0x40a5d0" in factory,
    "factory_sets_final_cs_tag": "0x419bb4" in factory and "0x457bac" in factory,
    "top_writer_appends_factory_result": "call   0x40ac20" in writer and "0x419b58" in writer,
}
result = {
    "audit": "historical-conceptmodel-mismatch-reconciliation",
    "checks": checks,
    "passed": sum(checks.values()),
    "total": len(checks),
    "status": "SUPERSEDED" if all(checks.values()) else "FAIL",
    "scope": "historical report reconciliation against the corrected wrapper disassembly; not a runtime round-trip",
    "active_conclusion": "ConceptModel writer-reader outer-tree symmetry is statically confirmed by docs/47 and the SHA-pinned 42/42 binary audit"
}
(ROOT / "analysis/conceptmodel_mismatch_followup_audit.json").write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
print(json.dumps(result, ensure_ascii=False, indent=2))
raise SystemExit(0 if result["status"] == "SUPERSEDED" else 1)
