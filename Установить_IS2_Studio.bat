@echo off
setlocal
cd /d "%~dp0continuation"
set "PYTHONPATH=%CD%\src;%PYTHONPATH%"
where py >nul 2>nul
if %errorlevel%==0 (
  py -3 -m is2_re.gui %*
) else (
  python -m is2_re.gui %*
)
if errorlevel 1 pause
