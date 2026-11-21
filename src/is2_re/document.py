"""Editable IS-2 XML document model and conservative writer.

The implementation preserves the original XML tree (including unknown elements
and attributes) and only mutates explicitly recovered model fields. It does not
claim byte-identical output to Qt's QDomDocument serializer.
"""
from __future__ import annotations

from copy import deepcopy
from dataclasses import dataclass
import os
from pathlib import Path
import tempfile
from typing import Iterable, Mapping
import xml.etree.ElementTree as ET

from .model import ProjectFormatError

MAX_PROJECT_BYTES = 128 * 1024 * 1024
ACTION_FIELDS = {"name", "type", "formalization", "mark", "symbol", "status", "level", "number"}


def _xml_parser() -> ET.XMLParser:
    return ET.XMLParser(target=ET.TreeBuilder(insert_comments=True, insert_pis=True))


def _int_attr(node: ET.Element, key: str, *, default: int | None = None) -> int:
    raw = node.get(key)
    if raw is None:
        if default is None:
            raise ProjectFormatError(f"<{node.tag}> is missing required integer attribute {key!r}")
        return default
    try:
        return int(raw, 10)
    except ValueError as exc:
        raise ProjectFormatError(f"<{node.tag}> has non-integer {key}={raw!r}") from exc


def _clean_formatting_text(value: str | None) -> str | None:
    if value is None or not value.strip():
        return None
    return value


def _semantic_node(node: ET.Element):
    """Semantic tree representation: ignores formatting-only whitespace/attr order."""
    return (
        node.tag,
        tuple(sorted(node.attrib.items())),
        _clean_formatting_text(node.text),
        tuple(_semantic_node(child) for child in list(node)),
        _clean_formatting_text(node.tail),
    )


@dataclass(frozen=True)
class ActionRecord:
    id: str
    name: str
    type: str | None
    formalization: str | None
    level: str | None
    number: str | None


@dataclass(frozen=True)
class LinkRecord:
    type: str
    parent_id: str
    child_id: str
    next_id: str


class ProjectDocument:
    """Editable XML-backed project with conservative, schema-aware operations."""

    def __init__(self, root: ET.Element, *, source_path: str | None = None):
        self.root = root
        self.source_path = source_path
        self._validate_envelope()

    @classmethod
    def load(cls, path: str | Path) -> "ProjectDocument":
        path = Path(path)
        size = path.stat().st_size
        if size > MAX_PROJECT_BYTES:
            raise ProjectFormatError(f"project exceeds safety limit ({size} bytes > {MAX_PROJECT_BYTES})")
        raw = path.read_bytes()
        try:
            root = ET.fromstring(raw, parser=_xml_parser())
        except ET.ParseError as exc:
            raise ProjectFormatError(f"XML parse error in {path}: {exc}") from exc
        return cls(root, source_path=str(path))

    @classmethod
    def new_empty(
        cls, name: str, *, info: str = "", user_name: str = "", user_info: str = ""
    ) -> "ProjectDocument":
        """Create an empty project from the recovered common XML envelope.

        The envelope and one minimal PrimaryModelAuto ModuleParams entry are
        grounded in multiple supplied native samples. No user-specific decStr
        selections or other plug-in defaults are synthesized.
        """
        if not name.strip():
            raise ValueError("project name must not be empty")
        root = ET.Element("project", {"name": name, "info": info})
        ET.SubElement(root, "user", {"name": user_name, "info": user_info})
        models = ET.SubElement(root, "models")
        primary = ET.SubElement(models, "primaryModel")
        ET.SubElement(primary, "params", {"LastID": "0"})
        ET.SubElement(primary, "objects", {"LastID": "0"})
        spd = ET.SubElement(primary, "spd")
        ET.SubElement(spd, "actions", {"lastID": "0"})
        ET.SubElement(spd, "links")
        ET.SubElement(primary, "matrix")
        concept = ET.SubElement(models, "ConceptModel")
        cs = ET.SubElement(concept, "cs", {"last_elem_id": "0", "last_link_id": "0"})
        ET.SubElement(cs, "elemets")
        ET.SubElement(cs, "links")
        spz = ET.SubElement(concept, "spz", {"last_id": "0"})
        ET.SubElement(spz, "elemets")
        ET.SubElement(spz, "links")
        ET.SubElement(concept, "content")
        module_params = ET.SubElement(root, "ModuleParams")
        module = ET.SubElement(module_params, "Module", {"name": "PrimaryModelAuto"})
        ET.SubElement(module, "param", {"decStr": ""})
        return cls(root)

    @classmethod
    def from_bytes(cls, raw: bytes) -> "ProjectDocument":
        if len(raw) > MAX_PROJECT_BYTES:
            raise ProjectFormatError("project exceeds safety limit")
        try:
            root = ET.fromstring(raw, parser=_xml_parser())
        except ET.ParseError as exc:
            raise ProjectFormatError(f"XML parse error: {exc}") from exc
        return cls(root)

    def clone(self) -> "ProjectDocument":
        return ProjectDocument(deepcopy(self.root), source_path=self.source_path)

    def _validate_envelope(self) -> None:
        if self.root.tag != "project":
            raise ProjectFormatError(f"expected root <project>, got <{self.root.tag}>")
        self._required("models/primaryModel/spd/actions")
        self._required("models/primaryModel/spd/links")
        self._required("models/primaryModel/params")
        self._required("models/primaryModel/objects")

    def _required(self, path: str) -> ET.Element:
        node = self.root.find(path)
        if node is None:
            raise ProjectFormatError(f"missing required path /project/{path}")
        return node

    @property
    def actions_node(self) -> ET.Element:
        return self._required("models/primaryModel/spd/actions")

    @property
    def links_node(self) -> ET.Element:
        return self._required("models/primaryModel/spd/links")

    @property
    def params_node(self) -> ET.Element:
        return self._required("models/primaryModel/params")

    @property
    def objects_node(self) -> ET.Element:
        return self._required("models/primaryModel/objects")

    @property
    def concept_structure(self):
        """Typed editor for the observed ConceptModel/cs branch."""
        from .concept import ConceptStructureDocument
        return ConceptStructureDocument(self.root)

    @property
    def dynamic_structure(self):
        """Typed editor for recovered ConceptModel dynamic records."""
        from .spz import DynamicStructureDocument
        return DynamicStructureDocument(self.root)

    @property
    def user_node(self) -> ET.Element | None:
        return self.root.find("user")

    def update_project_metadata(self, *, name: str | None = None, info: str | None = None) -> None:
        if name is not None and not name.strip():
            raise ValueError("project name must not be empty")
        for key, value in (("name", name), ("info", info)):
            if value is not None:
                self.root.set(key, value)

    def update_user_metadata(self, *, name: str | None = None, info: str | None = None) -> None:
        user = self.user_node
        if user is None:
            user = ET.Element("user")
            models = self.root.find("models")
            insert_at = list(self.root).index(models) if models is not None else len(self.root)
            self.root.insert(insert_at, user)
        for key, value in (("name", name), ("info", info)):
            if value is not None:
                user.set(key, value)

    @property
    def actions(self) -> list[ET.Element]:
        return self.actions_node.findall("pd")

    @property
    def links(self) -> list[ET.Element]:
        return self.links_node.findall("link")

    def action(self, action_id: str | int) -> ET.Element:
        wanted = str(action_id)
        for node in self.actions:
            if node.get("id") == wanted:
                return node
        raise KeyError(f"action id {wanted!r} does not exist")

    def action_records(self) -> list[ActionRecord]:
        return [ActionRecord(
            id=node.get("id", ""), name=node.get("name", ""),
            type=node.get("type"), formalization=node.get("formalization"),
            level=node.get("level"), number=node.get("number"),
        ) for node in self.actions]

    def _links_of_type(self, link_type: str) -> list[ET.Element]:
        return [node for node in self.links if node.get("type") == link_type]

    def composition_children(self, parent_id: str | int) -> list[str]:
        parent = str(parent_id)
        return [node.get("afe2", "") for node in self._links_of_type("2") if node.get("afe1") == parent]

    def sibling_order(self, parent_id: str | int) -> list[str]:
        """Return child order by following type=3 afe3 links, never sorting IDs."""
        parent = str(parent_id)
        records = [n for n in self._links_of_type("3") if n.get("afe1") == parent]
        if not records:
            if self.composition_children(parent):
                raise ProjectFormatError(f"parent {parent}: composition children exist without arrangement links")
            return []
        by_current: dict[str, ET.Element] = {}
        incoming: set[str] = set()
        for rec in records:
            current = rec.get("afe2", "")
            nxt = rec.get("afe3", "0")
            if not current or current == "0":
                raise ProjectFormatError(f"parent {parent}: arrangement record has invalid afe2")
            if current in by_current:
                raise ProjectFormatError(f"parent {parent}: duplicate arrangement record for child {current}")
            by_current[current] = rec
            if nxt not in ("", "0"):
                incoming.add(nxt)
        heads = [child for child in by_current if child not in incoming]
        if not heads:
            raise ProjectFormatError(f"parent {parent}: arrangement cycle detected (no chain head)")
        if len(heads) != 1:
            raise ProjectFormatError(f"parent {parent}: expected one arrangement head, found {len(heads)}")
        ordered: list[str] = []
        seen: set[str] = set()
        current = heads[0]
        while current not in ("", "0"):
            if current in seen:
                raise ProjectFormatError(f"parent {parent}: arrangement cycle at child {current}")
            rec = by_current.get(current)
            if rec is None:
                raise ProjectFormatError(f"parent {parent}: arrangement points to missing child {current}")
            seen.add(current)
            ordered.append(current)
            current = rec.get("afe3", "0")
        if seen != set(by_current):
            missing = sorted(set(by_current) - seen)
            raise ProjectFormatError(f"parent {parent}: unreachable arrangement children {missing}")
        comp = self.composition_children(parent)
        if len(comp) != len(set(comp)):
            raise ProjectFormatError(f"parent {parent}: duplicate composition child")
        if set(comp) != set(ordered):
            raise ProjectFormatError(f"parent {parent}: composition/arrangement child sets differ")
        return ordered

    def reorder_children(self, parent_id: str | int, ordered_ids: Iterable[str | int]) -> None:
        """Rewire the observed type-3 sibling chain without replacing link records.

        The set of children must be unchanged. All checks run before mutation;
        unknown attributes and children of the existing links are retained.
        """
        parent = str(parent_id)
        self.action(parent)
        current = self.sibling_order(parent)
        desired = [str(item) for item in ordered_ids]
        if len(desired) != len(current) or len(set(desired)) != len(desired) or set(desired) != set(current):
            raise ValueError("new order must contain exactly the existing children once")
        records = {n.get("afe2"): n for n in self._links_of_type("3") if n.get("afe1") == parent}
        for index, child in enumerate(desired):
            records[child].set("afe3", desired[index + 1] if index + 1 < len(desired) else "0")

    def validate(self, *, deep: bool = True) -> list[str]:
        issues: list[str] = []
        actions = self.actions
        ids = [n.get("id", "") for n in actions]
        if any(not value for value in ids):
            issues.append("one or more <pd> nodes have no id")
        if len(ids) != len(set(ids)):
            issues.append("duplicate action IDs")
        idset = set(ids)
        parent_of: dict[str, str] = {}
        for idx, link in enumerate(self.links):
            kind = link.get("type")
            e1, e2, e3 = link.get("afe1"), link.get("afe2"), link.get("afe3", "0")
            if kind not in {"2", "3"}:
                issues.append(f"link[{idx}] has unsupported type {kind!r}; preserved but not interpreted")
                continue
            for key, endpoint in (("afe1", e1), ("afe2", e2), ("afe3", e3 if kind == "3" else "0")):
                if endpoint not in (None, "", "0") and endpoint not in idset:
                    issues.append(f"link[{idx}] {key} references missing action id {endpoint}")
            if kind == "2" and e3 not in (None, "", "0"):
                issues.append(f"link[{idx}] type=2 must use afe3=0")
            if kind in {"2", "3"} and (e1 in (None, "", "0") or e2 in (None, "", "0")):
                issues.append(f"link[{idx}] type={kind} requires nonzero afe1 and afe2")
            if kind == "2" and e1 and e2 and e2 != "0":
                previous = parent_of.setdefault(e2, e1)
                if previous != e1:
                    issues.append(f"action {e2} has multiple composition parents ({previous}, {e1})")
        if deep:
            parents = {n.get("afe1", "") for n in self._links_of_type("2") + self._links_of_type("3")}
            for parent in sorted(parents):
                try:
                    self.sibling_order(parent)
                except ProjectFormatError as exc:
                    issues.append(str(exc))
            # Composition cycles are invalid. Check the parent map without assuming ID order.
            for start in parent_of:
                seen: set[str] = set()
                cur = start
                while cur in parent_of:
                    if cur in seen:
                        issues.append(f"composition cycle involving action {cur}")
                        break
                    seen.add(cur)
                    cur = parent_of[cur]
        # Parameter/@o is the recovered native Parameter -> Object reference.
        # Validate it in its own ID namespace; an отсутствует/zero value means unassigned.
        parameter_nodes = self.params_node.findall("param")
        object_nodes = list(self.objects_node)
        parameter_ids = [node.get("id", "") for node in parameter_nodes]
        object_ids = [node.get("id", "") for node in object_nodes]
        if any(not value for value in parameter_ids):
            issues.append("one or more <param> nodes have no id")
        if len(parameter_ids) != len(set(parameter_ids)):
            issues.append("duplicate parameter IDs")
        if any(not value for value in object_ids):
            issues.append("one or more <object> nodes have no id")
        if len(object_ids) != len(set(object_ids)):
            issues.append("duplicate object IDs")
        object_id_set = set(object_ids)
        for node in parameter_nodes:
            object_ref = node.get("o")
            if object_ref not in (None, "", "0") and object_ref not in object_id_set:
                issues.append(
                    f"parameter {node.get('id', '?')} references missing object id {object_ref} via @o"
                )

        matrix = self.root.find("models/primaryModel/matrix")
        if matrix is not None:
            pids = set(parameter_ids)
            for index, node in enumerate(matrix):
                if not isinstance(node.tag, str):
                    continue
                if node.tag != "AElement" or node.get("type") != "4":
                    issues.append(f"primaryModel/matrix[{index}] unsupported record; preserved")
                    continue
                if node.get("e1") not in idset:
                    issues.append(f"primaryModel/matrix[{index}] references missing action {node.get('e1')}")
                if node.get("e2") not in pids:
                    issues.append(f"primaryModel/matrix[{index}] references missing parameter {node.get('e2')}")
                try:
                    char, power = int(node.get("char", "")), int(node.get("power", ""))
                    if not -128 <= char <= 127 or not -(2**31) <= power < 2**31:
                        raise ValueError()
                except ValueError:
                    issues.append(f"primaryModel/matrix[{index}] invalid char/power")

        # Keep the high-water counters, but ensure they are not lower than any current numeric ID.
        for container, key, nodes in (
            (self.actions_node, "lastID", actions),
            (self.params_node, "LastID", parameter_nodes),
            (self.objects_node, "LastID", object_nodes),
        ):
            try:
                counter = _int_attr(container, key)
                numeric = [int(n.get("id", "")) for n in nodes if (n.get("id", "").isdigit())]
                if numeric and counter < max(numeric):
                    issues.append(f"<{container.tag}> {key}={counter} is below max current ID {max(numeric)}")
            except ProjectFormatError as exc:
                issues.append(str(exc))
        # ConceptModel/cs and the scalar AElement projection in spz have
        # independently recovered contracts. spz links/content payloads remain
        # preserved and opaque; the typed editor does not reinterpret them.
        try:
            issues.extend(self.concept_structure.validate())
        except ProjectFormatError as exc:
            issues.append(str(exc))
        try:
            issues.extend(self.dynamic_structure.validate())
        except ProjectFormatError as exc:
            issues.append(str(exc))
        return issues

    def next_id(self, kind: str) -> int:
        mapping = {
            "action": (self.actions_node, "lastID"),
            "parameter": (self.params_node, "LastID"),
            "object": (self.objects_node, "LastID"),
        }
        try:
            node, key = mapping[kind]
        except KeyError as exc:
            raise ValueError(f"unknown ID domain: {kind}") from exc
        current = _int_attr(node, key)
        records = {
            "action": self.actions,
            "parameter": self.params_node.findall("param"),
            "object": list(self.objects_node),
        }[kind]
        numeric_ids = [int(n.get("id", "")) for n in records if n.get("id", "").isdigit()]
        if numeric_ids and current < max(numeric_ids):
            raise ProjectFormatError(
                f"<{node.tag}> {key}={current} is below max current ID {max(numeric_ids)}; refusing ID reuse"
            )
        next_value = current + 1
        node.set(key, str(next_value))
        return next_value

    def add_action(
        self, name: str, *, action_type: int | str, formalization: int | str = 0,
        status: int | str = 0, mark: str = "", symbol: str | None = None,
        level: int | str | None = None, number: int | str | None = None,
        parent_id: str | int | None = None, alternatives: Iterable[str] = (),
    ) -> str:
        if parent_id is not None:
            self.action(parent_id)
            # Fail before consuming an ID if the existing order chain is malformed.
            self.sibling_order(parent_id)
        action_id = str(self.next_id("action"))
        attrs = {
            "id": action_id, "name": str(name), "type": str(action_type),
            "formalization": str(formalization), "mark": str(mark),
            "status": str(status),
        }
        if symbol is not None:
            attrs["symbol"] = str(symbol)
        if level is not None:
            attrs["level"] = str(level)
        if number is not None:
            attrs["number"] = str(number)
        node = ET.SubElement(self.actions_node, "pd", attrs)
        for text in alternatives:
            ET.SubElement(node, "alts", {"text": str(text)})
        if parent_id is not None:
            self.append_child(parent_id, action_id)
        return action_id

    def append_child(self, parent_id: str | int, child_id: str | int) -> None:
        parent, child = str(parent_id), str(child_id)
        self.action(parent)
        self.action(child)
        if parent == child:
            raise ValueError("an action cannot be its own parent")
        if child in self.composition_children(parent):
            raise ValueError(f"action {child} is already a child of {parent}")
        # A child may have only one composition parent.
        parents = [n.get("afe1") for n in self._links_of_type("2") if n.get("afe2") == child]
        if parents:
            raise ValueError(f"action {child} already has composition parent {parents[0]}")
        # Prevent introducing a cycle.
        cur = parent
        parent_map = {n.get("afe2"): n.get("afe1") for n in self._links_of_type("2")}
        while cur in parent_map:
            cur = parent_map[cur]
            if cur == child:
                raise ValueError("adding this child would create a composition cycle")
        chain = self.sibling_order(parent)
        ET.SubElement(self.links_node, "link", {"type": "2", "afe1": parent, "afe2": child, "afe3": "0"})
        if chain:
            tail_id = chain[-1]
            tail = next(n for n in self._links_of_type("3") if n.get("afe1") == parent and n.get("afe2") == tail_id)
            tail.set("afe3", child)
        ET.SubElement(self.links_node, "link", {"type": "3", "afe1": parent, "afe2": child, "afe3": "0"})

    def update_action(self, action_id: str | int, **changes: str | int | None) -> None:
        node = self.action(action_id)
        unknown = set(changes) - ACTION_FIELDS
        if unknown:
            raise ValueError(f"unsupported action fields: {sorted(unknown)}")
        for key, value in changes.items():
            if value is None:
                node.attrib.pop(key, None)
            else:
                node.set(key, str(value))

    def delete_action(
        self, action_id: str | int, *, cascade: bool = False,
        cascade_content: bool = False,
    ) -> None:
        """Delete an action, optionally including its composition subtree.

        All content-link and sibling-chain dependencies are preflighted before
        the first XML mutation, so a refused cascade cannot leave a half-edited
        document. AEContentLink e1 endpoints resolve in the AFElement action
        namespace; opaque rows remain a hard safety boundary.
        """
        target = str(action_id)
        self.action(target)
        subtree: list[str] = []
        seen: set[str] = set()
        stack = [target]
        while stack:
            current = stack.pop()
            if current in seen:
                raise ProjectFormatError(f"composition subtree contains a cycle at action {current}")
            seen.add(current)
            subtree.append(current)
            children = self.composition_children(current)
            if children and not cascade:
                raise ValueError(
                    f"action {target} has children; pass cascade=True to delete its subtree"
                )
            if children:
                ordered = self.sibling_order(current)
                stack.extend(reversed(ordered))

        content_node = self.root.find("models/ConceptModel/content")
        content_records = list(content_node) if content_node is not None else []
        opaque_content = [
            n for n in content_records
            if n.tag != "AElement" or n.get("e1") is None or n.get("e2") is None
        ]
        if opaque_content:
            raise ValueError(
                "ConceptModel/content contains opaque records; action deletion is blocked until cross-model content-link endpoints are resolved"
            )
        subtree_set = set(subtree)
        dependent_content = [n for n in content_records if n.get("e1") in subtree_set]
        if dependent_content and not cascade_content:
            raise ValueError(
                f"action subtree is referenced by {len(dependent_content)} ConceptModel/content links; pass cascade_content=True"
            )

        matrix = self.root.find("models/primaryModel/matrix")
        if matrix is not None:
            records = [n for n in matrix if isinstance(n.tag, str)]
            if any(n.tag != "AElement" or n.get("e1") is None or n.get("e2") is None for n in records):
                raise ValueError("primaryModel/matrix contains opaque records; deletion is blocked")
            if any(n.get("e1") in subtree_set for n in records):
                raise ValueError("action is referenced in primaryModel/matrix; remove its parameter links first")

        # Preflight every incoming sibling-chain splice too.
        for current in subtree:
            incoming_parent = next(
                (n.get("afe1") for n in self._links_of_type("2") if n.get("afe2") == current),
                None,
            )
            if incoming_parent is not None:
                order = self.sibling_order(incoming_parent)
                if current not in order:
                    raise ProjectFormatError(
                        f"action {current} is missing from parent {incoming_parent} sibling order"
                    )

        if dependent_content and content_node is not None:
            for record in dependent_content:
                content_node.remove(record)

        if cascade:
            # Children are deleted by the established sibling-chain splice logic.
            # Their content records have already been removed as one atomic set.
            for child in list(self.composition_children(target)):
                self.delete_action(child, cascade=True, cascade_content=True)

        incoming_parent = next(
            (n.get("afe1") for n in self._links_of_type("2") if n.get("afe2") == target),
            None,
        )
        if incoming_parent is not None:
            order = self.sibling_order(incoming_parent)
            index = order.index(target)
            successor = order[index + 1] if index + 1 < len(order) else "0"
            if index > 0:
                predecessor = order[index - 1]
                pred_link = next(
                    n for n in self._links_of_type("3")
                    if n.get("afe1") == incoming_parent and n.get("afe2") == predecessor
                )
                pred_link.set("afe3", successor)
        for link in list(self.links):
            if target in {link.get("afe1"), link.get("afe2"), link.get("afe3")}:
                self.links_node.remove(link)
        self.actions_node.remove(self.action(target))

    def parameter(self, parameter_id: str | int) -> ET.Element:
        ident = str(parameter_id)
        node = next((n for n in self.params_node.findall("param") if n.get("id") == ident), None)
        if node is None:
            raise KeyError(f"parameter id {ident!r} does not exist")
        return node

    def object(self, object_id: str | int) -> ET.Element:
        ident = str(object_id)
        node = next((n for n in self.objects_node if n.get("id") == ident), None)
        if node is None:
            raise KeyError(f"object id {ident!r} does not exist")
        return node

    def parameter_object_references(self, object_id: str | int | None = None) -> list[tuple[str, str]]:
        """Return (parameter_id, object_id) pairs from native <param o="…"/> refs."""
        result = []
        for node in self.params_node.findall("param"):
            ref = node.get("o")
            if ref in (None, "", "0"):
                continue
            if object_id is None or ref == str(object_id):
                result.append((node.get("id", ""), ref))
        return result

    def set_parameter_object(self, parameter_id: str | int, object_id: str | int | None) -> None:
        """Assign or clear the recovered native Parameter/@o object reference."""
        parameter = self.parameter(parameter_id)
        if object_id is None or str(object_id).strip() in {"", "0"}:
            parameter.attrib.pop("o", None)
            return
        object_ident = str(object_id).strip()
        self.object(object_ident)  # Validate before mutating the parameter.
        parameter.set("o", object_ident)

    def add_parameter(self, attributes: Mapping[str, str | int]) -> str:
        attrs = {str(k): str(v) for k, v in attributes.items()}
        if "id" in attrs:
            raise ValueError("parameter id is assigned from params/@LastID")
        object_ref = attrs.get("o")
        if object_ref not in (None, "", "0"):
            self.object(object_ref)
        param_id = str(self.next_id("parameter"))
        attrs["id"] = param_id
        ET.SubElement(self.params_node, "param", attrs)
        return param_id

    def update_parameter(self, parameter_id: str | int, **changes: str | int | None) -> None:
        if "o" in changes and changes["o"] not in (None, "", "0"):
            self.object(changes["o"])
        self._update_record(self.params_node.findall("param"), str(parameter_id), changes)

    def delete_parameter(self, parameter_id: str | int) -> None:
        content_node = self.root.find("models/ConceptModel/content")
        if content_node is not None and len(content_node):
            raise ValueError(
                "ConceptModel/content is non-empty; parameter deletion is blocked until cross-model content-link endpoints are resolved"
            )
        matrix = self.root.find("models/primaryModel/matrix")
        if matrix is not None:
            records = [n for n in matrix if isinstance(n.tag, str)]
            if any(n.tag != "AElement" or n.get("e1") is None or n.get("e2") is None for n in records):
                raise ValueError("primaryModel/matrix contains opaque records; deletion is blocked")
            if any(n.get("e2") == str(parameter_id) for n in records):
                raise ValueError("parameter is referenced in primaryModel/matrix; remove its action links first")
        self._delete_record(self.params_node, "param", str(parameter_id))

    def add_object(self, name: str, *, attributes: Mapping[str, str | int] | None = None) -> str:
        attrs = {str(k): str(v) for k, v in (attributes or {}).items()}
        if "id" in attrs or "name" in attrs:
            raise ValueError("object id/name are assigned by add_object")
        object_id = str(self.next_id("object"))
        attrs = {"name": str(name), "id": object_id, **attrs}
        ET.SubElement(self.objects_node, "object", attrs)
        return object_id

    def update_object(self, object_id: str | int, **changes: str | int | None) -> None:
        self._update_record(list(self.objects_node), str(object_id), changes)

    def delete_object(
        self, object_id: str | int, *, clear_parameter_references: bool = False,
        allow_unknown_references: bool = False,
    ) -> None:
        """Delete an object after preflighting native param/@o references.

        ``clear_parameter_references`` explicitly removes all known ``o``
        attributes that point to this object. The legacy ``allow_unknown_references``
        argument is retained for source compatibility with 0.7.4 callers, but it
        does not silently clear known references.
        """
        ident = str(object_id)
        target = self.object(ident)
        references = self.parameter_object_references(ident)
        if references and not clear_parameter_references:
            ids = ", ".join(parameter_id for parameter_id, _ in references)
            raise ValueError(
                f"object {ident} is referenced by parameter(s) {ids}; "
                "pass clear_parameter_references=True to clear their @o assignments"
            )
        # Mutation follows the complete preflight above; no partial deletion on refusal.
        if clear_parameter_references:
            for parameter_id, _ in references:
                self.parameter(parameter_id).attrib.pop("o", None)
        self.objects_node.remove(target)

    @staticmethod
    def _update_record(nodes: Iterable[ET.Element], ident: str, changes: Mapping[str, str | int | None]) -> None:
        node = next((n for n in nodes if n.get("id") == ident), None)
        if node is None:
            raise KeyError(f"record id {ident!r} does not exist")
        for key, value in changes.items():
            if key == "id":
                raise ValueError("record IDs are immutable; delete and add explicitly")
            if value is None:
                node.attrib.pop(key, None)
            else:
                node.set(key, str(value))

    @staticmethod
    def _delete_record(parent: ET.Element, tag: str | None, ident: str) -> None:
        nodes = list(parent) if tag is None else parent.findall(tag)
        node = next((n for n in nodes if n.get("id") == ident), None)
        if node is None:
            raise KeyError(f"record id {ident!r} does not exist")
        parent.remove(node)

    def semantic_snapshot(self):
        return _semantic_node(self.root)

    def to_bytes(self, *, pretty: bool = True) -> bytes:
        """Serialize a copy of the native XML tree without adding fork metadata.

        The source document remains untouched. Unknown elements/attributes,
        comments and processing instructions are retained by the XML parser and
        serializer. Formatting follows the recovered one-space Qt DOM profile;
        byte-identical Qt output is not claimed.
        """
        root = deepcopy(self.root)
        if pretty:
            ET.indent(root, space=" ")  # QDomDocument::toString(1) indentation profile.
        return ET.tostring(root, encoding="utf-8", xml_declaration=True, short_empty_elements=True)

    def serialization_preflight(self, *, pretty: bool = True) -> dict[str, object]:
        """Verify that the writer output reopens, preserves semantics and stabilizes.

        This is a local writer-safety check, not an assertion that the original
        Windows IS-2 executable accepts the output.
        """
        payload = self.to_bytes(pretty=pretty)
        reopened = ProjectDocument.from_bytes(payload)
        semantic_preserved = reopened.semantic_snapshot() == self.semantic_snapshot()
        second_payload = reopened.to_bytes(pretty=pretty)
        idempotent = payload == second_payload
        validation_issues = reopened.validate(deep=True)
        return {
            "xml_reopens": True,
            "semantic_preserved": semantic_preserved,
            "writer_idempotent": idempotent,
            "validation_issues": validation_issues,
            "payload_bytes": len(payload),
            "output_encoding": "utf-8",
        }

    def save(self, path: str | Path, *, pretty: bool = True, atomic: bool = True) -> Path:
        path = Path(path)
        payload = self.to_bytes(pretty=pretty)
        reopened = ProjectDocument.from_bytes(payload)
        if reopened.semantic_snapshot() != self.semantic_snapshot():
            raise ProjectFormatError("writer preflight failed: serialized XML changes the semantic project tree")
        if reopened.to_bytes(pretty=pretty) != payload:
            raise ProjectFormatError("writer preflight failed: serialization is not idempotent after reopening")
        path.parent.mkdir(parents=True, exist_ok=True)
        if not atomic:
            path.write_bytes(payload)
            self.source_path = str(path)
            return path
        fd, temp_name = tempfile.mkstemp(prefix=f".{path.name}.", suffix=".tmp", dir=str(path.parent))
        try:
            with os.fdopen(fd, "wb") as stream:
                stream.write(payload)
                stream.flush()
                os.fsync(stream.fileno())
            os.replace(temp_name, path)
        except Exception:
            try:
                os.unlink(temp_name)
            except FileNotFoundError:
                pass
            raise
        self.source_path = str(path)
        return path

    def roundtrip_to(self, path: str | Path) -> list[str]:
        before = self.semantic_snapshot()
        self.save(path)
        after = ProjectDocument.load(path).semantic_snapshot()
        if before != after:
            raise ProjectFormatError("semantic tree changed during writer round-trip")
        return self.validate(deep=True)
