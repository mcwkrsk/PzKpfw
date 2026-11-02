param(
    [Parameter(Mandatory=$true)][string]$Is2ExePath,
    [Parameter(Mandatory=$true)][string]$PzkpfwProjectFile,
    [Parameter(Mandatory=$true)][string]$PzkpfwCommand,
    [string]$NativeIs2ProjectFile = '',
    [string]$OutputDirectory = '.\runtime-acceptance'
)
$ErrorActionPreference = 'Stop'

function Get-Sha256([string]$Path) {
    return (Get-FileHash -Algorithm SHA256 -LiteralPath $Path).Hash
}
function Ask-PassFail([string]$Prompt) {
    while ($true) {
        $value = (Read-Host "$Prompt (PASS/FAIL)").Trim().ToUpperInvariant()
        if ($value -in @('PASS', 'FAIL')) { return $value }
        Write-Host 'Please enter PASS or FAIL.' -ForegroundColor Yellow
    }
}
function Start-Pzkpfw([string]$ProjectPath) {
    $launcher = Get-Command $PzkpfwCommand -ErrorAction SilentlyContinue
    if (-not $launcher) { throw "PzKpfw launcher '$PzkpfwCommand' not found. Install the 0.7.8 wheel or pass its command path." }
    return Start-Process -FilePath $launcher.Source -ArgumentList @('"' + $ProjectPath + '"') -PassThru
}
function Start-Is2([string]$ProjectPath) {
    return Start-Process -FilePath $Is2ExePath -ArgumentList @('"' + $ProjectPath + '"') -PassThru
}

if (-not (Test-Path -LiteralPath $Is2ExePath -PathType Leaf)) { throw "IS.exe not found: $Is2ExePath" }
if (-not (Test-Path -LiteralPath $PzkpfwProjectFile -PathType Leaf)) { throw "PzKpfw project not found: $PzkpfwProjectFile" }
if ($NativeIs2ProjectFile -and -not (Test-Path -LiteralPath $NativeIs2ProjectFile -PathType Leaf)) { throw "Native IS-2 project not found: $NativeIs2ProjectFile" }
New-Item -ItemType Directory -Force -Path $OutputDirectory | Out-Null
$results = [ordered]@{
    schema_version = 1
    pzkpfw_release = '0.7.8'
    started_at = (Get-Date).ToString('o')
    windows_version = [System.Environment]::OSVersion.VersionString
    is2_exe = (Get-Item -LiteralPath $Is2ExePath).FullName
    is2_exe_sha256 = Get-Sha256 $Is2ExePath
    pzkpfw_project = (Get-Item -LiteralPath $PzkpfwProjectFile).FullName
    pzkpfw_project_sha256 = Get-Sha256 $PzkpfwProjectFile
    native_is2_project = $null
    pzkpfw_open_native_is2 = 'NOT_RUN'
    pzkpfw_saved_copy = $null
    pzkpfw_saved_copy_sha256 = $null
    is2_open_pzkpfw_save = 'NOT_RUN'
    is2_resaved_copy = $null
    is2_resaved_copy_sha256 = $null
    pzkpfw_open_is2_save = 'NOT_RUN'
    notes = @()
}

Write-Host 'PzKpfw 0.7.8 / original IS-2 Windows runtime acceptance' -ForegroundColor Cyan
Write-Host 'Work only on copies. This script records operator-confirmed UI results; it does not inspect IS-2 internals.'

if ($NativeIs2ProjectFile) {
    $nativePath = (Get-Item -LiteralPath $NativeIs2ProjectFile).FullName
    $results.native_is2_project = $nativePath
    $results.native_is2_project_sha256 = Get-Sha256 $nativePath
    Write-Host '1/3: Opening an IS-2-native project in PzKpfw...' -ForegroundColor Cyan
    $pzk = Start-Pzkpfw $nativePath
    Write-Host "PzKpfw PID: $($pzk.Id)"
    $results.pzkpfw_open_native_is2 = Ask-PassFail 'Did PzKpfw open the native IS-2 project and render its content correctly?'
    $pzkSave = Read-Host 'Enter the full path of a copy saved via PzKpfw Save As (blank to skip remaining steps)'
    if ($pzkSave -and (Test-Path -LiteralPath $pzkSave -PathType Leaf)) {
        $pzkSave = (Get-Item -LiteralPath $pzkSave).FullName
        $results.pzkpfw_saved_copy = $pzkSave
        $results.pzkpfw_saved_copy_sha256 = Get-Sha256 $pzkSave
        $PzkpfwProjectFile = $pzkSave
        $results.pzkpfw_project = $pzkSave
        $results.pzkpfw_project_sha256 = Get-Sha256 $pzkSave
    } else {
        $results.notes += 'PzKpfw Save As copy was not provided; remaining runtime checks were skipped.'
    }
}

if ($results.notes.Count -eq 0) {
    Write-Host '2/3: Opening the PzKpfw-saved project in the original IS-2...' -ForegroundColor Cyan
    $is2 = Start-Is2 $PzkpfwProjectFile
    Write-Host "IS-2 PID: $($is2.Id)"
    $results.is2_open_pzkpfw_save = Ask-PassFail 'Did the original IS-2 open and render the PzKpfw-saved project correctly?'
    $is2Save = Read-Host 'Enter the full path of a copy saved via original IS-2 Save As (blank to skip final step)'
    if ($is2Save -and (Test-Path -LiteralPath $is2Save -PathType Leaf)) {
        $is2Save = (Get-Item -LiteralPath $is2Save).FullName
        $results.is2_resaved_copy = $is2Save
        $results.is2_resaved_copy_sha256 = Get-Sha256 $is2Save
        Write-Host '3/3: Reopening the IS-2-saved project in PzKpfw...' -ForegroundColor Cyan
        $pzkAgain = Start-Pzkpfw $is2Save
        Write-Host "PzKpfw PID: $($pzkAgain.Id)"
        $results.pzkpfw_open_is2_save = Ask-PassFail 'Did PzKpfw open and render the IS-2-saved project correctly?'
    } else {
        $results.notes += 'IS-2 Save As copy was not provided; final PzKpfw reopen was skipped.'
    }
}

$results.finished_at = (Get-Date).ToString('o')
$results.overall = if ($results.is2_open_pzkpfw_save -eq 'PASS' -and $results.pzkpfw_open_is2_save -eq 'PASS' -and (-not $NativeIs2ProjectFile -or $results.pzkpfw_open_native_is2 -eq 'PASS')) { 'OPERATOR_PASS' } else { 'INCOMPLETE_OR_FAIL' }
$jsonPath = Join-Path $OutputDirectory 'runtime-acceptance.json'
$results | ConvertTo-Json -Depth 8 | Set-Content -Encoding UTF8 $jsonPath
Write-Host "Acceptance report written to $jsonPath" -ForegroundColor Green
Write-Host "Overall: $($results.overall)" -ForegroundColor Cyan
