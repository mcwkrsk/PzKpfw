"""Portable per-project editor state stored outside native IS-2 XML.

The sidecar ``<project>.pzkpfw-view.json`` stores only presentation state:
node coordinates/zoom, active notebook page, selections, window geometry and
search/filter text. Schema v1/v2 sidecars are migrated in memory to v3.
"""
from __future__ import annotations

import json
import math
import os
import re
import tempfile
from pathlib import Path
from typing import Mapping

SCHEMA_VERSION = 3
SUPPORTED_FILTERS = {
    "Все", "SCBinaryLink (cs)", "AIEBinaryLink (spz)",
    "AEContentLink (content)", "Parameter → Object",
}
MAX_SIDECAR_BYTES = 4 * 1024 * 1024
MIN_ZOOM = 0.25
MAX_ZOOM = 3.0
MAX_COORDINATE = 1_000_000.0
MAX_SEARCH_LENGTH = 256
_GEOMETRY = re.compile(r"^(\d{2,5})x(\d{2,5})([+-]\d{1,5})([+-]\d{1,5})$")


class ViewStateError(ValueError):
    """A sidecar exists but cannot be safely interpreted."""


def sidecar_path(project_path: str | Path) -> Path:
    path = Path(project_path)
    return path.with_name(path.name + ".pzkpfw-view.json")


def _finite_coordinate(value: object) -> float:
    if isinstance(value, bool):
        raise ValueError("boolean is not a coordinate")
    number = float(value)
    if not math.isfinite(number) or not 0.0 <= number <= MAX_COORDINATE:
        raise ValueError("coordinate must be finite and between 0 and 1,000,000")
    return number


def _default_state() -> dict:
    return {
        "schema_version": SCHEMA_VERSION,
        "zoom": 1.0,
        "positions": {},
        "active_tab": 0,
        "selections": {},
        "window_geometry": None,
        "graph_filter": "Все",
        "graph_search": "",
    }


def normalize_view_state(data: object, *, valid_keys: set[str] | None = None) -> dict:
    if not isinstance(data, dict):
        raise ViewStateError("sidecar root must be a JSON object")
    version = data.get("schema_version")
    if version not in {1, 2, SCHEMA_VERSION}:
        raise ViewStateError(f"unsupported sidecar schema_version: {version!r}")

    zoom = data.get("zoom", 1.0)
    if isinstance(zoom, bool):
        raise ViewStateError("zoom must be numeric")
    try:
        zoom = float(zoom)
    except (TypeError, ValueError) as exc:
        raise ViewStateError("zoom must be numeric") from exc
    if not math.isfinite(zoom) or not MIN_ZOOM <= zoom <= MAX_ZOOM:
        raise ViewStateError(f"zoom must be between {MIN_ZOOM} and {MAX_ZOOM}")

    raw_positions = data.get("positions", {})
    if not isinstance(raw_positions, dict):
        raise ViewStateError("positions must be a JSON object")
    positions: dict[str, list[float]] = {}
    for key, value in raw_positions.items():
        if not isinstance(key, str) or not key or (valid_keys is not None and key not in valid_keys):
            continue
        if not isinstance(value, (list, tuple)) or len(value) != 2:
            continue
        try:
            x, y = (_finite_coordinate(value[0]), _finite_coordinate(value[1]))
        except (TypeError, ValueError, OverflowError):
            continue
        positions[key] = [x, y]

    active_tab = data.get("active_tab", 0)
    if isinstance(active_tab, bool) or not isinstance(active_tab, int) or not 0 <= active_tab <= 32:
        active_tab = 0

    raw_selections = data.get("selections", {})
    if not isinstance(raw_selections, dict):
        raw_selections = {}
    selections: dict[str, str] = {}
    for key, value in raw_selections.items():
        if not isinstance(key, str) or not re.fullmatch(r"[a-z_]{1,32}", key):
            continue
        if not isinstance(value, str) or not value or len(value) > 160:
            continue
        if any(ord(ch) < 32 for ch in value):
            continue
        selections[key] = value

    geometry = data.get("window_geometry")
    if not isinstance(geometry, str) or len(geometry) > 64:
        geometry = None
    else:
        match = _GEOMETRY.fullmatch(geometry)
        if not match:
            geometry = None
        else:
            width, height = int(match.group(1)), int(match.group(2))
            geometry = geometry if 320 <= width <= 12000 and 240 <= height <= 12000 else None

    graph_filter = data.get("graph_filter", "Все")
    if not isinstance(graph_filter, str) or graph_filter not in SUPPORTED_FILTERS:
        graph_filter = "Все"
    graph_search = data.get("graph_search", "")
    if not isinstance(graph_search, str) or len(graph_search) > MAX_SEARCH_LENGTH or any(ord(ch) < 32 and ch not in "\t" for ch in graph_search):
        graph_search = ""

    return {
        "schema_version": SCHEMA_VERSION,
        "zoom": zoom,
        "positions": positions,
        "active_tab": active_tab,
        "selections": selections,
        "window_geometry": geometry,
        "graph_filter": graph_filter,
        "graph_search": graph_search,
    }


def load_view_state(project_path: str | Path, *, valid_keys: set[str] | None = None) -> dict:
    target = sidecar_path(project_path)
    if not target.exists():
        return _default_state()
    try:
        size = target.stat().st_size
        if size > MAX_SIDECAR_BYTES:
            raise ViewStateError(f"sidecar exceeds size limit ({size} bytes)")
        data = json.loads(target.read_text(encoding="utf-8"))
        return normalize_view_state(data, valid_keys=valid_keys)
    except ViewStateError:
        raise
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise ViewStateError(f"cannot read editor-state sidecar {target}: {exc}") from exc


def save_view_state(
    project_path: str | Path,
    *,
    positions: Mapping[str, tuple[float, float] | list[float]],
    zoom: float = 1.0,
    active_tab: int = 0,
    selections: Mapping[str, str] | None = None,
    window_geometry: str | None = None,
    graph_filter: str = "Все",
    graph_search: str = "",
) -> Path:
    target = sidecar_path(project_path)
    payload = normalize_view_state({
        "schema_version": SCHEMA_VERSION,
        "zoom": zoom,
        "positions": dict(positions),
        "active_tab": active_tab,
        "selections": dict(selections or {}),
        "window_geometry": window_geometry,
        "graph_filter": graph_filter,
        "graph_search": graph_search,
    })
    encoded = (json.dumps(payload, ensure_ascii=False, indent=2, sort_keys=True) + "\n").encode("utf-8")
    target.parent.mkdir(parents=True, exist_ok=True)
    fd, temporary = tempfile.mkstemp(prefix=f".{target.name}.", suffix=".tmp", dir=str(target.parent))
    try:
        with os.fdopen(fd, "wb") as stream:
            stream.write(encoded)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(temporary, target)
    except Exception:
        try:
            os.unlink(temporary)
        except FileNotFoundError:
            pass
        raise
    return target
