CHCP 1258 >nul 2>&1
CHCP 65001 >nul 2>&1
@echo off & color 1f
setlocal enabledelayedexpansion
Title ACTIVATION AND SETUP OFFICE ONLINE BY THNAM 0942.433.452
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
ECHO           1. SETUP ALL IN ONE OFFICE ONLINE
ECHO.
ECHO           2. SETUP ALL IN ONE PROJECT_VISIO ONLINE
ECHO.
ECHO..................................................................
ECHO.
SET /P M=      Choose a Number (Ex: 2) then press ENTER:   
ECHO.
IF %M%==0 GOTO TheEnd
IF %M%==1 GOTO SETUPOFFICE
IF %M%==2 GOTO ProjectVisio

:SETUPOFFICE
cls
cd %windir%\system32
:: Hiển thị thông báo cho người dùng
echo Chọn OfficeClientEdition bạn muốn chọn:
echo     1. 32 bit
echo     2. 64 bit

:: Nhập lựa chọn từ người dùng
set /p CLIENT_CHOICE="Nhập số thứ tự (1-2): "
cls
if "%CLIENT_CHOICE%"=="1" (
    echo Bạn đã chọn phiên bản 32 bit.
    set OfficeClientEdition=32
    goto continue
) else if "%CLIENT_CHOICE%"=="2" (
    echo Bạn đã chọn phiên bản 64 bit.
    set OfficeClientEdition=64
    goto continue
) else (
    echo Lựa chọn không hợp lệ, vui lòng thử lại!
    timeout /t 2 >nul
    GOTO MENU
)
:continue
echo.

:: Danh sách Product ID
echo DANH SÁCH Product ID:
echo.
echo      1. ProPlus2024Volume
echo      2. ProPlus2024Retail
echo      3. Standard2024Volume
echo      4. ProPlus2021Volume
echo      5. Standard2021Volume
echo      6. ProPlus2021Retail
echo      7. Standard2021Retail
echo      8. HomeBusiness2021Retail
echo      9. HomeStudent2021Retail
echo      10. ProPlus2019Volume
echo      11. Standard2019Volume
echo      12. ProPlus2019Retail
echo      13. Standard2019Retail
echo      14. HomeBusiness2019Retail
echo      15. HomeStudent2019Retail
echo      16. O365ProPlusRetail
echo      17. O365BusinessRetail
echo      18. O365SmallBusPremRetail
echo      19. O365HomePremRetail
echo      20. ProplusRetail
echo      21. StandardRetail
echo      22. HomeBusinessRetail
echo      23. HomeStudentRetail
echo.

:: Nhập Product ID
set /p PRODUCT_CHOICE="Nhập số thứ tự của ProductID bạn muốn chọn (1-25): "

:: Gán giá trị cho PRODUCT_ID dựa trên lựa chọn
set PRODUCT_ID=
set PIDKEY_ID=
set CHANNEL_ID=

if "%PRODUCT_CHOICE%"=="1" (
    set PRODUCT_ID=ProPlus2024Volume
    set PIDKEY_ID=XJ2XN-FW8RK-P4HMP-DKDBV-GCVGB
	set CHANNEL_ID=PerpetualVL2024
) else if "%PRODUCT_CHOICE%"=="2" (
    set PRODUCT_ID=ProPlus2024Retail
	set CHANNEL_ID=Current
) else if "%PRODUCT_CHOICE%"=="3" (
    set PRODUCT_ID=Standard2024Volume
    set PIDKEY_ID=V28N4-JG22K-W66P8-VTMGK-H6HGR
	set CHANNEL_ID=PerpetualVL2024
) else if "%PRODUCT_CHOICE%"=="4" (
    set PRODUCT_ID=ProPlus2021Volume
    set PIDKEY_ID=FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH
	set CHANNEL_ID=PerpetualVL2021
) else if "%PRODUCT_CHOICE%"=="5" (
    set PRODUCT_ID=Standard2021Volume
    set PIDKEY_ID=KDX7X-BNVR8-TXXGX-4Q7Y8-78VT3
	set CHANNEL_ID=PerpetualVL2021
) else if "%PRODUCT_CHOICE%"=="6" (
    set PRODUCT_ID=ProPlus2021Retail
	set CHANNEL_ID=Current
) else if "%PRODUCT_CHOICE%"=="7" (
    set PRODUCT_ID=Standard2021Retail
	set CHANNEL_ID=Current
) else if "%PRODUCT_CHOICE%"=="8" (
    set PRODUCT_ID=HomeBusiness2021Retail
	set CHANNEL_ID=Current
) else if "%PRODUCT_CHOICE%"=="9" (
    set PRODUCT_ID=HomeStudent2021Retail
	set CHANNEL_ID=Current	
) else if "%PRODUCT_CHOICE%"=="10" (
    set PRODUCT_ID=ProPlus2019Volume
    set PIDKEY_ID=NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP
	set CHANNEL_ID=PerpetualVL2019
) else if "%PRODUCT_CHOICE%"=="11" (
    set PRODUCT_ID=Standard2019Volume
    set PIDKEY_ID=6NWWJ-YQWMR-QKGCB-6TMB3-9D9HK
	set CHANNEL_ID=PerpetualVL2019
) else if "%PRODUCT_CHOICE%"=="12" (
    set PRODUCT_ID=ProPlus2019Retail
	set CHANNEL_ID=Current
) else if "%PRODUCT_CHOICE%"=="13" (
    set PRODUCT_ID=Standard2019Retail
	set CHANNEL_ID=Current
) else if "%PRODUCT_CHOICE%"=="14" (
    set PRODUCT_ID=HomeBusiness2019Retail
	set CHANNEL_ID=Current
) else if "%PRODUCT_CHOICE%"=="15" (
    set PRODUCT_ID=HomeStudent2019Retail
	set CHANNEL_ID=Current
) else if "%PRODUCT_CHOICE%"=="16" (
    set PRODUCT_ID=O365ProPlusRetail
	set CHANNEL_ID=Current
) else if "%PRODUCT_CHOICE%"=="17" (
    set PRODUCT_ID=O365BusinessRetail
	set CHANNEL_ID=Current
) else if "%PRODUCT_CHOICE%"=="18" (
    set PRODUCT_ID=O365SmallBusPremRetail
	set CHANNEL_ID=Current
) else if "%PRODUCT_CHOICE%"=="19" (
    set PRODUCT_ID=O365HomePremRetail
	set CHANNEL_ID=Current
) else if "%PRODUCT_CHOICE%"=="20" (
    set PRODUCT_ID=ProPlusRetail
	set CHANNEL_ID=Current
) else if "%PRODUCT_CHOICE%"=="21" (
    set PRODUCT_ID=StandardRetail
	set CHANNEL_ID=Current
) else if "%PRODUCT_CHOICE%"=="22" (
    set PRODUCT_ID=HomeBusinessRetail
	set CHANNEL_ID=Current
) else if "%PRODUCT_CHOICE%"=="23" (
    set PRODUCT_ID=HomeStudentRetail
	set CHANNEL_ID=Current
) else (
    echo Lua chon khong hop le!
    timeout 2 & GOTO MENU
)
cls
:: Kiểm tra nếu PRODUCT_ID chưa được gán
if not defined PRODUCT_ID (
    echo Lựa chọn không hợp lệ! Vui lòng chọn một số từ 1 đến 25.
) else (
    echo Bạn đã chọn Product ID: %PRODUCT_ID%
)
echo.

:: Danh sách Language ID
echo DANH SÁCH Language ID:
echo.
echo      1. English (en-us)
echo      2. Vietnamese (vi-vn)
echo.

:: Nhập Language ID
set /p LANGUAGE_CHOICE="Nhập số thứ tự của Language ID bạn muốn chọn (1-2): "
if "%LANGUAGE_CHOICE%"=="1" set LANGUAGE_ID=en-us
if "%LANGUAGE_CHOICE%"=="2" set LANGUAGE_ID=vi-vn
cls
if not defined LANGUAGE_ID (
    echo Lựa chọn không hợp lệ! Vui lòng chạy lại.
    exit /b
)

echo Bạn đã chọn Language ID: %LANGUAGE_ID%
echo.
setlocal enabledelayedexpansion
:: Danh sách các ứng dụng Office
set APP_LIST=Excel Word Access Publisher Groove Lync OneNote Outlook PowerPoint OneDrive Teams

:: Biến để lưu danh sách loại trừ
set EXCLUDE_LIST=

:: Hiển thị danh sách các ứng dụng
echo Danh sách các ứng dụng:
set i=1
for %%a in (%APP_LIST%) do (
    echo     !i!. %%a
    set /a i+=1
)

:: Nhập các ứng dụng cần loại trừ
set /p apps_to_exclude=Nhập các số ứng dụng cần loại trừ (cách nhau bằng dấu cách): 

:: Duyệt qua các lựa chọn và lưu vào biến EXCLUDE_LIST
for %%i in (%apps_to_exclude%) do (
    set EXCLUDE_LIST=!EXCLUDE_LIST! %%i
)

:: Đường dẫn lưu trữ tạm thời cho file config.xml và setup.exe
set "tempDir=%TEMP%\OfficeSetup"
set "configFile=%tempDir%\config.xml"
set "setupFile=%tempDir%\setup.exe"
set "setupUrl=http://officecdn.microsoft.com/pr/wsus/setup.exe"

:: Tạo thư mục tạm nếu chưa tồn tại
if not exist "%tempDir%" (
    mkdir "%tempDir%"
)

:: Tạo file config.xml với các ứng dụng loại trừ
(
    echo ^<Configuration^>
    echo     ^<Add OfficeClientEdition="%OfficeClientEdition%" Channel="%CHANNEL_ID%"^>
    echo         ^<Product ID="%PRODUCT_ID%" PIDKEY="%PIDKEY_ID%"^>
    echo             ^<Language ID="%LANGUAGE_ID%" /^>
) > "%configFile%"

:: Thêm các ứng dụng bị loại trừ vào file config.xml
for %%e in (%EXCLUDE_LIST%) do (
    set j=1
    for %%a in (%APP_LIST%) do (
        if "!j!"=="%%e" (
            echo             ^<ExcludeApp ID="%%a" /^> >> "%configFile%"
        )
        set /a j+=1
    )
)

:: Kết thúc cấu hình xml
(
    echo         ^</Product^>
    echo     ^</Add^>
    echo     ^<Display Level="Full" AcceptEULA="TRUE" /^>
    echo     ^<Updates Enabled="TRUE" /^>
    echo     ^<Property Name="AUTOACTIVATE" Value="1" /^>
    echo ^</Configuration^>
) >> "%configFile%"

echo File %configFile% > NUL 2>&1 đã được tạo thành công

:: Tạo job BITS và thêm file vào job
echo Đang bắt đầu tải file từ %setupUrl%...
if exist "%setupFile%" del /f /q "%setupFile%"
bitsadmin /transfer "DownloadSetup" /download /priority normal "%setupUrl%" "%setupFile%"

:: Kiểm tra xem file setup.exe đã được tải về thành công hay chưa
if not exist "%setupFile%" (
    echo Lỗi: Không thể tải file setup.exe.
    pause
    exit /b 1
)

:: Hiển thị toàn bộ lựa chọn của người dùng
echo Các lựa chọn của bạn:
echo             Phiên bản: %OfficeClientEdition%
echo             Kênh: %CHANNEL_ID%
echo             Sản phẩm : %PRODUCT_ID%
echo             Ngôn ngữ: %LANGUAGE_ID%
echo             Các ứng dụng đã loại trừ: 
if defined EXCLUDE_LIST (
    for %%e in (%EXCLUDE_LIST%) do (
        set j=1
        for %%a in (%APP_LIST%) do (
            if "!j!"=="%%e" echo - %%a
            set /a j+=1
        )
    )
) else (
    echo Không có ứng dụng nào được chọn để loại trừ
)
echo.
set /p confirm=Xác nhận cài đặt (y/n): 
if /i '!confirm!'=='y' goto INSTALL
if /i '!confirm!'=='n' goto MENU
echo Lựa chọn không hợp lệ. Vui lòng chọn y hoặc n.
pause & GOTO MENU

:INSTALL
cls
echo Bắt đầu cài đặt Office với các ứng dụng đã lựa chọn...
"%setupFile%" /configure "%configFile%"
echo.

:: Xóa file config.xml và setup.exe
del /f /q "%configFile%" & del /f /q "%setupFile%" & rmdir /s /q "%tempDir%"
echo.
echo     OFFICE DA DUOC CAI DAT HOAN TAT!.
echo.
set /p choice_PROJECTVISIO=Bạn có muốn cài đặt thêm Project và Visio không? (Y/N): 
if /i "%choice_PROJECTVISIO%"=="Y" (
    goto ProjectVisio
) else if /i "%choice_PROJECTVISIO%"=="N" (
    timeout 3 & GOTO MENU
) else (
    echo Lựa chọn không hợp lệ. Vui lòng nhập Y hoặc N.
    timeout /t 2 >nul & GOTO MENU
)

:ProjectVisio
cls
cd %windir%\system32
:: Hiển thị thông báo cho người dùng
echo Chọn OfficeClientEdition bạn muốn chọn:
echo     1. 32 bit
echo     2. 64 bit

:: Nhập lựa chọn từ người dùng
set /p CLIENT_CHOICE="Nhập số thứ tự (1-2): "
cls
if "%CLIENT_CHOICE%"=="1" (
    echo Bạn đã chọn phiên bản 32 bit.
    set OfficeClientEdition=32
    goto continueProjectVisio
) else if "%CLIENT_CHOICE%"=="2" (
    echo Bạn đã chọn phiên bản 64 bit.
    set OfficeClientEdition=64
    goto continueProjectVisio
) else (
    echo Lựa chọn không hợp lệ, vui lòng thử lại!
    timeout /t 2 >nul
    GOTO MENU
)
:continueProjectVisio
echo.
:: Danh sách Language ID
echo DANH SÁCH Language ID:
echo.
echo      1. English (en-us)
echo      2. Vietnamese (vi-vn)
echo.

:: Nhập Language ID
set /p LANGUAGE_CHOICE="Nhập số thứ tự của Language ID bạn muốn chọn (1-2): "
if "%LANGUAGE_CHOICE%"=="1" set LANGUAGE_ID=en-us
if "%LANGUAGE_CHOICE%"=="2" set LANGUAGE_ID=vi-vn
cls
if not defined LANGUAGE_ID (
    echo Lựa chọn không hợp lệ! Vui lòng chạy lại.
    exit /b
)

echo Bạn đã chọn Language ID: %LANGUAGE_ID%
echo.

:: Danh sách Product ID ProjectVisio
echo DANH SÁCH Product ID ProjectVisio:
echo.
echo      1. ProjectPro2024Volume_VisioPro2024Volume
echo      2. ProjectPro2024Retail_VisioPro2024Retail
echo      3. ProjectStd2024Volume_VisioStd2024Volume
echo      4. ProjectPro2021Volume_VisioPro2021Volume
echo      5. ProjectStd2021Volume_VisioStd2021Volume
echo      6. ProjectPro2021Retail_VisioPro2021Retail
echo      7. ProjectStd2021Retail_VisioStd2021Retail
echo      8. ProjectPro2019Volume_VisioPro2019Volume
echo      9. ProjectStd2019Volume_VisioStd2019Volume
echo      10. ProjectPro2019Retail_VisioPro2019Retail
echo      11. ProjectStd2019Retail_VisioStd2019Retail
echo      12. ProjectProRetail_VisioProRetail
echo      13. ProjectStdRetail_VisioStdRetail
echo.

:: Nhập lựa chọn Product ID
set /p choice="Nhập số thứ tự Product ID Project_Visio bạn muốn cài đặt (1-13): "
if %choice% lss 1 if %choice% gtr 13 (
    echo Lựa chọn không hợp lệ.
    exit /b
)
cls
echo Bạn đã chọn là : %choice% %product_id%

:: Tạo biến cho Product ID, Project ID và Visio ID, PIDKEY
set "product_id="
set "project_id="
set "visio_id="
set "project_pidkey="
set "visio_pidkey="
set "CHANNELPROJECTVISIO_id="

:: Tách Project ID và Visio ID với PIDKEY tương ứng
if %choice%==1 (
    set product_id=ProjectPro2024Volume_VisioPro2024Volume
    set project_id=ProjectPro2024Volume
    set visio_id=VisioPro2024Volume
    set project_pidkey=FQQ23-N4YCY-73HQ3-FM9WC-76HF4
    set visio_pidkey=B7TN8-FJ8V3-7QYCP-HQPMV-YY89G
	set CHANNELPROJECTVISIO_id=PerpetualVL2024
)
if %choice%==2 (
    set product_id=ProjectPro2024Retail_VisioPro2024Retail
    set project_id=ProjectPro2024Retail
    set visio_id=VisioPro2024Retail
	set CHANNELPROJECTVISIO_id=Current
)
if %choice%==3 (
    set product_id=ProjectStd2024Volume_VisioStd2024Volume
    set project_id=ProjectStd2024Volume
    set visio_id=VisioStd2024Volume
    set project_pidkey=PD3TT-NTHQQ-VC7CY-MFXK3-G87F8
    set visio_pidkey=JMMVY-XFNQC-KK4HK-9H7R3-WQQTV
	set CHANNELPROJECTVISIO_id=PerpetualVL2024
)
if %choice%==4 (
    set product_id=ProjectPro2021Volume_VisioPro2021Volume
    set project_id=ProjectPro2021Volume
    set visio_id=VisioPro2021Volume
    set project_pidkey=FTNWT-C6WBT-8HMGF-K9PRX-QV9H8
    set visio_pidkey=KNH8D-FGHT4-T8RK3-CTDYJ-K2HT4
	set CHANNELPROJECTVISIO_id=PerpetualVL2021
)
if %choice%==5 (
    set product_id=ProjectStd2021Volume_VisioStd2021Volume
    set project_id=ProjectStd2021Volume
    set visio_id=VisioStd2021Volume
    set project_pidkey=J2JDC-NJCYY-9RGQ4-YXWMH-T3D4T
    set visio_pidkey=MJVNY-BYWPY-CWV6J-2RKRT-4M8QG
	set CHANNELPROJECTVISIO_id=PerpetualVL2021
)
if %choice%==6 (
    set product_id=ProjectPro2021Retail_VisioPro2021Retail
    set project_id=ProjectPro2021Retail
    set visio_id=VisioPro2021Retail
	set CHANNELPROJECTVISIO_id=Current
)
if %choice%==7 (
    set product_id=ProjectStd2021Retail_VisioStd2021Retail
    set project_id=ProjectStd2021Retail
    set visio_id=VisioStd2021Retail
	set CHANNELPROJECTVISIO_id=Current
)
if %choice%==8 (
    set product_id=ProjectPro2019Volume_VisioPro2019Volume
    set project_id=ProjectPro2019Volume
    set visio_id=VisioPro2019Volume
    set project_pidkey=B4NPR-3FKK7-T2MBV-FRQ4W-PKD2B
    set visio_pidkey=9BGNQ-K37YR-RQHF2-38RQ3-7VCBB
	set CHANNELPROJECTVISIO_id=PerpetualVL2019
)
if %choice%==9 (
    set product_id=ProjectStd2019Volume_VisioStd2019Volume
    set project_id=ProjectStd2019Volume
    set visio_id=VisioStd2019Volume
    set project_pidkey=C4F7P-NCP8C-6CQPT-MQHV9-JXD2M
    set visio_pidkey=7TQNQ-K3YQQ-3PFH7-CCPPM-X4VQ2
	set CHANNELPROJECTVISIO_id=PerpetualVL2019
)
if %choice%==10 (
    set product_id=ProjectPro2019Retail_VisioPro2019Retail
    set project_id=ProjectPro2019Retail
    set visio_id=VisioPro2019Retail
	set CHANNELPROJECTVISIO_id=Current
)
if %choice%==11 (
    set product_id=ProjectStd2019Retail_VisioStd2019Retail
    set project_id=ProjectStd2019Retail
    set visio_id=VisioStd2019Retail
	set CHANNELPROJECTVISIO_id=Current
)
if %choice%==12 (
    set product_id=ProjectProRetail_VisioProRetail
    set project_id=ProjectProRetail
    set visio_id=VisioProRetail
	set CHANNELPROJECTVISIO_id=Current
)
if %choice%==13 (
    set product_id=ProjectStdRetail_VisioStdRetail
    set project_id=ProjectStdRetail
    set visio_id=VisioStdRetail
	set CHANNELPROJECTVISIO_id=Current
)
echo.

:: Lựa chọn cài đặt
echo.
echo Bạn muốn cài đặt như thế nào?
echo      1. Cài đặt cả Project và Visio
echo      2. Chỉ cài đặt Project
echo      3. Chỉ cài đặt Visio
set /p install_choice="Nhập lựa chọn (1-3): "

:: Đường dẫn lưu trữ tạm thời cho file config.xml và setup.exe
set "tempDir=%TEMP%\ProjectSetup"
set "configProjectVisioFile=%tempDir%\ProjectVisionConfig.xml"
set "setupFile=%tempDir%\setup.exe"

:: Tạo thư mục tạm nếu chưa tồn tại
if not exist "%tempDir%" (
    mkdir "%tempDir%"
)

:: Tạo file config.xml với PIDKEY ID cho Project ID và Visio ID
(
    echo ^<Configuration^>
    echo     ^<Add OfficeClientEdition="%OfficeClientEdition%" Channel="%CHANNELPROJECTVISIO_id%"^>

    if %install_choice%==1 (
        echo         ^<Product ID="%project_id%" PIDKEY="%project_pidkey%"^>
        echo             ^<Language ID="%LANGUAGE_ID%" /^>
        echo             ^<ExcludeApp ID="OneDrive" /^>
        echo         ^</Product^>

        echo         ^<Product ID="%visio_id%" PIDKEY="%visio_pidkey%"^>
        echo             ^<Language ID="%LANGUAGE_ID%" /^>
        echo             ^<ExcludeApp ID="OneDrive" /^>
        echo         ^</Product^>
    ) else if %install_choice%==2 (
        echo         ^<Product ID="%project_id%" PIDKEY="%project_pidkey%"^>
        echo             ^<Language ID="%LANGUAGE_ID%" /^>
        echo             ^<ExcludeApp ID="OneDrive" /^>
        echo         ^</Product^>
    ) else if %install_choice%==3 (
        echo         ^<Product ID="%visio_id%" PIDKEY="%visio_pidkey%"^>
        echo             ^<Language ID="%LANGUAGE_ID%" /^>
        echo             ^<ExcludeApp ID="OneDrive" /^>
        echo         ^</Product^>
    )

    echo     ^</Add^>
    echo     ^<Display Level="Full" AcceptEULA="TRUE" /^>
    echo     ^<Updates Enabled="TRUE" /^>
    echo     ^<Property Name="AUTOACTIVATE" Value="1" /^>
    echo ^</Configuration^>
) > "%configProjectVisioFile%"

echo.
:: Hỏi người dùng có thực hiện cài đặt không
set /p confirm="Bạn có muốn thực hiện cài đặt không? (Y/N): "
if /I "%confirm%"=="Y" (
    echo Đang thực hiện cài đặt
"%setupFile%" /configure "%configProjectVisioFile%"
    echo Cài đặt hoàn tất!
) else (
    echo Quay về menu...
del /f /q "%configProjectVisioFile%" & del /f /q "%setupFile%" & rmdir /s /q "%tempDir%"
timeout 3 & GOTO MENU
)
