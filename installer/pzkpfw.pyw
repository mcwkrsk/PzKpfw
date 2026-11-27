"""PzKpfw launcher for the installed copy.

The installer starts it as  runtime\\pythonw.exe pzkpfw.pyw [project.is2]
pythonw has no console, so a startup error is written to a log file and shown
in a message box instead of disappearing silently.
"""
import os
import sys
import traceback
from pathlib import Path

HERE = Path(__file__).resolve().parent


def _log_dir() -> Path:
    base = os.environ.get("LOCALAPPDATA") or str(Path.home() / "AppData" / "Local")
    return Path(base) / "PzKpfw" / "logs"


def main() -> int:
    os.environ["PZKPFW_INSTALL_DIR"] = str(HERE)
    sys.path.insert(0, str(HERE / "app"))
    if sys.platform == "win32":
        try:
            import ctypes
            # Same ID as the Start-menu shortcut: one taskbar button with the PzKpfw icon.
            ctypes.windll.shell32.SetCurrentProcessExplicitAppUserModelID("PzKpfw.Editor")
        except Exception:
            pass
    from is2_re.gui import main as run
    return run(sys.argv[1:])


if __name__ == "__main__":
    try:
        code = main()
    except SystemExit:
        raise
    except BaseException:
        details = traceback.format_exc()
        log = _log_dir() / "last-error.txt"
        try:
            log.parent.mkdir(parents=True, exist_ok=True)
            log.write_text(details, encoding="utf-8")
        except OSError:
            log = None
        try:
            import tkinter
            from tkinter import messagebox
            root = tkinter.Tk()
            root.withdraw()
            messagebox.showerror("PzKpfw", "PzKpfw не запустился.\n\n" + details.strip().splitlines()[-1]
                                 + (f"\n\nПодробности: {log}" if log else ""))
            root.destroy()
        except Exception:
            pass
        code = 1
    sys.exit(code)
