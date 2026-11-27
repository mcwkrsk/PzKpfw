"""Autosave: a recovery copy after a few edits, optionally the project file itself.

How it is triggered (cheap on purpose):
  * every edit only increments a counter and restarts a short idle timer;
  * when the user pauses (IDLE_MS) and there were EDITS_THRESHOLD edits, or the
    oldest unsaved edit is MAX_DELAY_S old, the document is serialized once on
    the Tk thread and written to disk in a worker thread.

The recovery copy lives in the user data folder, never next to the project, and
is deleted as soon as the project is clean (saved, discarded, or closed). A
copy left after a crash is offered for restoring at the next start.
"""
from __future__ import annotations

import json
import os
import queue
import threading
import time
import uuid
from dataclasses import dataclass
from pathlib import Path

from .document import ProjectDocument
from .installation import data_dir

EDITS_THRESHOLD = 5
IDLE_MS = 2000
MAX_DELAY_S = 120
POLL_MS = 100


def recovery_dir() -> Path:
    return data_dir() / "autosave"


def _settings_path() -> Path:
    return data_dir() / "autosave.json"


def load_settings() -> dict:
    try:
        value = json.loads(_settings_path().read_text(encoding="utf-8"))
        return value if isinstance(value, dict) else {}
    except (OSError, ValueError):
        return {}


def save_settings(**changes) -> None:
    data = load_settings()
    data.update(changes)
    try:
        path = _settings_path()
        path.parent.mkdir(parents=True, exist_ok=True)
        atomic_write(path, json.dumps(data, ensure_ascii=False, indent=1).encode("utf-8"))
    except OSError:
        pass


def atomic_write(path: Path, payload: bytes) -> None:
    """Write to a temporary file beside `path`, flush it, then replace `path`."""
    path = Path(path)
    tmp = path.with_name(f".{path.name}.{uuid.uuid4().hex[:8]}.tmp")
    try:
        with open(tmp, "wb") as handle:
            handle.write(payload)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(tmp, path)
    finally:
        try:
            tmp.unlink()
        except OSError:
            pass


def check_payload(payload: bytes) -> None:
    """The bytes must reopen as a project and serialize back identically."""
    if ProjectDocument.from_bytes(payload).to_bytes() != payload:
        raise ValueError("serialization is not stable; autosave skipped")


@dataclass(frozen=True)
class Recovery:
    payload_path: Path
    meta_path: Path
    source: str | None
    title: str
    saved_at: float


class RecoveryStore:
    """One recovery file per running program (session)."""

    def __init__(self, folder: Path | None = None):
        self.folder = Path(folder) if folder is not None else recovery_dir()
        self.session = f"{time.strftime('%Y%m%d-%H%M%S')}-{uuid.uuid4().hex[:8]}"
        self.payload_path = self.folder / f"session-{self.session}.is2"
        self.meta_path = self.folder / f"session-{self.session}.json"
        self.written = False

    def write(self, payload: bytes, source: str | None, title: str) -> None:
        self.folder.mkdir(parents=True, exist_ok=True)
        atomic_write(self.payload_path, payload)
        meta = {"source": source, "title": title, "saved_at": time.time(), "session": self.session}
        atomic_write(self.meta_path, json.dumps(meta, ensure_ascii=False).encode("utf-8"))
        self.written = True

    def discard(self) -> None:
        if not self.written:
            return
        for path in (self.payload_path, self.meta_path):
            try:
                path.unlink()
            except OSError:
                pass
        self.written = False

    def orphans(self) -> list[Recovery]:
        """Copies left by other sessions (a crash or power loss), newest first."""
        result = []
        if not self.folder.is_dir():
            return result
        for meta_path in self.folder.glob("session-*.json"):
            if meta_path == self.meta_path:
                continue
            payload_path = meta_path.with_suffix(".is2")
            try:
                meta = json.loads(meta_path.read_text(encoding="utf-8"))
            except (OSError, ValueError):
                continue
            if not payload_path.is_file() or not isinstance(meta, dict):
                continue
            result.append(Recovery(payload_path, meta_path, meta.get("source") or None,
                                   str(meta.get("title") or ""), float(meta.get("saved_at") or 0)))
        return sorted(result, key=lambda item: item.saved_at, reverse=True)

    @staticmethod
    def remove(recovery: Recovery) -> None:
        for path in (recovery.payload_path, recovery.meta_path):
            try:
                path.unlink()
            except OSError:
                pass


class AutosaveScheduler:
    """Decides WHEN to autosave; the host decides what to write.

    `widget` provides after/after_cancel (the Tk root); `fire()` is called on
    the Tk thread.
    """

    def __init__(self, widget, fire, *, edits=EDITS_THRESHOLD, idle_ms=IDLE_MS, max_delay_s=MAX_DELAY_S, clock=time.monotonic):
        self.widget, self.fire = widget, fire
        self.edits_threshold, self.idle_ms, self.max_delay_s = edits, idle_ms, max_delay_s
        self.clock = clock
        self.edits = 0
        self.first_edit = None
        self._job = None

    def note_edit(self) -> None:
        self.edits += 1
        if self.first_edit is None:
            self.first_edit = self.clock()
        self._schedule(self.idle_ms)

    def reset(self) -> None:
        self._cancel()
        self.edits = 0
        self.first_edit = None

    def _cancel(self):
        if self._job is not None:
            try:
                self.widget.after_cancel(self._job)
            except Exception:
                pass
            self._job = None

    def _schedule(self, delay_ms):
        self._cancel()
        try:
            self._job = self.widget.after(max(1, int(delay_ms)), self._check)
        except Exception:
            self._job = None

    def _check(self):
        self._job = None
        if not self.edits:
            return
        age = self.clock() - self.first_edit
        if self.edits >= self.edits_threshold or age >= self.max_delay_s:
            self.edits = 0
            self.first_edit = None
            self.fire()
        else:
            self._schedule((self.max_delay_s - age) * 1000)


class BackgroundWriter:
    """Runs write jobs one at a time in a worker thread; results come back via after()."""

    def __init__(self, widget):
        self.widget = widget
        self._results = queue.Queue()
        self._busy = False
        self._pending = None
        self._polling = False

    def submit(self, work, done) -> None:
        if self._busy:
            self._pending = (work, done)   # only the newest state matters
            return
        self._start(work, done)

    def _start(self, work, done):
        self._busy = True

        def run():
            try:
                self._results.put((done, work(), None))
            except Exception as exc:
                self._results.put((done, None, exc))
        threading.Thread(target=run, name="pzkpfw-autosave", daemon=True).start()
        if not self._polling:
            self._polling = True
            self.widget.after(POLL_MS, self._poll)

    def _poll(self):
        try:
            done, result, error = self._results.get_nowait()
        except queue.Empty:
            if not self._busy:
                self._polling = False
                return
            try:
                self.widget.after(POLL_MS, self._poll)
            except Exception:
                self._polling = False
            return
        self._polling = False
        self._busy = False
        try:
            done(result, error)
        finally:
            if self._pending is not None:
                work, done = self._pending
                self._pending = None
                self._start(work, done)

    def wait(self, timeout=5.0) -> None:
        """Finish queued writes before the program exits (Tk thread)."""
        end = time.monotonic() + timeout
        while (self._busy or self._pending is not None) and time.monotonic() < end:
            try:
                done, result, error = self._results.get(timeout=0.05)
            except queue.Empty:
                continue
            self._busy = False
            try:
                done(result, error)
            except Exception:
                pass
            if self._pending is not None:
                work, callback = self._pending
                self._pending = None
                self._busy = True
                try:
                    callback(work(), None)
                except Exception as exc:
                    callback(None, exc)
                self._busy = False
