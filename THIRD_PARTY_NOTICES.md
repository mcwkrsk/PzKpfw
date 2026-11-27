# Third-party components

The source application uses Python's standard library, including Tkinter and
Tcl/Tk supplied by the Python or operating-system distributor.

The Windows installer is built with Inno Setup. At install time it downloads the
PzKpfw runtime: CPython 3.12 from python-build-standalone (PSF license, with
Tcl/Tk and other bundled libraries under their own licenses), pip, python-docx
(MIT), lxml (BSD) and Pillow (MIT-CMU / HPND). Check the versions and licenses of
the actual runtime archive before publishing it.

DOCX report export uses python-docx and Pillow; when running from sources they
are installed separately (requirements.txt).

No original IS-2 binaries or proprietary runtime are included.
