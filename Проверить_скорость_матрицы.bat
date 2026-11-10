@echo off
cd /d "%~dp0"
if not exist ".venv-build-py312\Scripts\python.exe" (
  echo First run the EXE build script to install the build environment.
  pause
  exit /b 1
)
set "PYTHONPATH=%CD%\src"
echo Optional: drag an .is2 project onto this BAT to test it.
echo Running the matrix performance test. No project file will be saved.
".venv-build-py312\Scripts\python.exe" "tools\benchmark_matrix_gui.py" %*
if errorlevel 1 echo The test did not complete. Please share the error above.
pause
