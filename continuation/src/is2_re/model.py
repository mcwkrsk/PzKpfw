"""Read-only semantic projection of the observed IS-2 project XML format.

The original XML tree is retained. This module deliberately does not mutate or
rewrite documents: canonical saving rules are not yet verified against IS-2.
"""
from __future__ import annotations
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any
import hashlib
import xml.etree.ElementTree as ET

class ProjectFormatError(ValueError):
    """Raised when the supplied document is not an observed IS-2 XML project."""

@dataclass(frozen=True)
class Action:
    id: str
    name: str = ""
    type: str | None = None
    formalization: str | None = None
    mark: str = ""
    symbol: str | None = None
    status: str | None = None
    level: str | None = None
    number: str | None = None
    alternatives: tuple[str, ...] = ()
    raw_attributes: dict[str, str] = field(default_factory=dict)

@dataclass(frozen=True)
class Link:
    type: str | None
    afe1: str | None
    afe2: str | None
    afe3: str | None
    raw_attributes: dict[str, str] = field(default_factory=dict)

@dataclass
class Project:
    path: str
    sha256: str
    name: str
    info: str
    actions: list[Action]
    links: list[Link]
    parameters: list[dict[str, str]]
    objects: list[dict[str, str]]
    concept_elements: list[dict[str, str]]
    module_params: list[dict[str, Any]]
    root: ET.Element = field(repr=False)
    warnings: list[str] = field(default_factory=list)

    def summary(self) -> dict[str, Any]:
        from collections import Counter
        return {
            "file": Path(self.path).name,
            "sha256": self.sha256,
            "project_name": self.name,
            "project_info": self.info,
            "actions": len(self.actions),
            "action_types": dict(sorted(Counter(a.type for a in self.actions).items(), key=lambda x: str(x[0]))),
            "formalization_values": dict(sorted(Counter(a.formalization for a in self.actions).items(), key=lambda x: str(x[0]))),
            "status_values": dict(sorted(Counter(a.status for a in self.actions).items(), key=lambda x: str(x[0]))),
            "links": len(self.links),
            "link_types": dict(sorted(Counter(link.type for link in self.links).items(), key=lambda x: str(x[0]))),
            "parameters": len(self.parameters),
            "objects": len(self.objects),
            "concept_elements": len(self.concept_elements),
            "module_parameters": self.module_params,
            "warnings": self.warnings,
        }

    def validate(self) -> list[str]:
        issues: list[str] = []
        ids = [a.id for a in self.actions]
        seen: set[str] = set()
        for ident in ids:
            if ident in seen:
                issues.append(f"duplicate action id: {ident}")
            seen.add(ident)
        idset = set(ids)
        for idx, link in enumerate(self.links):
            for attr in ("afe1", "afe2", "afe3"):
                ref = getattr(link, attr)
                if ref is not None and ref not in ("", "0") and ref not in idset:
                    issues.append(f"link[{idx}] {attr} references missing action id {ref}")
        if not self.actions:
            issues.append("primaryModel.spd.actions contains no pd elements")
        return issues


def load_project(path: str | Path) -> Project:
    path = Path(path)
    raw = path.read_bytes()
    try:
        root = ET.fromstring(raw)
    except ET.ParseError as e:
        raise ProjectFormatError(f"XML parse error in {path}: {e}") from e
    if root.tag != "project":
        raise ProjectFormatError(f"expected root <project>, got <{root.tag}>")
    models = root.find("models")
    if models is None:
        raise ProjectFormatError("missing <models>")
    primary = models.find("primaryModel")
    if primary is None:
        raise ProjectFormatError("missing <models>/<primaryModel>")
    spd = primary.find("spd")
    if spd is None:
        raise ProjectFormatError("missing <primaryModel>/<spd>")
    actions_node = spd.find("actions")
    links_node = spd.find("links")
    actions: list[Action] = []
    if actions_node is not None:
        for node in actions_node.findall("pd"):
            if "id" not in node.attrib:
                raise ProjectFormatError("<pd> without required id attribute")
            alternatives = tuple(alt.get("text", "") for alt in node.findall("alts"))
            actions.append(Action(
                id=node.get("id", ""), name=node.get("name", ""),
                type=node.get("type"), formalization=node.get("formalization"),
                mark=node.get("mark", ""), symbol=node.get("symbol"),
                status=node.get("status"), level=node.get("level"),
                number=node.get("number"), alternatives=alternatives,
                raw_attributes=dict(node.attrib)))
    links: list[Link] = []
    if links_node is not None:
        for node in links_node.findall("link"):
            links.append(Link(node.get("type"), node.get("afe1"), node.get("afe2"), node.get("afe3"), dict(node.attrib)))
    params_node = primary.find("params")
    params = [dict(n.attrib) for n in params_node.findall("param")] if params_node is not None else []
    objs_node = primary.find("objects")
    objects = [dict(n.attrib) for n in list(objs_node)] if objs_node is not None else []
    # Preserve original spelling: the observed tag is literally `elemets`.
    concept = models.find("ConceptModel")
    c_elements: list[dict[str, str]] = []
    if concept is not None:
        for parent_path in ("cs/elemets", "spz/elemets"):
            node = concept.find(parent_path)
            if node is not None:
                c_elements.extend(dict(el.attrib) for el in list(node))
    module_params: list[dict[str, Any]] = []
    mp = root.find("ModuleParams")
    if mp is not None:
        for module in mp.findall("Module"):
            module_params.append({"name": module.get("name", ""), "params": [dict(p.attrib) for p in module.findall("param")]})
    proj = Project(
        path=str(path), sha256=hashlib.sha256(raw).hexdigest(),
        name=root.get("name", ""), info=root.get("info", ""),
        actions=actions, links=links, parameters=params, objects=objects,
        concept_elements=c_elements, module_params=module_params, root=root)
    proj.warnings.extend(proj.validate())
    return proj
