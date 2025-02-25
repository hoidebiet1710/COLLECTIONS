@echo off & color 1f
CHCP 65001 >nul
setlocal enabledelayedexpansion
cd /d "%~dp0"

echo Kill OneDrive process
taskkill.exe /F /IM "OneDrive.exe"
taskkill.exe /F /IM "explorer.exe"

echo Remove OneDrive
if exist "%systemroot%\System32\OneDriveSetup.exe" (
    "%systemroot%\System32\OneDriveSetup.exe" /uninstall
)
if exist "%systemroot%\SysWOW64\OneDriveSetup.exe" (
    "%systemroot%\SysWOW64\OneDriveSetup.exe" /uninstall
)

echo Removing OneDrive leftovers
rmdir /S /Q "%localappdata%\Microsoft\OneDrive" 2>nul
rmdir /S /Q "%programdata%\Microsoft OneDrive" 2>nul
rmdir /S /Q "%systemdrive%\OneDriveTemp" 2>nul

:: Check if directory is empty before removing
dir /A /B "%userprofile%\OneDrive" | findstr . >nul
if errorlevel 1 (
    rmdir /S /Q "%userprofile%\OneDrive" 2>nul
)

echo Disable OneDrive via Group Policies
reg add "HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d 1 /f

echo Remove OneDrive from explorer sidebar
reg add "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d 0 /f
reg add "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d 0 /f

echo Removing run hook for new users
reg load "hku\Default" "C:\Users\Default\NTUSER.DAT"
reg delete "HKEY_USERS\Default\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "OneDriveSetup" /f
reg unload "hku\Default"

echo Removing startmenu entry
del /F /Q "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk" 2>nul

echo Removing scheduled task
schtasks /Delete /TN "OneDrive*" /F >nul 2>&1

echo Restarting explorer
start explorer.exe

echo Waiting for explorer to complete loading
timeout /T 5 /NOBREAK >nul

echo OneDrive removal and disabling completed.
pause 2>nul & Exit /b
