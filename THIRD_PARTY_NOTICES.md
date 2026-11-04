# Third-party notices and dependency inventory

## Runtime

PzKpfw has no third-party Python runtime dependencies. It uses the Python
standard library, including `tkinter`/Tcl-Tk for the desktop UI. Python and
Tk/Tcl are separately distributed by the relevant platform vendors and are
not bundled in this source archive.

## Build and test tools

- setuptools (build backend; `setuptools>=61`): MIT license.
- pytest (`test` optional extra; `pytest>=8`): MIT license.

These tools are development/build dependencies and are not required as
runtime libraries once PzKpfw is installed. Install them from their official
package distributions and review their current license notices.

## Original IS-2 and other software

No original IS-2 executable, DLL, Qt runtime, MSVC runtime, plugin binary,
Chromium/WebEngine component, or commercial third-party library is shipped
here. The reconstructed headers in `sdk/` are independent ABI contract
summaries and are not the original vendor SDK.

This inventory is a source-release snapshot, not legal advice. A production
binary installer must maintain a separate, version-specific SBOM and license
review for every bundled runtime component.

- Tcl/Tk (platform GUI runtime used by Python's `tkinter`): supplied by the
  operating system or Python distributor, not bundled here. Review the Tcl/Tk
  license and notices for the exact version provided by your platform.
