@echo off
cd /d "%~dp0"
set "PYTHONPATH=%CD%\src"
where python >nul 2>nul
if %errorlevel%==0 (
  python pzkpfw_standalone_entry.py
) else (
  py -3 pzkpfw_standalone_entry.py
)
if errorlevel 1 pause
