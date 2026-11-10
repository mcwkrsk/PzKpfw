# Installs Python 3.12 for the current user if needed; internet is required.
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not [Environment]::Is64BitOperatingSystem) {
    throw 'A 64-bit Windows installation is required.'
}
$localPythonDir = Join-Path $env:LOCALAPPDATA 'PzKpfw\BuildPython312'
$localPython = Join-Path $localPythonDir 'python.exe'
$pythonExe = $null
$pythonArgs = @()
$checkCode = "import sys, struct, tkinter; assert sys.version_info[:2] == (3, 12); assert struct.calcsize('P') == 8"
function Test-BuildPython($exe, $arguments) {
    try {
        & $exe @arguments -c $checkCode 2>$null | Out-Null
        return $LASTEXITCODE -eq 0
    } catch { return $false }
}
if ((Test-Path $localPython) -and (Test-BuildPython $localPython @())) {
    $pythonExe = $localPython
} elseif ((Get-Command py -ErrorAction SilentlyContinue) -and (Test-BuildPython 'py' @('-3.12'))) {
    $pythonExe = 'py'
    $pythonArgs = @('-3.12')
} elseif ((Get-Command python -ErrorAction SilentlyContinue) -and (Test-BuildPython 'python' @())) {
    $pythonExe = 'python'
}
if (-not $pythonExe) {
    Write-Host 'Python 3.12 x64 with Tkinter was not found. Downloading the official installer...'
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $installer = Join-Path $env:TEMP ('pzkpfw-python-' + [Guid]::NewGuid().ToString('N') + '.exe')
    try {
        Invoke-WebRequest -UseBasicParsing -Uri 'https://www.python.org/ftp/python/3.12.10/python-3.12.10-amd64.exe' -OutFile $installer
        $signature = Get-AuthenticodeSignature -FilePath $installer
        if ($signature.Status -ne 'Valid' -or $signature.SignerCertificate.Subject -notmatch 'Python Software Foundation') {
            throw 'The downloaded Python installer does not have a valid Python Software Foundation signature.'
        }
        Write-Host 'Installing Python for the current Windows user...'
        $installArgs = "/quiet InstallAllUsers=0 Include_launcher=0 Include_test=0 Include_doc=0 Include_tcltk=1 Include_pip=1 PrependPath=0 Shortcuts=0 TargetDir=`"$localPythonDir`""
        $process = Start-Process -FilePath $installer -ArgumentList $installArgs -Wait -PassThru
        if ($process.ExitCode -ne 0) { throw "Python installer failed with exit code $($process.ExitCode)." }
    } finally {
        Remove-Item $installer -Force -ErrorAction SilentlyContinue
    }
    if (-not ((Test-Path $localPython) -and (Test-BuildPython $localPython @()))) {
        throw 'Python installation did not produce a working 64-bit Python 3.12 with Tkinter.'
    }
    $pythonExe = $localPython
    $pythonArgs = @()
}
& $pythonExe @pythonArgs -m venv .venv-build-py312
if ($LASTEXITCODE -ne 0) { throw 'Could not create the build environment' }
$buildPython = Join-Path $PSScriptRoot '.venv-build-py312\Scripts\python.exe'
& $buildPython -c "import sys, struct, tkinter; assert sys.version_info[:2] == (3, 12); assert struct.calcsize('P') == 8"
if ($LASTEXITCODE -ne 0) { throw 'The existing .venv-build-py312 is incompatible. Delete that build environment and run the build again.' }
& $buildPython -m pip install 'pyinstaller>=6.10,<7' -r requirements.txt
if ($LASTEXITCODE -ne 0) { throw 'Could not install build dependencies' }
$env:PYTHONPATH = Join-Path $PSScriptRoot 'src'
& $buildPython -m unittest discover -s tests -p 'test_*.py' -q
if ($LASTEXITCODE -ne 0) { throw 'Source tests failed' }
& $buildPython -m PyInstaller --noconfirm --clean --onedir --windowed --name 'PzKpfw' --icon 'src\is2_re\assets\pzkpfw.ico' --paths 'src' --add-data 'src\is2_re\assets;is2_re\assets' 'pzkpfw_standalone_entry.py'
if ($LASTEXITCODE -ne 0) { throw 'EXE build failed' }
if (-not (Test-Path 'dist\PzKpfw\_internal\python312.dll')) { throw 'Build is incomplete: _internal\python312.dll is missing' }
if (-not (Get-ChildItem 'dist\PzKpfw\_internal' -Filter '_tkinter*.pyd' -Recurse -ErrorAction SilentlyContinue)) { throw 'Build is incomplete: tkinter extension is missing' }
Copy-Item LICENSE, NOTICE, THIRD_PARTY_NOTICES.md -Destination 'dist\PzKpfw'
# Preserve existing root files instead of overwriting them. The standalone
# distribution in dist remains available independently of the root copy.
$backupSuffix = '.backup-' + [Guid]::NewGuid().ToString('N')
if (Test-Path 'PzKpfw.exe') { Move-Item 'PzKpfw.exe' ("PzKpfw.exe" + $backupSuffix) }
if (Test-Path '_internal') { Move-Item '_internal' ("_internal" + $backupSuffix) }
Copy-Item 'dist\PzKpfw\_internal' -Destination '_internal' -Recurse
Copy-Item 'dist\PzKpfw\PzKpfw.exe' -Destination 'PzKpfw.exe'
Write-Host 'Done! Launch PzKpfw.exe in this folder. Keep _internal next to the EXE.'
