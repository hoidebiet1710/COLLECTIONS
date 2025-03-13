@echo off
REM Check if the system is 64-bit or 32-bit

REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\14.0\Common\FilesPaths" /v "mso.dll" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\16.0\Common\FilesPaths" /v "mso.dll" /f
:: Đổi tên giá trị mso.dll
::@echo off
::for %%V in ("14.0" "16.0") do (
    ::for /f "skip=2 tokens=3*" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\%%~V\Common\FilesPaths" /v "mso.dll" 2^>nul') do (
        ::REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\%%~V\Common\FilesPaths" /v "mso_renamed.dll" /t REG_SZ /d "%%B" /f
        ::REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\%%~V\Common\FilesPaths" /v "mso.dll" /f
    ::)
::pause

IF DEFINED ProgramFiles(x86) (
    REM System is 64-bit
    echo Detected a 64-bit operating system.
    echo Installing AccessDatabaseEngine_X64.exe...
    accessdatabaseengine-2016-x64.exe /quiet /passive /norestart
) ELSE (
    REM System is 32-bit
    echo Detected a 32-bit operating system.
    echo Installing AccessDatabaseEngine.exe...
    accessdatabaseengine-2016-x86.exe /quiet /passive /norestart
)

Pause 2>nul & exit