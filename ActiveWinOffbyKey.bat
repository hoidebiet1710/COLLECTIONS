@echo off & color 1f & mode con: cols=100 lines=80
setlocal enabledelayedexpansion
cd /d "%~dp0"
:MENU
cls
ECHO..................................................................
ECHO    	        ACTIVATE WINDOW_OFFICE BY KEY
ECHO.
ECHO..................................................................
ECHO.
ECHO           0. Exit
ECHO.
ECHO           1. Online Window Activation 
ECHO.
ECHO           2. Online Office Activation
ECHO.
ECHO           3. Byphone Windows Activation
ECHO.
ECHO           4. Byphone Office Activation
ECHO.
ECHO..................................................................
ECHO.
set /p choice=Nhap lua chon (1-4): 
ECHO.
if %choice%==0 goto TheEnd
if %choice%==1 goto winonl
if %choice%==2 goto officeonl
if %choice%==3 goto winbyphone
if %choice%==4 goto officebyphone

:winonl
cd %windir%\system32
set /p key=Nhap key Windows: 
cscript //nologo %windir%\system32\slmgr.vbs /rilc >nul 2>&1
cscript //nologo %windir%\system32\slmgr.vbs /upk >nul 2>&1
cscript //nologo %windir%\system32\slmgr.vbs /ckms >nul 2>&1
cscript //nologo %windir%\system32\slmgr.vbs /cpky >nul 2>&1
sc config Winmgmt start=demand & net start Winmgmt
sc config LicenseManager start= auto & net start LicenseManager
sc config wuauserv start= auto & net start wuauserv
cscript //nologo %windir%\system32\slmgr.vbs /ipk %key%
cscript //nologo %windir%\system32\slmgr.vbs /ato
cscript //nologo %windir%\system32\slmgr.vbs /xpr
cscript //nologo %windir%\system32\slmgr.vbs /dli
pause 2>nul & GOTO MENU

:winbyphone
cd %windir%\system32
set /p key=Nhap key Windows: 
cscript //nologo %windir%\system32\slmgr.vbs /rilc >nul 2>&1
cscript //nologo %windir%\system32\slmgr.vbs /upk >nul 2>&1
cscript //nologo %windir%\system32\slmgr.vbs /ckms >nul 2>&1
cscript //nologo %windir%\system32\slmgr.vbs /cpky >nul 2>&1
sc config Winmgmt start=demand & net start Winmgmt
sc config LicenseManager start= auto & net start LicenseManager
sc config wuauserv start= auto & net start wuauserv
cscript //nologo %windir%\system32\slmgr.vbs /ipk %key%
cls
cscript //nologo %windir%\system32\slmgr.vbs /dti>C:\Win.txt & start C:\Win.txt
start "" https://getcid.info/
set /p CID= Nhap confirmation ID : 
cscript //nologo %windir%\system32\slmgr.vbs %CID%
cscript //nologo %windir%\system32\slmgr.vbs /ato
cscript //nologo %windir%\system32\slmgr.vbs /xpr
cscript //nologo %windir%\system32\slmgr.vbs /dli
pause 2>nul & GOTO MENU
)

:OffOnline
cd %windir%\system32
set "versions=4 5 6"
for %%a in (%versions%) do (if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles% (x86)\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles% (x86)\Microsoft Office\Office1%%a"))
set /p key= Nhap Key Office: 
cls
set "versions=4 5 6"
for %%a in (%versions%) do (if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles% (x86)\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles% (x86)\Microsoft Office\Office1%%a"))&cls
cscript OSPP.VBS /inpkey:%key%
cscript OSPP.VBS /act & cscript OSPP.VBS /dstatus
start Excel
pause 2>nul & GOTO MENU
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
