@echo off
:: Limit the download speed, example: 1M, 500K "0 = unlimited"
set "speedLimit=0"

:: Set the number of parallel downloads
set "parallel=1"

set "_work=%~dp0"
set "_work=%_work:~0,-1%"
set "_batn=%~nx0"
setlocal EnableDelayedExpansion
pushd "!_work!"
set exist=0
if exist "aria2c.exe" set exist=1
for %%i in (aria2c.exe) do @if not "%%~$PATH:i"=="" set exist=1
if %exist%==0 echo.&echo Error: aria2c.exe is not detected&echo.&popd&pause&exit /b
set "destDir=C2R_PerpetualVL2021"
set "uri=temp_aria2.txt"
echo Downloading...
echo.
if exist "%uri%" del /f /q "%uri%"
call :GenTXT TXinfo > "%uri%"
aria2c.exe -x16 -s16 -j%parallel% -c -R --max-overall-download-limit=%speedLimit% -d"%destDir%" -i"%uri%"
if exist "%uri%" del /f /q "%uri%"
echo.
echo Done.
echo Press any key to exit.
popd
pause >nul
exit /b

:GenTXT
set [=&for /f "delims=:" %%s in ('findstr /nbrc:":%~1:\[" /c:":%~1:\]" "!_batn!"') do if defined [ (set /a ]=%%s-3) else set /a [=%%s-1
<"!_batn!" ((for /l %%i in (0 1 %[%) do set /p =)&for /l %%i in (%[% 1 %]%) do (set txt=&set /p txt=&echo(!txt!)) &exit/b

:TXinfo:[
https://officecdn.microsoft.com/db/5030841d-c919-4594-8d2d-84ae4f96e58e/Office/Data/v64_16.0.14332.21007.cab
  out=Office\Data\v64.cab

https://officecdn.microsoft.com/db/5030841d-c919-4594-8d2d-84ae4f96e58e/Office/Data/v64_16.0.14332.21007.cab
  out=Office\Data\v64_16.0.14332.21007.cab

https://officecdn.microsoft.com/db/5030841d-c919-4594-8d2d-84ae4f96e58e/Office/Data/16.0.14332.21007/i641033.cab
  out=Office\Data\16.0.14332.21007\i641033.cab

https://officecdn.microsoft.com/db/5030841d-c919-4594-8d2d-84ae4f96e58e/Office/Data/16.0.14332.21007/s641033.cab
  out=Office\Data\16.0.14332.21007\s641033.cab

https://officecdn.microsoft.com/db/5030841d-c919-4594-8d2d-84ae4f96e58e/Office/Data/16.0.14332.21007/i640.cab
  out=Office\Data\16.0.14332.21007\i640.cab

https://officecdn.microsoft.com/db/5030841d-c919-4594-8d2d-84ae4f96e58e/Office/Data/16.0.14332.21007/s640.cab
  out=Office\Data\16.0.14332.21007\s640.cab

https://officecdn.microsoft.com/db/5030841d-c919-4594-8d2d-84ae4f96e58e/Office/Data/16.0.14332.21007/stream.x64.en-US.dat
  out=Office\Data\16.0.14332.21007\stream.x64.en-US.dat

https://officecdn.microsoft.com/db/5030841d-c919-4594-8d2d-84ae4f96e58e/Office/Data/16.0.14332.21007/stream.x64.x-none.dat
  out=Office\Data\16.0.14332.21007\stream.x64.x-none.dat

:TXinfo:]
exit /b
