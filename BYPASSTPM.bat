@echo off & color 1f
setlocal enabledelayedexpansion
cd /d "%~dp0"
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /v "BranchName" /t REG_SZ /d "Dev" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /v "Ring" /t REG_SZ /d "External" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /v "ContentType" /t REG_SZ /d "Mainline" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /v "UIContentType" /t REG_SZ /d "Mainline" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /v "UIBranch" /t REG_SZ /d "Dev" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /v "UIRing" /t REG_SZ /d "External" /f
Reg.exe add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassCPUCheck" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassStorageCheck" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassNRO" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\Setup\LabConfig" /v "OOBEBypassNRO" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassMSARequirement" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\Setup\MoSetup" /v "BypassCPUCheck" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\Setup\MoSetup" /v "BypassStorageCheck" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\Setup\MoSetup" /v "BypassRAMCheck" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\Setup\MoSetup" /v "BypassTPMCheck" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\Setup\MoSetup" /v "BypassSecureBootCheck" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /t REG_DWORD /d "1" /f
del "%%~f0" & Exit
