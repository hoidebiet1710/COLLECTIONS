CHCP 1258 >nul 2>&1
CHCP 65001 >nul 2>&1
@echo off & color 1f
setlocal enabledelayedexpansion
:: Thông tin phiên bản
set "VERSION=Version 3"
set "AUTHOR=TRAN HOANG NAM"
set "DATE=2025-02-10"
:MENU
cls
ECHO..................................................................
ECHO    	ACTIVATE WINDOW_OFFICE BY KEY AND SETUP ONLINE OFFICE
ECHO.
echo           Phiên bản:         %VERSION%
echo           Tác giả:           %AUTHOR%
echo           Ngày cập nhật:     %DATE%
ECHO..................................................................
ECHO.
ECHO           0. Exit
ECHO.
ECHO           1. CHOOSE AN OFFICE KEY TO REMOVE
ECHO.
ECHO           2. REMOVE ALL OFFICE LICENSES
ECHO..................................................................
ECHO.
SET /P M=      Choose a Number (Ex: 2) then press ENTER:   
ECHO.
:REMOVEALLKEYOFFICE
cd %windir%\system32
for %%a in (4,5,6) do (if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles% (x86)\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles% (x86)\Microsoft Office\Office1%%a"))
for /f "tokens= 8" %%b in ('cscript //nologo OSPP.VBS /dstatus ^| findstr /b /c:"Last 5"') do (cscript //nologo ospp.vbs /unpkey:%%b)&cls
Echo.
Echo     All office keys have been successfully removed
TIMEOUT 3 >NUL & GOTO MENU
)

:REMOVEKEYOFFICE
cd %windir%\system32
for %%a in (4,5,6) do (if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles% (x86)\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles% (x86)\Microsoft Office\Office1%%a"))
cscript OSPP.VBS /dstatus >>C:\Office.txt
start C:\Office.txt & cls
@echo.
set /p key= * NHAP 5 KY TU CUOI CUA KEY CAN XOA : 
@echo.
cscript OSPP.VBS /unpkey:%key%
TIMEOUT 3 >NUL & GOTO MENU
)
