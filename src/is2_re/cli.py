"""Command-line interface for the IS-2 reader/writer."""
from __future__ import annotations

import argparse
import json
from pathlib import Path
import sys

from . import ProjectDocument, ProjectFormatError, load_project, audit_document
from .graph import build_relationship_graph, filter_relationship_graph
from .dependencies import dependency_report
from .graph_layout import automatic_relationship_layout
from .view_state import save_view_state, sidecar_path
from .repair import link_integrity_report, apply_link_repairs, parse_repair_assignment, RepairError
from .backups import (BackupError, create_project_backup, list_project_backups,
                      restore_project_backup, backup_report)
from .diff import (ProjectDiffError, compare_project_files, apply_selected_restores, expand_related_restore_bundle)
from .merge import ProjectMergeError, merge_documents
from .graph_diff import compare_relationship_graphs
from .exports import write_export
from .decomposition import convert_action, insert_sibling
from .specifications import add_primary_link, remove_primary_link, set_primary_link_power, primary_links
from .feature_audit import feature_audit
from .coursework import (create_course_project, renumber_structure, course_checklist,
                         build_course_scene, scene_svg, set_alternative_labels)


def _pairs(values: list[str]) -> dict[str, str]:
    result: dict[str, str] = {}
    for item in values:
        if "=" not in item:
            raise ValueError(f"expected KEY=VALUE, got {item!r}")
        key, value = item.split("=", 1)
        if not key or key in result:
            raise ValueError(f"empty or duplicate key in {item!r}")
        result[key] = value
    return result


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Inspect, validate, edit and round-trip IS-2 XML projects.")
    sub = parser.add_subparsers(dest="command", required=True)

    p = sub.add_parser("export", help="export a read-only HTML overview, SVG diagram, or CSV relation table")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("--kind", choices=("report", "diagram", "relations", "matrix", "primary-matrix", "specifications"), required=True)
    p.add_argument("--overwrite", action="store_true")

    p = sub.add_parser("summary", help="print semantic project summary")
    p.add_argument("input", type=Path)

    p = sub.add_parser("validate", help="validate project structure and graph invariants")
    p.add_argument("input", type=Path)
    p.add_argument("--json", action="store_true")

    p = sub.add_parser("feature-audit", help="inventory supported, experimental, and unknown IS-2 capabilities for a project")
    p.add_argument("input", type=Path)
    p.add_argument("--output", type=Path)

    p = sub.add_parser("course-new", help="create editable .is2 coursework scaffold with coded root")
    p.add_argument("output", type=Path)
    p.add_argument("--title", required=True)
    p.add_argument("--root", required=True)
    p.add_argument("--author", default="")
    p.add_argument("--symbol", default="z")

    p = sub.add_parser("course-renumber", help="explicit PzKpfw codeStructure approximation; writes a separate .is2")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("--symbol", default="z")

    p = sub.add_parser("course-check", help="coursework completeness checklist, not a grade")
    p.add_argument("input", type=Path)
    p.add_argument("--output", type=Path)

    p = sub.add_parser("course-svg", help="export screenshot-style coursework hierarchy as standalone SVG")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("--focus", help="action ID for a local sheet")
    p.add_argument("--depth", type=int, help="optional subtree depth; default is full hierarchy")
    p.add_argument("--overwrite", action="store_true")

    p = sub.add_parser("course-alternatives", help="edit two native <alts> labels on an alternative")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("action_id")
    p.add_argument("--first", required=True)
    p.add_argument("--second", required=True)

    p = sub.add_parser("primary-links", help="list the action/parameter matrix rows without altering XML")
    p.add_argument("input", type=Path)

    p = sub.add_parser("convert-action", help="conservatively convert selected action to elementary/alternative/sequence/iteration")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("action_id")
    p.add_argument("--to", choices=("elementary", "alternative", "sequence", "iteration"), required=True)
    p.add_argument("--replace-children", action="store_true")
    p.add_argument("--drop-content", action="store_true")
    p.add_argument("--child-name", action="append", default=[])

    p = sub.add_parser("insert-sibling", help="insert a new action before/after an existing child in the native sibling chain")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("anchor_id")
    p.add_argument("--position", choices=("before", "after"), required=True)
    p.add_argument("--name", required=True)

    for cmd in ("add-primary-link", "remove-primary-link", "set-primary-link-power"):
        p = sub.add_parser(cmd, help="safely edit one native-shaped primaryModel/matrix action/parameter link")
        p.add_argument("input", type=Path)
        p.add_argument("output", type=Path)
        p.add_argument("--action", required=True)
        p.add_argument("--parameter", required=True)
        p.add_argument("--marker", required=True, choices=("*", "+", "."))
        if cmd != "remove-primary-link":
            p.add_argument("--power", type=int, default=1)

    p = sub.add_parser("inspect-conceptmodel", help="inspect AElement, spz links and content records")
    p.add_argument("input", type=Path)

    p = sub.add_parser("compatibility", help="audit native XML envelope and semantic writer round-trip")
    p.add_argument("input", type=Path)

    p = sub.add_parser("graph", help="export the typed relationship endpoint graph as JSON")
    p.add_argument("input", type=Path)
    p.add_argument("--output", type=Path, help="write JSON to this path instead of stdout")
    p.add_argument("--relation-kind", choices=("all", "scbinarylink", "aie_binary_link", "ae_content_link", "parameter_object"), default="all")
    p.add_argument("--query", default="", help="filter by endpoint ID, entity label, or relationship attributes")

    p = sub.add_parser("link-integrity", help="inspect typed dangling relationship endpoints and repair policy")
    p.add_argument("input", type=Path)
    p.add_argument("--output", type=Path, help="write JSON report to this path")

    p = sub.add_parser("backup", help="create an exact, verified backup of a project")
    p.add_argument("input", type=Path)
    p.add_argument("--backup-dir", type=Path, help="optional backup directory; defaults beside the project")
    p.add_argument("--keep", type=int, default=20, help="maximum number of distinct backups to retain")

    p = sub.add_parser("list-backups", help="list and validate saved project backups")
    p.add_argument("input", type=Path)
    p.add_argument("--backup-dir", type=Path)
    p.add_argument("--output", type=Path, help="optional JSON report destination")

    p = sub.add_parser("restore-backup", help="restore a validated backup to a destination project")
    p.add_argument("backup", type=Path)
    p.add_argument("destination", type=Path)
    p.add_argument("--overwrite", action="store_true", help="replace existing destination after creating a rollback backup")
    p.add_argument("--no-rollback-backup", action="store_true", help="do not keep an automatic backup of an existing destination")

    p = sub.add_parser("repair-links", help="preview or explicitly repair broken typed relationship endpoints")
    p.add_argument("input", type=Path)
    p.add_argument("--set", dest="replacements", action="append", default=[], metavar="KIND:INDEX:SLOT=TARGET_ID")
    p.add_argument("--clear", dest="clears", action="append", default=[], metavar="KIND:INDEX:SLOT")
    p.add_argument("--apply", action="store_true", help="write the repaired copy; without this flag only preview")
    p.add_argument("--output", type=Path, help="destination .is2 path (required with --apply; never overwrite input)")
    p.add_argument("--overwrite", action="store_true", help="allow replacing an existing destination file")
    p.add_argument("--report", type=Path, help="optional JSON report path")

    p = sub.add_parser("dependencies", help="audit references and safe-deletion dependencies")
    p.add_argument("input", type=Path)
    p.add_argument("--output", type=Path, help="write JSON to this path instead of stdout")

    p = sub.add_parser("concept-report", help="summarize ConceptModel/cs classes, groups and numbering")
    p.add_argument("input", type=Path)
    p.add_argument("--output", type=Path, help="write JSON to this path instead of stdout")

    p = sub.add_parser("layout", help="generate automatic graph layout in a separate PzKpfw sidecar")
    p.add_argument("input", type=Path)
    p.add_argument("--output", type=Path, help="optional JSON export path; sidecar is still stored beside the project")

    p = sub.add_parser("diff", help="compare two IS-2 projects and export a semantic change report")
    p.add_argument("reference", type=Path, help="older/reference project")
    p.add_argument("current", type=Path, help="newer/current project")
    p.add_argument("--output", type=Path, help="write JSON report to this path")
    p.add_argument("--include-fragments", action="store_true", help="include XML fragments for removed/added nodes")

    p = sub.add_parser("restore-diff", help="selectively restore old records/fields from a reference project")
    p.add_argument("reference", type=Path)
    p.add_argument("current", type=Path)
    p.add_argument("output", type=Path, help="write restored project to a separate .is2 file")
    p.add_argument("--select", action="append", default=[], required=True, metavar="DIFF_ID",
                   help="diff operation ID such as D000001; may be repeated")
    p.add_argument("--allow-ambiguous", action="store_true", help="allow positional restore for anonymous XML records")
    p.add_argument("--revert-additions", action="store_true", help="also remove selected nodes that exist only in current project")
    p.add_argument("--include-related", action="store_true", help="preview and include missing typed relations/entities connected to selected removed records")
    p.add_argument("--overwrite", action="store_true", help="replace existing output after all preflight checks pass")
    p.add_argument("--report", type=Path, help="write JSON restore report to a separate path")

    p = sub.add_parser("graph-diff", help="compare typed relationship graphs in two IS-2 projects")
    p.add_argument("reference", type=Path)
    p.add_argument("current", type=Path)
    p.add_argument("--output", type=Path, help="write graph-diff JSON report")

    p = sub.add_parser("merge", help="three-way merge a common base, local branch and incoming branch")
    p.add_argument("base", type=Path, help="common ancestor project")
    p.add_argument("ours", type=Path, help="local/current branch; unresolved conflicts default to this branch in preview")
    p.add_argument("theirs", type=Path, help="incoming branch")
    p.add_argument("output", type=Path, help="separate output .is2 path; written only when every conflict is resolved")
    p.add_argument("--resolve", action="append", default=[], metavar="CONFLICT=ours|theirs|base",
                   help="resolve a detected conflict; repeat for multiple conflicts")
    p.add_argument("--report", type=Path, help="write JSON merge report, including unresolved conflicts")
    p.add_argument("--overwrite", action="store_true", help="replace existing output after preflight passes")

    p = sub.add_parser("roundtrip", help="write UTF-8 XML and verify semantic preservation")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)

    p = sub.add_parser("add-action", help="append an action, optionally as a child")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("--name", required=True)
    p.add_argument("--type", dest="action_type", required=True)
    p.add_argument("--formalization", default="0")
    p.add_argument("--status", default="0")
    p.add_argument("--mark", default="")
    p.add_argument("--symbol")
    p.add_argument("--level")
    p.add_argument("--number")
    p.add_argument("--parent-id")
    p.add_argument("--alternative", action="append", default=[])

    p = sub.add_parser("set-action", help="update supported attributes of an action")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("action_id")
    p.add_argument("--set", dest="changes", action="append", required=True, help="KEY=VALUE; empty value removes attribute")

    p = sub.add_parser("delete-action", help="delete an action (requires --cascade for a subtree)")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("action_id")
    p.add_argument("--cascade", action="store_true")
    p.add_argument("--cascade-content", action="store_true", help="remove AEContentLink records that reference the deleted action(s)")

    p = sub.add_parser("add-parameter", help="add a primary-model parameter using params/@LastID")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("--attr", action="append", required=True, help="ATTRIBUTE=VALUE")

    p = sub.add_parser("add-object", help="add a primary-model object using objects/@LastID")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("--name", required=True)

    p = sub.add_parser("set-parameter-object", help="assign a PrimaryModel object to a parameter (native param/@o)")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("parameter_id")
    choice = p.add_mutually_exclusive_group(required=True)
    choice.add_argument("--object-id", help="existing PrimaryModel object ID")
    choice.add_argument("--clear", action="store_true", help="remove the parameter's @o assignment")

    p = sub.add_parser("delete-object", help="delete a PrimaryModel object after dependency preflight")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("object_id")
    p.add_argument("--clear-parameter-references", action="store_true", help="clear @o on every parameter referencing the object")

    p = sub.add_parser("add-spz-element", help="add a scalar AElement under ConceptModel/spz/elemets")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("--name", required=True)
    p.add_argument("--type", default="0")
    p.add_argument("--status", default="0")
    p.add_argument("--formalization", default="0")
    p.add_argument("--level", default="1")
    p.add_argument("--number", type=int)
    p.add_argument("--symbol", type=int, default=99)

    p = sub.add_parser("set-spz-element", help="update scalar AElement attributes")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("element_id")
    p.add_argument("--set", dest="changes", action="append", required=True, help="KEY=VALUE")

    p = sub.add_parser("delete-spz-element", help="delete an AElement when no opaque references can be orphaned")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("element_id")
    p.add_argument("--cascade-links", action="store_true", help="remove spz links referencing this element")

    p = sub.add_parser("add-spz-link", help="create a writer-shaped AIEBinaryLink under ConceptModel/spz/links")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("--e1", default="0")
    p.add_argument("--e2", default="0")
    p.add_argument("--e3", default="0")
    p.add_argument("--name", default="")
    p.add_argument("--type", dest="link_type", default="0")
    p.add_argument("--status", default="0")
    p.add_argument("--formalization", default="0")
    p.add_argument("--level", default="0")
    p.add_argument("--number", default="0")
    p.add_argument("--symbol", default="0")

    p = sub.add_parser("delete-spz-link", help="delete an spz link by its zero-based index")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("index", type=int)

    p = sub.add_parser("set-spz-link", help="update typed endpoints and AElement scalar fields on an existing spz link")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("index", type=int, help="zero-based record index")
    p.add_argument("--set", dest="changes", action="append", required=True, help="e1/e2/e3=ID, name=TEXT, or type/status/formalization/level/number/symbol=INTEGER")

    p = sub.add_parser("add-content-link", help="create an AEContentLink (e1=action, e2=ConceptModel category)")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("--e1", required=True, help="AFElement action ID")
    p.add_argument("--e2", required=True, help="AIElement SubjectCategory ID")
    p.add_argument("--char", type=int, default=0, help="signed 8-bit char field (native constructor default: 0)")
    p.add_argument("--power", type=int, default=1)
    p.add_argument("--duplicate", choices=("reuse", "reject", "increment_power"), default="reuse")

    p = sub.add_parser("delete-content-link", help="delete an AEContentLink by zero-based index")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("index", type=int)

    p = sub.add_parser("set-content-record", help="update e1/e2 endpoints or char/power on a content record")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("index", type=int, help="zero-based record index")
    p.add_argument("--set", dest="changes", action="append", required=True, help="e1=AF action ID, e2=AI category ID, char=VALUE and/or power=VALUE")
    return parser


def main(argv: list[str] | None = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    try:
        if args.command == "diff":
            result = compare_project_files(args.reference, args.current)
            report = result.as_dict(include_fragments=args.include_fragments)
            payload = json.dumps(report, ensure_ascii=False, indent=2) + "\n"
            if args.output:
                protected = {args.reference.resolve(), args.current.resolve()}
                if args.output.resolve() in protected:
                    raise ProjectDiffError("diff report path must differ from both input project paths")
                args.output.parent.mkdir(parents=True, exist_ok=True)
                args.output.write_text(payload, encoding="utf-8")
                print(json.dumps({"output": str(args.output), "summary": result.summary,
                                  "reference_sha256": result.reference_sha256,
                                  "current_sha256": result.current_sha256}, ensure_ascii=False, indent=2))
            else:
                print(payload, end="")
            return 0
        if args.command == "restore-diff":
            reference_path, current_path, output_path = (
                args.reference.resolve(), args.current.resolve(), args.output.resolve()
            )
            if output_path in {reference_path, current_path}:
                raise ProjectDiffError("restore output must be separate; reference/current source files are never overwritten")
            if output_path.exists() and not args.overwrite:
                raise ProjectDiffError("output already exists; pass --overwrite to replace it")
            if args.report:
                report_path = args.report.resolve()
                if report_path in {reference_path, current_path, output_path}:
                    raise ProjectDiffError("restore report path must differ from both inputs and output project")
            reference_doc = ProjectDocument.load(args.reference)
            current_doc = ProjectDocument.load(args.current)
            selected_ids = list(args.select)
            bundle_report = None
            if args.include_related:
                selected_ids, bundle_report = expand_related_restore_bundle(
                    reference_doc, current_doc, selected_ids,
                )
            restored, report = apply_selected_restores(
                reference_doc, current_doc, selected_ids,
                allow_ambiguous=args.allow_ambiguous,
                revert_additions=args.revert_additions,
            )
            if bundle_report is not None:
                report["related_bundle"] = bundle_report
            restored.save(args.output)
            report.update({"reference": str(args.reference), "current": str(args.current),
                           "written_to": str(args.output), "validation": report["validation_status"]})
            if args.report:
                args.report.parent.mkdir(parents=True, exist_ok=True)
                args.report.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
            print(json.dumps({"written_to": str(args.output), "restored_count": report["restored_count"],
                              "validation": report["validation_status"],
                              "remaining_validation_issues": report["validation_issue_count_after"],
                              "report": str(args.report) if args.report else None},
                             ensure_ascii=False, indent=2))
            return 0
        if args.command == "graph-diff":
            reference_doc = ProjectDocument.load(args.reference)
            current_doc = ProjectDocument.load(args.current)
            report = compare_relationship_graphs(reference_doc, current_doc)
            report.update({"reference": str(args.reference), "current": str(args.current)})
            if args.output:
                protected = {args.reference.resolve(), args.current.resolve()}
                if args.output.resolve() in protected:
                    raise ProjectDiffError("graph-diff report path must differ from both input project paths")
                args.output.parent.mkdir(parents=True, exist_ok=True)
                args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
                print(json.dumps({"output": str(args.output), "summary": report["summary"],
                                  "warnings": report["warnings"]}, ensure_ascii=False, indent=2))
            else:
                print(json.dumps(report, ensure_ascii=False, indent=2))
            return 0
        if args.command == "merge":
            base_path, ours_path, theirs_path, output_path = (
                args.base.resolve(), args.ours.resolve(), args.theirs.resolve(), args.output.resolve()
            )
            if output_path in {base_path, ours_path, theirs_path}:
                raise ProjectMergeError("merge output must be a separate path; base/ours/theirs are never overwritten")
            if output_path.exists() and not args.overwrite:
                raise ProjectMergeError("output already exists; pass --overwrite to replace it")
            if args.report and args.report.resolve() in {base_path, ours_path, theirs_path, output_path}:
                raise ProjectMergeError("merge report path must differ from every input and output project")
            resolutions = _pairs(args.resolve)
            candidate, report = merge_documents(
                ProjectDocument.load(args.base), ProjectDocument.load(args.ours),
                ProjectDocument.load(args.theirs), resolutions=resolutions,
            )
            report.update({"base": str(args.base), "ours": str(args.ours), "theirs": str(args.theirs)})
            if args.report:
                args.report.parent.mkdir(parents=True, exist_ok=True)
                args.report.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
            if not report["ready_to_write"]:
                print(json.dumps({"written": False, "ready_to_write": False,
                                  "conflict_count": report["conflict_count"],
                                  "unresolved_conflicts": [item["conflict_id"] for item in report["conflicts"] if item["resolution"] is None],
                                  "report": str(args.report) if args.report else None}, ensure_ascii=False, indent=2))
                return 3
            candidate.save(args.output)
            print(json.dumps({"written": True, "output": str(args.output),
                              "conflict_count": report["conflict_count"],
                              "validation_issue_count": report["validation_issue_count_after"],
                              "report": str(args.report) if args.report else None}, ensure_ascii=False, indent=2))
            return 0
        if args.command == "course-new":
            if args.output.exists():
                raise ValueError('destination exists: source-safe command will not overwrite')
            doc = create_course_project(args.title, args.root, author=args.author, symbol=args.symbol)
            doc.save(args.output)
            print(json.dumps({'output': str(args.output), 'actions': len(doc.actions), 'valid': not doc.validate()}, ensure_ascii=False))
            return 0
        if args.command == "course-renumber":
            if args.input.resolve() == args.output.resolve() or args.output.exists():
                raise ValueError('use a separate, non-existing destination .is2')
            doc=ProjectDocument.load(args.input)
            result=renumber_structure(doc,symbol=args.symbol)
            doc.save(args.output)
            print(json.dumps({'output': str(args.output), **result}, ensure_ascii=False, indent=2))
            return 0
        if args.command == "course-check":
            doc=ProjectDocument.load(args.input)
            result=course_checklist(doc)
            value=json.dumps(result,ensure_ascii=False,indent=2)+'\n'
            if args.output:
                if args.output.resolve()==args.input.resolve():
                    raise ValueError('report must not overwrite input .is2')
                if args.output.exists():
                    raise ValueError('report destination exists')
                args.output.write_text(value,encoding='utf-8')
            print(value,end='')
            return 0 if not result['errors'] else 2
        if args.command == "course-svg":
            if args.output.resolve()==args.input.resolve() or (args.output.exists() and not args.overwrite):
                raise ValueError('SVG output must not overwrite source; existing output requires --overwrite')
            if args.depth is not None and args.depth < 0:
                raise ValueError('--depth must be nonnegative')
            doc=ProjectDocument.load(args.input)
            graphic=scene_svg(build_course_scene(doc, args.focus, max_depth=args.depth))
            args.output.write_text(graphic,encoding='utf-8')
            print(json.dumps({'output':str(args.output),'source':str(args.input),'format':'SVG'},ensure_ascii=False))
            return 0
        if args.command == "course-alternatives":
            if args.input.resolve()==args.output.resolve() or args.output.exists():
                raise ValueError('use a separate, non-existing destination .is2')
            doc=ProjectDocument.load(args.input)
            set_alternative_labels(doc,args.action_id,[args.first,args.second])
            doc.save(args.output)
            print(json.dumps({'output':str(args.output),'action_id':args.action_id},ensure_ascii=False))
            return 0
        if args.command == "export":
            doc = ProjectDocument.load(args.input)
            write_export(doc, args.output, args.kind, source_path=args.input, overwrite=args.overwrite)
            print(json.dumps({"output": str(args.output), "kind": args.kind, "original_is2_equivalence": "NOT_TESTED"}, ensure_ascii=False))
            return 0
        if args.command == "summary":
            print(json.dumps(load_project(args.input).summary(), ensure_ascii=False, indent=2))
            return 0
        if args.command == "validate":
            doc = ProjectDocument.load(args.input)
            issues = doc.validate()
            output = {"file": str(args.input), "actions": len(doc.actions), "links": len(doc.links),
                      "valid": not issues, "issues": issues}
            print(json.dumps(output, ensure_ascii=False, indent=2) if args.json else
                  (f"VALID: {args.input} ({len(doc.actions)} actions, {len(doc.links)} links)" if not issues else
                   "INVALID:\n" + "\n".join(f"- {x}" for x in issues)))
            return 0 if not issues else 2
        if args.command == "inspect-conceptmodel":
            doc = ProjectDocument.load(args.input)
            report = doc.dynamic_structure.inspection()
            report["file"] = str(args.input)
            print(json.dumps(report, ensure_ascii=False, indent=2))
            return 0 if not report["validation_issues"] else 2
        if args.command == "compatibility":
            doc = ProjectDocument.load(args.input)
            report = audit_document(doc)
            report["file"] = str(args.input)
            print(json.dumps(report, ensure_ascii=False, indent=2))
            return 0 if all(report[key] == "PASS" for key in (
                "native_envelope", "structural_validation", "writer_semantic_roundtrip",
                "writer_idempotent_roundtrip", "writer_reopened_validation"
            )) else 2
        if args.command == "feature-audit":
            doc = ProjectDocument.load(args.input)
            report = feature_audit(doc)
            report["file"] = str(args.input)
            serialized = json.dumps(report, ensure_ascii=False, indent=2) + "\n"
            if args.output:
                args.output.parent.mkdir(parents=True, exist_ok=True)
                args.output.write_text(serialized, encoding="utf-8")
            print(serialized, end="")
            return 0 if not report["validation_issues"] else 2
        if args.command == "primary-links":
            doc = ProjectDocument.load(args.input)
            links, warnings = primary_links(doc)
            print(json.dumps({"links": [dict(action=a, parameter=p, marker=m, power=v)
                                      for a, p, m, v in links], "warnings": warnings}, ensure_ascii=False, indent=2))
            return 0
        if args.command == "graph":
            doc = ProjectDocument.load(args.input)
            full = build_relationship_graph(doc)
            report = filter_relationship_graph(
                full, relation_kind=args.relation_kind, query=args.query
            ) if args.relation_kind != "all" or args.query else full
            report["file"] = str(args.input)
            if args.output:
                args.output.parent.mkdir(parents=True, exist_ok=True)
                args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
                print(json.dumps({"output": str(args.output), "summary": report["summary"]}, ensure_ascii=False, indent=2))
            else:
                print(json.dumps(report, ensure_ascii=False, indent=2))
            problems = report.get("dangling_references", [])
            duplicate_ids = report.get("duplicate_ids", [])
            return 0 if not problems and not duplicate_ids else 2
        if args.command == "backup":
            info = create_project_backup(args.input, backup_root=args.backup_dir, keep=args.keep)
            print(json.dumps({
                "backup": str(info.path), "size_bytes": info.size_bytes,
                "sha256": info.sha256, "created_at": info.created_at,
                "valid_xml": info.valid_xml, "deduplicated_or_created": True,
            }, ensure_ascii=False, indent=2))
            return 0 if info.valid_xml else 2
        if args.command == "list-backups":
            records = list_project_backups(args.input, backup_root=args.backup_dir)
            report = backup_report(records)
            report["source"] = str(args.input)
            payload = json.dumps(report, ensure_ascii=False, indent=2) + "\n"
            if args.output:
                if args.output.resolve() == args.input.resolve():
                    raise BackupError("backup report path must differ from the source project")
                args.output.parent.mkdir(parents=True, exist_ok=True)
                args.output.write_text(payload, encoding="utf-8")
                print(json.dumps({"output": str(args.output), "backup_count": len(records)}, ensure_ascii=False, indent=2))
            else:
                print(payload, end="")
            return 0 if all(item.valid_xml for item in records) else 2
        if args.command == "restore-backup":
            restored, rollback = restore_project_backup(
                args.backup, args.destination, overwrite=args.overwrite,
                backup_existing=not args.no_rollback_backup,
            )
            print(json.dumps({
                "restored_to": str(restored),
                "source_backup": str(args.backup),
                "rollback_backup": str(rollback.path) if rollback else None,
                "validation": "PASS",
            }, ensure_ascii=False, indent=2))
            return 0
        if args.command == "link-integrity":
            doc = ProjectDocument.load(args.input)
            report = link_integrity_report(doc)
            report["file"] = str(args.input)
            payload = json.dumps(report, ensure_ascii=False, indent=2) + "\n"
            if args.output:
                if args.output.resolve() == args.input.resolve():
                    raise RepairError("link-integrity report output must differ from the source project path")
                args.output.parent.mkdir(parents=True, exist_ok=True)
                args.output.write_text(payload, encoding="utf-8")
                print(json.dumps({"output": str(args.output), "summary": report["summary"]}, ensure_ascii=False, indent=2))
            else:
                print(payload, end="")
            return 0 if report["summary"]["dangling_count"] == 0 and report["summary"]["duplicate_id_count"] == 0 else 2
        if args.command == "repair-links":
            if args.apply and args.output is None:
                raise RepairError("--output is required with --apply")
            if not args.apply and args.output is not None:
                raise RepairError("--output is a project destination and may only be used with --apply")
            protected_paths = {args.input.resolve()}
            if args.apply and args.output is not None:
                protected_paths.add(args.output.resolve())
            if args.report is not None and args.report.resolve() in protected_paths:
                raise RepairError("--report path must differ from the input and project output paths")
            if args.apply and not (args.replacements or args.clears):
                raise RepairError("--apply requires at least one --set or --clear repair")
            replacements = {}
            for raw in args.replacements:
                selector, target = parse_repair_assignment(raw)
                if selector in replacements:
                    raise RepairError(f"duplicate repair selector: {selector}")
                replacements[selector] = target
            doc = ProjectDocument.load(args.input)
            repaired, report = apply_link_repairs(doc, replacements, clears=args.clears) if (replacements or args.clears) else (doc.clone(), None)
            if report is None:
                integrity = link_integrity_report(doc)
                report = {
                    "schema_version": 1,
                    "mode": "diagnostic-only",
                    "repair_policy": "explicit-only; no heuristic ID guessing",
                    "summary": {"applied_count": 0, "remaining_dangling_count": integrity["summary"]["dangling_count"],
                                "remaining_duplicate_id_count": integrity["summary"]["duplicate_id_count"],
                                "validation_issue_count": len(doc.validate(deep=True)), "safe_to_save": False},
                    "issues": integrity["issues"], "validation_issues": doc.validate(deep=True),
                }
            report["source"] = str(args.input)
            report["mode"] = "apply" if args.apply else "preview"
            if args.apply:
                source = args.input.resolve()
                destination = args.output.resolve()
                if source == destination:
                    raise RepairError("repair output must differ from the input path; the source is never overwritten")
                if destination.exists() and not args.overwrite:
                    raise RepairError("destination already exists; pass --overwrite to replace it")
                if report["summary"]["validation_issue_count"] != 0:
                    raise RepairError("repaired document still has validation issues; no file was written. Run link-integrity/validate and repair all remaining problems first")
                repaired.save(args.output)
                report["written_to"] = str(args.output)
            if args.report:
                args.report.parent.mkdir(parents=True, exist_ok=True)
                args.report.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
            print(json.dumps(report, ensure_ascii=False, indent=2))
            return 0 if report["summary"].get("remaining_dangling_count", report["summary"].get("dangling_count", 0)) == 0 and report["summary"].get("validation_issue_count", 0) == 0 else 2
        if args.command == "dependencies":
            doc = ProjectDocument.load(args.input)
            report = dependency_report(doc)
            report["file"] = str(args.input)
            if args.output:
                args.output.parent.mkdir(parents=True, exist_ok=True)
                args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
                print(json.dumps({"output": str(args.output), "entity_count": report["entity_count"],
                                  "reference_count": report["reference_count"],
                                  "dangling_count": report["dangling_count"],
                                  "opaque_count": report["opaque_count"]}, ensure_ascii=False, indent=2))
            else:
                print(json.dumps(report, ensure_ascii=False, indent=2))
            return 0 if report["dangling_count"] == 0 else 2
        if args.command == "concept-report":
            doc = ProjectDocument.load(args.input)
            report = doc.concept_structure.catalog_report()
            report["file"] = str(args.input)
            if args.output:
                args.output.parent.mkdir(parents=True, exist_ok=True)
                args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
                print(json.dumps({"output": str(args.output), "category_count": report["category_count"],
                                  "group_count": report["group_count"], "duplicate_numbers": len(report["duplicate_numbers"])}, ensure_ascii=False, indent=2))
            else:
                print(json.dumps(report, ensure_ascii=False, indent=2))
            return 0
        if args.command == "layout":
            doc = ProjectDocument.load(args.input)
            graph = build_relationship_graph(doc)
            positions = automatic_relationship_layout(graph)
            sidecar = save_view_state(args.input, positions=positions, zoom=1.0)
            report = {
                "schema_version": 1,
                "project": str(args.input),
                "sidecar": str(sidecar),
                "node_count": len(positions),
                "positions": {key: [x, y] for key, (x, y) in sorted(positions.items())},
                "note": "View-only layout; the native .is2 project was not modified.",
            }
            if args.output:
                args.output.parent.mkdir(parents=True, exist_ok=True)
                args.output.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
            print(json.dumps({"sidecar": str(sidecar), "node_count": len(positions), "native_project_modified": False,
                              "json_export": str(args.output) if args.output else None}, ensure_ascii=False, indent=2))
            return 0
        doc = ProjectDocument.load(args.input)
        if args.command in {"convert-action", "insert-sibling", "add-primary-link", "remove-primary-link", "set-primary-link-power"}:
            if args.input.resolve() == args.output.resolve():
                raise ValueError('Refusing to replace input project; save to a separate output .is2')
        if args.command == "roundtrip":
            issues = doc.roundtrip_to(args.output)
            print(json.dumps({"output": str(args.output), "semantic_roundtrip": "PASS", "validation_issues": issues}, ensure_ascii=False, indent=2))
            return 0 if not issues else 2
        if args.command == "add-action":
            ident = doc.add_action(args.name, action_type=args.action_type,
                formalization=args.formalization, status=args.status, mark=args.mark,
                symbol=args.symbol, level=args.level, number=args.number,
                parent_id=args.parent_id, alternatives=args.alternative)
            result = {"created_action_id": ident}
        elif args.command == "convert-action":
            result = convert_action(doc, args.action_id, args.to,
                                    replace_children=args.replace_children, drop_content=args.drop_content,
                                    child_names=args.child_name if args.child_name else None)
        elif args.command == "insert-sibling":
            result = insert_sibling(doc, args.anchor_id, after=(args.position == "after"), name=args.name)
        elif args.command == "add-primary-link":
            add_primary_link(doc, args.action, args.parameter, args.marker, power=args.power)
            result = {"matrix_link_added": [args.action, args.parameter, args.marker], "power": args.power}
        elif args.command == "remove-primary-link":
            remove_primary_link(doc, args.action, args.parameter, args.marker)
            result = {"matrix_link_removed": [args.action, args.parameter, args.marker]}
        elif args.command == "set-primary-link-power":
            new_power = set_primary_link_power(doc, args.action, args.parameter, args.marker, args.power)
            result = {"matrix_link_updated": [args.action, args.parameter, args.marker], "power": new_power}
        elif args.command == "set-action":
            changes = _pairs(args.changes)
            doc.update_action(args.action_id, **{k: (None if v == "" else v) for k, v in changes.items()})
            result = {"updated_action_id": args.action_id, "changes": changes}
        elif args.command == "delete-action":
            doc.delete_action(args.action_id, cascade=args.cascade, cascade_content=args.cascade_content)
            result = {"deleted_action_id": args.action_id, "cascade": args.cascade, "cascade_content": args.cascade_content}
        elif args.command == "add-parameter":
            ident = doc.add_parameter(_pairs(args.attr))
            result = {"created_parameter_id": ident}
        elif args.command == "add-object":
            ident = doc.add_object(args.name)
            result = {"created_object_id": ident}
        elif args.command == "set-parameter-object":
            doc.set_parameter_object(args.parameter_id, None if args.clear else args.object_id)
            result = {"parameter_id": args.parameter_id,
                      "object_id": None if args.clear else args.object_id,
                      "operation": "cleared" if args.clear else "assigned"}
        elif args.command == "delete-object":
            doc.delete_object(args.object_id, clear_parameter_references=args.clear_parameter_references)
            result = {"deleted_object_id": args.object_id,
                      "cleared_parameter_references": args.clear_parameter_references}
        elif args.command == "add-spz-element":
            ident = doc.dynamic_structure.add_element(
                args.name, type=int(args.type), status=int(args.status),
                formalization=int(args.formalization), level=int(args.level),
                number=args.number, symbol=args.symbol,
            )
            result = {"created_spz_element_id": ident}
        elif args.command == "set-spz-element":
            changes = _pairs(args.changes)
            allowed = {"name", "type", "status", "formalization", "level", "number", "symbol"}
            unknown = set(changes) - allowed
            if unknown:
                raise ValueError(f"unsupported AElement fields: {sorted(unknown)}")
            normalized = {key: (value if key == "name" else int(value)) for key, value in changes.items()}
            doc.dynamic_structure.update_element(args.element_id, **normalized)
            result = {"updated_spz_element_id": args.element_id, "changes": changes}
        elif args.command == "delete-spz-element":
            doc.dynamic_structure.delete_element(args.element_id, cascade_links=args.cascade_links)
            result = {"deleted_spz_element_id": args.element_id, "cascade_links": args.cascade_links}
        elif args.command == "add-spz-link":
            ident = doc.dynamic_structure.add_spz_link(
                e1=args.e1, e2=args.e2, e3=args.e3, name=args.name,
                type=int(args.link_type), status=int(args.status),
                formalization=int(args.formalization), level=int(args.level),
                number=int(args.number), symbol=int(args.symbol),
            )
            result = {"created_spz_link_index": ident, "native_link_object_id": "0"}
        elif args.command == "delete-spz-link":
            doc.dynamic_structure.delete_spz_link(args.index)
            result = {"deleted_spz_link_index": args.index}
        elif args.command == "set-spz-link":
            raw_changes = _pairs(args.changes)
            unknown = set(raw_changes) - {"e1", "e2", "e3", "name", "type", "status", "formalization", "level", "number", "symbol"}
            if unknown:
                raise ValueError(f"unsupported spz link fields: {sorted(unknown)}")
            changes = {key: (value if key == "name" else int(value)) for key, value in raw_changes.items()}
            doc.dynamic_structure.update_spz_link(args.index, **changes)
            result = {"updated_spz_link_index": args.index, "changes": changes}
        elif args.command == "add-content-link":
            index = doc.dynamic_structure.add_content_link(
                args.e1, args.e2, char=args.char, power=args.power, duplicate=args.duplicate,
            )
            result = {"created_content_link_index": index, "e1": args.e1, "e2": args.e2,
                      "char": args.char, "power": args.power, "duplicate_policy": args.duplicate}
        elif args.command == "delete-content-link":
            doc.dynamic_structure.delete_content_link(args.index)
            result = {"deleted_content_link_index": args.index}
        elif args.command == "set-content-record":
            raw_changes = _pairs(args.changes)
            unknown = set(raw_changes) - {"e1", "e2", "char", "power"}
            if unknown:
                raise ValueError(f"unsupported content record fields: {sorted(unknown)}")
            changes = {key: int(value) for key, value in raw_changes.items()}
            doc.dynamic_structure.update_content_record(args.index, **changes)
            result = {"updated_content_record_index": args.index, "changes": changes}
        else:  # pragma: no cover - argparse enforces the command set
            parser.error("unknown command")
            return 2
        issues = doc.validate()
        if issues:
            raise ProjectFormatError("edit produced an invalid project: " + "; ".join(issues))
        doc.save(args.output)
        result.update({"output": str(args.output), "validation": "PASS"})
        print(json.dumps(result, ensure_ascii=False, indent=2))
        return 0
    except (OSError, KeyError, ValueError, ProjectFormatError, BackupError, ProjectDiffError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 2
