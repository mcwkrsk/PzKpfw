#!/usr/bin/env python3
"""Read-only audit for primaryModel/spd links in an IS-2 XML project."""
from __future__ import annotations
import argparse
import collections
import hashlib
import json
import xml.etree.ElementTree as ET
from pathlib import Path

def audit(path: Path) -> dict:
    raw = path.read_bytes()
    root = ET.fromstring(raw)
    actions = root.findall("./models/primaryModel/spd/actions/pd")
    links = root.findall("./models/primaryModel/spd/links/link")
    ids = {int(x.get("id")) for x in actions}
    levels = {int(x.get("id")): int(x.get("level")) for x in actions}
    composition = [(int(x.get("afe1")), int(x.get("afe2"))) for x in links if x.get("type") == "2"]
    arrangement = [(int(x.get("afe1")), int(x.get("afe2")), int(x.get("afe3"))) for x in links if x.get("type") == "3"]
    children, parents = collections.defaultdict(list), collections.defaultdict(list)
    for parent, child in composition:
        children[parent].append(child)
        parents[child].append(parent)
    dangling = []
    for i, link in enumerate(links):
        for key in ("afe1", "afe2", "afe3"):
            value = int(link.get(key))
            if value and value not in ids:
                dangling.append({"link_index": i, "attribute": key, "id": value})
    chains = []
    for parent, child_ids in sorted(children.items()):
        rows = [(a, b, c) for a, b, c in arrangement if a == parent]
        next_by_child = {b: c for _, b, c in rows}
        heads = [child for child in child_ids if child not in {c for _, _, c in rows if c}]
        sequence, seen = [], set()
        current = heads[0] if len(heads) == 1 else None
        while current is not None and current not in seen:
            seen.add(current)
            sequence.append(current)
            current = next_by_child.get(current)
            if current == 0:
                break
        valid = (
            len(rows) == len(child_ids)
            and len(heads) == 1
            and len(next_by_child) == len(rows)
            and set(next_by_child) == set(child_ids)
            and sum(c == 0 for _, _, c in rows) == 1
            and len(sequence) == len(child_ids)
            and current == 0
        )
        chains.append({"parent_id": parent, "child_count": len(child_ids),
                       "ordered_children": sequence, "valid": valid})
    level_violations = [
        {"parent": p, "child": c} for p, c in composition if levels[c] <= levels[p]
    ]
    return {
        "file": path.name, "project_name": root.get("name"),
        "sha256": hashlib.sha256(raw).hexdigest(), "bytes": len(raw),
        "action_count": len(actions), "unique_action_ids": len(ids),
        "action_type_counts": dict(collections.Counter(x.get("type") for x in actions)),
        "link_count": len(links), "link_type_counts": dict(collections.Counter(x.get("type") for x in links)),
        "composition_roots": sorted(ids - set(parents)),
        "composition_edges": len(composition), "arrangement_records": len(arrangement),
        "dangling_link_references": dangling, "level_violations": level_violations,
        "sibling_chain_parent_count": len(chains),
        "sibling_chain_valid_count": sum(x["valid"] for x in chains),
        "sibling_chains": chains,
        "primary_parameters": len(root.findall("./models/primaryModel/params/param")),
        "primary_objects": len(root.findall("./models/primaryModel/objects/*")),
        "alternatives": len(root.findall("./models/primaryModel/spd/actions/pd/alts")),
    }

def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("project", type=Path)
    parser.add_argument("--json", type=Path)
    args = parser.parse_args()
    result = audit(args.project)
    rendered = json.dumps(result, ensure_ascii=False, indent=2)
    if args.json:
        args.json.parent.mkdir(parents=True, exist_ok=True)
        args.json.write_text(rendered + "\n", encoding="utf-8")
    print(rendered)

if __name__ == "__main__":
    main()
