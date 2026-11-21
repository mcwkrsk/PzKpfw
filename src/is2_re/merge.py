"""Conservative three-way merge for native IS-2 XML projects.

The merger applies only changes that can be reconciled from a common base.
Concurrent edits are reported as stable, addressable conflicts. Неразрешённое
conflicts keep the local/ours value in the in-memory preview and block CLI
output. Unknown XML nodes and attributes are carried through unchanged.
"""
from __future__ import annotations

from collections import Counter, defaultdict
import hashlib
from copy import deepcopy
from dataclasses import dataclass
from typing import Any, Mapping
import xml.etree.ElementTree as ET

from .document import ProjectDocument, _clean_formatting_text
from .diff import _stable_identity
from .i18n import tr


class ProjectMergeError(ValueError):
    """Raised when a three-way merge cannot be safely prepared."""


@dataclass(frozen=True)
class MergeConflict:
    conflict_id: str
    kind: str
    path: str
    field: str | None
    base_value: Any
    ours_value: Any
    theirs_value: Any
    resolution: str | None
    description: str

    def as_dict(self) -> dict[str, Any]:
        return {
            "conflict_id": self.conflict_id,
            "kind": self.kind,
            "path": self.path,
            "field": self.field,
            "base": self.base_value,
            "ours": self.ours_value,
            "theirs": self.theirs_value,
            "resolution": self.resolution,
            "description": self.description,
        }


def _tag_name(node: ET.Element) -> str:
    return str(node.tag) if isinstance(node.tag, str) else "#special"


def _semantic(node: ET.Element | None) -> Any:
    if node is None:
        return None
    if not isinstance(node.tag, str):
        return ("#special", str(node.tag), node.text)
    return (
        node.tag,
        tuple(sorted(node.attrib.items())),
        _clean_formatting_text(node.text),
        tuple(_semantic(child) for child in list(node)),
    )


def _display(node: ET.Element | None) -> Any:
    if node is None:
        return None
    if not isinstance(node.tag, str):
        return {"kind": "special_xml_node", "text": node.text}
    return {
        "tag": node.tag,
        "identity": dict(zip(("kind", "value"), _stable_identity(node))) if _stable_identity(node) else None,
        "attributes": dict(node.attrib),
        "text": _clean_formatting_text(node.text),
        "children": len(list(node)),
    }


def _child_identity(node: ET.Element) -> tuple[Any, ...] | None:
    identity = _stable_identity(node)
    if identity is None:
        return None
    return (_tag_name(node), identity[0], identity[1])


def _counter_by_tag(nodes: list[ET.Element]) -> Counter:
    return Counter(_tag_name(node) for node in nodes)


class _MergeContext:
    def __init__(self, resolutions: Mapping[str, str]):
        self.resolutions = dict(resolutions)
        self.conflicts: list[MergeConflict] = []
        self.warnings: list[str] = []

    def conflict(self, kind: str, path: str, field: str | None,
                 base_value: Any, ours_value: Any, theirs_value: Any,
                 description: str):
        conflict_id = f"M{len(self.conflicts) + 1:06d}"
        resolution = self.resolutions.get(conflict_id)
        if resolution not in {None, "ours", "theirs", "base"}:
            raise ProjectMergeError(
                f"invalid resolution for {conflict_id}: {resolution!r}; use ours, theirs or base"
            )
        record = MergeConflict(
            conflict_id, kind, path, field, base_value, ours_value,
            theirs_value, resolution, description,
        )
        self.conflicts.append(record)
        return resolution or "ours"


def _chosen_value(base: Any, ours: Any, theirs: Any, ctx: _MergeContext,
                  *, kind: str, path: str, field: str | None) -> Any:
    if ours == base:
        return theirs
    if theirs == base or ours == theirs:
        return ours
    choice = ctx.conflict(
        kind, path, field, base, ours, theirs,
        tr("Обе ветки изменили {field} по-разному").format(field=field or tr("структуру")),
    )
    return {"ours": ours, "theirs": theirs, "base": base}[choice]


def _unique_child_maps(
    base_children: list[ET.Element], ours_children: list[ET.Element],
    theirs_children: list[ET.Element],
) -> tuple[dict[tuple[Any, ...], ET.Element], ...] | None:
    """Map a child list by unique IDs or unique-per-tag anonymous records.

    Repeated anonymous nodes and duplicate stable identities are not matched by
    position: doing so could silently merge unrelated XML records.
    """
    snapshots = (base_children, ours_children, theirs_children)
    counters = [_counter_by_tag(items) for items in snapshots]
    keyed_counts: list[Counter] = []
    for items in snapshots:
        keyed_counts.append(Counter(_child_identity(node) for node in items if _child_identity(node)))
    # Any duplicate stable identity is ambiguous and forces a whole-list choice.
    if any(count > 1 for counter in keyed_counts for count in counter.values()):
        return None
    # If a tag has multiple anonymous records in any branch, positional pairing
    # cannot be proven. Preserve the branch as a unit and ask for a resolution.
    anon_tags = set()
    for items in snapshots:
        counts = Counter(_tag_name(n) for n in items if _child_identity(n) is None)
        anon_tags.update(tag for tag, count in counts.items() if count > 1)
    if anon_tags:
        return None

    maps: list[dict[tuple[Any, ...], ET.Element]] = []
    for items in snapshots:
        mapping: dict[tuple[Any, ...], ET.Element] = {}
        for node in items:
            identity = _child_identity(node)
            token = ("stable", *identity) if identity else ("anonymous", _tag_name(node))
            if token in mapping:
                return None
            mapping[token] = node
        maps.append(mapping)
    return tuple(maps)


def _merge_node(base: ET.Element, ours: ET.Element, theirs: ET.Element,
                ctx: _MergeContext, path: str) -> ET.Element:
    """Merge two surviving versions of the same logical element."""
    if _semantic(ours) == _semantic(base):
        return deepcopy(theirs)
    if _semantic(theirs) == _semantic(base) or _semantic(ours) == _semantic(theirs):
        return deepcopy(ours)
    if not (isinstance(base.tag, str) and isinstance(ours.tag, str) and isinstance(theirs.tag, str)):
        choice = ctx.conflict("opaque_node", path, None, _display(base), _display(ours), _display(theirs),
                              tr("Одновременно изменён непрозрачный XML-узел"))
        return deepcopy({"ours": ours, "theirs": theirs, "base": base}[choice])

    result = ET.Element(ours.tag)
    attr_names = sorted(set(base.attrib) | set(ours.attrib) | set(theirs.attrib))
    for name in attr_names:
        b, o, t = base.attrib.get(name), ours.attrib.get(name), theirs.attrib.get(name)
        chosen = _chosen_value(b, o, t, ctx, kind="attribute", path=path, field=f"@{name}")
        if chosen is not None:
            result.set(name, chosen)

    btext = _clean_formatting_text(base.text)
    otext = _clean_formatting_text(ours.text)
    ttext = _clean_formatting_text(theirs.text)
    chosen_text = _chosen_value(btext, otext, ttext, ctx, kind="text", path=path, field="#text")
    result.text = chosen_text
    result.tail = ours.tail if ours.tail is not None else theirs.tail or base.tail

    base_children, ours_children, theirs_children = list(base), list(ours), list(theirs)
    if _semantic_children(ours_children) == _semantic_children(base_children):
        result.extend(deepcopy(theirs_children))
        return result
    if (_semantic_children(theirs_children) == _semantic_children(base_children)
            or _semantic_children(ours_children) == _semantic_children(theirs_children)):
        result.extend(deepcopy(ours_children))
        return result

    maps = _unique_child_maps(base_children, ours_children, theirs_children)
    if maps is None:
        choice = ctx.conflict(
            "ambiguous_child_group", path, "children",
            [_display(n) for n in base_children],
            [_display(n) for n in ours_children],
            [_display(n) for n in theirs_children],
            tr("В группе есть повторяющиеся анонимные или дублирующиеся XML-узлы; автоматическое сопоставление небезопасно"),
        )
        chosen = {"ours": ours_children, "theirs": theirs_children, "base": base_children}[choice]
        result.extend(deepcopy(chosen))
        return result

    bmap, omap, tmap = maps
    order: list[tuple[Any, ...]] = []
    for items, mapping in ((ours_children, omap), (theirs_children, tmap), (base_children, bmap)):
        for node in items:
            identity = _child_identity(node)
            token = ("stable", *identity) if identity else ("anonymous", _tag_name(node))
            if token not in order:
                order.append(token)

    for token in order:
        b, o, t = bmap.get(token), omap.get(token), tmap.get(token)
        child_path = f"{path}/{token[-3] if token[0] == 'stable' else token[-1]}"
        if token[0] == "stable":
            child_path += f"[@{token[-2]}={token[-1]!r}]"
        else:
            child_path += "[unique-anonymous]"
        merged = _merge_presence(b, o, t, ctx, child_path)
        if merged is not None:
            result.append(merged)
    return result


def _semantic_children(children: list[ET.Element]) -> Any:
    return tuple(_semantic(child) for child in children)


def _merge_presence(base: ET.Element | None, ours: ET.Element | None,
                    theirs: ET.Element | None, ctx: _MergeContext,
                    path: str) -> ET.Element | None:
    if base is None:
        if ours is None:
            return deepcopy(theirs) if theirs is not None else None
        if theirs is None or _semantic(ours) == _semantic(theirs):
            return deepcopy(ours)
        choice = ctx.conflict("concurrent_add", path, None, None, _display(ours), _display(theirs),
                              tr("Обе ветки независимо добавили узел с одинаковой идентичностью"))
        chosen = {"ours": ours, "theirs": theirs, "base": None}[choice]
        return deepcopy(chosen) if chosen is not None else None

    if ours is None and theirs is None:
        return None
    if ours is None:
        if _semantic(theirs) == _semantic(base):
            return None  # ours deleted; theirs did not change
        choice = ctx.conflict("delete_modify", path, None, _display(base), None, _display(theirs),
                              tr("Локальная ветка удалила узел, а входящая изменила его"))
        chosen = {"ours": None, "theirs": theirs, "base": base}[choice]
        return deepcopy(chosen) if chosen is not None else None
    if theirs is None:
        if _semantic(ours) == _semantic(base):
            return None  # theirs deleted; ours did not change
        choice = ctx.conflict("modify_delete", path, None, _display(base), _display(ours), None,
                              tr("Локальная ветка изменила узел, а входящая удалила его"))
        chosen = {"ours": ours, "theirs": None, "base": base}[choice]
        return deepcopy(chosen) if chosen is not None else None

    return _merge_node(base, ours, theirs, ctx, path)


def _validate_resolutions(ctx: _MergeContext) -> None:
    known = {item.conflict_id for item in ctx.conflicts}
    unknown = sorted(set(ctx.resolutions) - known)
    if unknown:
        raise ProjectMergeError("unknown merge conflict ID(s): " + ", ".join(unknown))


def merge_documents(
    base: ProjectDocument,
    ours: ProjectDocument,
    theirs: ProjectDocument,
    *,
    resolutions: Mapping[str, str] | None = None,
) -> tuple[ProjectDocument, dict[str, Any]]:
    """Create a three-way merge preview from common base, local and incoming.

    Non-conflicting changes from both branches are merged. Conflicts retain the
    local value in the preview until the caller supplies an explicit resolution.
    A report with ``ready_to_write=False`` must never be written to disk.
    """
    if not (base.root.tag == ours.root.tag == theirs.root.tag):
        raise ProjectMergeError("base, ours and theirs must have the same XML root tag")
    ctx = _MergeContext(resolutions or {})
    merged_root = _merge_node(base.root, ours.root, theirs.root, ctx, "/project")
    _validate_resolutions(ctx)
    candidate = ProjectDocument(merged_root, source_path=ours.source_path)

    base_issues = Counter(ours.validate(deep=True))
    after_issues = Counter(candidate.validate(deep=True))
    introduced = []
    for issue, count in after_issues.items():
        introduced.extend([issue] * max(0, count - base_issues.get(issue, 0)))
    if introduced:
        raise ProjectMergeError(
            "three-way merge introduces dependency/structure validation issues: "
            + "; ".join(introduced[:12])
        )
    preflight = candidate.serialization_preflight()
    if not (preflight.get("xml_reopens") and preflight.get("semantic_preserved") and preflight.get("writer_idempotent")):
        raise ProjectMergeError("three-way merge failed XML writer preflight")

    unresolved = [item for item in ctx.conflicts if item.resolution is None]
    report = {
        "schema_version": 1,
        "mode": "three_way_merge",
        "base_path": base.source_path,
        "ours_path": ours.source_path,
        "theirs_path": theirs.source_path,
        "base_sha256": hashlib.sha256(base.to_bytes(pretty=False)).hexdigest(),
        "ours_sha256": hashlib.sha256(ours.to_bytes(pretty=False)).hexdigest(),
        "theirs_sha256": hashlib.sha256(theirs.to_bytes(pretty=False)).hexdigest(),
        "conflict_count": len(ctx.conflicts),
        "unresolved_conflict_count": len(unresolved),
        "conflicts": [item.as_dict() for item in ctx.conflicts],
        "warnings": ctx.warnings,
        "ready_to_write": not unresolved,
        "validation_issue_count_before": sum(base_issues.values()),
        "validation_issue_count_after": sum(after_issues.values()),
        "introduced_validation_issues": introduced,
        "writer_preflight": preflight,
        "native_is2_metadata_added": False,
        "ordering_policy": "Preserves local child order; incoming-only records are appended when both branches changed the same child group.",
    }
    return candidate, report


def merge_project_files(base_path: str, ours_path: str, theirs_path: str,
                        *, resolutions: Mapping[str, str] | None = None):
    return merge_documents(
        ProjectDocument.load(base_path), ProjectDocument.load(ours_path),
        ProjectDocument.load(theirs_path), resolutions=resolutions,
    )
