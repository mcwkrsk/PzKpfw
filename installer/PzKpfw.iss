; PzKpfw installer (Inno Setup 6.3+). Built by installer/build_release.py, which passes:
;   AppVersion, StageDir, OutputDir, RuntimeId, RuntimeFile, RuntimeUrl, RuntimeSha256, RuntimeSizeMB, RuntimeDownloadMB
; The Python runtime is not inside the installer: it is downloaded once (SHA-256 checked)
; and reused by later updates while RuntimeId stays the same.

#ifndef AppVersion
  #error AppVersion is not defined: build with installer/build_release.py
#endif

#define AppName "PzKpfw"
#define AppId "{{4F2B7E61-9C3A-4D8E-B5A1-6E0C2F9D7A34}"
#define AppUrl "https://github.com/mcwkrsk/PzKpfw"
#define AppUserModelId "PzKpfw.Editor"
#define ProgId "PzKpfw.Project"

[Setup]
AppId={#AppId}
AppName={#AppName}
AppVersion={#AppVersion}
AppVerName={#AppName} {#AppVersion}
AppPublisher=PzKpfw contributors
AppPublisherURL={#AppUrl}
AppSupportURL={#AppUrl}/issues
AppUpdatesURL={#AppUrl}/releases
VersionInfoVersion={#AppVersion}
; Per-user install: no administrator rights, works on university PCs.
PrivilegesRequired=lowest
DefaultDirName={autopf}\{#AppName}
DisableProgramGroupPage=yes
DefaultGroupName={#AppName}
UsePreviousAppDir=yes
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
; tar.exe (used to unpack the runtime) ships with Windows 10 1803+.
MinVersion=10.0.17763
OutputDir={#OutputDir}
OutputBaseFilename=PzKpfw-Setup-{#AppVersion}
SetupIconFile={#StageDir}\pzkpfw.ico
UninstallDisplayIcon={app}\pzkpfw.ico
UninstallDisplayName={#AppName}
WizardStyle=modern
Compression=lzma2/max
SolidCompression=yes
CloseApplications=yes
RestartApplications=no
ChangesAssociations=yes
ExtraDiskSpaceRequired={#RuntimeSizeMB}000000

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"

[CustomMessages]
AssociateTask=Open .is2 files with PzKpfw
FileTypeName=IS-2 project
DownloadingRuntime=Downloading the PzKpfw runtime (about {#RuntimeDownloadMB} MB)…
UnpackingRuntime=Unpacking the PzKpfw runtime…
RuntimeFailed=The PzKpfw runtime could not be installed:%n%n%1%n%nCheck the internet connection and run the installer again.
RuntimeLocked=The previous PzKpfw runtime is in use. Close PzKpfw and run the installer again.
RemoveUserData=Also remove PzKpfw modules, settings and logs of this user?
russian.AssociateTask=Открывать файлы .is2 в PzKpfw
russian.FileTypeName=Проект ИС-2
russian.DownloadingRuntime=Загрузка среды выполнения PzKpfw (около {#RuntimeDownloadMB} МБ)…
russian.UnpackingRuntime=Распаковка среды выполнения PzKpfw…
russian.RuntimeFailed=Не удалось установить среду выполнения PzKpfw:%n%n%1%n%nПроверьте подключение к интернету и запустите установщик ещё раз.
russian.RuntimeLocked=Предыдущая среда PzKpfw занята. Закройте PzKpfw и запустите установщик ещё раз.
russian.RemoveUserData=Удалить также модули, настройки и журналы PzKpfw этого пользователя?
ukrainian.AssociateTask=Відкривати файли .is2 у PzKpfw
ukrainian.FileTypeName=Проєкт ІС-2
ukrainian.DownloadingRuntime=Завантаження середовища PzKpfw (близько {#RuntimeDownloadMB} МБ)…
ukrainian.UnpackingRuntime=Розпакування середовища PzKpfw…
ukrainian.RuntimeFailed=Не вдалося встановити середовище PzKpfw:%n%n%1%n%nПеревірте підключення до інтернету й запустіть інсталятор ще раз.
ukrainian.RuntimeLocked=Попереднє середовище PzKpfw зайняте. Закрийте PzKpfw і запустіть інсталятор ще раз.
ukrainian.RemoveUserData=Видалити також модулі, налаштування й журнали PzKpfw цього користувача?

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "associate"; Description: "{cm:AssociateTask}"

[InstallDelete]
; Program files are replaced as a whole so that removed source files do not linger.
Type: filesandordirs; Name: "{app}\app"

[Files]
Source: "{#StageDir}\app\*"; DestDir: "{app}\app"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#StageDir}\pzkpfw.pyw"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#StageDir}\pzkpfw.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#StageDir}\LICENSE.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#StageDir}\pzkpfw-install.json"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\{#AppName}"; Filename: "{app}\runtime\pythonw.exe"; Parameters: """{app}\pzkpfw.pyw"""; WorkingDir: "{app}"; IconFilename: "{app}\pzkpfw.ico"; AppUserModelID: "{#AppUserModelId}"
Name: "{autodesktop}\{#AppName}"; Filename: "{app}\runtime\pythonw.exe"; Parameters: """{app}\pzkpfw.pyw"""; WorkingDir: "{app}"; IconFilename: "{app}\pzkpfw.ico"; AppUserModelID: "{#AppUserModelId}"; Tasks: desktopicon

[Registry]
; HKA = HKEY_CURRENT_USER for a per-user install.
Root: HKA; Subkey: "Software\Classes\{#ProgId}"; ValueType: string; ValueName: ""; ValueData: "{cm:FileTypeName}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#ProgId}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\pzkpfw.ico"
Root: HKA; Subkey: "Software\Classes\{#ProgId}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\runtime\pythonw.exe"" ""{app}\pzkpfw.pyw"" ""%1"""
Root: HKA; Subkey: "Software\Classes\.is2\OpenWithProgids"; ValueType: string; ValueName: "{#ProgId}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\.is2"; ValueType: string; ValueName: ""; ValueData: "{#ProgId}"; Flags: uninsdeletevalue; Tasks: associate

[Run]
; Also runs after a silent update, so the program starts again; /NOLAUNCH turns it off (CI tests).
Filename: "{app}\runtime\pythonw.exe"; Parameters: """{app}\pzkpfw.pyw"""; WorkingDir: "{app}"; Description: "{cm:LaunchProgram,{#AppName}}"; Flags: nowait postinstall; Check: ShouldLaunch

[UninstallDelete]
Type: filesandordirs; Name: "{app}\runtime"
Type: filesandordirs; Name: "{app}\runtime.new"
Type: filesandordirs; Name: "{app}\app"

[Code]
var
  DownloadPage: TDownloadWizardPage;
  RuntimeZip: String;

function HasParam(const Name: String): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 1 to ParamCount do
    if CompareText(ParamStr(I), Name) = 0 then
      Result := True;
end;

function ShouldLaunch: Boolean;
begin
  Result := not HasParam('/NOLAUNCH');
end;

function RuntimeDir: String;
begin
  Result := ExpandConstant('{app}\runtime');
end;

{ True when the runtime of this version is already installed: nothing to download. }
function RuntimeIsCurrent: Boolean;
var
  Id: AnsiString;
begin
  Result := FileExists(RuntimeDir + '\pythonw.exe')
    and LoadStringFromFile(RuntimeDir + '\pzkpfw-runtime.id', Id)
    and (Trim(String(Id)) = '{#RuntimeId}');
end;

{ A runtime archive placed next to the installer is used instead of downloading
  (CI tests, slow connections). It must have the expected SHA-256 as well. }
function LocalRuntimeZip: String;
begin
  Result := ExpandConstant('{src}\{#RuntimeFile}');
  if not FileExists(Result) then
    Result := ''
  else if CompareText(GetSHA256OfFile(Result), '{#RuntimeSha256}') <> 0 then
    Result := '';
end;

function OnDownloadProgress(const Url, FileName: String; const Progress, ProgressMax: Int64): Boolean;
begin
  Result := True;
end;

procedure InitializeWizard;
begin
  DownloadPage := CreateDownloadPage(SetupMessage(msgWizardPreparing), CustomMessage('DownloadingRuntime'), @OnDownloadProgress);
  RuntimeZip := '';
end;

{ Interactive install: download on a progress page after «Ready». }
function NextButtonClick(CurPageID: Integer): Boolean;
begin
  Result := True;
  if (CurPageID = wpReady) and not RuntimeIsCurrent then
  begin
    RuntimeZip := LocalRuntimeZip;
    if RuntimeZip <> '' then
      Exit;
    DownloadPage.Clear;
    DownloadPage.Add('{#RuntimeUrl}', '{#RuntimeFile}', '{#RuntimeSha256}');
    DownloadPage.Show;
    try
      try
        DownloadPage.Download;
        RuntimeZip := ExpandConstant('{tmp}\{#RuntimeFile}');
      except
        if not DownloadPage.AbortedByUser then
          SuppressibleMsgBox(FmtMessage(CustomMessage('RuntimeFailed'), [GetExceptionMessage]), mbCriticalError, MB_OK, IDOK);
        Result := False;
      end;
    finally
      DownloadPage.Hide;
    end;
  end;
end;

function Unpack(const ZipFile, Target: String): Boolean;
var
  Code: Integer;
begin
  Result := Exec(ExpandConstant('{sys}\tar.exe'), '-xf "' + ZipFile + '" -C "' + Target + '"', '', SW_HIDE, ewWaitUntilTerminated, Code) and (Code = 0);
  if not Result then
    Result := Exec(ExpandConstant('{sys}\WindowsPowerShell\v1.0\powershell.exe'),
      '-NoProfile -NonInteractive -ExecutionPolicy Bypass -Command "Expand-Archive -LiteralPath ''' + ZipFile + ''' -DestinationPath ''' + Target + ''' -Force"',
      '', SW_HIDE, ewWaitUntilTerminated, Code) and (Code = 0);
end;

{ Runs in interactive and silent mode before any file is copied, so a failure
  leaves the previous installation untouched. }
function PrepareToInstall(var NeedsRestart: Boolean): String;
var
  NewDir: String;
begin
  Result := '';
  if RuntimeIsCurrent then
    Exit;
  if RuntimeZip = '' then
    RuntimeZip := LocalRuntimeZip;
  if RuntimeZip = '' then
  begin
    { Silent update: no wizard pages, download directly. }
    try
      DownloadTemporaryFile('{#RuntimeUrl}', '{#RuntimeFile}', '{#RuntimeSha256}', @OnDownloadProgress);
      RuntimeZip := ExpandConstant('{tmp}\{#RuntimeFile}');
    except
      Result := FmtMessage(CustomMessage('RuntimeFailed'), [GetExceptionMessage]);
      Exit;
    end;
  end;
  WizardForm.PreparingLabel.Caption := CustomMessage('UnpackingRuntime');
  NewDir := ExpandConstant('{app}\runtime.new');
  DelTree(NewDir, True, True, True);
  if not ForceDirectories(NewDir) or not Unpack(RuntimeZip, NewDir) or not FileExists(NewDir + '\pythonw.exe') then
  begin
    DelTree(NewDir, True, True, True);
    Result := FmtMessage(CustomMessage('RuntimeFailed'), [RuntimeZip]);
    Exit;
  end;
  if DirExists(RuntimeDir) and not DelTree(RuntimeDir, True, True, True) then
  begin
    DelTree(NewDir, True, True, True);
    Result := CustomMessage('RuntimeLocked');
    Exit;
  end;
  if not RenameFile(NewDir, RuntimeDir) then
    Result := CustomMessage('RuntimeLocked');
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  if (CurUninstallStep = usPostUninstall) and not UninstallSilent then
    if MsgBox(CustomMessage('RemoveUserData'), mbConfirmation, MB_YESNO or MB_DEFBUTTON2) = IDYES then
    begin
      DelTree(ExpandConstant('{localappdata}\PzKpfw'), True, True, True);
      DelTree(ExpandConstant('{userappdata}\PzKpfw'), True, True, True);
    end;
end;
