#!/usr/bin/env python3
"""Read-only audit of primaryModel/spd type-2/type-3 link semantics."""
from __future__ import annotations
import argparse, collections, hashlib, json, pathlib, xml.etree.ElementTree as ET

def audit(path: pathlib.Path) -> dict:
    raw = path.read_bytes()
    root = ET.fromstring(raw)
    spd = root.find("./models/primaryModel/spd")
    if spd is None:
        raise ValueError(f"{path}: missing models/primaryModel/spd")
    pd = spd.findall("./actions/pd")
    links = spd.findall("./links/link")
    ids = [node.get("id") for node in pd]
    if any(x is None for x in ids):
        raise ValueError(f"{path}: pd without id")
    if len(ids) != len(set(ids)):
        raise ValueError(f"{path}: duplicate pd IDs")
    idset = set(ids)
    by_type_parent = {"2": collections.defaultdict(list), "3": collections.defaultdict(list)}
    dangling = []
    unknown_types = []
    type2_nonzero_afe3 = []
    for index, link in enumerate(links):
        typ, parent, child, nxt = (link.get(k) for k in ("type", "afe1", "afe2", "afe3"))
        if typ not in by_type_parent:
            unknown_types.append({"index": index, "type": typ})
            continue
        if parent not in idset or child not in idset:
            dangling.append({"index": index, "afe1": parent, "afe2": child})
        by_type_parent[typ][parent].append((child, nxt, index))
        if typ == "2" and nxt != "0":
            type2_nonzero_afe3.append({"index": index, "afe3": nxt})
    parents = sorted(set(by_type_parent["2"]) | set(by_type_parent["3"]), key=lambda x: int(x))
    chain_results = []
    for parent in parents:
        comp = by_type_parent["2"].get(parent, [])
        order = by_type_parent["3"].get(parent, [])
        next_by_child = {}
        duplicate_current = []
        for child, nxt, idx in order:
            if child in next_by_child:
                duplicate_current.append(child)
            next_by_child[child] = nxt
        order_children = set(next_by_child)
        comp_children = {child for child, _, _ in comp}
        predecessor_values = {nxt for _, nxt, _ in order if nxt != "0"}
        starts = sorted(order_children - predecessor_values, key=lambda x: int(x))
        chain = []
        seen = set()
        current = starts[0] if len(starts) == 1 else None
        while current is not None and current != "0" and current not in seen and current in next_by_child:
            seen.add(current)
            chain.append(current)
            current = next_by_child[current]
        valid = (
            bool(comp) and len(comp) == len(order)
            and comp_children == order_children
            and len(starts) == 1
            and not duplicate_current
            and current == "0"
            and len(chain) == len(order)
            and len([1 for _, nxt, _ in order if nxt == "0"]) == 1
        )
        chain_results.append({
            "parent": parent, "composition_children": len(comp),
            "order_children": len(order), "chain": chain,
            "membership_equal": comp_children == order_children,
            "valid": valid,
        })
    ids_int = [int(x) for x in ids]
    return {
        "file": path.name, "bytes": len(raw), "sha256": hashlib.sha256(raw).hexdigest(),
        "root_name": root.get("name", ""),
        "actions": len(pd), "links": len(links),
        "link_types": dict(collections.Counter(x.get("type") for x in links)),
        "pd_ids_sorted_ascending": ids_int == sorted(ids_int),
        "pd_ids_unique": len(ids) == len(set(ids)),
        "pd_id_min": min(ids_int) if ids_int else None,
        "pd_id_max": max(ids_int) if ids_int else None,
        "pd_id_gaps": sorted(set(range(min(ids_int), max(ids_int) + 1)) - set(ids_int)) if ids_int else [],
        "parent_groups": len(parents),
        "valid_sibling_chains": sum(x["valid"] for x in chain_results),
        "all_sibling_chains_valid": bool(chain_results) and all(x["valid"] for x in chain_results),
        "all_type2_afe3_zero": not type2_nonzero_afe3,
        "dangling_endpoints": dangling,
        "unknown_link_types": unknown_types,
        "chain_results": chain_results,
    }

def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("files", nargs="+", type=pathlib.Path)
    ap.add_argument("--out", type=pathlib.Path)
    ns = ap.parse_args()
    results = [audit(p) for p in ns.files]
    out = {"audit": "primarymodel-spd-five-sample-link-semantics", "static_xml_only": True,
           "sample_count": len(results), "total_parent_groups": sum(x["parent_groups"] for x in results),
           "total_valid_chains": sum(x["valid_sibling_chains"] for x in results),
           "all_pass": all(x["all_sibling_chains_valid"] and x["all_type2_afe3_zero"]
                           and not x["dangling_endpoints"] and not x["unknown_link_types"] for x in results),
           "samples": results}
    payload = json.dumps(out, ensure_ascii=False, indent=2) + "\n"
    if ns.out:
        ns.out.parent.mkdir(parents=True, exist_ok=True)
        ns.out.write_text(payload, encoding="utf-8")
    print(payload, end="")
    return 0 if out["all_pass"] else 1

if __name__ == "__main__":
    raise SystemExit(main())
