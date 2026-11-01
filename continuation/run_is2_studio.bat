@echo off
setlocal
cd /d "%~dp0"
set "PYTHONPATH=%CD%\src;%PYTHONPATH%"
where py >nul 2>nul
if %errorlevel%==0 (
  py -3 -m is2_re.gui %*
) else (
  python -m is2_re.gui %*
)
