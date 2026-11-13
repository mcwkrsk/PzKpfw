"""Semantic project comparison and selective restoration from older IS-2 XML.

The diff is deliberately conservative. Stable ``id`` fields (and Module/@name)
are used for identity; anonymous repeated XML records are paired positionally
and explicitly marked ambiguous. Restores are applied to a clone, then checked
against ProjectDocument validation and writer preflight before they are returned.
No PzKpfw metadata is written into native ``.is2`` XML.
"""
from __future__ import annotations

from collections import Counter, defaultdict
from copy import deepcopy
from dataclasses import dataclass, field
import hashlib
from pathlib import Path
from typing import Any, Iterable
import xml.etree.ElementTree as ET

from .document import ProjectDocument, _clean_formatting_text
from .i18n import tr


class ProjectDiffError(ValueError):
    """Raised when project comparison or selective restoration is unsafe."""


@dataclass(frozen=True)
class DiffOperation:
    operation_id: str
    kind: str  # removed, added, modified_attribute, modified_text
    path: tuple[dict[str, Any], ...] = ()
    parent_path: tuple[dict[str, Any], ...] = ()
    index: int | None = None
    tag: str | None = None
    attribute: str | None = None
    reference_value: str | None = None
    current_value: str | None = None
    fragment_xml: str | None = None
    before_anchor: tuple[dict[str, Any], ...] | None = None
    after_anchor: tuple[dict[str, Any], ...] | None = None
    ambiguous: bool = False
    description: str = ""

    @property
    def can_restore(self) -> bool:
        return self.kind in {"removed", "modified_attribute", "modified_text"}

    def as_dict(self, *, include_fragment: bool = False) -> dict[str, Any]:
        result: dict[str, Any] = {
            "operation_id": self.operation_id,
            "kind": self.kind,
            "path": [dict(item) for item in self.path],
            "path_display": format_locator(self.path),
            "parent_path": [dict(item) for item in self.parent_path],
            "index": self.index,
            "tag": self.tag,
            "attribute": self.attribute,
            "reference_value": self.reference_value,
            "current_value": self.current_value,
            "ambiguous": self.ambiguous,
            "can_restore": self.can_restore,
            "description": self.description,
        }
        if include_fragment:
            result["fragment_xml"] = self.fragment_xml
        return result


@dataclass(frozen=True)
class ProjectDiff:
    reference_path: str | None
    current_path: str | None
    reference_sha256: str
    current_sha256: str
    operations: tuple[DiffOperation, ...]
    warnings: tuple[str, ...] = ()

    @property
    def summary(self) -> dict[str, int]:
        counts = Counter(operation.kind for operation in self.operations)
        return {
            "total": len(self.operations),
            "removed_in_current": counts["removed"],
            "added_in_current": counts["added"],
            "modified_attributes": counts["modified_attribute"],
            "modified_text": counts["modified_text"],
            "ambiguous": sum(1 for operation in self.operations if operation.ambiguous),
            "restorable_by_default": sum(1 for operation in self.operations if operation.can_restore and not operation.ambiguous),
        }

    def as_dict(self, *, include_fragments: bool = False) -> dict[str, Any]:
        return {
            "schema_version": 1,
            "direction": "reference_to_current",
            "reference_path": self.reference_path,
            "current_path": self.current_path,
            "reference_sha256": self.reference_sha256,
            "current_sha256": self.current_sha256,
            "summary": self.summary,
            "warnings": list(self.warnings),
            "operations": [item.as_dict(include_fragment=include_fragments) for item in self.operations],
            "policy": {
                "identity": "stable @id, or Module/@name; anonymous same-tag records use positional matching",
                "restore": "removed and modified records/fields are restored explicitly from the reference project",
                "additions": "newer records are reported but are not removed unless revert_additions is explicitly enabled",
                "safety": "apply to clone; compare validation issue counts; run writer preflight; never modify source files",
            },
        }


def _sha256(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _stable_identity(node: ET.Element) -> tuple[str, str] | None:
    ident = node.get("id")
    # Native relationship records frequently use id="0" as a sentinel,
    # not a unique record identity. Never pair or duplicate-check on that value.
    if ident not in (None, "", "0"):
        return ("id", ident)
    if node.tag == "Module" and node.get("name") not in (None, ""):
        return ("name", node.get("name", ""))
    return None


def _identity_counts(nodes: Iterable[ET.Element]) -> Counter:
    return Counter((node.tag, _stable_identity(node)) for node in nodes if _stable_identity(node) is not None)


def _locator_segment(
    node: ET.Element, siblings: list[ET.Element], identity_counts: Counter | None = None,
) -> dict[str, Any]:
    identity = _stable_identity(node)
    counts = identity_counts if identity_counts is not None else _identity_counts(siblings)
    if identity is not None and counts[(node.tag, identity)] == 1:
        return {"tag": node.tag, "key_attribute": identity[0], "key_value": identity[1]}
    same_tag = [item for item in siblings if item.tag == node.tag]
    return {"tag": node.tag, "index": same_tag.index(node)}


def resolve_locator(root: ET.Element, locator: Iterable[dict[str, Any]]) -> ET.Element:
    """Resolve a locator produced by this module against an XML root."""
    current = root
    for segment in locator:
        tag = str(segment.get("tag", ""))
        candidates = [node for node in list(current) if node.tag == tag]
        if "key_attribute" in segment:
            key = str(segment["key_attribute"])
            value = str(segment.get("key_value", ""))
            candidates = [node for node in candidates if node.get(key) == value]
            if len(candidates) != 1:
                raise ProjectDiffError(f"cannot resolve {tag}[@{key}={value!r}] uniquely")
            current = candidates[0]
        else:
            index = segment.get("index")
            if isinstance(index, bool) or not isinstance(index, int) or index < 0 or index >= len(candidates):
                raise ProjectDiffError(f"cannot resolve {tag}[{index}] in current project")
            current = candidates[index]
    return current


def format_locator(locator: Iterable[dict[str, Any]]) -> str:
    pieces = ["project"]
    for segment in locator:
        tag = str(segment.get("tag", "?"))
        if "key_attribute" in segment:
            pieces.append(f"{tag}[@{segment['key_attribute']}={segment.get('key_value')!r}]")
        else:
            pieces.append(f"{tag}[{segment.get('index', '?')}]")
    return "/" + "/".join(pieces)


def _match_children(reference_children: list[ET.Element], current_children: list[ET.Element]):
    """Return index matches plus unmatched indices and positional ambiguity flags."""
    ref_by_tag: dict[str, list[int]] = defaultdict(list)
    cur_by_tag: dict[str, list[int]] = defaultdict(list)
    for index, node in enumerate(reference_children):
        ref_by_tag[node.tag].append(index)
    for index, node in enumerate(current_children):
        cur_by_tag[node.tag].append(index)

    matches: dict[int, tuple[int, bool]] = {}
    removed: list[int] = []
    added: list[int] = []
    all_tags = list(dict.fromkeys([*ref_by_tag, *cur_by_tag]))

    for tag in all_tags:
        ref_indices = ref_by_tag.get(tag, [])
        cur_indices = cur_by_tag.get(tag, [])
        ref_keyed: dict[tuple[str, str], list[int]] = defaultdict(list)
        cur_keyed: dict[tuple[str, str], list[int]] = defaultdict(list)
        for index in ref_indices:
            identity = _stable_identity(reference_children[index])
            if identity is not None:
                ref_keyed[identity].append(index)
        for index in cur_indices:
            identity = _stable_identity(current_children[index])
            if identity is not None:
                cur_keyed[identity].append(index)

        used_ref: set[int] = set()
        used_cur: set[int] = set()
        for identity in sorted(set(ref_keyed) | set(cur_keyed)):
            rlist, clist = ref_keyed.get(identity, []), cur_keyed.get(identity, [])
            if len(rlist) == 1 and len(clist) == 1:
                matches[rlist[0]] = (clist[0], False)
                used_ref.add(rlist[0]); used_cur.add(clist[0])
            elif len(rlist) > 1 or len(clist) > 1:
                # Duplicate IDs are invalid/ambiguous; do not pretend they identify
                # one exact element. Fall back to positional matching with warning.
                pass

        remaining_ref = [i for i in ref_indices if i not in used_ref and _stable_identity(reference_children[i]) is None or
                         i not in used_ref and len(ref_keyed.get(_stable_identity(reference_children[i]), [])) > 1]
        remaining_cur = [i for i in cur_indices if i not in used_cur and _stable_identity(current_children[i]) is None or
                         i not in used_cur and len(cur_keyed.get(_stable_identity(current_children[i]), [])) > 1]
        # Records with a unique identity existing only on one side are true add/remove
        # candidates and must not be paired to an anonymous/other keyed record.
        remaining_ref = sorted(remaining_ref)
        remaining_cur = sorted(remaining_cur)
        pair_count = min(len(remaining_ref), len(remaining_cur))
        positional_ambiguous = pair_count > 0 and (len(remaining_ref) != len(remaining_cur) or pair_count > 1)
        for offset in range(pair_count):
            matches[remaining_ref[offset]] = (remaining_cur[offset], positional_ambiguous)
            used_ref.add(remaining_ref[offset]); used_cur.add(remaining_cur[offset])

        removed.extend(i for i in ref_indices if i not in used_ref)
        added.extend(i for i in cur_indices if i not in used_cur)

    return matches, sorted(removed), sorted(added)


def compare_documents(reference: ProjectDocument, current: ProjectDocument) -> ProjectDiff:
    """Compare two native projects and describe changes from reference to current."""
    operations: list[DiffOperation] = []
    warnings: list[str] = []
    sequence = 0

    def add(**kwargs) -> None:
        nonlocal sequence
        sequence += 1
        operations.append(DiffOperation(operation_id=f"D{sequence:06d}", **kwargs))

    def visit(ref_node: ET.Element, cur_node: ET.Element,
              cur_path: tuple[dict[str, Any], ...], *, ambiguous: bool = False) -> None:
        # Tag mismatches are handled by parent child matching.
        attr_names = sorted(set(ref_node.attrib) | set(cur_node.attrib))
        for name in attr_names:
            old, new = ref_node.get(name), cur_node.get(name)
            if old != new:
                add(kind="modified_attribute", path=cur_path, tag=cur_node.tag,
                    attribute=name, reference_value=old, current_value=new,
                    ambiguous=ambiguous,
                    description=f"@{name}: {new!r} → {old!r}")

        old_text = _clean_formatting_text(ref_node.text)
        new_text = _clean_formatting_text(cur_node.text)
        if old_text != new_text:
            add(kind="modified_text", path=cur_path, tag=cur_node.tag,
                reference_value=old_text, current_value=new_text,
                ambiguous=ambiguous,
                description=tr("Текстовое содержимое <{tag}> изменено").format(tag=cur_node.tag))

        ref_children = list(ref_node)
        cur_children = list(cur_node)
        matches, removed_indices, added_indices = _match_children(ref_children, cur_children)
        current_paths: dict[int, tuple[dict[str, Any], ...]] = {}
        # Build identity counts once per sibling group; this keeps locator
        # generation linear for large XML lists instead of rescanning siblings
        # separately for every child.
        current_identity_counts = _identity_counts(cur_children)
        for cur_index, child in enumerate(cur_children):
            segment = _locator_segment(child, cur_children, current_identity_counts)
            current_paths[cur_index] = cur_path + (segment,)

        # Restoreable removals are anchored to a surviving neighbor whenever possible.
        for ref_index in removed_indices:
            child = ref_children[ref_index]
            before_anchor = None
            after_anchor = None
            for next_index in range(ref_index + 1, len(ref_children)):
                if next_index in matches:
                    before_anchor = current_paths[matches[next_index][0]]
                    break
            if before_anchor is None:
                for prev_index in range(ref_index - 1, -1, -1):
                    if prev_index in matches:
                        after_anchor = current_paths[matches[prev_index][0]]
                        break
            identity = _stable_identity(child)
            child_group = [n for n in ref_children if n.tag == child.tag]
            child_ambiguous = identity is None and len(child_group) > 1
            fragment = ET.tostring(child, encoding="unicode", short_empty_elements=True)
            add(kind="removed", parent_path=cur_path, index=ref_index, tag=child.tag,
                reference_value=f"<{child.tag}> (старый XML-фрагмент)", fragment_xml=fragment,
                before_anchor=before_anchor, after_anchor=after_anchor,
                ambiguous=child_ambiguous,
                description=tr("Удалён элемент <{tag}>").format(tag=child.tag) + (f" с id={identity[1]}" if identity and identity[0] == "id" else ""))

        for ref_index in sorted(matches):
            cur_index, pair_ambiguous = matches[ref_index]
            child = ref_children[ref_index]
            current_child = cur_children[cur_index]
            visit(child, current_child, current_paths[cur_index], ambiguous=pair_ambiguous)

        for cur_index in added_indices:
            child = cur_children[cur_index]
            identity = _stable_identity(child)
            child_group = [n for n in cur_children if n.tag == child.tag]
            fragment = ET.tostring(child, encoding="unicode", short_empty_elements=True)
            add(kind="added", path=current_paths[cur_index], parent_path=cur_path,
                index=cur_index, tag=child.tag, current_value=f"<{child.tag}> (новый XML-фрагмент)",
                fragment_xml=fragment, ambiguous=identity is None and len(child_group) > 1,
                description=tr("Добавлен элемент <{tag}>").format(tag=child.tag) + (f" с id={identity[1]}" if identity and identity[0] == "id" else ""))

    if reference.root.tag != current.root.tag:
        raise ProjectDiffError("project root tags differ; projects cannot be compared safely")
    visit(reference.root, current.root, ())
    ref_bytes = reference.to_bytes(pretty=False)
    cur_bytes = current.to_bytes(pretty=False)
    if any(op.ambiguous for op in operations):
        warnings.append(tr("Часть однотипных XML-узлов не имеет устойчивого ID и сопоставлена по позиции; проверьте её вручную перед восстановлением."))
    return ProjectDiff(
        reference_path=reference.source_path, current_path=current.source_path,
        reference_sha256=_sha256(ref_bytes), current_sha256=_sha256(cur_bytes),
        operations=tuple(operations), warnings=tuple(warnings),
    )


def compare_project_files(reference_path: str | Path, current_path: str | Path) -> ProjectDiff:
    reference = ProjectDocument.load(reference_path)
    current = ProjectDocument.load(current_path)
    result = compare_documents(reference, current)
    return result


def apply_selected_restores(
    reference: ProjectDocument,
    current: ProjectDocument,
    operation_ids: Iterable[str],
    *,
    allow_ambiguous: bool = False,
    revert_additions: bool = False,
) -> tuple[ProjectDocument, dict[str, Any]]:
    """Restore selected old values/nodes onto a clone of ``current``.

    Newer-only records are merely reported by default. Removing them is a
    separate explicit option. Anonymous positional matches require opt-in.
    Existing validation issues are tolerated only when the restore introduces
    no additional issue instances.
    """
    selected_ids = list(operation_ids)
    if not selected_ids or any(not isinstance(item, str) or not item for item in selected_ids):
        raise ProjectDiffError("select at least one valid diff operation")
    if len(selected_ids) != len(set(selected_ids)):
        raise ProjectDiffError("duplicate diff operation IDs are not allowed")

    diff = compare_documents(reference, current)
    by_id = {item.operation_id: item for item in diff.operations}
    unknown = sorted(set(selected_ids) - set(by_id))
    if unknown:
        raise ProjectDiffError(f"unknown diff operation(s): {', '.join(unknown)}")
    selected = [by_id[item] for item in selected_ids]
    if any(item.kind == "added" for item in selected) and not revert_additions:
        raise ProjectDiffError("selected rows include additions; pass revert_additions=True to remove newer-only XML records")
    ambiguous = [item.operation_id for item in selected if item.ambiguous]
    if ambiguous and not allow_ambiguous:
        raise ProjectDiffError("selected operations use positional/ambiguous XML matching: " + ", ".join(ambiguous) + "; explicit allow_ambiguous=True is required")

    candidate = current.clone()
    # Resolve all locators before any mutation so that sibling insertions/removals
    # cannot shift indexes used by other selected operations.
    resolved: dict[str, dict[str, Any]] = {}
    for item in selected:
        if item.kind in {"modified_attribute", "modified_text", "added"}:
            target = resolve_locator(candidate.root, item.path)
            parent = resolve_locator(candidate.root, item.parent_path) if item.kind == "added" else None
            resolved[item.operation_id] = {"target": target, "parent": parent}
        elif item.kind == "removed":
            parent = resolve_locator(candidate.root, item.parent_path)
            before = resolve_locator(candidate.root, item.before_anchor) if item.before_anchor else None
            after = resolve_locator(candidate.root, item.after_anchor) if item.after_anchor else None
            resolved[item.operation_id] = {"parent": parent, "before": before, "after": after}
        else:
            raise ProjectDiffError(f"unsupported restore operation kind: {item.kind}")

    # First restore field values; node pointers remain stable during sibling edits.
    for item in selected:
        if item.kind == "modified_attribute":
            node = resolved[item.operation_id]["target"]
            if item.reference_value is None:
                node.attrib.pop(item.attribute, None)
            else:
                node.set(str(item.attribute), item.reference_value)
        elif item.kind == "modified_text":
            node = resolved[item.operation_id]["target"]
            node.text = item.reference_value

    # Revert newer-only additions. Parent and node were resolved before mutation.
    for item in selected:
        if item.kind == "added":
            parent = resolved[item.operation_id]["parent"]
            target = resolved[item.operation_id]["target"]
            if target not in list(parent):
                raise ProjectDiffError(f"cannot safely remove added node for {item.operation_id}")
            parent.remove(target)

    # Reinsert removed records. Sort by the reference sibling index so several
    # selected deletions of the same parent regain their original relative order.
    removed = sorted((item for item in selected if item.kind == "removed"),
                     key=lambda item: (id(resolved[item.operation_id]["parent"]), item.index or 0))
    for item in removed:
        record = resolved[item.operation_id]
        parent = record["parent"]
        restored_node = ET.fromstring(item.fragment_xml or "")
        identity = _stable_identity(restored_node)
        if identity is not None and any(
            child.tag == restored_node.tag and _stable_identity(child) == identity for child in list(parent)
        ):
            raise ProjectDiffError(f"restoring {item.operation_id} would create duplicate {restored_node.tag} identity {identity}")
        before = record.get("before")
        after = record.get("after")
        siblings = list(parent)
        if before is not None and before in siblings:
            insertion_index = siblings.index(before)
        elif after is not None and after in siblings:
            insertion_index = siblings.index(after) + 1
        else:
            insertion_index = max(0, min(int(item.index or 0), len(siblings)))
        parent.insert(insertion_index, restored_node)

    current_issues = Counter(current.validate(deep=True))
    candidate_issues = Counter(candidate.validate(deep=True))
    introduced: list[str] = []
    for issue, count in candidate_issues.items():
        extra = count - current_issues.get(issue, 0)
        if extra > 0:
            introduced.extend([issue] * extra)
    if introduced:
        raise ProjectDiffError("selective restore failed dependency/structure preflight; no change applied: " + "; ".join(introduced[:12]))

    preflight = candidate.serialization_preflight()
    if not (preflight.get("xml_reopens") and preflight.get("semantic_preserved") and preflight.get("writer_idempotent")):
        raise ProjectDiffError("selective restore failed XML writer preflight")

    report = {
        "schema_version": 1,
        "mode": "selective_restore",
        "source_reference_sha256": diff.reference_sha256,
        "source_current_sha256": diff.current_sha256,
        "restored_count": len(selected),
        "restored_operations": [item.as_dict() for item in selected],
        "revert_additions": bool(revert_additions),
        "allow_ambiguous": bool(allow_ambiguous),
        "validation_issue_count_before": sum(current_issues.values()),
        "validation_issue_count_after": sum(candidate_issues.values()),
        "validation_issues_after": list(candidate.validate(deep=True)),
        "introduced_validation_issues": [],
        "validation_status": "PASS" if not candidate_issues else "PASS_NO_NEW_ISSUES_EXISTING_ISSUES_REMAIN",
        "writer_preflight": preflight,
        "native_is2_metadata_added": False,
    }
    return candidate, report


def expand_related_restore_bundle(
    reference: ProjectDocument,
    current: ProjectDocument,
    operation_ids: Iterable[str],
    *,
    max_operations: int = 256,
) -> tuple[list[str], dict[str, Any]]:
    """Expand selected removed records to a conservative related graph bundle.

    The expansion follows only typed edges exposed by the recovered graph
    projection. It adds missing linked records/entities from the reference
    version, never guesses unknown XML references, and returns an explicit
    preview explaining each addition. Opaque records are called out in the
    report; the normal restore validation remains authoritative.
    """
    from .graph import build_relationship_graph

    selected = list(operation_ids)
    if not selected or len(selected) != len(set(selected)):
        raise ProjectDiffError("select one or more distinct diff operation IDs")
    if max_operations < 1:
        raise ProjectDiffError("max_operations must be positive")
    diff = compare_documents(reference, current)
    by_id = {item.operation_id: item for item in diff.operations}
    unknown = sorted(set(selected) - set(by_id))
    if unknown:
        raise ProjectDiffError("unknown diff operation(s): " + ", ".join(unknown))

    # Index removed entity fragments by recovered domain identity.
    entity_fragments: dict[str, str] = {}
    removed_entity_by_key: dict[str, str] = {}
    entity_sources = {
        "action": list(reference.actions),
        "category": list(reference.concept_structure.categories),
        "spz_element": list(reference.dynamic_structure.elements),
        "parameter": list(reference.params_node.findall("param")),
        "object": list(reference.objects_node),
    }
    removed_by_identity: dict[tuple[str, str, str], list[str]] = defaultdict(list)
    for operation in diff.operations:
        if operation.kind != "removed" or not operation.fragment_xml:
            continue
        try:
            fragment = ET.fromstring(operation.fragment_xml)
        except ET.ParseError:
            continue
        ident = fragment.get("id")
        if ident:
            removed_by_identity[(str(fragment.tag), "id", ident)].append(operation.operation_id)

    entity_operation_for_key: dict[str, str] = {}
    for domain, elements in entity_sources.items():
        for element in elements:
            ident = element.get("id")
            if not ident:
                continue
            key = f"{domain}:{ident}"
            candidates = removed_by_identity.get((str(element.tag), "id", ident), [])
            if len(candidates) == 1:
                entity_operation_for_key[key] = candidates[0]

    # Link operations are mapped using their parent branch and source record index
    # (with an attribute-signature check when available).
    relation_operations_for_key: dict[str, list[str]] = {}
    graph = build_relationship_graph(reference)
    relation_nodes = {node["key"]: node for node in graph["nodes"] if node.get("kind") == "relation"}
    list_for_kind = {
        "scbinarylink": list(reference.concept_structure.links),
        "aie_binary_link": list(reference.dynamic_structure.links),
        "ae_content_link": list(reference.dynamic_structure.content_records),
    }
    branch_tokens = {
        "scbinarylink": {"cs", "links"},
        "aie_binary_link": {"spz", "links"},
        "ae_content_link": {"content"},
    }
    def operation_in_relation_branch(operation: DiffOperation, kind: str) -> bool:
        locator = operation.path if operation.path else operation.parent_path
        tags = {str(segment.get("tag", "")) for segment in locator}
        return branch_tokens[kind].issubset(tags)

    for key, node in relation_nodes.items():
        kind = node.get("relation_kind")
        if kind not in list_for_kind:
            continue
        index = int(node.get("record_index", -1))
        records = list_for_kind[kind]
        if index < 0 or index >= len(records):
            continue
        source = records[index]
        signature = (str(source.tag), tuple(sorted(source.attrib.items())))
        candidates = []
        for operation in diff.operations:
            if operation.kind == "removed" and operation.fragment_xml and operation_in_relation_branch(operation, kind):
                try:
                    fragment = ET.fromstring(operation.fragment_xml)
                except ET.ParseError:
                    continue
                if (str(fragment.tag), tuple(sorted(fragment.attrib.items()))) == signature:
                    candidates.append(operation.operation_id)
        if not candidates:
            # id="0" is a common native sentinel. If a relation changed in
            # place, it is represented by one or more field operations at the
            # same positional locator rather than a removed-node operation.
            for operation in diff.operations:
                if (operation.kind not in {"modified_attribute", "modified_text"}
                        or not operation.path or not operation_in_relation_branch(operation, kind)):
                    continue
                leaf = operation.path[-1]
                if leaf.get("tag") == str(source.tag) and leaf.get("index") == index:
                    candidates.append(operation.operation_id)
        if candidates:
            relation_operations_for_key[key] = candidates

    selected_set = set(selected)
    queue_entities: list[str] = []
    queue_relations: list[str] = []
    for operation_id in selected:
        operation = by_id[operation_id]
        if operation.kind != "removed" or not operation.fragment_xml:
            continue
        fragment = ET.fromstring(operation.fragment_xml)
        ident = fragment.get("id")
        if ident:
            for domain in entity_sources:
                key = f"{domain}:{ident}"
                if entity_operation_for_key.get(key) == operation_id:
                    queue_entities.append(key)
        for relation_key, relation_operations in relation_operations_for_key.items():
            if operation_id in relation_operations:
                queue_relations.append(relation_key)

    edges_by_entity: dict[str, list[str]] = defaultdict(list)
    edges_by_relation: dict[str, list[str]] = defaultdict(list)
    for edge in graph["edges"]:
        if edge.get("target_key"):
            edges_by_entity[edge["target_key"]].append(edge["relation_key"])
            edges_by_relation[edge["relation_key"]].append(edge["target_key"])

    processed_entities: set[str] = set()
    processed_relations: set[str] = set()
    reasons: dict[str, list[str]] = defaultdict(list)
    while queue_entities or queue_relations:
        while queue_entities:
            entity_key = queue_entities.pop(0)
            if entity_key in processed_entities:
                continue
            processed_entities.add(entity_key)
            for relation_key in edges_by_entity.get(entity_key, []):
                for relation_operation in relation_operations_for_key.get(relation_key, []):
                    if relation_operation not in selected_set:
                        reasons[relation_operation].append(tr("Связь {relation_key} с сущностью {entity_key}").format(relation_key=relation_key, entity_key=entity_key))
                        selected_set.add(relation_operation)
                queue_relations.append(relation_key)
        while queue_relations:
            relation_key = queue_relations.pop(0)
            if relation_key in processed_relations:
                continue
            processed_relations.add(relation_key)
            for relation_operation in relation_operations_for_key.get(relation_key, []):
                selected_set.add(relation_operation)
            for entity_key in edges_by_relation.get(relation_key, []):
                entity_operation = entity_operation_for_key.get(entity_key)
                # Traverse further only when the endpoint itself is missing in
                # current. Existing endpoints satisfy the dependency and should
                # not cause an unrelated whole-graph expansion.
                if entity_operation:
                    if entity_operation not in selected_set:
                        reasons[entity_operation].append(tr("Конечная точка связи {relation_key}: {entity_key}").format(relation_key=relation_key, entity_key=entity_key))
                        selected_set.add(entity_operation)
                    queue_entities.append(entity_key)
        if len(selected_set) > max_operations:
            raise ProjectDiffError(
                f"related restore bundle exceeds safety limit ({len(selected_set)} > {max_operations}); select a smaller group"
            )

    expanded = [item.operation_id for item in diff.operations if item.operation_id in selected_set]
    added = [item for item in expanded if item not in selected]
    report = {
        "schema_version": 1,
        "mode": "related_restore_bundle_preview",
        "selected_operation_ids": selected,
        "expanded_operation_ids": expanded,
        "added_operation_ids": added,
        "added_reasons": {key: value for key, value in reasons.items() if key in added},
        "opaque_record_count": len(graph["opaque_records"]),
        "warnings": ([tr("Непрозрачные записи не входят в автоматический анализ зависимостей; итоговую проверку обязательно выполнить вручную.")]
                     if graph["opaque_records"] else []),
        "max_operations": max_operations,
        "automatic_id_guessing": False,
    }
    return expanded, report
