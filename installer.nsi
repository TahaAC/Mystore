; Gulistan Management System - Windows Installer
; This script can be compiled with NSIS (Nullsoft Scriptable Install System)
; Download NSIS from: https://nsis.sourceforge.io/

; Include Modern UI
!include "MUI2.nsh"

; General Settings
Name "Gulistan Management System"
OutFile "GulistanInstaller-2.0.0.exe"
InstallDir "$PROGRAMFILES\Gulistan"
ShowInstDetails show
ShowUninstDetails show

; UI Settings
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

; Installation Section
Section "Install Node.js Dependencies"
    SetOutPath "$INSTDIR"
    File /r "*.*"
    
    ; Run npm install
    ExecWait 'cmd.exe /C npm install'
    
SectionEnd

Section "Create Start Menu Shortcut"
    CreateDirectory "$SMPROGRAMS\Gulistan"
    CreateShortcut "$SMPROGRAMS\Gulistan\Gulistan Management System.lnk" "$INSTDIR\start.bat"
    CreateShortcut "$SMPROGRAMS\Gulistan\Uninstall.lnk" "$INSTDIR\uninstall.exe"
SectionEnd

Section "Create Desktop Shortcut"
    CreateShortcut "$DESKTOP\Gulistan Management System.lnk" "$INSTDIR\start.bat"
SectionEnd

; Uninstaller Section
Section "Uninstall"
    RMDir /r "$INSTDIR"
    RMDir /r "$SMPROGRAMS\Gulistan"
    Delete "$DESKTOP\Gulistan Management System.lnk"
SectionEnd
