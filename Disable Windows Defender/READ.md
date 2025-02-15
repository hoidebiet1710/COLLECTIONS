Để chạy file.ps1 bằng quyền quản trị, hãy tạo batch file với nội dung dưới đây
@echo off & color 1f
cd /d "%~dp0"

:: Lấy đường dẫn tuyệt đối đến file PS1
set "ps1_file=%~dp0

:: Chạy file PS1 bằng quyền quản trị thông qua PowerShell
powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb runAs -ArgumentList '-NoExit', '-File', 'Disable-Defender.ps1'"

del /f /q "%ps1_file%" & Exit /b