; ──────────────────────────────────────────────────────────────
; MedGlobal POS - Windows Installer Script
;
; This is an Inno Setup script template. The following placeholders
; will be replaced by the build script (create_installer.sh):
;   {{APP_VERSION}}     - Version from pubspec.yaml (e.g., 2.0.0)
;   {{APP_BUILD}}       - Build number from pubspec.yaml (e.g., 123)
;   {{APP_PUBLISHER}}   - Publisher name from env var
;   {{APP_NAME}}        - Application display name from env var
;   {{TENANT_NAME}}     - Tenant name or environment (e.g., alpha, dev)
;   {{SUPPORT_URL}}     - Support website URL (optional)
; ──────────────────────────────────────────────────────────────

#define MyAppName "{{APP_NAME}}"
#define MyAppVersion "{{APP_VERSION}}"
#define MyAppBuildNumber "{{APP_BUILD}}"
#define MyAppPublisher "{{APP_PUBLISHER}}"
#define MyAppExeName "medglobal_admin_portal.exe"
#define MyAppSupportURL "{{SUPPORT_URL}}"

[Setup]
; ──────────────────────────────────────────────────────────────
; Application Information
; ──────────────────────────────────────────────────────────────
AppId={{8A7F9C2E-4B3D-4F6A-9E2C-1D5B8F3A7E9C}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}+{#MyAppBuildNumber}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppSupportURL}
AppSupportURL={#MyAppSupportURL}

; ──────────────────────────────────────────────────────────────
; Installation Directories
; ──────────────────────────────────────────────────────────────
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
PrivilegesRequired=admin
PrivilegesRequiredOverridesAllowed=dialog

; ──────────────────────────────────────────────────────────────
; Output Configuration
; ──────────────────────────────────────────────────────────────
OutputDir=Output
OutputBaseFilename={#MyAppName}-v{#MyAppVersion}-{{TENANT_NAME}}+{#MyAppBuildNumber}
SetupIconFile=..\runner\resources\app_icon.ico
UninstallDisplayIcon={app}\{#MyAppExeName}

; ──────────────────────────────────────────────────────────────
; Compression
; ──────────────────────────────────────────────────────────────
Compression=lzma2
SolidCompression=yes
LZMAUseSeparateProcess=yes
LZMADictionarySize=1048576
LZMANumFastBytes=273

; ──────────────────────────────────────────────────────────────
; Architecture
; ──────────────────────────────────────────────────────────────
ArchitecturesInstallIn64BitMode=x64
ArchitecturesAllowed=x64

; ──────────────────────────────────────────────────────────────
; Versioning
; ──────────────────────────────────────────────────────────────
VersionInfoVersion={#MyAppVersion}.{#MyAppBuildNumber}
VersionInfoCompany={#MyAppPublisher}
VersionInfoDescription={#MyAppName} Installer
VersionInfoProductName={#MyAppName}
VersionInfoProductVersion={#MyAppVersion}

; ──────────────────────────────────────────────────────────────
; UI Configuration
; ──────────────────────────────────────────────────────────────
WizardStyle=modern
DisableWelcomePage=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; ──────────────────────────────────────────────────────────────
; Application Files
; Copy all files from the staging directory (includes app + DLLs)
; ──────────────────────────────────────────────────────────────
Source: "..\..\build\windows_installer_staging\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
; ──────────────────────────────────────────────────────────────
; Shortcuts
; ──────────────────────────────────────────────────────────────
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
; ──────────────────────────────────────────────────────────────
; Post-Installation Actions
; ──────────────────────────────────────────────────────────────
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Code]
// ──────────────────────────────────────────────────────────────
// Uninstall Previous Version
// Automatically uninstall older versions before installing
// ──────────────────────────────────────────────────────────────
function GetUninstallString(): String;
var
  sUnInstPath: String;
  sUnInstallString: String;
begin
  sUnInstPath := ExpandConstant('Software\Microsoft\Windows\CurrentVersion\Uninstall\{#SetupSetting("AppId")}_is1');
  sUnInstallString := '';
  if not RegQueryStringValue(HKLM, sUnInstPath, 'UninstallString', sUnInstallString) then
    RegQueryStringValue(HKCU, sUnInstPath, 'UninstallString', sUnInstallString);
  Result := sUnInstallString;
end;

function IsUpgrade(): Boolean;
begin
  Result := (GetUninstallString() <> '');
end;

function UnInstallOldVersion(): Integer;
var
  sUnInstallString: String;
  iResultCode: Integer;
begin
  Result := 0;
  sUnInstallString := GetUninstallString();
  if sUnInstallString <> '' then begin
    sUnInstallString := RemoveQuotes(sUnInstallString);
    if Exec(sUnInstallString, '/SILENT /NORESTART /SUPPRESSMSGBOXES','', SW_HIDE, ewWaitUntilTerminated, iResultCode) then
      Result := 3
    else
      Result := 2;
  end else
    Result := 1;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if (CurStep=ssInstall) then
  begin
    if (IsUpgrade()) then
    begin
      UnInstallOldVersion();
    end;
  end;
end;
