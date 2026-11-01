#!/usr/bin/env python3
"""Structural audit for a native IS-2 .is2 XML project."""
import argparse, collections, hashlib, json, xml.etree.ElementTree as ET
from pathlib import Path

def audit(path):
    raw = Path(path).read_bytes()
    root = ET.fromstring(raw)
    spd = root.find(".//primaryModel/spd")
    actions = spd.find("./actions")
    pd = actions.findall("./pd")
    ids = [int(x.attrib["id"]) for x in pd]
    idset = set(ids)
    links = spd.find("./links").findall("./link")
    counts = collections.Counter(x.attrib.get("type") for x in links)
    endpoints_ok = all(
        int(x.attrib[k]) == 0 or int(x.attrib[k]) in idset
        for x in links for k in ("afe1", "afe2", "afe3")
    )
    parent = {}
    for x in links:
        if x.attrib.get("type") == "2":
            parent[int(x.attrib["afe2"])] = int(x.attrib["afe1"])
    roots = sorted(i for i in ids if i not in parent)
    level_ok = all(
        int(next(x for x in pd if int(x.attrib["id"]) == c).attrib["level"]) ==
        int(next(x for x in pd if int(x.attrib["id"]) == p).attrib["level"]) + 1
        for c, p in parent.items()
    )
    chains = collections.defaultdict(list)
    for x in links:
        if x.attrib.get("type") == "3":
            a = x.attrib
            chains[int(a["afe1"])].append((int(a["afe2"]), int(a["afe3"])))
    broken = []
    for par, pairs in chains.items():
        nxt = dict(pairs)
        heads = [c for c, _ in pairs if c not in set(nxt.values())]
        if len(heads) != 1:
            broken.append(par); continue
        seen, cur = [], heads[0]
        while cur and cur not in seen:
            seen.append(cur); cur = nxt.get(cur, 0)
        if cur != 0 or len(seen) != len(pairs):
            broken.append(par)
    cm = root.find("./models/ConceptModel")
    cs = cm.find("./cs") if cm is not None else None
    return {
        "sample": Path(path).name,
        "sha256": hashlib.sha256(raw).hexdigest(),
        "size_bytes": len(raw),
        "actions": len(pd),
        "unique_action_ids": len(set(ids)),
        "lastID": int(actions.attrib["lastID"]),
        "max_action_id": max(ids),
        "links": len(links),
        "link_type_counts": dict(counts),
        "all_link_endpoints_resolve": endpoints_ok,
        "type2_edges": len(parent),
        "type2_roots": roots,
        "type2_level_consistent": level_ok,
        "type3_parent_chains": len(chains),
        "type3_broken_chains": broken,
        "parameters": len(root.findall(".//primaryModel/params/param")),
        "objects": len(root.findall(".//primaryModel/objects/object")),
        "concept_cs_direct_child": cs is not None,
        "concept_cs_elemets": len(cs.findall("./elemets/*")) if cs is not None else None,
        "concept_cs_links": len(cs.findall("./links/*")) if cs is not None else None,
    }

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("project")
    ap.add_argument("--json", action="store_true")
    args = ap.parse_args()
    result = audit(args.project)
    print(json.dumps(result, ensure_ascii=False, indent=2) if args.json else result)
