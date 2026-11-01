"""Command-line interface for the IS-2 reader/writer."""
from __future__ import annotations

import argparse
import json
from pathlib import Path
import sys

from . import ProjectDocument, ProjectFormatError, load_project


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

    p = sub.add_parser("summary", help="print semantic project summary")
    p.add_argument("input", type=Path)

    p = sub.add_parser("validate", help="validate project structure and graph invariants")
    p.add_argument("input", type=Path)
    p.add_argument("--json", action="store_true")

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

    p = sub.add_parser("add-parameter", help="add a primary-model parameter using params/@LastID")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("--attr", action="append", required=True, help="ATTRIBUTE=VALUE")

    p = sub.add_parser("add-object", help="add a primary-model object using objects/@LastID")
    p.add_argument("input", type=Path)
    p.add_argument("output", type=Path)
    p.add_argument("--name", required=True)
    return parser


def main(argv: list[str] | None = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    try:
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
        doc = ProjectDocument.load(args.input)
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
        elif args.command == "set-action":
            changes = _pairs(args.changes)
            doc.update_action(args.action_id, **{k: (None if v == "" else v) for k, v in changes.items()})
            result = {"updated_action_id": args.action_id, "changes": changes}
        elif args.command == "delete-action":
            doc.delete_action(args.action_id, cascade=args.cascade)
            result = {"deleted_action_id": args.action_id, "cascade": args.cascade}
        elif args.command == "add-parameter":
            ident = doc.add_parameter(_pairs(args.attr))
            result = {"created_parameter_id": ident}
        elif args.command == "add-object":
            ident = doc.add_object(args.name)
            result = {"created_object_id": ident}
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
    except (OSError, KeyError, ValueError, ProjectFormatError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 2
