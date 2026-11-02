"""Conservative typed editor for ConceptModel/spz AElement records.

The original writer at IS.exe:0x0040A120 serializes the scalar AElement
attributes exposed here. PzKpfw 0.7.4 supports CRUD for the recovered AIEBinaryLink and AEContentLink
records. Unknown attributes and nested XML remain authoritative and are preserved.
"""
from __future__ import annotations

from dataclasses import dataclass
from typing import Iterable, Mapping
import xml.etree.ElementTree as ET

from .model import ProjectFormatError

SCALAR_FIELDS = {
    "name", "type", "status", "formalization", "level", "number", "symbol"
}
NUMERIC_FIELDS = {"type", "status", "formalization", "level", "number", "symbol"}
_UNSET = object()


def _int_attr(node: ET.Element, key: str, *, default: int | None = None) -> int:
    raw = node.get(key)
    if raw is None:
        if default is not None:
            return default
        raise ProjectFormatError(f"missing integer attribute {node.tag}@{key}")
    try:
        return int(raw, 10)
    except (TypeError, ValueError) as exc:
        raise ProjectFormatError(f"invalid integer attribute {node.tag}@{key}={raw!r}") from exc


@dataclass(frozen=True)
class AElementRecord:
    id: str
    name: str
    type: int
    status: int
    formalization: int
    level: int
    number: int
    symbol: int
    raw_attributes: dict[str, str]
    opaque_child_count: int = 0


@dataclass(frozen=True)
class DynamicLinkRecord:
    """Typed projection of one existing spz/links child.

    Reverse-engineered reader code resolves e1/e2/e3 through the dynamic
    structure's AIElement ID lookup and writes them through the three typed
    AIEBinaryLink endpoint setters. Other attributes and nested XML remain
    opaque and are never rewritten by the endpoint editor.
    """
    index: int
    tag: str
    e1: int | None
    e2: int | None
    e3: int | None
    raw_attributes: dict[str, str]
    opaque_child_count: int = 0


@dataclass(frozen=True)
class ContentLinkRecord:
    """Typed projection of one existing ConceptModel/content child.

    Static reader evidence establishes e1/e2 endpoints and the signed char
    and int32 power values. The recovered native endpoint domains are AFElement actions (e1) and
    AIElement ConceptModel categories (e2); fields outside this contract remain opaque.
    """
    index: int
    tag: str
    e1: int | None
    e2: int | None
    char: int | None
    power: int | None
    raw_attributes: dict[str, str]
    opaque_child_count: int = 0


class DynamicStructureDocument:
    """Typed editing facade over /project/models/ConceptModel/spz and content."""

    def __init__(self, project_root: ET.Element):
        self.project_root = project_root

    @property
    def concept_model_node(self) -> ET.Element | None:
        return self.project_root.find("models/ConceptModel")

    @property
    def spz_node(self) -> ET.Element | None:
        return self.project_root.find("models/ConceptModel/spz")

    @property
    def elements_node(self) -> ET.Element | None:
        spz = self.spz_node
        return spz.find("elemets") if spz is not None else None

    @property
    def links_node(self) -> ET.Element | None:
        spz = self.spz_node
        return spz.find("links") if spz is not None else None

    @property
    def content_node(self) -> ET.Element | None:
        cm = self.concept_model_node
        return cm.find("content") if cm is not None else None

    @property
    def elements(self) -> list[ET.Element]:
        node = self.elements_node
        return node.findall("AElement") if node is not None else []

    @property
    def links(self) -> list[ET.Element]:
        node = self.links_node
        return list(node) if node is not None else []

    @property
    def content_records(self) -> list[ET.Element]:
        node = self.content_node
        return list(node) if node is not None else []

    @staticmethod
    def _optional_integer(node: ET.Element, key: str) -> int | None:
        raw = node.get(key)
        if raw is None:
            return None
        try:
            return int(raw, 10)
        except (TypeError, ValueError):
            return None

    def spz_link_records(self) -> list[DynamicLinkRecord]:
        """Return a non-mutating, typed view of e1/e2/e3 on spz link nodes."""
        records: list[DynamicLinkRecord] = []
        for index, node in enumerate(self.links):
            records.append(DynamicLinkRecord(
                index=index,
                tag=node.tag,
                e1=self._optional_integer(node, "e1"),
                e2=self._optional_integer(node, "e2"),
                e3=self._optional_integer(node, "e3"),
                raw_attributes=dict(node.attrib),
                opaque_child_count=len(list(node)),
            ))
        return records

    def content_link_records(self) -> list[ContentLinkRecord]:
        """Return a non-mutating, typed view of e1/e2/char/power fields."""
        records: list[ContentLinkRecord] = []
        for index, node in enumerate(self.content_records):
            records.append(ContentLinkRecord(
                index=index,
                tag=node.tag,
                e1=self._optional_integer(node, "e1"),
                e2=self._optional_integer(node, "e2"),
                char=self._optional_integer(node, "char"),
                power=self._optional_integer(node, "power"),
                raw_attributes=dict(node.attrib),
                opaque_child_count=len(list(node)),
            ))
        return records

    def inspection(self) -> dict[str, object]:
        """JSON-friendly structural inventory; never materializes missing nodes."""
        spz = self.spz_node
        return {
            "spz_last_id": spz.get("last_id") if spz is not None else None,
            "a_elements": [
                {
                    "id": record.id, "name": record.name, "type": record.type,
                    "status": record.status, "formalization": record.formalization,
                    "level": record.level, "number": record.number, "symbol": record.symbol,
                    "raw_attributes": record.raw_attributes,
                    "opaque_child_count": record.opaque_child_count,
                }
                for record in self.records()
            ],
            "spz_links": [
                {
                    "index": record.index, "tag": record.tag,
                    "e1": record.e1, "e2": record.e2, "e3": record.e3,
                    "raw_attributes": record.raw_attributes,
                    "opaque_child_count": record.opaque_child_count,
                }
                for record in self.spz_link_records()
            ],
            "content_records": [
                {
                    "index": record.index, "tag": record.tag,
                    "e1": record.e1, "e2": record.e2,
                    "char": record.char, "power": record.power,
                    "raw_attributes": record.raw_attributes,
                    "opaque_child_count": record.opaque_child_count,
                }
                for record in self.content_link_records()
            ],
            "editing_policy": {
                "spz/AElement scalar fields": "editable",
                "spz/links": "typed AIEBinaryLink records: endpoints and AElement scalar fields editable; add/delete enabled",
                "ConceptModel/content": "AEContentLink type 4: e1=AFElement action, e2=AIElement category; add/edit/delete enabled",
            },
            "validation_issues": self.validate(),
        }

    def ensure_spz(self) -> ET.Element:
        """Materialize the observed empty structure only on an explicit edit."""
        models = self.project_root.find("models")
        if models is None:
            raise ProjectFormatError("missing /project/models")
        cm = models.find("ConceptModel")
        if cm is None:
            cm = ET.SubElement(models, "ConceptModel")
        spz = cm.find("spz")
        if spz is None:
            spz = ET.SubElement(cm, "spz", {"last_id": "0"})
        if spz.find("elemets") is None:
            ET.SubElement(spz, "elemets")
        if spz.find("links") is None:
            ET.SubElement(spz, "links")
        return spz

    def _elements_container(self, *, create: bool = False) -> ET.Element:
        spz = self.ensure_spz() if create else self.spz_node
        if spz is None:
            raise ProjectFormatError("ConceptModel/spz is missing; create it explicitly before editing")
        node = spz.find("elemets")
        if node is None:
            if not create:
                raise ProjectFormatError("ConceptModel/spz/elemets is missing")
            node = ET.SubElement(spz, "elemets")
        return node

    def records(self) -> list[AElementRecord]:
        result: list[AElementRecord] = []
        for node in self.elements:
            ident = node.get("id")
            if ident is None or not ident.strip():
                raise ProjectFormatError("spz AElement without id")
            result.append(AElementRecord(
                id=ident,
                name=node.get("name", ""),
                type=_int_attr(node, "type"),
                status=_int_attr(node, "status"),
                formalization=_int_attr(node, "formalization"),
                level=_int_attr(node, "level"),
                number=_int_attr(node, "number"),
                symbol=_int_attr(node, "symbol"),
                raw_attributes=dict(node.attrib),
                opaque_child_count=len(list(node)),
            ))
        return result

    def element(self, ident: str | int) -> ET.Element:
        wanted = str(ident)
        matches = [n for n in self.elements if n.get("id") == wanted]
        if not matches:
            raise KeyError(f"spz AElement id {wanted!r} does not exist")
        if len(matches) > 1:
            raise ProjectFormatError(f"duplicate spz AElement id {wanted!r}")
        return matches[0]

    def _spz_element_ids(self) -> set[int]:
        result: set[int] = set()
        for node in self.elements:
            raw = node.get("id")
            if raw is None:
                continue
            try:
                result.add(int(raw, 10))
            except ValueError:
                continue
        return result

    def _action_ids(self) -> set[int]:
        result: set[int] = set()
        node = self.project_root.find("models/primaryModel/spd/actions")
        for action in node.findall("pd") if node is not None else []:
            raw = action.get("id")
            if raw is None:
                continue
            try:
                result.add(int(raw, 10))
            except ValueError:
                continue
        return result

    def _category_ids(self) -> set[int]:
        result: set[int] = set()
        node = self.project_root.find("models/ConceptModel/cs/elemets")
        for category in node.findall("pk") if node is not None else []:
            raw = category.get("id")
            if raw is None:
                continue
            try:
                result.add(int(raw, 10))
            except ValueError:
                continue
        return result

    def ensure_content(self) -> ET.Element:
        cm = self.concept_model_node
        if cm is None:
            models = self.project_root.find("models")
            if models is None:
                raise ProjectFormatError("missing /project/models")
            cm = ET.SubElement(models, "ConceptModel")
        content = cm.find("content")
        if content is None:
            content = ET.SubElement(cm, "content")
        return content

    @staticmethod
    def _endpoint(value: int | str | None, field: str, known: set[int], *, allow_null: bool) -> str:
        try:
            ident = int(value) if value not in (None, "") else 0
        except (TypeError, ValueError) as exc:
            raise ValueError(f"{field} must be an integer endpoint ID") from exc
        if not -(2**31) <= ident <= 2**31 - 1:
            raise ValueError(f"{field} must fit signed 32-bit range")
        if ident == 0 and allow_null:
            return "0"
        if ident <= 0:
            raise ValueError(f"{field} must reference an existing positive ID")
        if ident not in known:
            raise ValueError(f"{field} references unknown ID {ident}")
        return str(ident)

    def add_spz_link(
        self, *, e1: int | str = 0, e2: int | str = 0, e3: int | str = 0,
        name: str = "", type: int = 0, status: int = 0,
        formalization: int = 0, level: int = 0, number: int = 0,
        symbol: int = 0, attributes: Mapping[str, str | int] | None = None,
    ) -> int:
        """Create a writer-shaped AIEBinaryLink record in ConceptModel/spz/links.

        The generic AIEBinaryLink constructor has three null AIElement slots and
        zero-initialized scalar state. No vendor-specific extension payload is
        fabricated; callers may only add explicit, non-reserved attributes.
        """
        endpoints = {
            key: self._endpoint(value, key, self._spz_element_ids(), allow_null=True)
            for key, value in (("e1", e1), ("e2", e2), ("e3", e3))
        }
        if not any(value != "0" for value in endpoints.values()):
            raise ValueError("at least one spz link endpoint must be nonzero")
        extras = {str(k): str(v) for k, v in (attributes or {}).items()}
        reserved = {"id", "name", "e1", "e2", "e3", *SCALAR_FIELDS}
        overlap = reserved.intersection(extras)
        if overlap:
            raise ValueError(f"reserved spz link attributes: {sorted(overlap)}")
        scalar_values = {
            "type": int(type), "status": int(status),
            "formalization": int(formalization), "level": int(level),
            "number": int(number), "symbol": int(symbol),
        }
        for key, value in scalar_values.items():
            if key == "symbol":
                if not 0 <= value <= 65535:
                    raise ValueError("symbol must fit the original uint16 field")
            elif not -(2**31) <= value <= 2**31 - 1:
                raise ValueError(f"{key} must fit signed 32-bit range")
        spz = self.ensure_spz()
        links_node = spz.find("links")
        if links_node is None:
            links_node = ET.SubElement(spz, "links")
        # AIEBinaryLink's native no-argument constructor delegates to the
        # AElement base with id=0 and empty name. DynamicStructure's last_id
        # counter belongs to spz/elemets; no separate link counter is serialized.
        attrs = {
            "id": "0", "name": str(name),
            **{key: str(value) for key, value in scalar_values.items()},
            **endpoints, **extras,
        }
        ET.SubElement(links_node, "AElement", attrs)
        return len(links_node) - 1

    def delete_spz_link(self, index: int) -> None:
        nodes = self.links
        if index < 0 or index >= len(nodes):
            raise IndexError(f"spz link index {index} is out of range")
        if nodes[index].tag != "AElement" or any(nodes[index].get(key) is None for key in ("e1", "e2", "e3")):
            raise ProjectFormatError("selected spz/links record is opaque; deletion is blocked to preserve unknown vendor data")
        container = self.links_node
        if container is None:
            raise ProjectFormatError("ConceptModel/spz/links is missing")
        container.remove(nodes[index])
        # spz@last_id is a high-water mark and is never decremented.

    def add_content_link(
        self, e1: int | str, e2: int | str, *, char: int | str = 0,
        power: int | str = 1, duplicate: str = "reuse",
    ) -> int:
        """Create an AEContentLink: e1=AFElement action, e2=AIElement category.

        The native default constructor sets LinkType=4, char=0 and power=1.
        The plugin may pass markers such as '.', but those are caller policy,
        not a format-wide default. Duplicate handling follows the native
        addContentLink(..., bool) behavior: an existing identical link is
        reused unchanged by default or has power incremented when requested.
        """
        e1_value = self._endpoint(e1, "e1 (AFElement action)", self._action_ids(), allow_null=False)
        e2_value = self._endpoint(e2, "e2 (AIElement category)", self._category_ids(), allow_null=False)
        try:
            char_value = int(char)
            power_value = int(power)
        except (TypeError, ValueError) as exc:
            raise ValueError("char and power must be integers") from exc
        if not -128 <= char_value <= 127:
            raise ValueError("char must fit signed 8-bit range (-128..127)")
        if not -(2**31) <= power_value <= 2**31 - 1:
            raise ValueError("power must fit signed 32-bit range")
        if duplicate not in {"reuse", "reject", "increment_power"}:
            raise ValueError("duplicate must be 'reuse', 'reject' or 'increment_power'")
        content = self.ensure_content()
        for index, node in enumerate(list(content)):
            if node.tag == "AElement" and node.get("type") == "4" and (node.get("e1"), node.get("e2"), node.get("char")) == (e1_value, e2_value, str(char_value)):
                if duplicate == "reject":
                    raise ValueError("an AEContentLink with the same AF endpoint, AI endpoint and char already exists")
                if duplicate == "reuse":
                    return index
                current = int(node.get("power", "1"))
                if current >= 2**31 - 1:
                    raise ValueError("content-link power cannot be incremented beyond signed 32-bit maximum")
                node.set("power", str(current + 1))
                return index
        # AEContentLink's no-argument constructor yields id=0, empty name,
        # LinkType=4, char=0, power=1 and null endpoint slots. The writer emits
        # these as the same AElement record with e1/e2/type/char/power attrs.
        ET.SubElement(content, "AElement", {
            "id": "0", "name": "", "e1": e1_value, "e2": e2_value,
            "type": "4", "char": str(char_value), "power": str(power_value),
        })
        return len(content) - 1

    def delete_content_link(self, index: int) -> None:
        nodes = self.content_records
        if index < 0 or index >= len(nodes):
            raise IndexError(f"ConceptModel/content index {index} is out of range")
        if nodes[index].tag != "AElement" or nodes[index].get("type") != "4" or any(nodes[index].get(key) is None for key in ("e1", "e2", "char", "power")):
            raise ProjectFormatError("selected ConceptModel/content record is opaque or not AEContentLink type 4; deletion is blocked to preserve unknown data")
        content = self.content_node
        if content is None:
            raise ProjectFormatError("ConceptModel/content is missing")
        content.remove(nodes[index])

    def update_spz_link(self, index: int, **changes: int | str | None) -> None:
        """Update all serialized, recovered AIEBinaryLink fields atomically.

        Unknown attributes and nested children are never reconstructed or
        rewritten. Endpoint IDs are resolved in the spz AIElement namespace;
        numeric base fields retain their observed integer widths.
        """
        allowed = {"e1", "e2", "e3", "name", *NUMERIC_FIELDS}
        unsupported = set(changes) - allowed
        if unsupported:
            raise ValueError(f"unsupported spz link fields: {sorted(unsupported)}")
        nodes = self.links
        if index < 0 or index >= len(nodes):
            raise IndexError(f"spz link index {index} is out of range")
        node = nodes[index]
        if node.tag != "AElement" or any(node.get(key) is None for key in ("e1", "e2", "e3")):
            raise ProjectFormatError("selected spz/links record is opaque; editing is blocked")
        if not changes:
            return

        known_ids = self._spz_element_ids()
        prepared: dict[str, str] = {}
        for key, raw in changes.items():
            if key in {"e1", "e2", "e3"}:
                prepared[key] = self._endpoint(
                    raw, key, known_ids, allow_null=True
                )
            elif key == "name":
                prepared[key] = "" if raw is None else str(raw)
            else:
                try:
                    value = int(raw) if raw is not None else 0
                except (TypeError, ValueError) as exc:
                    raise ValueError(f"{key} must be an integer") from exc
                if key == "symbol":
                    if not 0 <= value <= 65535:
                        raise ValueError("symbol must fit the original uint16 field")
                elif not -(2**31) <= value <= 2**31 - 1:
                    raise ValueError(f"{key} must fit signed 32-bit range")
                prepared[key] = str(value)
        node.attrib.update(prepared)

    def update_content_record(
        self, index: int, *, e1: int | str | None | object = _UNSET,
        e2: int | str | None | object = _UNSET,
        char: int | str | None | object = _UNSET,
        power: int | str | None | object = _UNSET,
    ) -> None:
        """Update typed AF/AI endpoints and scalar fields on an AEContentLink."""
        nodes = self.content_records
        if index < 0 or index >= len(nodes):
            raise IndexError(f"ConceptModel/content index {index} is out of range")
        if all(value is _UNSET for value in (e1, e2, char, power)):
            return
        node = nodes[index]
        if node.tag != "AElement" or node.get("type") != "4" or any(node.get(key) is None for key in ("e1", "e2", "char", "power")):
            raise ProjectFormatError("selected ConceptModel/content record is opaque or not AEContentLink type 4")
        prepared: dict[str, str] = {}
        if e1 is not _UNSET:
            prepared["e1"] = self._endpoint(e1, "e1 (AFElement action)", self._action_ids(), allow_null=False)
        if e2 is not _UNSET:
            prepared["e2"] = self._endpoint(e2, "e2 (AIElement category)", self._category_ids(), allow_null=False)
        if char is not _UNSET:
            try:
                value = int(char) if char is not None else 0
            except (TypeError, ValueError) as exc:
                raise ValueError("char must be an integer") from exc
            if not -128 <= value <= 127:
                raise ValueError("char must fit signed 8-bit range (-128..127)")
            prepared["char"] = str(value)
        if power is not _UNSET:
            try:
                value = int(power) if power is not None else 0
            except (TypeError, ValueError) as exc:
                raise ValueError("power must be an integer") from exc
            if not -(2**31) <= value <= 2**31 - 1:
                raise ValueError("power must fit signed 32-bit range")
            prepared["power"] = str(value)
        node.attrib.update(prepared)

    def validate(self) -> list[str]:
        issues: list[str] = []
        spz = self.spz_node
        elements = self.elements
        ids = [node.get("id", "") for node in elements]
        if any(not ident for ident in ids):
            issues.append("one or more spz/AElement nodes have no id")
        if len(ids) != len(set(ids)):
            issues.append("duplicate spz AElement IDs")
        for node in elements:
            for key in NUMERIC_FIELDS:
                try:
                    value = _int_attr(node, key)
                    if key == "symbol" and not 0 <= value <= 65535:
                        issues.append(f"spz AElement {node.get('id')} symbol is outside uint16 range")
                except ProjectFormatError as exc:
                    issues.append(str(exc))
            if not node.get("name", "").strip():
                issues.append(f"spz AElement {node.get('id')} has empty name")
        if spz is not None:
            try:
                high = _int_attr(spz, "last_id")
                numeric = [int(ident) for ident in ids if ident.isdigit()]
                if numeric and high < max(numeric):
                    issues.append(f"spz@last_id={high} is below max AElement ID {max(numeric)}")
            except ProjectFormatError as exc:
                issues.append(str(exc))

        # AIEBinaryLink endpoint pointers are resolved through the current
        # DynamicStructure AIElement namespace (ConceptModel/spz/elemets).
        spz_ids = self._spz_element_ids()
        for index, node in enumerate(self.links):
            typed_record = node.tag == "AElement"
            for key in ("e1", "e2", "e3"):
                value = self._validate_optional_int(node, key, f"spz/links[{index}]@{key}", issues)
                if typed_record and value not in (None, 0) and value not in spz_ids:
                    issues.append(f"spz/links[{index}]@{key} references missing spz AIElement {value}")
            if typed_record:
                for key in NUMERIC_FIELDS:
                    # Some older/native files omit scalar defaults on AIEBinaryLink;
                    # preserve that sparse representation instead of rejecting it.
                    if node.get(key) is None:
                        continue
                    try:
                        value = _int_attr(node, key)
                        if key == "symbol" and not 0 <= value <= 65535:
                            issues.append(f"spz/links[{index}]@symbol is outside uint16 range")
                        elif key != "symbol" and not -(2**31) <= value <= 2**31 - 1:
                            issues.append(f"spz/links[{index}]@{key} is outside signed 32-bit range")
                    except ProjectFormatError as exc:
                        issues.append(f"spz/links[{index}]: {exc}")

        # AEContentLink reader resolves e1 through DynamicStructure(0) as an
        # AFElement (primaryModel/spd/actions), and e2 through ConceptStructure
        # as an AIElement (ConceptModel/cs/elemets). Unknown direct children are
        # retained as opaque vendor records; known AElement records get strict checks.
        action_ids = self._action_ids()
        category_ids = self._category_ids()
        for index, node in enumerate(self.content_records):
            values: dict[str, int | None] = {}
            for key in ("e1", "e2", "char", "power", "type"):
                values[key] = self._validate_optional_int(
                    node, key, f"ConceptModel/content[{index}]@{key}", issues
                )
            if node.tag == "AElement":
                for key, expected in (("e1", action_ids), ("e2", category_ids)):
                    value = values[key]
                    if value is None or value == 0:
                        issues.append(f"ConceptModel/content[{index}] requires nonzero {key} endpoint")
                    elif value not in expected:
                        domain = "AFElement action" if key == "e1" else "AIElement category"
                        issues.append(f"ConceptModel/content[{index}]@{key} references missing {domain} {value}")
            char_value, power_value = values["char"], values["power"]
            if char_value is not None and not -128 <= char_value <= 127:
                issues.append(f"ConceptModel/content[{index}]@char is outside signed 8-bit range")
            if power_value is not None and not -(2**31) <= power_value <= 2**31 - 1:
                issues.append(f"ConceptModel/content[{index}]@power is outside signed 32-bit range")
            type_value = values["type"]
            if node.tag == "AElement" and type_value is not None and type_value != 4:
                issues.append(f"ConceptModel/content[{index}]@type is {type_value}; expected AEContentLink type 4")
        return issues

    @staticmethod
    def _validate_optional_int(
        node: ET.Element, key: str, label: str, issues: list[str]
    ) -> int | None:
        raw = node.get(key)
        if raw is None:
            return None
        try:
            value = int(raw, 10)
        except (TypeError, ValueError):
            issues.append(f"{label} must be an integer, got {raw!r}")
            return None
        if not -(2**31) <= value <= 2**31 - 1:
            issues.append(f"{label} is outside signed 32-bit range")
            return None
        return value

    def _next_id(self, spz: ET.Element, records: Iterable[ET.Element]) -> str:
        current = _int_attr(spz, "last_id")
        numeric = [int(n.get("id", "")) for n in records if n.get("id", "").isdigit()]
        if numeric and current < max(numeric):
            raise ProjectFormatError(
                f"spz@last_id={current} is below max current ID {max(numeric)}; refusing ID reuse"
            )
        ident = str(current + 1)
        spz.set("last_id", ident)
        return ident

    def add_element(
        self, name: str, *, type: int = 0, status: int = 0,
        formalization: int = 0, level: int = 1, number: int | None = None,
        symbol: int = 99, attributes: Mapping[str, str | int] | None = None,
    ) -> str:
        if not name.strip():
            raise ValueError("AElement name must not be empty")
        values = {
            "type": int(type), "status": int(status),
            "formalization": int(formalization), "level": int(level),
            "symbol": int(symbol),
        }
        if not 0 <= values["symbol"] <= 65535:
            raise ValueError("symbol must fit the original uint16 field")
        if number is not None:
            values["number"] = int(number)
        extras = {str(k): str(v) for k, v in (attributes or {}).items()}
        reserved = {"id", "name", *SCALAR_FIELDS}
        if reserved.intersection(extras):
            raise ValueError(f"reserved AElement attributes: {sorted(reserved.intersection(extras))}")
        spz = self.ensure_spz()
        container = self._elements_container(create=True)
        ident = self._next_id(spz, list(container.findall("AElement")))
        record_number = values.get("number", int(ident))
        attrs = {
            "id": ident, "name": name,
            "type": str(values["type"]), "status": str(values["status"]),
            "formalization": str(values["formalization"]),
            "level": str(values["level"]), "number": str(record_number),
            "symbol": str(values["symbol"]), **extras,
        }
        ET.SubElement(container, "AElement", attrs)
        return ident

    def update_element(self, ident: str | int, **changes: str | int) -> None:
        unsupported = set(changes) - SCALAR_FIELDS
        if unsupported:
            raise ValueError(f"unsupported AElement fields: {sorted(unsupported)}")
        node = self.element(ident)
        prepared: dict[str, str] = {}
        for key, raw in changes.items():
            if key == "name":
                value = str(raw)
                if not value.strip():
                    raise ValueError("AElement name must not be empty")
            else:
                value = str(int(raw))
                if key == "symbol" and not 0 <= int(value) <= 65535:
                    raise ValueError("symbol must fit the original uint16 field")
            prepared[key] = value
        # Mutate only after every proposed field has passed validation.
        node.attrib.update(prepared)

    def delete_element(self, ident: str | int, *, cascade_links: bool = False) -> None:
        node = self.element(ident)
        target = str(ident)
        link_nodes = self.links
        opaque_links = [link for link in link_nodes if link.tag != "AElement" or any(link.get(key) is None for key in ("e1", "e2", "e3"))]
        if opaque_links:
            raise ProjectFormatError(
                "spz/links contains opaque records; element deletion is blocked until their endpoint references are decoded"
            )
        touching = [link for link in link_nodes if target in {link.get("e1"), link.get("e2"), link.get("e3")}]
        if touching and not cascade_links:
            raise ProjectFormatError(
                f"spz AElement {target} is referenced by {len(touching)} spz/links records; pass cascade_links=True"
            )
        if list(node):
            raise ProjectFormatError(
                "AElement has opaque child records; deletion is blocked to avoid orphaning nested data"
            )
        if cascade_links:
            container_links = self.links_node
            if container_links is not None:
                for link in touching:
                    container_links.remove(link)
        container = self._elements_container()
        container.remove(node)
        # last_id is a high-water mark and intentionally is not decremented.
