@echo off
cd /d "%~dp0"
set "PYTHONPATH=%CD%\src"
where py >nul 2>nul
if %errorlevel%==0 (
  py -3 pzkpfw_standalone_entry.py
) else (
  python pzkpfw_standalone_entry.py
)
if errorlevel 1 pause
