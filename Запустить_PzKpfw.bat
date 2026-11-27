@echo off
rem Run PzKpfw from the source folder (Python 3.10+ with Tkinter is required).
cd /d "%~dp0"
set "PYTHONPATH=%CD%\src"
where py >nul 2>nul
if %errorlevel%==0 (
  py -3 -m is2_re.gui %*
) else (
  python -m is2_re.gui %*
)
if errorlevel 1 pause
