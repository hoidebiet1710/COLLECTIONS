# Welcome to GitHub Desktop!

Thank you to the developers who created the tools
1. Enforce privacy & security best-practices on Windows, macOS and Linux, because privacy is sexy
https://github.com/undergroundwires/privacy.sexy.
2. Remove EDGE: 
[https://github.com/ShadowWhisperer](https://github.com/ShadowWhisperer/Remove-MS-Edge)
3. Collection of batch scripts utilities for Windows
https://github.com/abbodi1406/BatUtil
4. Bloatware Removal Utility, for automating removal of pre-installed, factory bloatware from devices running Windows 7-10 and newer
https://github.com/arcadesdude
5. Microsoft Activation Scripts (MAS)
Windows and Office activator featuring HWID, Ohook, KMS38, and Online KMS activation methods, along with advanced troubleshooting
Download / How to use it?
Mở powershell bằng quyền Quản trị, copy và dán lệnh sau: irm https://get.activated.win | iex
Hoặc sử dụng batch file với câu lệnh 
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& ([ScriptBlock]::Create((irm https://get.activated.win))) | iex
7. Downloads setup.exe from https://officecdn.microsoft.com/pr/wsus/setup.exe
8. Chạy File*.ps1 bằng quyền quản trị (administrator),
@echo off & color 1f
cd /d "%~dp0"
:: Lấy đường dẫn tuyệt đối đến file PS1
set "ps1_file=%~dp0
:: Chạy file PS1 bằng quyền quản trị thông qua PowerShell
powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb runAs -ArgumentList '-NoExit', '-File', 'File*.ps1'"
pause 2>nul & Exit/b
