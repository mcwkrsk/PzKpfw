@echo off
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0build_windows_standalone.ps1"
if errorlevel 1 (
  echo.
  echo Build failed. See message above.
) else (
  echo.
  echo EXE: PzKpfw.exe in this folder
  echo Keep the _internal folder next to the EXE.
)
pause
