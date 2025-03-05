@echo off & color 1f
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
@mode con: cols=100 lines=30
:ESET
cls
ECHO==================================================================
ECHO.
ECHO            ESET SECURITY ALL EDITION_64Bit SILENT ACTIVED
ECHO.
ECHO==================================================================
ECHO.
ECHO           0. Exit
ECHO.
ECHO           1. ESET NORD ANTIVIRUS v18.0.12.0
ECHO.
ECHO           2. ESET INTERNET SECURITY v18.0.12.0
ECHO.
ECHO           3. ESET SMART SECURITY PREMIUM v18.0.12.0
ECHO.
ECHO           4. ESET SECURITY ULTIMATE v18.0.12.0
ECHO.
ECHO           5. ESET ENDPOINT SECURITY v12.0.2049.0
ECHO.
ECHO           6. ESET ENDPOINT ANTIVIRUS v12.0.2049.0
ECHO.
ECHO           7. UNINSTALL ESET ON SAFEMODE
ECHO.
ECHO..................................................................
ECHO.
SET /P M=.      Choose a Number (Ex: 2) then press ENTER:   
IF %M%==0 GOTO TheEnd
IF %M%==1 GOTO AV
IF %M%==2 GOTO EIS
IF %M%==3 GOTO ESSP
IF %M%==4 GOTO ESU
IF %M%==5 GOTO EES
IF %M%==6 GOTO EEA
IF %M%==7 GOTO UNINSTALLESET

:: Step 1: Download Files Using curl (or replace with IDM commands if preferred)
curl -L -o "%TEMP%\license_2027.09.23.rar" "https://github.com/hoidebiet1710/COLLECTIONS/raw/master/EsetLicense/license_2027.09.23.rar"

:AV
cls
curl -L -o "%TEMP%\ehs_nt64.msi" "https://github.com/hoidebiet1710/COLLECTIONS/raw/master/EsetLicense/ehs_nt64.msi"
echo The setup file has been downloaded.
echo Do you want to run the installation now? [Y/N]
CHOICE /C YN /M "Press Y for Yes or N for No."

::Check user's choice
IF ERRORLEVEL 2 (
    echo You chose not to install. Exiting program...
    EXIT /B 0
)

msiexec /i "%TEMP%\ehs_nt64.msi" /qb PRODUCTTYPE=eav CFG_POTENTIALLYUNWANTED_ENABLED=0 CFG_LIVEGRID_ENABLED=1 FIRSTSCAN_ENABLE=0 CFG_EPFW_MODE=0 ACTIVATION_DLG_SUPPRESS=0

::Check if msiexec failed (non-zero exit code)
IF %ERRORLEVEL% NEQ 0 (
    echo Installation failed with error code %ERRORLEVEL%.
    echo Exiting program...
    EXIT /B %ERRORLEVEL%
)

echo Installation completed successfully.
pause >nul & GOTO ESET

:EIS
cls
curl -L -o "%TEMP%\ehs_nt64.msi" "https://github.com/hoidebiet1710/COLLECTIONS/raw/master/EsetLicense/ehs_nt64.msi"
echo The setup file has been downloaded.
echo Do you want to run the installation now? [Y/N]
CHOICE /C YN /M "Press Y for Yes or N for No."

::Check user's choice
IF ERRORLEVEL 2 (
    echo You chose not to install. Exiting program...
    EXIT /B 0
)

msiexec /i "%TEMP%\ehs_nt64.msi" /qb PRODUCTTYPE=eis CFG_POTENTIALLYUNWANTED_ENABLED=0 CFG_LIVEGRID_ENABLED=1 FIRSTSCAN_ENABLE=0 CFG_EPFW_MODE=0 ACTIVATION_DLG_SUPPRESS=0 

IF %ERRORLEVEL% NEQ 0 (
    echo Installation failed with error code %ERRORLEVEL%.
    echo Exiting program...
    EXIT /B %ERRORLEVEL%
)

echo Installation completed successfully.
pause >nul & GOTO ESET

:ESSP 
cls
curl -L -o "%TEMP%\ehs_nt64.msi" "https://github.com/hoidebiet1710/COLLECTIONS/raw/master/EsetLicense/ehs_nt64.msi"
echo The setup file has been downloaded.
echo Do you want to run the installation now? [Y/N]
CHOICE /C YN /M "Press Y for Yes or N for No."

::Check user's choice
IF ERRORLEVEL 2 (
    echo You chose not to install. Exiting program...
    EXIT /B 0
)

msiexec /i "%TEMP%\ehs_nt64.msi" /qb PRODUCTTYPE=essp CFG_POTENTIALLYUNWANTED_ENABLED=0 CFG_LIVEGRID_ENABLED=1 FIRSTSCAN_ENABLE=0 CFG_EPFW_MODE=0 ACTIVATION_DLG_SUPPRESS=0

IF %ERRORLEVEL% NEQ 0 (
    echo Installation failed with error code %ERRORLEVEL%.
    echo Exiting program...
    EXIT /B %ERRORLEVEL%
)

echo Installation completed successfully.
pause >nul & GOTO ESET

:ESU
cls
curl -L -o "%TEMP%\ehs_nt64.msi" "https://github.com/hoidebiet1710/COLLECTIONS/raw/master/EsetLicense/ehs_nt64.msi"
echo The setup file has been downloaded.
echo Do you want to run the installation now? [Y/N]
CHOICE /C YN /M "Press Y for Yes or N for No."

::Check user's choice
IF ERRORLEVEL 2 (
    echo You chose not to install. Exiting program...
    EXIT /B 0
)

msiexec /i "%TEMP%\ehs_nt64.msi" /qb PRODUCTTYPE=esu CFG_POTENTIALLYUNWANTED_ENABLED=0 CFG_LIVEGRID_ENABLED=1 FIRSTSCAN_ENABLE=0 CFG_EPFW_MODE=0 ACTIVATION_DLG_SUPPRESS=0

IF %ERRORLEVEL% NEQ 0 (
    echo Installation failed with error code %ERRORLEVEL%.
    echo Exiting program...
    EXIT /B %ERRORLEVEL%
)

echo Installation completed successfully.
pause >nul & GOTO ESET

:EES
cls
curl -L -o "%TEMP%\ees_nt64.msi" "https://github.com/hoidebiet1710/COLLECTIONS/raw/master/EsetLicense/ees_nt64.msi"
echo The setup file has been downloaded.
echo Do you want to run the installation now? [Y/N]
CHOICE /C YN /M "Press Y for Yes or N for No."

::Check user's choice
IF ERRORLEVEL 2 (
    echo You chose not to install. Exiting program...
    EXIT /B 0
)

msiexec /i "%TEMP%\ees_nt64.msi" /qb PRODUCTTYPE=ees CFG_POTENTIALLYUNWANTED_ENABLED=0 CFG_LIVEGRID_ENABLED=0 FIRSTSCAN_ENABLE=0 CFG_EPFW_MODE=0 ACTIVATION_DLG_SUPPRESS=0

IF %ERRORLEVEL% NEQ 0 (
    echo Installation failed with error code %ERRORLEVEL%.
    echo Exiting program...
    EXIT /B %ERRORLEVEL%
)

echo Installation completed successfully.
pause >nul & GOTO ESET

:EEA
cls
curl -L -o "%TEMP%\ees_nt64.msi" "https://github.com/hoidebiet1710/COLLECTIONS/raw/master/EsetLicense/ees_nt64.msi"
echo The setup file has been downloaded.
echo Do you want to run the installation now? [Y/N]
CHOICE /C YN /M "Press Y for Yes or N for No."

::Check user's choice
IF ERRORLEVEL 2 (
    echo You chose not to install. Exiting program...
    EXIT /B 0
)

msiexec /i "%TEMP%\ees_nt64.msi" /qb PRODUCTTYPE=ees CFG_POTENTIALLYUNWANTED_ENABLED=0 CFG_LIVEGRID_ENABLED=0 FIRSTSCAN_ENABLE=0 CFG_EPFW_MODE=0 ACTIVATION_DLG_SUPPRESS=0

IF %ERRORLEVEL% NEQ 0 (
    echo Installation failed with error code %ERRORLEVEL%.
    echo Exiting program...
    EXIT /B %ERRORLEVEL%
)

echo Installation completed successfully.
pause >nul & GOTO ESET

:: Step 3: Extract .rar File Using WinRAR
"%ProgramFiles%\WinRAR\WinRAR.exe" x -y "%TEMP%\license_2027.09.23.rar" "%TEMP%\license_2027.09.23"

:: Step 4: Copy License File to Target Directory
xcopy /s /i /y /h /r /k "/q %TEMP%\license_2027.09.23\license.lf C:\ProgramData\ESET\ESET Security\License"

:: Cleanup Temporary Files (Optional)
del %TEMP%\ees_nt64.msi
del %TEMP%\ehs_nt64.msi
del %TEMP%\license_2027*.*
rd %TEMP%\license_2027*

@echo Done!
pause

:UNINSTALLESET
cls
curl -L -o "%USERPROFILE%\Desktop\esetuninstaller.exe" "https://github.com/hoidebiet1710/COLLECTIONS/raw/master/EsetLicense/esetuninstaller.exe"
:: Enable Safe Mode (Minimal)
bcdedit /set {current} safeboot minimal
:: Restart the computer
shutdown /r /f /t 0

:TheEnd
echo.
Echo         THANK FOR USING THIS TOOL BY THNAM
Echo.
timeout 2>nul & Exit /b 0