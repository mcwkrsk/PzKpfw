"""Editable ConceptModel/cs projection based on recovered IS-2 writer/reader paths.

The XML subtree remains authoritative. Typed edits touch only the observed
SubjectCategory (pk) and SCBinaryLink (link) fields; unrecognised nodes and
attributes are retained verbatim at the semantic XML level.
"""
from __future__ import annotations
from .i18n import tr

from dataclasses import dataclass
from typing import Iterable, Mapping
import xml.etree.ElementTree as ET

from .model import ProjectFormatError

CATEGORY_FIELDS = {
    "name", "class", "group", "number", "status", "autoRange", "codingType"
}
LINK_FIELDS = {"name", "e1", "e2", "e3", "type", "range"}
CLASS_CHARS = {1: "S", 2: "P", 3: "Z", 4: "K", 5: "O", 6: "R", 7: "C"}
CLASS_LABELS = {
    1: tr("Цикл"), 2: tr("Процесс"), 3: tr("Задача"), 4: tr("Компонент"),
    5: tr("Объект"), 6: tr("Признак / атрибут"), 7: tr("Значение признака"),
}
LINK_LABELS = {1: tr("Упорядочивание"), 2: tr("Состав"), 3: tr("Компоновка")}


def _integer(value: str | None, field: str, *, default: int | None = None) -> int:
    if value is None:
        if default is not None:
            return default
        raise ProjectFormatError(f"missing integer attribute {field}")
    try:
        return int(value, 10)
    except (TypeError, ValueError) as exc:
        raise ProjectFormatError(f"invalid integer attribute {field}={value!r}") from exc


def _present(value: str | None) -> bool:
    return value not in (None, "", "0")


@dataclass(frozen=True)
class SubjectCategory:
    id: str
    name: str
    class_id: int
    group: int
    number: int
    status: int
    auto_range: bool
    coding_type: int
    raw_attributes: dict[str, str]

    @property
    def class_char(self) -> str:
        return CLASS_CHARS.get(self.class_id, "-")

    @property
    def class_label(self) -> str:
        return CLASS_LABELS.get(self.class_id, tr('Неизвестный класс {class_id}').format(class_id=self.class_id))

    @property
    def sort_key(self) -> tuple[int, int, int]:
        return self.class_id, self.group, self.number


@dataclass(frozen=True)
class SCBinaryLink:
    id: str
    name: str
    e1: str
    e2: str
    e3: str
    type: int
    range: int
    raw_attributes: dict[str, str]

    @property
    def label(self) -> str:
        return LINK_LABELS.get(self.type, tr('Неизвестная связь {link_type}').format(link_type=self.type))

    @property
    def endpoint_ids(self) -> tuple[str | None, str | None, str | None]:
        return tuple(None if not _present(v) else v for v in (self.e1, self.e2, self.e3))  # type: ignore[return-value]


class ConceptStructureDocument:
    """Typed editor for the observed ConceptModel/cs XML branch."""

    def __init__(self, project_root: ET.Element):
        self.project_root = project_root

    @property
    def concept_model_node(self) -> ET.Element | None:
        return self.project_root.find("models/ConceptModel")

    @property
    def cs_node(self) -> ET.Element | None:
        return self.project_root.find("models/ConceptModel/cs")

    def ensure_cs(self) -> ET.Element:
        models = self.project_root.find("models")
        if models is None:
            raise ProjectFormatError("missing /project/models")
        concept = models.find("ConceptModel")
        if concept is None:
            concept = ET.SubElement(models, "ConceptModel")
        cs = concept.find("cs")
        if cs is None:
            cs = ET.SubElement(concept, "cs", {"last_elem_id": "0", "last_link_id": "0"})
        if cs.find("elemets") is None:
            ET.SubElement(cs, "elemets")
        if cs.find("links") is None:
            ET.SubElement(cs, "links")
        return cs

    @property
    def elements_node(self) -> ET.Element:
        cs = self.cs_node
        if cs is None:
            cs = self.ensure_cs()
        node = cs.find("elemets")
        if node is None:
            node = ET.SubElement(cs, "elemets")
        return node

    @property
    def links_node(self) -> ET.Element:
        cs = self.cs_node
        if cs is None:
            cs = self.ensure_cs()
        node = cs.find("links")
        if node is None:
            node = ET.SubElement(cs, "links")
        return node

    @property
    def categories(self) -> list[ET.Element]:
        # Read paths must not materialise missing containers as a side effect.
        cs = self.cs_node
        node = cs.find("elemets") if cs is not None else None
        return node.findall("pk") if node is not None else []

    @property
    def links(self) -> list[ET.Element]:
        # Keep validation and UI inspection strictly non-mutating.
        cs = self.cs_node
        node = cs.find("links") if cs is not None else None
        return node.findall("link") if node is not None else []

    def category(self, category_id: str | int) -> ET.Element:
        wanted = str(category_id)
        for node in self.categories:
            if node.get("id") == wanted:
                return node
        raise KeyError(f"SubjectCategory id {wanted!r} does not exist")

    def link(self, link_id: str | int) -> ET.Element:
        wanted = str(link_id)
        for node in self.links:
            if node.get("id") == wanted:
                return node
        raise KeyError(f"SCBinaryLink id {wanted!r} does not exist")

    def category_records(self) -> list[SubjectCategory]:
        result = []
        for n in self.categories:
            result.append(SubjectCategory(
                id=n.get("id", ""), name=n.get("name", ""),
                class_id=_integer(n.get("class"), "pk@class"),
                group=_integer(n.get("group"), "pk@group", default=-1),
                number=_integer(n.get("number"), "pk@number", default=-1),
                status=_integer(n.get("status"), "pk@status", default=0),
                auto_range=bool(_integer(n.get("autoRange"), "pk@autoRange", default=1)),
                coding_type=_integer(n.get("codingType"), "pk@codingType", default=1),
                raw_attributes=dict(n.attrib),
            ))
        return result

    def link_records(self) -> list[SCBinaryLink]:
        result = []
        for n in self.links:
            result.append(SCBinaryLink(
                id=n.get("id", ""), name=n.get("name", ""),
                e1=n.get("e1", "0"), e2=n.get("e2", "0"), e3=n.get("e3", "0"),
                type=_integer(n.get("type"), "link@type"),
                range=_integer(n.get("range"), "link@range", default=0),
                raw_attributes=dict(n.attrib),
            ))
        return result

    @staticmethod
    def _next_counter(node: ET.Element, key: str, records: Iterable[ET.Element]) -> str:
        try:
            current = _integer(node.get(key), f"cs@{key}")
        except ProjectFormatError:
            raise
        values = [int(x.get("id", "")) for x in records if (x.get("id", "").isdigit())]
        if values and current < max(values):
            raise ProjectFormatError(f"cs@{key}={current} is below max current ID {max(values)}; refusing ID reuse")
        nxt = current + 1
        node.set(key, str(nxt))
        return str(nxt)

    def add_category(
        self, name: str, *, class_id: int, group: int = -1, number: int = -1,
        status: int = 0, auto_range: bool = True, coding_type: int = 1,
        attributes: Mapping[str, str | int] | None = None,
    ) -> str:
        if not name.strip():
            raise ValueError("category name must not be empty")
        if class_id not in CLASS_CHARS:
            raise ValueError("class_id must be in the recovered domain 1..7")
        cs = self.ensure_cs()
        attrs = {str(k): str(v) for k, v in (attributes or {}).items()}
        reserved = {"id", "name", "class", "group", "number", "status", "autoRange", "codingType"}
        if reserved.intersection(attrs):
            raise ValueError(f"attributes are assigned by add_category: {sorted(reserved.intersection(attrs))}")
        ident = self._next_counter(cs, "last_elem_id", list(self.elements_node))
        data = {
            "id": ident, "name": name, "class": str(class_id), "group": str(group),
            "number": str(number), "status": str(status), "autoRange": "1" if auto_range else "0",
            "codingType": str(coding_type), **attrs,
        }
        ET.SubElement(self.elements_node, "pk", data)
        return ident

    @staticmethod
    def _normalize_category_changes(changes: Mapping[str, str | int | None]) -> dict[str, str | None]:
        unsupported = set(changes) - CATEGORY_FIELDS
        if unsupported:
            raise ValueError(f"unsupported category fields: {sorted(unsupported)}")
        normalized: dict[str, str | None] = {}
        for key, value in changes.items():
            if key == "name" and value is not None and not str(value).strip():
                raise ValueError("category name must not be empty")
            if key == "class" and value is not None and int(value) not in CLASS_CHARS:
                raise ValueError("class must be in the recovered domain 1..7")
            if key in {"group", "number", "status", "codingType"} and value is not None:
                value = str(int(value))
            if key == "autoRange" and value is not None:
                text = str(value).lower()
                if text not in {"0", "1", "true", "false", "yes", "no", "on", "off"}:
                    raise ValueError("autoRange must be 0 or 1")
                value = "1" if text in {"1", "true", "yes", "on"} else "0"
            normalized[key] = None if value is None else str(value)
        return normalized

    def update_category(self, category_id: str | int, **changes: str | int | None) -> None:
        self.update_categories({str(category_id): changes})

    def update_categories(
        self,
        updates: Mapping[str | int, Mapping[str, str | int | None]],
    ) -> tuple[str, ...]:
        """Atomically update multiple categories after validating every edit.

        This is intended for bulk group/number maintenance in the editor. All
        target IDs and field values are resolved before the first XML mutation,
        so an invalid member cannot leave a partially edited ConceptModel.
        Unknown attributes and child nodes are left untouched.
        """
        if not updates:
            return ()
        prepared: list[tuple[str, ET.Element, dict[str, str | None]]] = []
        seen: set[str] = set()
        for raw_id, changes in updates.items():
            ident = str(raw_id)
            if ident in seen:
                raise ValueError(f"duplicate category ID in bulk edit: {ident}")
            seen.add(ident)
            node = self.category(ident)
            normalized = self._normalize_category_changes(changes)
            prepared.append((ident, node, normalized))
        changed: list[str] = []
        for ident, node, normalized in prepared:
            did_change = False
            for key, value in normalized.items():
                current = node.get(key)
                if current == value:
                    continue
                did_change = True
                if value is None:
                    node.attrib.pop(key, None)
                else:
                    node.set(key, value)
            if did_change:
                changed.append(ident)
        return tuple(changed)

    def set_category_attributes(self, category_id: str | int, attributes: Mapping[str, str | int | float | bool | None]) -> None:
        """Replace the editable XML attribute map while preserving the category ID and children.

        This is an advanced escape hatch for project-specific attributes. Known
        fields still pass the same validators as ordinary typed edits; unknown
        scalar attributes are retained as text. Nested XML children are never
        replaced by this operation.
        """
        ident = str(category_id)
        node = self.category(ident)
        if not isinstance(attributes, Mapping):
            raise TypeError("category attributes must be a mapping")
        if "id" in attributes:
            raise ValueError("SubjectCategory id is managed by the native counter and cannot be changed")
        proposed: dict[str, str] = {}
        for raw_key, raw_value in attributes.items():
            key = str(raw_key)
            if not key or key == "id":
                raise ValueError("attribute names must be non-empty and id is reserved")
            if raw_value is None:
                continue
            if not isinstance(raw_value, (str, int, float, bool)):
                raise ValueError(f"attribute {key!r} must have a scalar value")
            proposed[key] = str(raw_value)
        known = {key: value for key, value in proposed.items() if key in CATEGORY_FIELDS}
        normalized = self._normalize_category_changes(known)
        for key, value in normalized.items():
            if value is None:
                proposed.pop(key, None)
            else:
                proposed[key] = value
        # Validate the full known domain before touching the live XML node.
        if "class" not in proposed:
            raise ValueError("category attributes must retain the required class field")
        if "name" in proposed and not proposed["name"].strip():
            raise ValueError("category name must not be empty")
        if int(proposed["class"]) not in CLASS_CHARS:
            raise ValueError("class must be in the recovered domain 1..7")
        node.attrib.clear()
        node.set("id", ident)
        node.attrib.update(proposed)

    def set_link_attributes(self, link_id: str | int, attributes: Mapping[str, str | int | float | bool | None]) -> None:
        """Replace SCBinaryLink attributes after validating the recovered fields."""
        ident = str(link_id)
        node = self.link(ident)
        if not isinstance(attributes, Mapping):
            raise TypeError("link attributes must be a mapping")
        if "id" in attributes:
            raise ValueError("SCBinaryLink id is managed by the native counter and cannot be changed")
        proposed: dict[str, str] = {}
        for raw_key, raw_value in attributes.items():
            key = str(raw_key)
            if not key or key == "id":
                raise ValueError("attribute names must be non-empty and id is reserved")
            if raw_value is None:
                continue
            if not isinstance(raw_value, (str, int, float, bool)):
                raise ValueError(f"attribute {key!r} must have a scalar value")
            proposed[key] = str(raw_value)
        known_changes = {key: proposed.get(key) for key in LINK_FIELDS if key in proposed or key in node.attrib}
        # update_link performs all endpoint/type/range validation before mutating.
        old_unknown = {key: value for key, value in node.attrib.items() if key not in LINK_FIELDS and key != "id"}
        self.update_link(ident, **known_changes)
        for key in old_unknown:
            node.attrib.pop(key, None)
        for key, value in proposed.items():
            if key not in LINK_FIELDS:
                node.set(key, value)

    def catalog_report(self) -> dict[str, object]:
        """Summarize ConceptModel/cs categories by recovered class and group."""
        records = self.category_records()
        classes: dict[int, dict[str, object]] = {}
        groups: dict[tuple[int, int], list[SubjectCategory]] = {}
        for record in records:
            item = classes.setdefault(record.class_id, {
                "class_id": record.class_id,
                "class_char": record.class_char,
                "class_label": record.class_label,
                "count": 0,
            })
            item["count"] = int(item["count"]) + 1
            groups.setdefault((record.class_id, record.group), []).append(record)
        group_items = []
        duplicate_numbers: list[dict[str, object]] = []
        for (class_id, group_id), members in sorted(groups.items()):
            by_number: dict[int, list[str]] = {}
            for member in members:
                if member.number >= 0:
                    by_number.setdefault(member.number, []).append(member.id)
            duplicates = {number: ids for number, ids in by_number.items() if len(ids) > 1}
            for number, ids in sorted(duplicates.items()):
                duplicate_numbers.append({"class_id": class_id, "group": group_id, "number": number, "category_ids": ids})
            numbers = sorted(by_number)
            group_items.append({
                "class_id": class_id,
                "class_char": CLASS_CHARS.get(class_id, "-"),
                "group": group_id,
                "count": len(members),
                "category_ids": [member.id for member in members],
                "number_min": numbers[0] if numbers else None,
                "number_max": numbers[-1] if numbers else None,
                "duplicate_numbers": duplicates,
            })
        cs = self.cs_node
        return {
            "schema_version": 1,
            "category_count": len(records),
            "link_count": len(self.links),
            "class_count": len(classes),
            "group_count": len(groups),
            "classes": [classes[key] for key in sorted(classes)],
            "groups": group_items,
            "duplicate_numbers": duplicate_numbers,
            "link_type_counts": {
                str(kind): sum(1 for node in self.links if node.get("type") == str(kind))
                for kind in (1, 2, 3)
            },
            "unknown_attribute_counts": {
                "categories": sum(1 for node in self.categories if set(node.attrib) - ({"id"} | CATEGORY_FIELDS)),
                "links": sum(1 for node in self.links if set(node.attrib) - ({"id"} | LINK_FIELDS)),
            },
            "duplicate_category_ids": sorted({ident for ident in [n.get("id", "") for n in self.categories] if ident and sum(1 for n in self.categories if n.get("id") == ident) > 1}),
            "duplicate_link_ids": sorted({ident for ident in [n.get("id", "") for n in self.links] if ident and sum(1 for n in self.links if n.get("id") == ident) > 1}),
            "validation_issues": self.validate(),
            "counters": {
                "last_elem_id": cs.get("last_elem_id") if cs is not None else None,
                "last_link_id": cs.get("last_link_id") if cs is not None else None,
            },
            "notes": [
                "Only observed SubjectCategory fields are interpreted.",
                "Unknown XML nodes and attributes remain untouched.",
                "Duplicate category numbers are reported, not automatically changed.",
            ],
        }

    def delete_category(
        self, category_id: str | int, *, cascade_links: bool = False,
        cascade_content_links: bool = False,
    ) -> None:
        ident = str(category_id)
        node = self.category(ident)
        content = self.project_root.find("models/ConceptModel/content")
        content_records = list(content) if content is not None else []
        opaque_content = [n for n in content_records if n.tag != "AElement" or n.get("e1") is None or n.get("e2") is None]
        if opaque_content:
            raise ValueError("ConceptModel/content is populated with opaque records; category deletion is blocked until content endpoints are resolved")
        content_refs = [n for n in content_records if n.get("e2") == ident]
        if content_refs and not cascade_content_links:
            raise ValueError(
                f"category {ident} is referenced by {len(content_refs)} ConceptModel/content links; "
                "pass cascade_content_links=True"
            )
        touching = [link for link in self.links if ident in {link.get("e1"), link.get("e2"), link.get("e3")}]
        if touching and not cascade_links:
            raise ValueError(f"category {ident} is referenced by {len(touching)} links; pass cascade_links=True")
        # Both dependency collections are preflighted before the first mutation.
        if cascade_content_links and content is not None:
            for record in content_refs:
                content.remove(record)
        if cascade_links:
            for link in touching:
                self.links_node.remove(link)
        self.elements_node.remove(node)

    def add_link(
        self, relation_type: int, *, e1: str | int | None = None,
        e2: str | int | None = None, e3: str | int | None = None,
        name: str = "", range_value: int | None = None,
        attributes: Mapping[str, str | int] | None = None,
    ) -> str:
        if relation_type not in (1, 2, 3):
            raise ValueError("SCBinaryLink type must be 1 (order), 2 (composition), or 3 (arrangement)")
        by_id = {n.get("id", ""): n for n in self.categories}
        endpoints = [None if x is None or str(x) in ("", "0") else str(x) for x in (e1, e2, e3)]
        if relation_type == 1:
            if endpoints[0] is not None:
                raise ValueError("type=1 order link uses endpoint slots (null, A, B)")
            if endpoints[1] is None or endpoints[2] is None:
                raise ValueError("type=1 order link requires e2 and e3")
        elif relation_type == 2:
            if endpoints[0] is None or endpoints[1] is None or endpoints[2] is not None:
                raise ValueError("type=2 composition link uses endpoint slots (A, B, null)")
        else:
            if endpoints[0] is None or endpoints[1] is None:
                raise ValueError("type=3 arrangement link requires e1 and e2; e3 is optional")
        for endpoint in endpoints:
            if endpoint is not None and endpoint not in by_id:
                raise KeyError(f"SCBinaryLink endpoint category {endpoint!r} does not exist")
        cs = self.ensure_cs()
        reserved = {"id", "name", "e1", "e2", "e3", "type", "range"}
        extra = {str(k): str(v) for k, v in (attributes or {}).items()}
        if reserved.intersection(extra):
            raise ValueError(f"attributes are assigned by add_link: {sorted(reserved.intersection(extra))}")
        ident = self._next_counter(cs, "last_link_id", list(self.links_node))
        if range_value is None:
            if relation_type == 1:
                range_value = 99
            elif relation_type == 2:
                class_id = _integer(by_id[str(endpoints[0])].get("class"), "pk@class")
                range_value = 1 if class_id in {1, 3, 5} else 99
            else:
                range_value = 1 if endpoints[2] is None else 99
        data = {
            "id": ident, "name": name,
            "e1": endpoints[0] or "0", "e2": endpoints[1] or "0", "e3": endpoints[2] or "0",
            "type": str(relation_type), "range": str(range_value), **extra,
        }
        ET.SubElement(self.links_node, "link", data)
        return ident

    def update_link(self, link_id: str | int, **changes: str | int | None) -> None:
        if set(changes) - LINK_FIELDS:
            raise ValueError(f"unsupported link fields: {sorted(set(changes) - LINK_FIELDS)}")
        node = self.link(link_id)
        proposed = dict(node.attrib)
        for key, value in changes.items():
            if value is None:
                proposed.pop(key, None)
            else:
                proposed[key] = str(value)
        kind = _integer(proposed.get("type"), "link@type")
        if kind not in (1, 2, 3):
            raise ValueError("link type must be 1, 2 or 3")
        endpoints = [proposed.get(key, "0") for key in ("e1", "e2", "e3")]
        if kind == 1:
            if _present(endpoints[0]) or not _present(endpoints[1]) or not _present(endpoints[2]):
                raise ValueError("type=1 order link requires endpoint layout (0, A, B)")
        elif kind == 2:
            if not _present(endpoints[0]) or not _present(endpoints[1]) or _present(endpoints[2]):
                raise ValueError("type=2 composition link requires endpoint layout (A, B, 0)")
        elif not _present(endpoints[0]) or not _present(endpoints[1]):
            raise ValueError("type=3 arrangement link requires e1 and e2")
        valid_ids = {category.get("id", "") for category in self.categories}
        for endpoint in endpoints:
            if _present(endpoint) and endpoint not in valid_ids:
                raise KeyError(f"SCBinaryLink endpoint category {endpoint!r} does not exist")
        _integer(proposed.get("range"), "link@range", default=0)
        node.attrib.clear()
        node.attrib.update(proposed)

    def delete_link(self, link_id: str | int) -> None:
        self.links_node.remove(self.link(link_id))

    def recompute_auto_ranges(self) -> dict[str, list[str]]:
        """Apply the statically recovered type-3/slot-0 auto-range predicate."""
        categories = {n.get("id", ""): n for n in self.categories}
        links = self.links
        changed: dict[str, list[str]] = {}
        for category_id, category in categories.items():
            if not bool(_integer(category.get("autoRange"), "pk@autoRange", default=1)):
                continue
            candidates = [
                link for link in links
                if link.get("type") == "3" and link.get("e1") == category_id and not _present(link.get("e3"))
            ]
            candidates.sort(key=lambda link: self._category_sort_key(categories.get(link.get("e2", ""))))
            if candidates:
                changed[category_id] = []
                for rank, link in enumerate(candidates, 1):
                    link.set("range", str(rank))
                    changed[category_id].append(link.get("id", ""))
        return changed

    @staticmethod
    def _category_sort_key(node: ET.Element | None) -> tuple[int, int, int]:
        if node is None:
            return (999, 999, 999)
        return (
            _integer(node.get("class"), "pk@class"),
            _integer(node.get("group"), "pk@group", default=-1),
            _integer(node.get("number"), "pk@number", default=-1),
        )

    def validate(self) -> list[str]:
        issues: list[str] = []
        cs = self.cs_node
        if cs is None:
            return issues
        category_nodes = self.categories
        link_nodes = self.links
        category_ids = [n.get("id", "") for n in category_nodes]
        link_ids = [n.get("id", "") for n in link_nodes]
        if any(not x for x in category_ids):
            issues.append("ConceptModel/cs contains pk without id")
        if len(category_ids) != len(set(category_ids)):
            issues.append("ConceptModel/cs contains duplicate SubjectCategory IDs")
        for idx, node in enumerate(category_nodes):
            for field, default in (("class", None), ("group", -1), ("number", -1),
                                   ("status", 0), ("autoRange", 1), ("codingType", 1)):
                try:
                    value = _integer(node.get(field), f"cs/pk[{idx}]@{field}", default=default)
                    if field == "class" and value not in CLASS_CHARS:
                        issues.append(f"cs/pk[{idx}] has unsupported class {value}")
                    if field == "autoRange" and value not in (0, 1):
                        issues.append(f"cs/pk[{idx}] autoRange must be 0 or 1")
                except ProjectFormatError as exc:
                    issues.append(str(exc))
                except ValueError as exc:
                    issues.append(f"cs/pk[{idx}] has invalid integer {field}: {exc}")
        if any(not x for x in link_ids):
            issues.append("ConceptModel/cs contains link without id")
        if len(link_ids) != len(set(link_ids)):
            issues.append("ConceptModel/cs contains duplicate SCBinaryLink IDs")
        idset = set(category_ids)
        for idx, node in enumerate(link_nodes):
            try:
                kind = _integer(node.get("type"), f"cs/link[{idx}]@type")
            except ProjectFormatError as exc:
                issues.append(str(exc))
                continue
            if kind not in (1, 2, 3):
                issues.append(f"cs/link[{idx}] has unsupported SCBinaryLink type {kind}")
                continue
            slots = [node.get("e1", "0"), node.get("e2", "0"), node.get("e3", "0")]
            required = {1: (1, 2), 2: (0, 1), 3: (0, 1)}[kind]
            for slot_index in required:
                if not _present(slots[slot_index]):
                    issues.append(f"cs/link[{idx}] type={kind} requires e{slot_index+1}")
            if kind == 1 and _present(slots[0]):
                issues.append(f"cs/link[{idx}] type=1 requires null e1")
            if kind == 2 and _present(slots[2]):
                issues.append(f"cs/link[{idx}] type=2 requires null e3")
            for slot_index, endpoint in enumerate(slots):
                if _present(endpoint) and endpoint not in idset:
                    issues.append(f"cs/link[{idx}] e{slot_index+1} references missing SubjectCategory {endpoint}")
            try:
                _integer(node.get("range"), f"cs/link[{idx}]@range", default=0)
            except ProjectFormatError as exc:
                issues.append(str(exc))
        try:
            elem_counter = _integer(cs.get("last_elem_id"), "cs@last_elem_id")
            elemets = cs.find("elemets")
            ids = [int(n.get("id", "")) for n in (list(elemets) if elemets is not None else []) if n.get("id", "").isdigit()]
            if ids and elem_counter < max(ids):
                issues.append(f"cs@last_elem_id={elem_counter} below max SubjectCategory ID {max(ids)}")
        except ProjectFormatError as exc:
            issues.append(str(exc))
        try:
            link_counter = _integer(cs.get("last_link_id"), "cs@last_link_id")
            links_container = cs.find("links")
            ids = [int(n.get("id", "")) for n in (list(links_container) if links_container is not None else []) if n.get("id", "").isdigit()]
            if ids and link_counter < max(ids):
                issues.append(f"cs@last_link_id={link_counter} below max SCBinaryLink ID {max(ids)}")
        except ProjectFormatError as exc:
            issues.append(str(exc))
        return issues
