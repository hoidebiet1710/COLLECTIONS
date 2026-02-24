#   Description:
# This script will remove and disable OneDrive integration.

Import-Module -DisableNameChecking $PSScriptRoot\..\lib\New-FolderForced.psm1
Import-Module -DisableNameChecking $PSScriptRoot\..\lib\take-own.psm1

Write-Output "Kill OneDrive process"
taskkill.exe /F /IM "OneDrive.exe"
taskkill.exe /F /IM "explorer.exe"

Write-Output "Remove OneDrive"
if (Test-Path "$env:systemroot\System32\OneDriveSetup.exe") {
    & "$env:systemroot\System32\OneDriveSetup.exe" /uninstall
}
if (Test-Path "$env:systemroot\SysWOW64\OneDriveSetup.exe") {
    & "$env:systemroot\SysWOW64\OneDriveSetup.exe" /uninstall
}

# Set registry values back to normal directories
Write-Output "Resetting Registry values for user directories"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" "Desktop" "%USERPROFILE%\Desktop"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" "Favorites" "%USERPROFILE%\Favorites"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" "Personal" "%USERPROFILE%\Documents"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" "My Music" "%USERPROFILE%\Music"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" "My Pictures" "%USERPROFILE%\Pictures"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" "My Video" "%USERPROFILE%\Videos"

# Copy data from onedrive to normal directories
Write-Output "Move data back to normal user directories"
Get-ChildItem -Path $env:userprofile\OneDrive\Desktop | Move-Item -Destination $env:userprofile\Desktop
Remove-Item -Path $env:userprofile\OneDrive\Desktop -Recurse

Get-ChildItem -Path $env:userprofile\OneDrive\Documents | Move-Item -Destination $env:userprofile\Documents
Remove-Item -Path $env:userprofile\OneDrive\Documents -Recurse

Get-ChildItem -Path $env:userprofile\OneDrive\Favorites | Move-Item -Destination $env:userprofile\Favorites
Remove-Item -Path $env:userprofile\OneDrive\Favorites -Recurse

Get-ChildItem -Path $env:userprofile\OneDrive\Music | Move-Item -Destination $env:userprofile\Music
Remove-Item -Path $env:userprofile\OneDrive\Music -Recurse

Get-ChildItem -Path $env:userprofile\OneDrive\Pictures | Move-Item -Destination $env:userprofile\Pictures
Remove-Item -Path $env:userprofile\OneDrive\Pictures -Recurse

Get-ChildItem -Path $env:userprofile\OneDrive\Videos | Move-Item -Destination $env:userprofile\Videos
Remove-Item -Path $env:userprofile\OneDrive\Videos -Recurse

Remove-Item -Path $env:userprofile\OneDrive -Recurse

# Remove leftovers
Write-Output "Removing OneDrive leftovers"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:localappdata\Microsoft\OneDrive"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:programdata\Microsoft OneDrive"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:systemdrive\OneDriveTemp"
# check if directory is empty before removing:
If ((Get-ChildItem "$env:userprofile\OneDrive" -Recurse | Measure-Object).Count -eq 0) {
    Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:userprofile\OneDrive"
}

Write-Output "Disable OneDrive via Group Policies"
New-FolderForced -Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\OneDrive"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\OneDrive" "DisableFileSyncNGSC" 1

Write-Output "Remove Onedrive from explorer sidebar"
New-PSDrive -PSProvider "Registry" -Root "HKEY_CLASSES_ROOT" -Name "HKCR"
mkdir -Force "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
Set-ItemProperty -Path "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" "System.IsPinnedToNameSpaceTree" 0
mkdir -Force "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
Set-ItemProperty -Path "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" "System.IsPinnedToNameSpaceTree" 0
Remove-PSDrive "HKCR"

# Thank you Matthew Israelsson
Write-Output "Removing run hook for new users"
reg load "hku\Default" "C:\Users\Default\NTUSER.DAT"
reg delete "HKEY_USERS\Default\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "OneDriveSetup" /f
reg unload "hku\Default"

Write-Output "Removing startmenu entry"
Remove-Item -Force -ErrorAction SilentlyContinue "$env:userprofile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk"

Write-Output "Removing scheduled task"
Get-ScheduledTask -TaskPath '\' -TaskName 'OneDrive*' -ea SilentlyContinue | Unregister-ScheduledTask -Confirm:$false

foreach ($item in (ls "$env:WinDir\WinSxS\*onedrive*")) {
	Takeown-Folder $item.FullName
	rm -Recurse -Force $item.FullName
}

Write-Output "Restarting explorer"
Start-Process "explorer.exe"

Write-Output "Waiting for explorer to complete loading"
Start-Sleep 3
