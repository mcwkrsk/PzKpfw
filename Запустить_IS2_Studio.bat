@echo off
setlocal
set "WHEEL=%~dp0continuation\dist\is2_re_analysis_kit-0.3.0-py3-none-any.whl"
where py >nul 2>nul
if %errorlevel%==0 (
  py -3 -m pip install --no-deps "%WHEEL%"
) else (
  python -m pip install --no-deps "%WHEEL%"
)
if errorlevel 1 (
  echo Installation failed. Python 3 and pip are required.
  pause
  exit /b 1
)
echo Installed. You can run: is2-studio
pause
