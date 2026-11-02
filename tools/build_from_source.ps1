$ErrorActionPreference = 'Stop'
Set-Location (Split-Path -Parent $PSScriptRoot)
python -m pytest -q
New-Item -ItemType Directory -Force -Path dist | Out-Null
python -m pip wheel . --no-deps --no-build-isolation --wheel-dir dist
Get-ChildItem dist -Filter 'pzkpfw-*.whl'
