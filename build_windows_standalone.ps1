# Requires Windows + Python 3.10+ with tkinter and pip.
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not (Get-Command py -ErrorAction SilentlyContinue)) {
    throw 'Python Launcher (py.exe) is required. Install Python from python.org.'
}
py -3 -m pip install --upgrade pyinstaller
if ($LASTEXITCODE -ne 0) { throw 'PyInstaller install failed' }
$env:PYTHONPATH = Join-Path $PSScriptRoot 'src'
py -3 -m PyInstaller --noconfirm --clean --onefile --windowed --name 'PzKpfw' --icon 'src\is2_re\assets\pzkpfw.ico' --paths 'src' --add-data 'src\is2_re\assets;is2_re\assets' 'pzkpfw_standalone_entry.py'
if ($LASTEXITCODE -ne 0) { throw 'EXE build failed' }
Write-Host 'Done! Standalone executable: dist\PzKpfw.exe'
