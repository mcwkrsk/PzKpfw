"""Conservative Git status and explicit local checkpoint support."""
from __future__ import annotations

from dataclasses import dataclass
import json
from pathlib import Path
import re
import subprocess
from typing import Iterable


class GitSupportError(ValueError):
    """Raised when a Git inspection or checkpoint cannot be completed safely."""


@dataclass(frozen=True)
class GitChange:
    path: str
    index_status: str
    worktree_status: str
    excluded: bool
    exclusion_reason: str = ""


@dataclass(frozen=True)
class GitStatus:
    root: Path
    branch: str
    upstream: str | None
    ahead: int
    behind: int
    changes: tuple[GitChange, ...]

    @property
    def dirty(self) -> bool:
        return bool(self.changes)

    @property
    def has_staged_changes(self) -> bool:
        return any(change.index_status not in {" ", "?"} for change in self.changes)

    @property
    def checkpoint_paths(self) -> tuple[str, ...]:
        return tuple(change.path for change in self.changes if not change.excluded)


@dataclass(frozen=True)
class GitCheckpoint:
    root: Path
    commit: str
    message: str
    paths: tuple[str, ...]


def inspect_git_status(path: str | Path) -> GitStatus:
    start = Path(path).resolve()
    cwd = start if start.is_dir() else start.parent
    root_text = _git(cwd, "rev-parse", "--show-toplevel").strip()
    if not root_text:
        raise GitSupportError("Git repository root was not reported")
    root = Path(root_text).resolve()
    output = _git(
        root,
        "-c", "core.quotepath=false",
        "status", "--porcelain=v1", "--branch", "--untracked-files=all",
    )
    lines = output.splitlines()
    branch, upstream, ahead, behind = _parse_branch(lines[0] if lines and lines[0].startswith("## ") else "")
    changes: list[GitChange] = []
    for line in lines[1:] if lines and lines[0].startswith("## ") else lines:
        if len(line) < 4:
            continue
        index_status, worktree_status = line[0], line[1]
        raw_path = line[3:]
        if " -> " in raw_path:
            raw_path = raw_path.split(" -> ", 1)[1]
        path_value = _unquote_git_path(raw_path)
        reason = sensitive_path_reason(path_value)
        changes.append(GitChange(
            path=path_value,
            index_status=index_status,
            worktree_status=worktree_status,
            excluded=bool(reason),
            exclusion_reason=reason,
        ))
    return GitStatus(root, branch, upstream, ahead, behind, tuple(changes))


def sensitive_path_reason(path: str) -> str:
    normalized = path.replace("\\", "/")
    while normalized.startswith("./"):
        normalized = normalized[2:]
    normalized = normalized.lstrip("/")
    parts = tuple(part.casefold() for part in normalized.split("/") if part)
    name = parts[-1] if parts else ""
    if ".git" in parts:
        return "служебные данные Git"
    if any(part in {"tmp", "temp", ".pzkpfw-backups", "__pycache__", ".pytest_cache"} for part in parts):
        return "временные или резервные данные"
    if name == ".env" or name.startswith(".env."):
        return "файл окружения"
    if name.endswith((".pem", ".key", ".p12", ".pfx")):
        return "ключ или сертификат"
    if name in {"credentials", "credentials.json", "secrets.json", "token.json"}:
        return "учётные данные"
    if name.endswith((".log", ".is2.bak", ".is2.backup")):
        return "журнал или резервная копия"
    return ""


def checkpoint_message(summary: str) -> str:
    clean = " ".join(str(summary).split())
    clean = re.sub(r"[\x00-\x1f\x7f]", "", clean)
    if not clean:
        clean = "изменения проекта"
    return "PzKpfw checkpoint: " + clean[:120]


def create_git_checkpoint(
    repository: str | Path,
    *,
    message: str,
    paths: Iterable[str],
) -> GitCheckpoint:
    status = inspect_git_status(repository)
    if status.has_staged_changes:
        raise GitSupportError(
            "repository already has staged changes; commit or unstage them before creating a checkpoint"
        )
    clean_message = checkpoint_message(message)
    requested = tuple(dict.fromkeys(str(path).replace("\\", "/") for path in paths))
    if not requested:
        raise GitSupportError("select at least one changed file for the checkpoint")
    changed = {item.path: item for item in status.changes}
    literal_pathspecs: list[str] = []
    for relative in requested:
        item = changed.get(relative)
        if item is None:
            raise GitSupportError(f"checkpoint path is not a reported change: {relative}")
        if item.excluded:
            raise GitSupportError(f"checkpoint path is excluded ({item.exclusion_reason}): {relative}")
        candidate = (status.root / relative).resolve(strict=False)
        try:
            candidate.relative_to(status.root)
        except ValueError as exc:
            raise GitSupportError(f"checkpoint path escapes the repository: {relative}") from exc
        literal_pathspecs.append(":(literal)" + relative)

    try:
        _git(status.root, "add", "--", *literal_pathspecs)
        staged = subprocess.run(
            ["git", "diff", "--cached", "--quiet", "--exit-code"],
            cwd=status.root,
            check=False,
            capture_output=True,
            timeout=30,
        )
        if staged.returncode == 0:
            raise GitSupportError("selected files contain no checkpoint changes")
        if staged.returncode != 1:
            raise GitSupportError("Git could not inspect staged checkpoint changes")
        # Pass the message through UTF-8 stdin instead of a Windows command-line
        # argument.  Some Git for Windows builds convert non-ASCII argv through
        # the active ANSI code page, which corrupts Russian checkpoint labels.
        _git(
            status.root,
            "-c", "i18n.commitEncoding=utf-8",
            "commit", "--file", "-",
            input_text=clean_message + "\n",
        )
    except Exception:
        subprocess.run(
            ["git", "restore", "--staged", "--", *literal_pathspecs],
            cwd=status.root,
            check=False,
            capture_output=True,
            timeout=30,
        )
        raise
    commit = _git(status.root, "rev-parse", "HEAD").strip()
    return GitCheckpoint(status.root, commit, clean_message, requested)


def _git(cwd: Path, *arguments: str, input_text: str | None = None) -> str:
    try:
        completed = subprocess.run(
            ["git", *arguments],
            cwd=cwd,
            check=False,
            capture_output=True,
            input=None if input_text is None else input_text.encode("utf-8"),
            timeout=30,
        )
    except (OSError, subprocess.TimeoutExpired) as exc:
        raise GitSupportError(f"Git command failed: {exc}") from exc
    stdout = completed.stdout.decode("utf-8", errors="replace")
    stderr = completed.stderr.decode("utf-8", errors="replace").strip()
    if completed.returncode != 0:
        raise GitSupportError(stderr or f"Git exited with code {completed.returncode}")
    return stdout


def _parse_branch(line: str) -> tuple[str, str | None, int, int]:
    value = line[3:] if line.startswith("## ") else ""
    metadata = ""
    if " [" in value and value.endswith("]"):
        value, metadata = value[:-1].split(" [", 1)
    if "..." in value:
        branch, upstream = value.split("...", 1)
    else:
        branch, upstream = value, None
    ahead = behind = 0
    for item in metadata.split(", ") if metadata else ():
        if item.startswith("ahead "):
            ahead = int(item[6:])
        elif item.startswith("behind "):
            behind = int(item[7:])
    return branch or "(detached)", upstream, ahead, behind


def _unquote_git_path(value: str) -> str:
    if len(value) >= 2 and value[0] == value[-1] == '"':
        try:
            return json.loads(value)
        except Exception:
            return value[1:-1]
    return value
