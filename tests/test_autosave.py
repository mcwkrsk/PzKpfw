"""Autosave timing, recovery files and background writing (no real waiting)."""
import json
import tempfile
import unittest
from pathlib import Path

from is2_re import autosave
from is2_re.coursework import create_course_project


class FakeTk:
    """after()/after_cancel() with a manual clock."""
    def __init__(self):
        self.now = 0.0
        self.jobs = {}
        self._next = 0

    def after(self, ms, callback):
        self._next += 1
        self.jobs[self._next] = (self.now + ms / 1000, callback)
        return self._next

    def after_cancel(self, job):
        self.jobs.pop(job, None)

    def advance(self, seconds):
        end = self.now + seconds
        while True:
            due = [(t, j) for j, (t, _) in self.jobs.items() if t <= end]
            if not due:
                break
            t, job = min(due)
            self.now = t
            _, callback = self.jobs.pop(job)
            callback()
        self.now = end


class SchedulerTests(unittest.TestCase):
    def setUp(self):
        self.tk = FakeTk()
        self.fired = []
        self.s = autosave.AutosaveScheduler(self.tk, lambda: self.fired.append(self.tk.now),
                                            edits=5, idle_ms=2000, max_delay_s=120, clock=lambda: self.tk.now)

    def test_five_edits_then_pause(self):
        for _ in range(5):
            self.s.note_edit()
            self.tk.advance(0.5)          # typing: no save while edits keep coming
        self.assertEqual(self.fired, [])
        self.tk.advance(2)
        self.assertEqual(len(self.fired), 1)
        self.tk.advance(600)
        self.assertEqual(len(self.fired), 1)   # nothing new to save

    def test_few_edits_saved_after_max_delay(self):
        self.s.note_edit()
        self.s.note_edit()
        self.tk.advance(60)
        self.assertEqual(self.fired, [])
        self.tk.advance(61)
        self.assertEqual(len(self.fired), 1)
        self.assertAlmostEqual(self.fired[0], 120, delta=0.01)

    def test_reset_cancels(self):
        for _ in range(7):
            self.s.note_edit()
        self.s.reset()
        self.tk.advance(1000)
        self.assertEqual(self.fired, [])


class RecoveryStoreTests(unittest.TestCase):
    def test_write_discard_and_orphans(self):
        with tempfile.TemporaryDirectory() as folder:
            crashed = autosave.RecoveryStore(Path(folder))
            crashed.write(b"<project/>", r"C:\work\v13.is2", "v13.is2")
            current = autosave.RecoveryStore(Path(folder))
            current.write(b"<project/>", None, "new")
            [orphan] = current.orphans()
            self.assertEqual((orphan.source, orphan.title, orphan.payload_path.read_bytes()),
                             (r"C:\work\v13.is2", "v13.is2", b"<project/>"))
            current.discard()
            self.assertFalse(current.payload_path.exists())
            current.remove(orphan)
            self.assertEqual(sorted(p.name for p in Path(folder).iterdir()), [])

    def test_atomic_write_replaces_and_leaves_no_temp(self):
        with tempfile.TemporaryDirectory() as folder:
            target = Path(folder) / "a.is2"
            autosave.atomic_write(target, b"one")
            autosave.atomic_write(target, b"two")
            self.assertEqual(target.read_bytes(), b"two")
            self.assertEqual([p.name for p in Path(folder).iterdir()], ["a.is2"])

    def test_payload_check(self):
        doc = create_course_project("p", "root")
        autosave.check_payload(doc.to_bytes())
        with self.assertRaises(Exception):
            autosave.check_payload(b"not xml")


class BackgroundWriterTests(unittest.TestCase):
    def test_wait_runs_pending_jobs_in_order(self):
        tk = FakeTk()
        writer = autosave.BackgroundWriter(tk)
        results = []
        writer.submit(lambda: "first", lambda r, e: results.append(r))
        writer.submit(lambda: "second", lambda r, e: results.append(r))
        writer.submit(lambda: "third", lambda r, e: results.append(r))   # replaces "second"
        writer.wait()
        self.assertEqual(results, ["first", "third"])

    def test_errors_reach_the_callback(self):
        tk = FakeTk()
        writer = autosave.BackgroundWriter(tk)
        seen = []
        writer.submit(lambda: 1 / 0, lambda r, e: seen.append(type(e).__name__))
        writer.wait()
        self.assertEqual(seen, ["ZeroDivisionError"])


if __name__ == "__main__":
    unittest.main()
