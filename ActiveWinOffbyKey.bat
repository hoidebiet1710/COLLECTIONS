CHCP 1258 >nul 2>&1
CHCP 65001 >nul 2>&1
@echo off & color 1f
setlocal enabledelayedexpansion
Title ACTIVATION WINDOW_OFFICE BY THNAM 0942.433.452
mode con: cols=100 lines=80
CHCP 65001 >nul 2>&1
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo  Run CMD as Administrator...
    goto goUAC 
) else (
 goto goADMIN )
 
:goUAC
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:goADMIN
    pushd "%~dp0"
    cd /d "%~dp0"

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
ECHO           1. FOR WINDOW WITH ONLINE KEY 
ECHO.
ECHO           2. FOR WINDOW WITH BYPHONE KEY
ECHO.
ECHO           3. FOR OFFICE WITH ONLINE KEY
ECHO.
ECHO           4. FOR OFFICE WITH BYPHONE KEY
ECHO.
ECHO..................................................................
ECHO.
SET /P M=      Choose a Number (Ex: 2) then press ENTER:   
ECHO.
IF %M%==0 GOTO TheEnd
IF %M%==1 GOTO WinOnline
IF %M%==2 GOTO Winbyphone
IF %M%==3 GOTO OffOnline
IF %M%==4 GOTO Offbyphone

:WinOnline
cd %windir%\system32
set /p k1= Nhap Key : 
cls
cscript slmgr.vbs /rilc >nul
cscript slmgr.vbs /upk >nul
cscript slmgr.vbs /cpky >nul
cscript slmgr.vbs /ckms >nul
sc config Winmgmt start=demand & net start Winmgmt
sc config LicenseManager start= auto & net start LicenseManager
sc config wuauserv start= auto & net start wuauserv
cls
cscript slmgr.vbs /ipk %k1% >nul & cscript slmgr.vbs -ato
cscript //nologo %windir%\system32\slmgr.vbs /xpr & cscript //nologo %windir%\system32\slmgr.vbs /dli
pause >nul
GOTO MENU
)

:Winbyphone
cd %windir%\system32
set /p k1= Nhap Key : 
cls
cscript slmgr.vbs /rilc >nul
cscript slmgr.vbs /upk >nul
cscript slmgr.vbs /cpky >nul
cscript slmgr.vbs /ckms >nul
sc config Winmgmt start=demand & net start Winmgmt
sc config LicenseManager start= auto & net start LicenseManager
sc config wuauserv start= auto & net start wuauserv
cscript slmgr.vbs /ipk %k1% >nul
cls
cscript slmgr.vbs /dti>C:\Win.txt & start C:\Win.txt
start "" https://getcid.info/
set /p CID= Nhap confirmation ID : 
cscript slmgr.vbs /atp %CID% & cscript slmgr.vbs /ato
cscript //nologo %windir%\system32\slmgr.vbs /xpr & cscript //nologo %windir%\system32\slmgr.vbs /dli
pause >nul
GOTO MENU
)

:OffOnline
cd %windir%\system32
for %%a in (4,5,6) do (if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles% (x86)\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles% (x86)\Microsoft Office\Office1%%a"))
set /p key= Nhap Key Office: 
cls
for %%a in (4,5,6) do (if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles% (x86)\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles% (x86)\Microsoft Office\Office1%%a"))&cls
cscript OSPP.VBS /inpkey:%key%
cscript ospp.vbs /act & cscript OSPP.VBS /dstatus
start Excel
pause >nul
GOTO MENU
)

:Offbyphone
cd %windir%\system32
for %%a in (4,5,6) do (if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles% (x86)\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles% (x86)\Microsoft Office\Office1%%a"))
set /p key= Nhap Key Office: 
for %%a in (4,5,6) do (if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles% (x86)\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles% (x86)\Microsoft Office\Office1%%a"))&cls
cscript OSPP.VBS /inpkey:%key%
cscript ospp.vbs /dinstid>C:\Office.txt & start C:\Office.txt
start "" https://getcid.info/
set /p CID= Nhap confirmation ID :
cscript ospp.vbs /actcid:%CID% & cscript ospp.vbs /act
cscript ospp.vbs /dstatus >>C:\Office.txt & start C:\Office.txt
start Excel
pause >nul
GOTO MENU
)

:TheEnd
@echo.
@echo          THANK FOR USING THIS TOOL BY THNAM 0942 433 452
@echo.
del "%%~f0" & exit /b 0
