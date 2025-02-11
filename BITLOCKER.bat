@echo off & color 1f
setlocal enabledelayedexpansion
cd %windir%\system32
echo Checking BitLocker status on all volumes...

:: Loop through all fixed drives (C: to Z:)
for /f "skip=1 tokens=1" %%d in ('wmic logicaldisk where "DriveType=3" get DeviceID') do (
    manage-bde -status %%d: | find "Percentage Encrypted:" > nul
    if not errorlevel 1 (
        echo Drive %%d: is encrypted.
        echo Turning off BitLocker on drive %%d:...
        manage-bde -off %%d:
    ) else (
        echo Drive %%d: is not encrypted or does not exist.
    )
)

:: Stop the BitLocker service

echo Disable BitLocker
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\FVE" /v "RDVConfigureBDE" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\FVE" /v "RDVAllowBDE" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\FVE" /v "RDVDenyCrossOrg" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\FVE" /v "RDVDisableBDE" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\FVE" /v "OSAllowedHardwareEncryptionAlgorithms" /t REG_DWORD /d "0" /f
echo.
echo.Disable BitLocker sevice
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BDESVC" /v "Start" /t REG_DWORD /d 4 /f
echo.
echo Hide BitLocker Drive Encryption item from Control Panel
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisallowCpl" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowCpl" /v 1 /t REG_SZ /d "BitLocker Drive Encryption" /f
echo.
echo Remove Turn on BitLocker form Context Menu
reg add "HKCR\Drive\shell\change-passphrase" /v "ProgrammaticAccessOnly" /t REG_SZ /f
reg add "HKCR\Drive\shell\change-pin" /v "ProgrammaticAccessOnly" /t REG_SZ /f
reg add "HKCR\Drive\shell\encrypt-bde" /v "ProgrammaticAccessOnly" /t REG_SZ /f
reg add "HKCR\Drive\shell\encrypt-bde-elev" /v "ProgrammaticAccessOnly" /t REG_SZ /f
reg add "HKCR\Drive\shell\manage-bde" /v "ProgrammaticAccessOnly" /t REG_SZ /f
reg add "HKCR\Drive\shell\resume-bde" /v "ProgrammaticAccessOnly" /t REG_SZ /f
reg add "HKCR\Drive\shell\resume-bde-elev" /v "ProgrammaticAccessOnly" /t REG_SZ /f
reg add "HKCR\Drive\shell\unlock-bde" /v "ProgrammaticAccessOnly" /t REG_SZ /f
echo All operations completed.
del "%%~f0" & exit /b 0
