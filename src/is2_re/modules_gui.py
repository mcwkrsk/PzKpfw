"""Tk windows for modules and program updates.

Network and pip work run in a worker thread; results come back to the Tk
thread through a queue polled with after(), so Tk is only touched from its
own thread.
"""
from __future__ import annotations

import queue
import threading
import tkinter as tk
import webbrowser
from tkinter import filedialog, messagebox, ttk

from . import __version__
from . import installation, modules
from .i18n import tr
from .ui_theme import apply_theme

POLL_MS = 100


class BackgroundTask:
    """Run work(report, cancelled) in a thread; deliver progress and result on the Tk thread."""

    def __init__(self, widget, work, on_done, on_progress=None):
        self.widget = widget
        self._queue = queue.Queue()
        self._cancel = threading.Event()
        self._on_done, self._on_progress = on_done, on_progress

        def run():
            try:
                result = work(lambda *values: self._queue.put(("progress", values)), self._cancel.is_set)
                self._queue.put(("done", (result, None)))
            except Exception as exc:  # shown to the user by on_done
                self._queue.put(("done", (None, exc)))
        threading.Thread(target=run, name="pzkpfw-background", daemon=True).start()
        # First poll is scheduled, never immediate: callers store the task
        # before any result can arrive.
        self.widget.after(POLL_MS, self._poll)

    def cancel(self):
        self._cancel.set()

    def _poll(self):
        try:
            alive = self.widget.winfo_exists()
        except tk.TclError:
            alive = False
        if not alive:
            self._cancel.set()
            return
        try:
            while True:
                kind, values = self._queue.get_nowait()
                if kind == "progress":
                    if self._on_progress is not None:
                        self._on_progress(*values)
                else:
                    self._on_done(*values)
                    return
        except queue.Empty:
            pass
        self.widget.after(POLL_MS, self._poll)


def _percent(done, total):
    return int(done * 100 / total) if total else 0


# ---- program updates ----------------------------------------------------------

class UpdateController:
    """Check for a newer release, download its installer and hand over to it."""

    def __init__(self, app):
        self.app = app
        self._busy = False

    def check(self, *, manual: bool):
        if self._busy:
            return
        if manual and not installation.is_installed_copy():
            if messagebox.askyesno(tr("Обновления"), tr("Эта копия запущена не из установщика. Открыть страницу релизов?"), parent=self.app):
                webbrowser.open(installation.RELEASES_PAGE)
            return
        self._busy = True
        if manual:
            self.app.status.set(tr("Проверка обновлений…"))
        BackgroundTask(self.app, lambda _report, _cancelled: installation.fetch_latest_release(),
                       lambda release, error: self._checked(release, error, manual))

    def _checked(self, release, error, manual):
        self._busy = False
        if error is not None:
            if manual:
                messagebox.showerror(tr("Обновления"), tr("Не удалось проверить обновления: {error}").format(error=error), parent=self.app)
                self.app.status.set("")
            return
        if not release.newer:
            if manual:
                messagebox.showinfo(tr("Обновления"), tr("Установлена последняя версия: {version}.").format(version=__version__), parent=self.app)
                self.app.status.set("")
            return
        if not manual and installation.load_update_settings().get("skipped") == release.version:
            return
        self._offer(release)

    def _offer(self, release):
        window = tk.Toplevel(self.app)
        window.title(tr("Обновления"))
        window.transient(self.app)
        window.resizable(False, False)
        body = ttk.Frame(window, padding=18)
        body.pack(fill="both", expand=True)
        ttk.Label(body, text=tr("Доступна новая версия PzKpfw {version}. Скачать и установить сейчас?").format(version=release.version),
                  wraplength=420, justify="left").pack(anchor="w")
        if release.notes.strip():
            notes = tk.Text(body, height=8, width=60, wrap="word")
            notes.insert("1.0", release.notes.strip())
            notes.configure(state="disabled")
            notes.pack(fill="both", expand=True, pady=(10, 0))
        progress = ttk.Progressbar(body, length=420, mode="determinate", maximum=100)
        status = tk.StringVar()
        ttk.Label(body, textvariable=status, style="Muted.TLabel").pack(anchor="w", pady=(10, 0))
        buttons = ttk.Frame(body)
        buttons.pack(fill="x", pady=(12, 0))
        task = {}

        def skip():
            installation.save_update_settings(skipped=release.version)
            window.destroy()

        def close():
            if task.get("job") is not None:
                task["job"].cancel()
            window.destroy()

        def done(path, error):
            task["job"] = None
            if error is not None:
                status.set("")
                progress.pack_forget()
                install.state(["!disabled"])
                if str(error) != "cancelled":
                    messagebox.showerror(tr("Обновления"), tr("Не удалось установить обновление: {error}").format(error=error), parent=window)
                return
            messagebox.showinfo(tr("Обновления"), tr("Обновление скачано. PzKpfw закроется, установит новую версию и запустится снова."), parent=window)
            self.app.hand_over_to_installer(path)

        def start():
            if not self.app.confirm_close_for_update():
                return
            install.state(["disabled"])
            progress.pack(anchor="w", pady=(6, 0))
            task["job"] = BackgroundTask(
                window,
                lambda report, cancelled: installation.download_installer(release, report, cancelled),
                done,
                lambda done_bytes, total: (progress.configure(value=_percent(done_bytes, total)),
                                           status.set(tr("Скачивание обновления… {percent}%").format(percent=_percent(done_bytes, total)))))

        install = ttk.Button(buttons, text=tr("Установить"), command=start, style="Primary.TButton")
        install.pack(side="right")
        ttk.Button(buttons, text=tr("Позже"), command=close).pack(side="right", padx=6)
        ttk.Button(buttons, text=tr("Пропустить эту версию"), command=skip).pack(side="left")
        window.protocol("WM_DELETE_WINDOW", close)
        window.bind("<Escape>", lambda _e: close())
        apply_theme(self.app, self.app.theme_name.get())


# ---- modules window -------------------------------------------------------------

class ModulesDialog(tk.Toplevel):
    def __init__(self, app):
        super().__init__(app)
        self.app = app
        self.title(tr("Модули PzKpfw"))
        self.geometry("820x520")
        self.transient(app)
        self.catalogue: list[modules.CatalogueEntry] = []
        self.catalogue_error = ""
        self._task = None
        body = ttk.Frame(self, padding=12)
        body.pack(fill="both", expand=True)
        ttk.Label(body, text=tr("Модули выполняют код на вашем компьютере. Устанавливайте только модули из каталога PzKpfw или от авторов, которым доверяете."),
                  wraplength=780, justify="left", style="Muted.TLabel").pack(anchor="w", pady=(0, 8))
        columns = ("name", "version", "state")
        self.tree = ttk.Treeview(body, columns=columns, show="headings", selectmode="browse")
        for column, label, width in (("name", tr("Название"), 420), ("version", tr("Версия"), 120), ("state", tr("Состояние"), 220)):
            self.tree.heading(column, text=label)
            self.tree.column(column, width=width, anchor="w")
        self.tree.pack(fill="both", expand=True)
        self.tree.bind("<<TreeviewSelect>>", lambda _e: self._update_buttons())
        self.description = tk.StringVar()
        ttk.Label(body, textvariable=self.description, wraplength=780, justify="left").pack(anchor="w", pady=(8, 0))
        self.status = tk.StringVar()
        ttk.Label(body, textvariable=self.status, style="Muted.TLabel").pack(anchor="w", pady=(4, 0))
        self.progress = ttk.Progressbar(body, mode="determinate", maximum=100)
        bar = ttk.Frame(body)
        bar.pack(fill="x", pady=(10, 0))
        self.install_button = ttk.Button(bar, text=tr("Установить"), command=self._install)
        self.remove_button = ttk.Button(bar, text=tr("Удалить"), command=self._remove)
        self.toggle_button = ttk.Button(bar, text=tr("Выключить"), command=self._toggle)
        for button in (self.install_button, self.remove_button, self.toggle_button):
            button.pack(side="left", padx=(0, 6))
        ttk.Button(bar, text=tr("Закрыть"), command=self.destroy).pack(side="right")
        ttk.Button(bar, text=tr("Обновить список"), command=self._load_catalogue).pack(side="right", padx=6)
        ttk.Button(bar, text=tr("Установить из файла…"), command=self._install_file).pack(side="right")
        self.bind("<Escape>", lambda _e: self.destroy())
        apply_theme(app, app.theme_name.get())
        self._fill()
        self._load_catalogue()

    # rows: installed modules first, then catalogue entries not installed
    def _rows(self):
        installed = {m.manifest.id: m for m in modules.installed_modules()}
        loaded = {m.manifest.id: m for m in self.app.loaded_modules}
        updates = modules.available_updates(list(installed.values()), self.catalogue)
        rows = []
        for ident, module in installed.items():
            runtime = loaded.get(ident, module)
            if runtime.error or module.error:
                state = tr("Ошибка")
            elif ident in updates:
                state = tr("Доступна версия {version}").format(version=updates[ident].manifest.version)
            elif module.enabled:
                state = tr("Включён")
            else:
                state = tr("Выключен")
            rows.append((ident, module.manifest.name, module.manifest.version, state, module, updates.get(ident)))
        for entry in self.catalogue:
            if entry.manifest.id not in installed:
                state = "" if entry.manifest.compatible else tr("Нужна версия PzKpfw {version}").format(version=entry.manifest.min_app_version)
                rows.append((entry.manifest.id, entry.manifest.name, entry.manifest.version, state, None, entry))
        return rows

    def _fill(self):
        selected = self.tree.selection()
        self.tree.delete(*self.tree.get_children())
        self._row_data = {}
        for ident, name, version, state, module, entry in self._rows():
            self.tree.insert("", "end", iid=ident, values=(name, version, state))
            self._row_data[ident] = (module, entry)
        if selected and self.tree.exists(selected[0]):
            self.tree.selection_set(selected[0])
        if not self._row_data:
            self.description.set(tr("Нет установленных модулей"))
        self._update_buttons()

    def _selected(self):
        selection = self.tree.selection()
        return (selection[0], *self._row_data[selection[0]]) if selection and selection[0] in self._row_data else (None, None, None)

    def _update_buttons(self):
        ident, module, entry = self._selected()
        busy = self._task is not None
        can_install = entry is not None and entry.manifest.compatible and not busy
        self.install_button.configure(text=tr("Обновить") if module is not None else tr("Установить"))
        self.install_button.state(["!disabled"] if can_install else ["disabled"])
        self.remove_button.state(["!disabled"] if module is not None and not busy else ["disabled"])
        self.toggle_button.state(["!disabled"] if module is not None and not module.error and not busy else ["disabled"])
        if module is not None:
            self.toggle_button.configure(text=tr("Выключить") if module.enabled else tr("Включить"))
        if ident is not None:
            manifest = (module or entry).manifest
            loaded = next((m for m in self.app.loaded_modules if m.manifest.id == ident), None)
            error = (module.error if module is not None else "") or (loaded.error if loaded is not None else "")
            text = manifest.description + (f"\n{tr('Автор')}: {manifest.author}" if manifest.author else "")
            self.description.set(text + (f"\n{tr('Ошибка модуля')}: {error}" if error else ""))

    def _busy(self, text):
        self.status.set(text)
        self.progress.configure(value=0)
        self.progress.pack(fill="x", pady=(4, 0))
        self._update_buttons()

    def _idle(self, text=""):
        self._task = None
        self.status.set(text)
        self.progress.pack_forget()
        self._update_buttons()

    def _load_catalogue(self):
        if self._task is not None:
            return
        self._busy(tr("Загрузка списка модулей…"))

        def done(result, error):
            if error is None:
                self.catalogue = result
                self._idle()
            else:
                self._idle(tr("Список модулей не загружен: {error}").format(error=error))
            self._fill()
        self._task = BackgroundTask(self, lambda _r, _c: modules.fetch_catalogue(), done)
        self._update_buttons()

    def _after_change(self, text):
        self._idle(text + " " + tr("Изменения вступят в силу после перезапуска PzKpfw."))
        self._fill()

    def _install(self):
        ident, module, entry = self._selected()
        if entry is None or self._task is not None:
            return
        self._busy(tr("Установка модуля…"))

        def done(manifest, error):
            if error is not None:
                self._idle()
                messagebox.showerror(tr("Модули PzKpfw"), str(error), parent=self)
                return
            self._after_change(tr("Модуль «{name}» установлен.").format(name=manifest.name))
        self._task = BackgroundTask(self, lambda report, cancelled: modules.install_from_catalogue(entry, progress=report, cancelled=cancelled),
                                    done, lambda d, t: self.progress.configure(value=_percent(d, t)))
        self._update_buttons()

    def _install_file(self):
        if self._task is not None:
            return
        path = filedialog.askopenfilename(parent=self, title=tr("Установить из файла…"), filetypes=[(tr("Модуль PzKpfw"), "*.zip")])
        if not path:
            return
        if not messagebox.askyesno(tr("Модули PzKpfw"), tr("Файл не из каталога: его подлинность не проверена. Установить?"), parent=self, icon="warning"):
            return
        self._busy(tr("Установка модуля…"))

        def done(manifest, error):
            if error is not None:
                self._idle()
                messagebox.showerror(tr("Модули PzKpfw"), str(error), parent=self)
                return
            self._after_change(tr("Модуль «{name}» установлен.").format(name=manifest.name))
        self._task = BackgroundTask(self, lambda _r, _c: modules.install_archive(path), done)
        self._update_buttons()

    def _remove(self):
        ident, module, _entry = self._selected()
        if module is None or self._task is not None:
            return
        if not messagebox.askyesno(tr("Модули PzKpfw"), tr("Удалить модуль «{name}»?").format(name=module.manifest.name), parent=self):
            return
        try:
            modules.uninstall(ident)
        except (OSError, modules.ModuleError) as exc:
            messagebox.showerror(tr("Модули PzKpfw"), str(exc), parent=self)
            return
        self._after_change("")

    def _toggle(self):
        ident, module, _entry = self._selected()
        if module is None or module.error:
            return
        try:
            modules.set_enabled(ident, not module.enabled)
        except OSError as exc:
            messagebox.showerror(tr("Модули PzKpfw"), str(exc), parent=self)
            return
        self._after_change("")
