@echo off & color 1f
setlocal enabledelayedexpansion
cls
cd %windir%\system32
set "versions=4 5 6"
for %%a in (%versions%) do (
    if exist "%ProgramFiles(x86)%\Microsoft Office\Office1%%a\ospp.vbs" (
        cd /d "%ProgramFiles(x86)%\Microsoft Office\Office1%%a"
        call :CheckLicense
    )

    if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (
        cd /d "%ProgramFiles%\Microsoft Office\Office1%%a"
        call :CheckLicense
    )
)

:CheckLicense
echo.
echo      DANG KIEM TRA TRANG THAI BAN QUYEN Office
echo.
cscript ospp.vbs /dstatus
echo.
echo      DANG KIEM TRA TRANG THAI BAN QUYEN Windows
echo.
cd %windir%\system32
cscript.exe "%windir%\system32\slmgr.vbs" /xpr
cscript.exe "%windir%\system32\slmgr.vbs" /dli
timeout 3 & Exit
