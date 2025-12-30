@ECHO OFF & color 1F
find /i "www.bandicam.com" %windir%\system32\drivers\etc\hosts && goto :exit
%Windir%\System32\FLTMC.exe >nul 2>&1 || (
    ECHO CreateObject^("Shell.Application"^).ShellExecute "%~f0", "%PAR1st%", "", "runas", 1 > "%TEMP%\AdminRun.vbs"
    ECHO CreateObject^("Scripting.filesystemobject"^).DeleteFile ^(WScript.ScriptFullName^) >> "%TEMP%\AdminRun.vbs"
    %Windir%\System32\CSCRIPT.exe /Nologo "%TEMP%\AdminRun.vbs"
    Exit /b
)
:Menu
echo 0.0.0.0 www.bandicam.com
echo 0.0.0.0 bandicam.com
echo 0.0.0.0 www.bandisoft.com
echo 0.0.0.0 bandisoft.com
echo 0.0.0.0 cert.bandicam.com
echo 0.0.0.0 ssl.bandisoft.com
)>> %windir%\system32\drivers\etc\hosts
:exit
( del /q /f "%~f0" >nul 2>&1 & exit /b 0  )
exit