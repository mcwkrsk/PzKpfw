"""Run the assistant workflow end to end in an isolated disposable repository."""
from __future__ import annotations

import argparse
import json
from pathlib import Path
import subprocess
from zipfile import ZipFile

from is2_re.assistant import (
    AssignmentInput,
    CourseworkAssignment,
    build_assignment_plan,
    execute_plan,
)
from is2_re.coursework import create_course_project
from is2_re.document import ProjectDocument
from is2_re.docx_report import ReportOptions, write_docx_report
from is2_re.exports import write_export
from is2_re.git_support import create_git_checkpoint, inspect_git_status
from is2_re.ocr_report import export_report_bundle


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_FIXTURE = ROOT / "tests" / "fixtures" / "assistant" / "cylindrical_design.json"


def _git(repository: Path, *arguments: str) -> str:
    completed = subprocess.run(
        ["git", *arguments],
        cwd=repository,
        check=False,
        capture_output=True,
        timeout=30,
    )
    if completed.returncode:
        message = completed.stderr.decode("utf-8", errors="replace").strip()
        raise RuntimeError(message or f"Git exited with code {completed.returncode}")
    return completed.stdout.decode("utf-8", errors="strict").strip()


def run_smoke(output_directory: Path, fixture_path: Path = DEFAULT_FIXTURE) -> dict[str, object]:
    output = output_directory.resolve()
    if output.exists() and any(output.iterdir()):
        raise ValueError(f"smoke output directory is not empty: {output}")
    output.mkdir(parents=True, exist_ok=True)

    payload = json.loads(fixture_path.read_text(encoding="utf-8"))
    definition = payload["assignment"]

    _git(output, "init", "-q")
    _git(output, "config", "user.name", "PzKpfw Smoke")
    _git(output, "config", "user.email", "smoke@example.invalid")

    project_path = output / "cylindrical_design.is2"
    document = create_course_project("Контрольный проект", "Расчёт передачи")
    document.save(project_path)
    _git(output, "add", project_path.name)
    _git(output, "commit", "-q", "-m", "Initial smoke project")

    assignment = CourseworkAssignment(
        title=definition["title"],
        transmission_kind=definition["transmission_kind"],
        calculation_mode=definition["calculation_mode"],
        parent_action_id=definition["parent_action_id"],
        inputs=tuple(AssignmentInput(**item) for item in definition["inputs"]),
        perform_calculations=True,
    )
    source_before_preview = document.to_bytes()
    plan = build_assignment_plan(document, assignment)
    execution = execute_plan(document, plan)
    if document.to_bytes() != source_before_preview:
        raise AssertionError("assistant preview changed the source project")
    if execution.validation_issues_after:
        raise AssertionError(f"assistant candidate is invalid: {execution.validation_issues_after}")
    for key in ("xml_reopens", "semantic_preserved", "writer_idempotent"):
        if not execution.writer_preflight.get(key):
            raise AssertionError(f"writer preflight failed: {key}")

    execution.candidate.save(project_path)
    reopened = ProjectDocument.load(project_path)
    validation_issues = reopened.validate(deep=True)
    if validation_issues:
        raise AssertionError(f"saved project is invalid: {validation_issues}")
    if reopened.semantic_snapshot() != execution.candidate.semantic_snapshot():
        raise AssertionError("saved project changed after reopening")

    values = {node.get("sign"): node.get("value") for node in reopened.params_node.findall("param")}
    for symbol, expected in payload["expected_parameters"].items():
        if values.get(symbol) != expected:
            raise AssertionError(f"{symbol}: expected {expected}, got {values.get(symbol)}")

    checkpoint = create_git_checkpoint(
        output,
        message="Проверенный расчёт цилиндрической передачи",
        paths=[project_path.name],
    )

    docx_path = output / "course_report.docx"
    html_path = output / "project_overview.html"
    svg_path = output / "diagram.svg"
    write_docx_report(
        reopened,
        docx_path,
        ReportOptions(author="Тестовый студент", group="ИДБ-24-17"),
        source_path=project_path,
    )
    write_export(reopened, html_path, "report", source_path=project_path)
    write_export(reopened, svg_path, "diagram", source_path=project_path)
    bundle = export_report_bundle(
        output / "markdown_report",
        reopened,
        assumptions=plan.assumptions,
        manual_checks=plan.manual_checks,
    )
    if ZipFile(docx_path).testzip() is not None:
        raise AssertionError("DOCX report archive is damaged")
    markdown = bundle.report_path.read_text(encoding="utf-8")
    if "Расчетное передаточное отношение" not in markdown:
        raise AssertionError("Markdown report does not contain the calculated parameters")
    if "необязательная численная проверка формул" not in markdown:
        raise AssertionError("Markdown report does not explain the optional calculation boundary")
    if "не выполняет инженерный расчет" in markdown:
        raise AssertionError("Markdown report contains the obsolete calculation disclaimer")

    status = inspect_git_status(output)
    result: dict[str, object] = {
        "status": "passed",
        "project": str(project_path),
        "checkpoint": checkpoint.commit,
        "checkpoint_message": checkpoint.message,
        "operations": len(plan.operations),
        "calculated_parameters": len(payload["expected_parameters"]),
        "actions": len(reopened.actions),
        "parameters": len(reopened.params_node),
        "objects": len(reopened.objects_node),
        "validation_issues": validation_issues,
        "writer_preflight": execution.writer_preflight,
        "exports": [str(docx_path), str(bundle.report_path), str(html_path), str(svg_path)],
        "remaining_git_changes": [item.path for item in status.changes],
    }
    (output / "smoke_result.json").write_text(
        json.dumps(result, ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=ROOT / "tmp" / "end_to_end_smoke",
        help="empty directory for the isolated repository and generated reports",
    )
    parser.add_argument("--fixture", type=Path, default=DEFAULT_FIXTURE)
    args = parser.parse_args()
    result = run_smoke(args.output_dir, args.fixture)
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
