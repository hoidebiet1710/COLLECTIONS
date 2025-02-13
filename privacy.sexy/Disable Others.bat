@echo off
:: https://privacy.sexy — v0.13.7 — Tue, 11 Feb 2025 07:35:19 GMT
:: Ensure PowerShell is available
where PowerShell >nul 2>&1 || (
    echo PowerShell is not available. Please install or enable PowerShell.
    pause & exit 1
)
:: Ensure admin privileges
fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)
:: Initialize environment
setlocal EnableExtensions DisableDelayedExpansion


:: ----------------------------------------------------------
:: -----------Disable all settings synchronization-----------
:: ----------------------------------------------------------
echo --- Disable all settings synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableSyncOnPaidNetwork"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableSyncOnPaidNetwork' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!SyncPolicy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '5'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'SyncPolicy' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable "Application" setting synchronization-------
:: ----------------------------------------------------------
echo --- Disable "Application" setting synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableApplicationSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableApplicationSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableApplicationSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableApplicationSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable "App Sync" setting synchronization--------
:: ----------------------------------------------------------
echo --- Disable "App Sync" setting synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableAppSyncSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableAppSyncSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableAppSyncSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableAppSyncSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable "Credentials" setting synchronization-------
:: ----------------------------------------------------------
echo --- Disable "Credentials" setting synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableCredentialsSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableCredentialsSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableCredentialsSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableCredentialsSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials!Enabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials'; $data = '0'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials' /v 'Enabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable "Desktop Theme" setting synchronization------
:: ----------------------------------------------------------
echo --- Disable "Desktop Theme" setting synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableDesktopThemeSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableDesktopThemeSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableDesktopThemeSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableDesktopThemeSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable "Personalization" setting synchronization-----
:: ----------------------------------------------------------
echo --- Disable "Personalization" setting synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisablePersonalizationSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisablePersonalizationSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisablePersonalizationSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisablePersonalizationSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable "Start Layout" setting synchronization------
:: ----------------------------------------------------------
echo --- Disable "Start Layout" setting synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableStartLayoutSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableStartLayoutSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableStartLayoutSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableStartLayoutSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable "Web Browser" setting synchronization-------
:: ----------------------------------------------------------
echo --- Disable "Web Browser" setting synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableWebBrowserSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableWebBrowserSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableWebBrowserSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableWebBrowserSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable "Windows" setting synchronization---------
:: ----------------------------------------------------------
echo --- Disable "Windows" setting synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableWindowsSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableWindowsSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableWindowsSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data = '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableWindowsSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable "Language" setting synchronization--------
:: ----------------------------------------------------------
echo --- Disable "Language" setting synchronization
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language!Enabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language'; $data = '0'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language' /v 'Enabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable Windows feedback collection------------
:: ----------------------------------------------------------
echo --- Disable Windows feedback collection
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Siuf\Rules!NumberOfSIUFInPeriod"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Siuf\Rules'; $data = '0'; reg add 'HKCU\SOFTWARE\Microsoft\Siuf\Rules' /v 'NumberOfSIUFInPeriod' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Delete the registry value "PeriodInNanoSeconds" from the key "HKCU\SOFTWARE\Microsoft\Siuf\Rules" 
PowerShell -ExecutionPolicy Unrestricted -Command "$keyName = 'HKCU\SOFTWARE\Microsoft\Siuf\Rules'; $valueName = 'PeriodInNanoSeconds'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection!DoNotShowFeedbackNotifications"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection'; $data = '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' /v 'DoNotShowFeedbackNotifications' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection!DoNotShowFeedbackNotifications"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection'; $data = '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection' /v 'DoNotShowFeedbackNotifications' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable text and handwriting data collection-------
:: ----------------------------------------------------------
echo --- Disable text and handwriting data collection
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization!RestrictImplicitInkCollection"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization'; $data = '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization' /v 'RestrictImplicitInkCollection' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization!RestrictImplicitTextCollection"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization'; $data = '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization' /v 'RestrictImplicitTextCollection' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports!PreventHandwritingErrorReports"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports'; $data = '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports' /v 'PreventHandwritingErrorReports' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC!PreventHandwritingDataSharing"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC'; $data = '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC' /v 'PreventHandwritingDataSharing' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization!AllowInputPersonalization"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization'; $data = '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization' /v 'AllowInputPersonalization' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore!HarvestContacts"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore'; $data = '0'; reg add 'HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore' /v 'HarvestContacts' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------------Disable Wi-Fi Sense--------------------
:: ----------------------------------------------------------
echo --- Disable Wi-Fi Sense
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting!value"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting'; $data = '0'; reg add 'HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting' /v 'value' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots!Enabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots'; $data = '0'; reg add 'HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots' /v 'Enabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config!AutoConnectAllowedOEM"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config'; $data = '0'; reg add 'HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config' /v 'AutoConnectAllowedOEM' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable automatic map downloads--------------
:: ----------------------------------------------------------
echo --- Disable automatic map downloads
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps!AllowUntriggeredNetworkTrafficOnSettingsPage"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps'; $data = '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps' /v 'AllowUntriggeredNetworkTrafficOnSettingsPage' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps!AutoDownloadAndUpdateMapData"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps'; $data = '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps' /v 'AutoDownloadAndUpdateMapData' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable typing feedback (sends typing data)--------
:: ----------------------------------------------------------
echo --- Disable typing feedback (sends typing data)
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Input\TIPC!Enabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\Input\TIPC'; $data = '0'; reg add 'HKLM\SOFTWARE\Microsoft\Input\TIPC' /v 'Enabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Input\TIPC!Enabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Input\TIPC'; $data = '0'; reg add 'HKCU\SOFTWARE\Microsoft\Input\TIPC' /v 'Enabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: Pause the script to view the final state
pause
:: Restore previous environment settings
endlocal
:: Exit the script successfully
del "%~f0" & exit /b 0
