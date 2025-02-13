@echo off & color 1f & mode con: cols=100 lines=80
setlocal enabledelayedexpansion
cd /d "%~dp0"
:ACTIVEWINOFF
cls
ECHO................................................
ECHO    	    ACTIVATE WINDOW_OFFICE BY KEY
ECHO.
ECHO................................................
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
if %choice%==1 goto winonline
if %choice%==2 goto officeonline
if %choice%==3 goto winbyphone
if %choice%==4 goto officebyphone

:winonline
cd %windir%\system32
set /p keyWin=Nhap key Windows: 
cscript //nologo %windir%\system32\slmgr.vbs /rilc >nul 2>&1
cscript //nologo %windir%\system32\slmgr.vbs /upk >nul 2>&1
cscript //nologo %windir%\system32\slmgr.vbs /ckms >nul 2>&1
cscript //nologo %windir%\system32\slmgr.vbs /cpky >nul 2>&1
sc config Winmgmt start=demand & net start Winmgmt
sc config LicenseManager start= auto & net start LicenseManager
sc config wuauserv start= auto & net start wuauserv
cscript //nologo %windir%\system32\slmgr.vbs /ipk %keyWin%
cscript //nologo %windir%\system32\slmgr.vbs /ato
cscript //nologo %windir%\system32\slmgr.vbs /xpr
cscript //nologo %windir%\system32\slmgr.vbs /dli
pause 2>nul & GOTO ACTIVEWINOFF

:winbyphone
cd %windir%\system32
set /p keyWin=Nhap key Windows: 
cscript //nologo %windir%\system32\slmgr.vbs /rilc >nul 2>&1
cscript //nologo %windir%\system32\slmgr.vbs /upk >nul 2>&1
cscript //nologo %windir%\system32\slmgr.vbs /ckms >nul 2>&1
cscript //nologo %windir%\system32\slmgr.vbs /cpky >nul 2>&1
sc config Winmgmt start=demand & net start Winmgmt
sc config LicenseManager start= auto & net start LicenseManager
sc config wuauserv start= auto & net start wuauserv
cscript //nologo %windir%\system32\slmgr.vbs /ipk %keyWin%
cls
cscript //nologo %windir%\system32\slmgr.vbs /dti>C:\Win.txt & start C:\Win.txt
start "" https://getcid.info/
set /p CID= Nhap confirmation ID : 
cscript //nologo %windir%\system32\slmgr.vbs %CID%
cscript //nologo %windir%\system32\slmgr.vbs /ato
cscript //nologo %windir%\system32\slmgr.vbs /xpr
cscript //nologo %windir%\system32\slmgr.vbs /dli
pause 2>nul & GOTO ACTIVEWINOFF
)

:officeonline
cd /d "%~dp0"
for %%a in (4,5,6) do (if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles% (x86)\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles% (x86)\Microsoft Office\Office1%%a"))
set /p keyOffice= Nhap Key Office: 
cls
for %%a in (4,5,6) do (if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles% (x86)\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles% (x86)\Microsoft Office\Office1%%a"))&cls
cscript OSPP.VBS /inpkey:%keyOffice%
cscript OSPP.VBS /act & cscript OSPP.VBS /dstatus
start Excel
pause 2>nul & GOTO ACTIVEWINOFF
)

:officebyphone
cd /d "%~dp0"
for %%a in (4,5,6) do (if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles% (x86)\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles% (x86)\Microsoft Office\Office1%%a"))
set /p keyOffice= Nhap Key Office: 
for %%a in (4,5,6) do (if exist "%ProgramFiles%\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles%\Microsoft Office\Office1%%a")
If exist "%ProgramFiles% (x86)\Microsoft Office\Office1%%a\ospp.vbs" (cd /d "%ProgramFiles% (x86)\Microsoft Office\Office1%%a"))&cls
cscript OSPP.VBS /inpkey:%keyOffice%
cscript ospp.vbs /dinstid>C:\Office.txt & start C:\Office.txt
start "" https://getcid.info/
set /p CID= Nhap confirmation ID :
cscript ospp.vbs /actcid:%CID% & cscript ospp.vbs /act
cscript ospp.vbs /dstatus >>C:\Office.txt & start C:\Office.txt
start Excel
pause >nul & GOTO ACTIVEWINOFF
)

:TheEnd
@echo.
@echo          THANK FOR USING THIS TOOL BY THNAM 0942 433 452
@echo.
del "%~f0" & exit /b 0
