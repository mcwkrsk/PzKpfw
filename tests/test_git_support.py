import subprocess
import tempfile
import unittest
from pathlib import Path

from is2_re.git_support import (
    GitSupportError,
    checkpoint_message,
    create_git_checkpoint,
    inspect_git_status,
    sensitive_path_reason,
)


class GitSupportTests(unittest.TestCase):
    def _repository(self):
        parent = Path.cwd() / "tmp" / "test_temp"
        parent.mkdir(parents=True, exist_ok=True)
        temporary = tempfile.TemporaryDirectory(dir=parent)
        root = Path(temporary.name)
        subprocess.run(["git", "init", "-q"], cwd=root, check=True)
        subprocess.run(["git", "config", "user.name", "PzKpfw Tests"], cwd=root, check=True)
        subprocess.run(["git", "config", "user.email", "tests@example.invalid"], cwd=root, check=True)
        (root / "tracked.txt").write_text("before\n", encoding="utf-8")
        subprocess.run(["git", "add", "tracked.txt"], cwd=root, check=True)
        subprocess.run(["git", "commit", "-q", "-m", "initial"], cwd=root, check=True)
        return temporary, root

    def test_status_reports_branch_changes_and_excluded_secrets(self):
        temporary, root = self._repository()
        self.addCleanup(temporary.cleanup)
        (root / "tracked.txt").write_text("after\n", encoding="utf-8")
        (root / "safe.txt").write_text("safe\n", encoding="utf-8")
        (root / ".env").write_text("OPENAI_API_KEY=secret\n", encoding="utf-8")

        status = inspect_git_status(root / "tracked.txt")
        by_path = {item.path: item for item in status.changes}

        self.assertTrue(status.dirty)
        self.assertIn("tracked.txt", by_path)
        self.assertIn("safe.txt", status.checkpoint_paths)
        self.assertTrue(by_path[".env"].excluded)
        self.assertNotIn(".env", status.checkpoint_paths)

    def test_checkpoint_commits_only_explicit_safe_paths(self):
        temporary, root = self._repository()
        self.addCleanup(temporary.cleanup)
        (root / "tracked.txt").write_text("after\n", encoding="utf-8")
        (root / "other.txt").write_text("leave me\n", encoding="utf-8")

        checkpoint = create_git_checkpoint(
            root,
            message="Перед большим изменением",
            paths=["tracked.txt"],
        )

        self.assertEqual(len(checkpoint.commit), 40)
        self.assertTrue(checkpoint.message.startswith("PzKpfw checkpoint:"))
        remaining = inspect_git_status(root)
        self.assertEqual(remaining.checkpoint_paths, ("other.txt",))
        subject = subprocess.run(
            ["git", "log", "-1", "--pretty=%s"],
            cwd=root,
            check=True,
            capture_output=True,
            encoding="utf-8",
            errors="strict",
        ).stdout.strip()
        self.assertEqual(subject, checkpoint.message)

    def test_checkpoint_refuses_existing_staged_changes(self):
        temporary, root = self._repository()
        self.addCleanup(temporary.cleanup)
        (root / "tracked.txt").write_text("staged\n", encoding="utf-8")
        subprocess.run(["git", "add", "tracked.txt"], cwd=root, check=True)
        (root / "other.txt").write_text("other\n", encoding="utf-8")

        with self.assertRaisesRegex(GitSupportError, "already has staged changes"):
            create_git_checkpoint(root, message="checkpoint", paths=["other.txt"])

    def test_sensitive_rules_and_message_are_deterministic(self):
        self.assertTrue(sensitive_path_reason("tmp/result.json"))
        self.assertTrue(sensitive_path_reason("keys/private.pem"))
        self.assertTrue(sensitive_path_reason(".pzkpfw-backups/example.is2.bak"))
        self.assertEqual(sensitive_path_reason("src/is2_re/gui.py"), "")
        self.assertEqual(checkpoint_message("  Проверка   расчета  "), "PzKpfw checkpoint: Проверка расчета")


if __name__ == "__main__":
    unittest.main()

