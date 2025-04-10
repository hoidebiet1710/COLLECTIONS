@echo off & color 1f


:: ----------------------------------------------------------
:: -----------Disable Windows feedback collection------------
:: ----------------------------------------------------------
echo --- Disable Windows feedback collection
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Siuf\Rules!NumberOfSIUFInPeriod"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Siuf\Rules'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Siuf\Rules' /v 'NumberOfSIUFInPeriod' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Delete the registry value "PeriodInNanoSeconds" from the key "HKCU\SOFTWARE\Microsoft\Siuf\Rules" 
PowerShell -ExecutionPolicy Unrestricted -Command "$keyName = 'HKCU\SOFTWARE\Microsoft\Siuf\Rules'; $valueName = 'PeriodInNanoSeconds'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection!DoNotShowFeedbackNotifications"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' /v 'DoNotShowFeedbackNotifications' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection!DoNotShowFeedbackNotifications"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection' /v 'DoNotShowFeedbackNotifications' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable text and handwriting data collection-------
:: ----------------------------------------------------------
echo --- Disable text and handwriting data collection
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization!RestrictImplicitInkCollection"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization' /v 'RestrictImplicitInkCollection' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization!RestrictImplicitTextCollection"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization' /v 'RestrictImplicitTextCollection' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports!PreventHandwritingErrorReports"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports' /v 'PreventHandwritingErrorReports' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC!PreventHandwritingDataSharing"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC' /v 'PreventHandwritingDataSharing' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization!AllowInputPersonalization"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization' /v 'AllowInputPersonalization' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore!HarvestContacts"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore' /v 'HarvestContacts' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Disable device sensors------------------
:: ----------------------------------------------------------
echo --- Disable device sensors
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors!DisableSensors"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors' /v 'DisableSensors' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------------Disable Wi-Fi Sense--------------------
:: ----------------------------------------------------------
echo --- Disable Wi-Fi Sense
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting!value"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting'; $data =  '0'; reg add 'HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting' /v 'value' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots!Enabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots'; $data =  '0'; reg add 'HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots' /v 'Enabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config!AutoConnectAllowedOEM"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config'; $data =  '0'; reg add 'HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config' /v 'AutoConnectAllowedOEM' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable automatic map downloads--------------
:: ----------------------------------------------------------
echo --- Disable automatic map downloads
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps!AllowUntriggeredNetworkTrafficOnSettingsPage"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps' /v 'AllowUntriggeredNetworkTrafficOnSettingsPage' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps!AutoDownloadAndUpdateMapData"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps' /v 'AutoDownloadAndUpdateMapData' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable game screen recording---------------
:: ----------------------------------------------------------
echo --- Disable game screen recording
:: Set the registry value: "HKCU\System\GameConfigStore!GameDVR_Enabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\System\GameConfigStore'; $data =  '0'; reg add 'HKCU\System\GameConfigStore' /v 'GameDVR_Enabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR!AllowGameDVR"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR' /v 'AllowGameDVR' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable typing feedback (sends typing data)--------
:: ----------------------------------------------------------
echo --- Disable typing feedback (sends typing data)
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Input\TIPC!Enabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\Input\TIPC'; $data =  '0'; reg add 'HKLM\SOFTWARE\Microsoft\Input\TIPC' /v 'Enabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Input\TIPC!Enabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Input\TIPC'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Input\TIPC' /v 'Enabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Disable Cortana's history display-------------
:: ----------------------------------------------------------
echo --- Disable Cortana's history display
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search!HistoryViewEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' /v 'HistoryViewEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable Cortana's device history usage----------
:: ----------------------------------------------------------
echo --- Disable Cortana's device history usage
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search!DeviceHistoryEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' /v 'DeviceHistoryEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable "Hey Cortana" voice activation----------
:: ----------------------------------------------------------
echo --- Disable "Hey Cortana" voice activation
:: Set the registry value: "HKCU\Software\Microsoft\Speech_OneCore\Preferences!VoiceActivationOn"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Microsoft\Speech_OneCore\Preferences'; $data =  '0'; reg add 'HKCU\Software\Microsoft\Speech_OneCore\Preferences' /v 'VoiceActivationOn' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\Software\Microsoft\Speech_OneCore\Preferences!VoiceActivationDefaultOn"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Microsoft\Speech_OneCore\Preferences'; $data =  '0'; reg add 'HKLM\Software\Microsoft\Speech_OneCore\Preferences' /v 'VoiceActivationDefaultOn' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: Disable Cortana keyboard shortcut (**Windows logo key** + **C**)
echo --- Disable Cortana keyboard shortcut (**Windows logo key** + **C**)
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search!VoiceShortcut"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' /v 'VoiceShortcut' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable Cortana on locked device-------------
:: ----------------------------------------------------------
echo --- Disable Cortana on locked device
:: Set the registry value: "HKCU\Software\Microsoft\Speech_OneCore\Preferences!VoiceActivationEnableAboveLockscreen"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Microsoft\Speech_OneCore\Preferences'; $data =  '0'; reg add 'HKCU\Software\Microsoft\Speech_OneCore\Preferences' /v 'VoiceActivationEnableAboveLockscreen' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable automatic update of speech data----------
:: ----------------------------------------------------------
echo --- Disable automatic update of speech data
:: Set the registry value: "HKCU\Software\Microsoft\Speech_OneCore\Preferences!ModelDownloadAllowed"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Microsoft\Speech_OneCore\Preferences'; $data =  '0'; reg add 'HKCU\Software\Microsoft\Speech_OneCore\Preferences' /v 'ModelDownloadAllowed' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable Cortana voice support during Windows setup----
:: ----------------------------------------------------------
echo --- Disable Cortana voice support during Windows setup
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE!DisableVoice"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE' /v 'DisableVoice' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable Cortana during search---------------
:: ----------------------------------------------------------
echo --- Disable Cortana during search
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search!AllowCortana"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' /v 'AllowCortana' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Disable Cortana experience----------------
:: ----------------------------------------------------------
echo --- Disable Cortana experience
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Experience\AllowCortana!value"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\PolicyManager\default\Experience\AllowCortana'; $data =  '0'; reg add 'HKLM\SOFTWARE\Microsoft\PolicyManager\default\Experience\AllowCortana' /v 'value' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: Disable Cortana's access to cloud services such as OneDrive and SharePoint
echo --- Disable Cortana's access to cloud services such as OneDrive and SharePoint
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search!AllowCloudSearch"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' /v 'AllowCloudSearch' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: Disable Cortana speech interaction while the system is locked
echo --- Disable Cortana speech interaction while the system is locked
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search!AllowCortanaAboveLock"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' /v 'AllowCortanaAboveLock' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable participation in Cortana data collection-----
:: ----------------------------------------------------------
echo --- Disable participation in Cortana data collection
:: Set the registry value: "HKCU\Software\Microsoft\Windows\CurrentVersion\Search!CortanaConsent"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Microsoft\Windows\CurrentVersion\Search'; $data =  '0'; reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\Search' /v 'CortanaConsent' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Disable enabling of Cortana----------------
:: ----------------------------------------------------------
echo --- Disable enabling of Cortana
:: Set the registry value: "HKCU\Software\Microsoft\Windows\CurrentVersion\Search!CanCortanaBeEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Microsoft\Windows\CurrentVersion\Search'; $data =  '0'; reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\Search' /v 'CanCortanaBeEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable Cortana in start menu---------------
:: ----------------------------------------------------------
echo --- Disable Cortana in start menu
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search!CortanaEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search'; $data =  '0'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' /v 'CortanaEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search!CortanaEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' /v 'CortanaEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Remove "Cortana" icon from taskbar------------
:: ----------------------------------------------------------
echo --- Remove "Cortana" icon from taskbar
:: Set the registry value: "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced!ShowCortanaButton"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'; $data =  '0'; reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' /v 'ShowCortanaButton' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable Cortana in ambient mode--------------
:: ----------------------------------------------------------
echo --- Disable Cortana in ambient mode
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search!CortanaInAmbientMode"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search'; $data =  '0'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' /v 'CortanaInAmbientMode' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable indexing of encrypted items------------
:: ----------------------------------------------------------
echo --- Disable indexing of encrypted items
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search!AllowIndexingEncryptedStoresOrItems"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' /v 'AllowIndexingEncryptedStoresOrItems' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable automatic language detection when indexing----
:: ----------------------------------------------------------
echo --- Disable automatic language detection when indexing
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search!AlwaysUseAutoLangDetection"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' /v 'AlwaysUseAutoLangDetection' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable remote access to search index-----------
:: ----------------------------------------------------------
echo --- Disable remote access to search index
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search!PreventRemoteQueries"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' /v 'PreventRemoteQueries' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable iFilters and protocol handlers----------
:: ----------------------------------------------------------
echo --- Disable iFilters and protocol handlers
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search!PreventUnwantedAddIns"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search'; $data =  ' '; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' /v 'PreventUnwantedAddIns' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: Disable Bing search and recent search suggestions (breaks search history)
echo --- Disable Bing search and recent search suggestions (breaks search history)
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer!DisableSearchBoxSuggestions"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer' /v 'DisableSearchBoxSuggestions' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search!DisableSearchBoxSuggestions"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search'; $data =  '1'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' /v 'DisableSearchBoxSuggestions' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Disable Bing search in start menu-------------
:: ----------------------------------------------------------
echo --- Disable Bing search in start menu
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search!BingSearchEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' /v 'BingSearchEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable web search in search bar-------------
:: ----------------------------------------------------------
echo --- Disable web search in search bar
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search!DisableWebSearch"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' /v 'DisableWebSearch' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable web results in Windows Search-----------
:: ----------------------------------------------------------
echo --- Disable web results in Windows Search
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search!ConnectedSearchUseWeb"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' /v 'ConnectedSearchUseWeb' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search!ConnectedSearchUseWebOverMeteredConnections"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' /v 'ConnectedSearchUseWebOverMeteredConnections' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Disable Windows search highlights-------------
:: ----------------------------------------------------------
echo --- Disable Windows search highlights
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search!EnableDynamicContentInWSB"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' /v 'EnableDynamicContentInWSB' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings!IsDynamicSearchBoxEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings'; $data =  '1'; reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings' /v 'IsDynamicSearchBoxEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable search's access to location------------
:: ----------------------------------------------------------
echo --- Disable search's access to location
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search!AllowSearchToUseLocation"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' /v 'AllowSearchToUseLocation' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search!AllowSearchToUseLocation"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search'; $data =  '1'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' /v 'AllowSearchToUseLocation' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -Disable local search history (breaks recent suggestions)-
:: ----------------------------------------------------------
echo --- Disable local search history (breaks recent suggestions)
:: Set the registry value: "HKLM\Software\Policies\Microsoft\Windows\Explorer!DisableSearchHistory"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Policies\Microsoft\Windows\Explorer'; $data =  '1'; reg add 'HKLM\Software\Policies\Microsoft\Windows\Explorer' /v 'DisableSearchHistory' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings!IsDeviceSearchHistoryEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings'; $data =  '1'; reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings' /v 'IsDeviceSearchHistoryEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---Disable sharing personal search data with Microsoft----
:: ----------------------------------------------------------
echo --- Disable sharing personal search data with Microsoft
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search!ConnectedSearchPrivacy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search'; $data =  '3'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search' /v 'ConnectedSearchPrivacy' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable personal cloud content search in taskbar-----
:: ----------------------------------------------------------
echo --- Disable personal cloud content search in taskbar
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings!IsMSACloudSearchEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' /v 'IsMSACloudSearchEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings!IsAADCloudSearchEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings' /v 'IsAADCloudSearchEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable all settings synchronization-----------
:: ----------------------------------------------------------
echo --- Disable all settings synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableSyncOnPaidNetwork"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableSyncOnPaidNetwork' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!SyncPolicy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '5'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'SyncPolicy' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable "Application" setting synchronization-------
:: ----------------------------------------------------------
echo --- Disable "Application" setting synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableApplicationSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableApplicationSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableApplicationSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableApplicationSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable "App Sync" setting synchronization--------
:: ----------------------------------------------------------
echo --- Disable "App Sync" setting synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableAppSyncSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableAppSyncSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableAppSyncSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableAppSyncSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable "Credentials" setting synchronization-------
:: ----------------------------------------------------------
echo --- Disable "Credentials" setting synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableCredentialsSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableCredentialsSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableCredentialsSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableCredentialsSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials!Enabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials' /v 'Enabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable "Desktop Theme" setting synchronization------
:: ----------------------------------------------------------
echo --- Disable "Desktop Theme" setting synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableDesktopThemeSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableDesktopThemeSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableDesktopThemeSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableDesktopThemeSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable "Personalization" setting synchronization-----
:: ----------------------------------------------------------
echo --- Disable "Personalization" setting synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisablePersonalizationSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisablePersonalizationSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisablePersonalizationSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisablePersonalizationSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable "Start Layout" setting synchronization------
:: ----------------------------------------------------------
echo --- Disable "Start Layout" setting synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableStartLayoutSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableStartLayoutSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableStartLayoutSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableStartLayoutSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable "Web Browser" setting synchronization-------
:: ----------------------------------------------------------
echo --- Disable "Web Browser" setting synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableWebBrowserSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableWebBrowserSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableWebBrowserSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableWebBrowserSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable "Windows" setting synchronization---------
:: ----------------------------------------------------------
echo --- Disable "Windows" setting synchronization
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableWindowsSettingSync"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '2'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableWindowsSettingSync' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync!DisableWindowsSettingSyncUserOverride"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync' /v 'DisableWindowsSettingSyncUserOverride' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable "Language" setting synchronization--------
:: ----------------------------------------------------------
echo --- Disable "Language" setting synchronization
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language!Enabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language' /v 'Enabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: Disable "Connected User Experiences and Telemetry" (`DiagTrack`) service
echo --- Disable "Connected User Experiences and Telemetry" (`DiagTrack`) service
:: Disable service(s): `DiagTrack`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'DiagTrack'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) { Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) { Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try { Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch { Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else { Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if (!$startupType) { $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) { $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if ($startupType -eq 'Disabled') { Write-Host "^""$serviceName is already disabled, no further action is needed"^""; Exit 0; }; <# -- 4. Disable service #>; try { Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch { Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable WAP push notification routing service-------
:: ----------------------------------------------------------
echo --- Disable WAP push notification routing service
:: Disable service(s): `dmwappushservice`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'dmwappushservice'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) { Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) { Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try { Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch { Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else { Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if (!$startupType) { $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) { $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if ($startupType -eq 'Disabled') { Write-Host "^""$serviceName is already disabled, no further action is needed"^""; Exit 0; }; <# -- 4. Disable service #>; try { Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch { Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---Disable "Diagnostics Hub Standard Collector" service---
:: ----------------------------------------------------------
echo --- Disable "Diagnostics Hub Standard Collector" service
:: Disable service(s): `diagnosticshub.standardcollector.service`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'diagnosticshub.standardcollector.service'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) { Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) { Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try { Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch { Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else { Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if (!$startupType) { $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) { $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if ($startupType -eq 'Disabled') { Write-Host "^""$serviceName is already disabled, no further action is needed"^""; Exit 0; }; <# -- 4. Disable service #>; try { Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch { Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable "Diagnostic Execution Service" (`diagsvc`)----
:: ----------------------------------------------------------
echo --- Disable "Diagnostic Execution Service" (`diagsvc`)
:: Disable service(s): `diagsvc`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'diagsvc'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) { Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) { Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try { Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch { Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else { Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if (!$startupType) { $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) { $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if ($startupType -eq 'Disabled') { Write-Host "^""$serviceName is already disabled, no further action is needed"^""; Exit 0; }; <# -- 4. Disable service #>; try { Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch { Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Disable "Device" task-------------------
:: ----------------------------------------------------------
echo --- Disable "Device" task
:: Disable scheduled task(s): `\Microsoft\Windows\Device Information\Device`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Microsoft\Windows\Device Information\'; $taskNamePattern='Device'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) { Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) { $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) { Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try { $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch { Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) { Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Disable "Device User" task----------------
:: ----------------------------------------------------------
echo --- Disable "Device User" task
:: Disable scheduled task(s): `\Microsoft\Windows\Device Information\Device User`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Microsoft\Windows\Device Information\'; $taskNamePattern='Device User'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) { Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) { $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) { Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try { $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch { Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) { Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Disable device and configuration data collection tool---
:: ----------------------------------------------------------
echo --- Disable device and configuration data collection tool
:: Check and terminate the running process "DeviceCensus.exe"
tasklist /fi "ImageName eq DeviceCensus.exe" /fo csv 2>NUL | find /i "DeviceCensus.exe">NUL && (
    echo DeviceCensus.exe is running and will be killed.
    taskkill /f /im DeviceCensus.exe
) || (
    echo Skipping, DeviceCensus.exe is not running.
)
:: Configure termination of "DeviceCensus.exe" immediately upon its startup
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeviceCensus.exe!Debugger"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeviceCensus.exe'; $data =  '%SYSTEMROOT%\System32\taskkill.exe'; reg add 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeviceCensus.exe' /v 'Debugger' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Add a rule to prevent the executable "DeviceCensus.exe" from running via File Explorer
PowerShell -ExecutionPolicy Unrestricted -Command "$executableFilename='DeviceCensus.exe'; try { $registryPathForDisallowRun='HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun'; $existingBlockEntries = Get-ItemProperty -Path "^""$registryPathForDisallowRun"^"" -ErrorAction Ignore; $nextFreeRuleIndex = 1; if ($existingBlockEntries) { $existingBlockingRuleForExecutable = $existingBlockEntries.PSObject.Properties | Where-Object { $_.Value -eq $executableFilename }; if ($existingBlockingRuleForExecutable) { $existingBlockingRuleIndexForExecutable = $existingBlockingRuleForExecutable.Name; Write-Output "^""Skipping, no action needed: '$executableFilename' is already blocked under rule index `"^""$existingBlockingRuleIndexForExecutable`"^""."^""; exit 0; }; $occupiedRuleIndexes = $existingBlockEntries.PSObject.Properties | Where-Object { $_.Name -Match '^\d+$' } | Select -ExpandProperty Name; if ($occupiedRuleIndexes) { while ($occupiedRuleIndexes -Contains $nextFreeRuleIndex) { $nextFreeRuleIndex += 1; }; }; }; Write-Output "^""Adding block rule for `"^""$executableFilename`"^"" under rule index `"^""$nextFreeRuleIndex`"^""."^""; if (!(Test-Path $registryPathForDisallowRun)) { New-Item -Path "^""$registryPathForDisallowRun"^"" -Force -ErrorAction Stop | Out-Null; }; New-ItemProperty -Path "^""$registryPathForDisallowRun"^"" -Name "^""$nextFreeRuleIndex"^"" -PropertyType String -Value "^""$executableFilename"^"" ` -ErrorAction Stop | Out-Null; Write-Output "^""Successfully blocked `"^""$executableFilename`"^"" with rule index `"^""$nextFreeRuleIndex`"^""."^""; } catch { Write-Error "^""Failed to block `"^""$executableFilename`"^"": $_"^""; Exit 1; }"
:: Activate the DisallowRun policy to block specified programs from running via File Explorer
PowerShell -ExecutionPolicy Unrestricted -Command "try { $fileExplorerDisallowRunRegistryPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer'; $currentDisallowRunPolicyValue = Get-ItemProperty -Path "^""$fileExplorerDisallowRunRegistryPath"^"" -Name 'DisallowRun' -ErrorAction Ignore | Select -ExpandProperty DisallowRun; if ([string]::IsNullOrEmpty($currentDisallowRunPolicyValue)) { Write-Output "^""Creating DisallowRun policy at `"^""$fileExplorerDisallowRunRegistryPath`"^""."^""; if (!(Test-Path $fileExplorerDisallowRunRegistryPath)) { New-Item -Path "^""$fileExplorerDisallowRunRegistryPath"^"" -Force -ErrorAction Stop | Out-Null; }; New-ItemProperty -Path "^""$fileExplorerDisallowRunRegistryPath"^"" -Name 'DisallowRun' -Value 1 -PropertyType DWORD -Force -ErrorAction Stop | Out-Null; Write-Output 'Successfully activated DisallowRun policy.'; Exit 0; }; if ($currentDisallowRunPolicyValue -eq 1) { Write-Output 'Skipping, no action needed: DisallowRun policy is already in place.'; Exit 0; }; Write-Output 'Updating DisallowRun policy from unexpected value `"^""$currentDisallowRunPolicyValue`"^"" to `"^""1`"^"".'; Set-ItemProperty -Path "^""$fileExplorerDisallowRunRegistryPath"^"" -Name 'DisallowRun' -Value 1 -Type DWORD -Force -ErrorAction Stop | Out-Null; Write-Output 'Successfully activated DisallowRun policy.'; } catch { Write-Error "^""Failed to activate DisallowRun policy: $_"^""; Exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable processing of Desktop Analytics----------
:: ----------------------------------------------------------
echo --- Disable processing of Desktop Analytics
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection!AllowDesktopAnalyticsProcessing"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection' /v 'AllowDesktopAnalyticsProcessing' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Disable sending device name in Windows diagnostic data--
:: ----------------------------------------------------------
echo --- Disable sending device name in Windows diagnostic data
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection!AllowDeviceNameInTelemetry"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection' /v 'AllowDeviceNameInTelemetry' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: Disable collection of Edge browsing data for Desktop Analytics
echo --- Disable collection of Edge browsing data for Desktop Analytics
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection!MicrosoftEdgeDataOptIn"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection' /v 'MicrosoftEdgeDataOptIn' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Disable diagnostics data processing for Business cloud--
:: ----------------------------------------------------------
echo --- Disable diagnostics data processing for Business cloud
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection!AllowWUfBCloudProcessing"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection' /v 'AllowWUfBCloudProcessing' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -Disable Update Compliance processing of diagnostics data-
:: ----------------------------------------------------------
echo --- Disable Update Compliance processing of diagnostics data
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection!AllowUpdateComplianceProcessing"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection' /v 'AllowUpdateComplianceProcessing' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable commercial usage of collected data--------
:: ----------------------------------------------------------
echo --- Disable commercial usage of collected data
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection!AllowCommercialDataPipeline"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection' /v 'AllowCommercialDataPipeline' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable diagnostic and usage telemetry----------
:: ----------------------------------------------------------
echo --- Disable diagnostic and usage telemetry
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection!AllowTelemetry"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection'; $data =  '0'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' /v 'AllowTelemetry' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection!AllowTelemetry"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection' /v 'AllowTelemetry' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable automatic cloud configuration downloads------
:: ----------------------------------------------------------
echo --- Disable automatic cloud configuration downloads
:: Set the registry value: "HKLM\Software\Policies\Microsoft\Windows\DataCollection!DisableOneSettingsDownloads"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Policies\Microsoft\Windows\DataCollection'; $data =  '1'; reg add 'HKLM\Software\Policies\Microsoft\Windows\DataCollection' /v 'DisableOneSettingsDownloads' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Disable license telemetry-----------------
:: ----------------------------------------------------------
echo --- Disable license telemetry
:: Set the registry value: "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform!NoGenTicket"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform'; $data =  '1'; reg add 'HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform' /v 'NoGenTicket' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------------Disable error reporting------------------
:: ----------------------------------------------------------
echo --- Disable error reporting
:: Disable Windows Error Reporting (WER)
:: Set the registry value: "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting!Disabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting'; $data =  '1'; reg add 'HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting' /v 'Disabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting!Disabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting' /v 'Disabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Disable Windows Error Reporting (WER) consent
:: Set the registry value: "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent!DefaultConsent"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent'; $data =  '1'; reg add 'HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent' /v 'DefaultConsent' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent!DefaultOverrideBehavior"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent'; $data =  '1'; reg add 'HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent' /v 'DefaultOverrideBehavior' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Disable WER sending second-level data
:: Set the registry value: "HKLM\Software\Microsoft\Windows\Windows Error Reporting!DontSendAdditionalData"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Microsoft\Windows\Windows Error Reporting'; $data =  '1'; reg add 'HKLM\Software\Microsoft\Windows\Windows Error Reporting' /v 'DontSendAdditionalData' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\Software\Microsoft\Windows\Windows Error Reporting!LoggingDisabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Microsoft\Windows\Windows Error Reporting'; $data =  '1'; reg add 'HKLM\Software\Microsoft\Windows\Windows Error Reporting' /v 'LoggingDisabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Disable scheduled task(s): `\Microsoft\Windows\ErrorDetails\EnableErrorDetailsUpdate`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Microsoft\Windows\ErrorDetails\'; $taskNamePattern='EnableErrorDetailsUpdate'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) { Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) { $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) { Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try { $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch { Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) { Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable scheduled task(s): `\Microsoft\Windows\Windows Error Reporting\QueueReporting`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Microsoft\Windows\Windows Error Reporting\'; $taskNamePattern='QueueReporting'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) { Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) { $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) { Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try { $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch { Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) { Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable service(s): `wersvc`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'wersvc'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) { Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) { Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try { Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch { Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else { Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if (!$startupType) { $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) { $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if ($startupType -eq 'Disabled') { Write-Host "^""$serviceName is already disabled, no further action is needed"^""; Exit 0; }; <# -- 4. Disable service #>; try { Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch { Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: Disable service(s): `wercplsupport`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'wercplsupport'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) { Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) { Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try { Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch { Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else { Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if (!$startupType) { $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) { $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if ($startupType -eq 'Disabled') { Write-Host "^""$serviceName is already disabled, no further action is needed"^""; Exit 0; }; <# -- 4. Disable service #>; try { Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch { Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------------Disable Windows Tips-------------------
:: ----------------------------------------------------------
echo --- Disable Windows Tips
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent!DisableSoftLanding"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent' /v 'DisableSoftLanding' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: Disable Windows Spotlight (shows random wallpapers on lock screen)
echo --- Disable Windows Spotlight (shows random wallpapers on lock screen)
:: Set the registry value: "HKLM\Software\Policies\Microsoft\Windows\CloudContent!DisableWindowsSpotlightFeatures"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Policies\Microsoft\Windows\CloudContent'; $data =  '1'; reg add 'HKLM\Software\Policies\Microsoft\Windows\CloudContent' /v 'DisableWindowsSpotlightFeatures' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable Microsoft Consumer Experiences----------
:: ----------------------------------------------------------
echo --- Disable Microsoft Consumer Experiences
:: Set the registry value: "HKLM\Software\Policies\Microsoft\Windows\CloudContent!DisableWindowsConsumerFeatures"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Policies\Microsoft\Windows\CloudContent'; $data =  '1'; reg add 'HKLM\Software\Policies\Microsoft\Windows\CloudContent' /v 'DisableWindowsConsumerFeatures' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable ad customization with Advertising ID-------
:: ----------------------------------------------------------
echo --- Disable ad customization with Advertising ID
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo!Enabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo' /v 'Enabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo!DisabledByGroupPolicy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo' /v 'DisabledByGroupPolicy' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable suggested content in Settings app---------
:: ----------------------------------------------------------
echo --- Disable suggested content in Settings app
:: Set the registry value: "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager!SubscribedContent-338393Enabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'; $data =  '0'; reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' /v 'SubscribedContent-338393Enabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager!SubscribedContent-353694Enabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'; $data =  '0'; reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' /v 'SubscribedContent-353694Enabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager!SubscribedContent-353696Enabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'; $data =  '0'; reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' /v 'SubscribedContent-353696Enabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable sync provider notifications------------
:: ----------------------------------------------------------
echo --- Disable sync provider notifications
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced!ShowSyncProviderNotifications"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' /v 'ShowSyncProviderNotifications' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable Live Tiles push notifications-----------
:: ----------------------------------------------------------
echo --- Disable Live Tiles push notifications
:: Set the registry value: "HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications!NoTileApplicationNotification"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications'; $data =  '1'; reg add 'HKCU\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications' /v 'NoTileApplicationNotification' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: Disable the display of recently used files in Quick Access
echo --- Disable the display of recently used files in Quick Access
:: Set the registry value: "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer!ShowRecent"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer'; $data =  '0'; reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer' /v 'ShowRecent' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Delete the registry value "(Default)" from the key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\DelegateFolders\{3134ef9c-6b18-4996-ad04-ed5912e00eb5}" 
PowerShell -ExecutionPolicy Unrestricted -Command "$keyName = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\DelegateFolders\{3134ef9c-6b18-4996-ad04-ed5912e00eb5}'; $valueName = '(Default)'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: Delete the registry value "(Default)" from the key "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\DelegateFolders\{3134ef9c-6b18-4996-ad04-ed5912e00eb5}" 
PowerShell -ExecutionPolicy Unrestricted -Command "$keyName = 'HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\HomeFolderDesktop\NameSpace\DelegateFolders\{3134ef9c-6b18-4996-ad04-ed5912e00eb5}'; $valueName = '(Default)'; $hive = $keyName.Split('\')[0]; $path = "^""$($hive):$($keyName.Substring($hive.Length))"^""; Write-Host "^""Removing the registry value '$valueName' from '$path'."^""; if (-Not (Test-Path -LiteralPath $path)) { Write-Host 'Skipping, no action needed, registry key does not exist.'; Exit 0; }; $existingValueNames = (Get-ItemProperty -LiteralPath $path).PSObject.Properties.Name; if (-Not ($existingValueNames -Contains $valueName)) { Write-Host 'Skipping, no action needed, registry value does not exist.'; Exit 0; }; try { if ($valueName -ieq '(default)') { Write-Host 'Removing the default value.'; $(Get-Item -LiteralPath $path).OpenSubKey('', $true).DeleteValue(''); } else { Remove-ItemProperty -LiteralPath $path -Name $valueName -Force -ErrorAction Stop; }; Write-Host 'Successfully removed the registry value.'; } catch { Write-Error "^""Failed to remove the registry value: $($_.Exception.Message)"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Remove "Desktop" folder from This PC in File Explorer---
:: ----------------------------------------------------------
echo --- Remove "Desktop" folder from This PC in File Explorer
:: Set the registry value: "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag!ThisPCPolicy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag'; $data =  'Hide'; reg add 'HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag' /v 'ThisPCPolicy' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag!ThisPCPolicy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag'; $data =  'Hide'; reg add 'HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag' /v 'ThisPCPolicy' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons!{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons'; $data =  '1'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons' /v '{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}!HiddenByDefault"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}' /v 'HiddenByDefault' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}!HideIfEnabled"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}'; $data =  '0x22ab9b9'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}' /v 'HideIfEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -Remove "Documents" folder from This PC in File Explorer--
:: ----------------------------------------------------------
echo --- Remove "Documents" folder from This PC in File Explorer
:: Set the registry value: "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag!ThisPCPolicy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag'; $data =  'Hide'; reg add 'HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag' /v 'ThisPCPolicy' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag!ThisPCPolicy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag'; $data =  'Hide'; reg add 'HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag' /v 'ThisPCPolicy' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons!{f42ee2d3-909f-4907-8871-4c22fc0bf756}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons'; $data =  '1'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons' /v '{f42ee2d3-909f-4907-8871-4c22fc0bf756}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}!HiddenByDefault"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}' /v 'HiddenByDefault' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}!HideIfEnabled"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}'; $data =  '0x22ab9b9'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}' /v 'HideIfEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}!HiddenByDefault"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}' /v 'HiddenByDefault' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}!HideIfEnabled"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}'; $data =  '0x22ab9b9'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}' /v 'HideIfEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -Remove "Downloads" folder from This PC in File Explorer--
:: ----------------------------------------------------------
echo --- Remove "Downloads" folder from This PC in File Explorer
:: Set the registry value: "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag!ThisPCPolicy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag'; $data =  'Hide'; reg add 'HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag' /v 'ThisPCPolicy' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag!ThisPCPolicy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag'; $data =  'Hide'; reg add 'HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag' /v 'ThisPCPolicy' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons!{7d83ee9b-2244-4e70-b1f5-5393042af1e4}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons'; $data =  '1'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons' /v '{7d83ee9b-2244-4e70-b1f5-5393042af1e4}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}!HiddenByDefault"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}' /v 'HiddenByDefault' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}!HideIfEnabled"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}'; $data =  '0x22ab9b9'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}' /v 'HideIfEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}!HiddenByDefault"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}' /v 'HiddenByDefault' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}!HideIfEnabled"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}'; $data =  '0x22ab9b9'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}' /v 'HideIfEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---Remove "Videos"folder from This PC in File Explorer----
:: ----------------------------------------------------------
echo --- Remove "Videos"folder from This PC in File Explorer
:: Set the registry value: "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag!ThisPCPolicy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag'; $data =  'Hide'; reg add 'HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag' /v 'ThisPCPolicy' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag!ThisPCPolicy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag'; $data =  'Hide'; reg add 'HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag' /v 'ThisPCPolicy' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons!{35286a68-3c57-41a1-bbb1-0eae73d76c95}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons'; $data =  '1'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons' /v '{35286a68-3c57-41a1-bbb1-0eae73d76c95}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}!HiddenByDefault"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}' /v 'HiddenByDefault' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}!HideIfEnabled"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}'; $data =  '0x22ab9b9'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}' /v 'HideIfEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}!HiddenByDefault"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}' /v 'HiddenByDefault' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}!HideIfEnabled"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}'; $data =  '0x22ab9b9'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}' /v 'HideIfEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---Remove "Music" folder from This PC in File Explorer----
:: ----------------------------------------------------------
echo --- Remove "Music" folder from This PC in File Explorer
:: Set the registry value: "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag!ThisPCPolicy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag'; $data =  'Hide'; reg add 'HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag' /v 'ThisPCPolicy' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag!ThisPCPolicy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag'; $data =  'Hide'; reg add 'HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag' /v 'ThisPCPolicy' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons!{a0c69a99-21c8-4671-8703-7934162fcf1d}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons'; $data =  '1'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons' /v '{a0c69a99-21c8-4671-8703-7934162fcf1d}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}!HiddenByDefault"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}' /v 'HiddenByDefault' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}!HideIfEnabled"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}'; $data =  '0x22ab9b9'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}' /v 'HideIfEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}!HiddenByDefault"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}' /v 'HiddenByDefault' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}!HideIfEnabled"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}'; $data =  '0x22ab9b9'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}' /v 'HideIfEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Remove "Pictures" folder from This PC in File Explorer--
:: ----------------------------------------------------------
echo --- Remove "Pictures" folder from This PC in File Explorer
:: Set the registry value: "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag!ThisPCPolicy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag'; $data =  'Hide'; reg add 'HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag' /v 'ThisPCPolicy' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag!ThisPCPolicy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag'; $data =  'Hide'; reg add 'HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag' /v 'ThisPCPolicy' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons!{0ddd015d-b06c-45d5-8c4c-f59713854639}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons'; $data =  '1'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons' /v '{0ddd015d-b06c-45d5-8c4c-f59713854639}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}!HiddenByDefault"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}' /v 'HiddenByDefault' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}!HideIfEnabled"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}'; $data =  '0x22ab9b9'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}' /v 'HideIfEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}!HiddenByDefault"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}' /v 'HiddenByDefault' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}!HideIfEnabled"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}'; $data =  '0x22ab9b9'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}' /v 'HideIfEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: Remove outdated "3D Objects" folder from This PC in File Explorer
echo --- Remove outdated "3D Objects" folder from This PC in File Explorer
:: Set the registry value: "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag!ThisPCPolicy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag'; $data =  'Hide'; reg add 'HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag' /v 'ThisPCPolicy' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag!ThisPCPolicy"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag'; $data =  'Hide'; reg add 'HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag' /v 'ThisPCPolicy' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons!{31C0DD25-9439-4F12-BF41-7FF4EDA38722}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons'; $data =  '1'; reg add 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideMyComputerIcons' /v '{31C0DD25-9439-4F12-BF41-7FF4EDA38722}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Remove the registry key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" 
:: This operation will not run on Windows versions later than Windows10-MostRecent.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows10-MostRecent'; $buildNumber = switch ($versionName) { 'Windows11-21H2' { '10.0.22000' }; 'Windows10-MostRecent' { '10.0.19045' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1903' { '10.0.18362' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for maximum Windows '$versionName'"^""; }; }; $maxVersion=[System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -gt $maxVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is above maximum $maxVersion ($versionName)"^""; Exit 0; }; $keyPath='HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}'; $registryHive = $keyPath.Split('\')[0]; $registryPath = "^""$($registryHive):$($keyPath.Substring($registryHive.Length))"^""; Write-Host "^""Removing registry key at `"^""$registryPath`"^""."^""; if (-not (Test-Path -LiteralPath $registryPath)) { Write-Host "^""Skipping, no action needed, registry key `"^""$registryPath`"^"" does not exist."^""; exit 0; }; try { Remove-Item -LiteralPath $registryPath -Force -ErrorAction Stop | Out-Null; Write-Host "^""Successfully removed the registry key at path `"^""$registryPath`"^""."^""; } catch { Write-Error "^""Failed to remove the registry key at path `"^""$registryPath`"^"": $($_.Exception.Message)"^""; }"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}!HiddenByDefault"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}' /v 'HiddenByDefault' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}!HideIfEnabled"
:: This operation will not run on Windows versions earlier than Windows11-FirstRelease.
PowerShell -ExecutionPolicy Unrestricted -Command "$versionName = 'Windows11-FirstRelease'; $buildNumber = switch ($versionName) { 'Windows11-FirstRelease' { '10.0.22000' }; 'Windows11-22H2' { '10.0.22621' }; 'Windows11-21H2' { '10.0.22000' }; 'Windows10-22H2' { '10.0.19045' }; 'Windows10-21H2' { '10.0.19044' }; 'Windows10-20H2' { '10.0.19042' }; 'Windows10-1909' { '10.0.18363' }; 'Windows10-1607' { '10.0.14393' }; default { throw "^""Internal privacy$([char]0x002E)sexy error: No build for minimum Windows '$versionName'"^""; }; }; $minVersion = [System.Version]::Parse($buildNumber); $ver = [Environment]::OSVersion.Version; $verNoPatch = [System.Version]::new($ver.Major, $ver.Minor, $ver.Build); if ($verNoPatch -lt $minVersion) { Write-Output "^""Skipping: Windows ($verNoPatch) is below minimum $minVersion ($versionName)"^""; Exit 0; }; $registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}'; $data =  '0x22ab9b9'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}' /v 'HideIfEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting explorer.exe for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'This script will not take effect until you restart explorer.exe. You can restart explorer.exe by restarting your computer or by running following on command prompt: `taskkill /f /im explorer.exe & start explorer`.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable history of recently opened documents-------
:: ----------------------------------------------------------
echo --- Disable history of recently opened documents
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer!NoRecentDocsHistory"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' /v 'NoRecentDocsHistory' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Clear recently opened document history upon exit-----
:: ----------------------------------------------------------
echo --- Clear recently opened document history upon exit
:: Set the registry value: "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer!ClearRecentDocsOnExit"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer'; $data =  '1'; reg add 'HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer' /v 'ClearRecentDocsOnExit' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------------Disable recent apps--------------------
:: ----------------------------------------------------------
echo --- Disable recent apps
:: Set the registry value: "HKCU\Software\Policies\Microsoft\Windows\EdgeUI!DisableRecentApps"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Policies\Microsoft\Windows\EdgeUI'; $data =  '1'; reg add 'HKCU\Software\Policies\Microsoft\Windows\EdgeUI' /v 'DisableRecentApps' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------------Disable backtracking-------------------
:: ----------------------------------------------------------
echo --- Disable backtracking
:: Set the registry value: "HKCU\Software\Policies\Microsoft\Windows\EdgeUI!TurnOffBackstack"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Policies\Microsoft\Windows\EdgeUI'; $data =  '1'; reg add 'HKCU\Software\Policies\Microsoft\Windows\EdgeUI' /v 'TurnOffBackstack' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Disable "Hyper-V" feature-----------------
:: ----------------------------------------------------------
echo --- Disable "Hyper-V" feature
:: Disable the "Microsoft-Hyper-V-All" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'Microsoft-Hyper-V-All'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try { Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch { Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable "Hyper-V GUI Management Tools" feature------
:: ----------------------------------------------------------
echo --- Disable "Hyper-V GUI Management Tools" feature
:: Disable the "Microsoft-Hyper-V-Management-Clients" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'Microsoft-Hyper-V-Management-Clients'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try { Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch { Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable "Hyper-V Management Tools" feature--------
:: ----------------------------------------------------------
echo --- Disable "Hyper-V Management Tools" feature
:: Disable the "Microsoft-Hyper-V-Tools-All" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'Microsoft-Hyper-V-Tools-All'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try { Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch { Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -Disable "Hyper-V Module for Windows PowerShell" feature--
:: ----------------------------------------------------------
echo --- Disable "Hyper-V Module for Windows PowerShell" feature
:: Disable the "Microsoft-Hyper-V-Management-PowerShell" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'Microsoft-Hyper-V-Management-PowerShell'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try { Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch { Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable "Internet Explorer" feature------------
:: ----------------------------------------------------------
echo --- Disable "Internet Explorer" feature
:: Disable the "Internet-Explorer-Optional-x64" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'Internet-Explorer-Optional-x64'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try { Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch { Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: Disable the "Internet-Explorer-Optional-x84" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'Internet-Explorer-Optional-x84'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try { Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch { Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: Disable the "Internet-Explorer-Optional-amd64" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'Internet-Explorer-Optional-amd64'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try { Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch { Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable "Media Features" feature-------------
:: ----------------------------------------------------------
echo --- Disable "Media Features" feature
:: Disable the "MediaPlayback" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'MediaPlayback'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try { Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch { Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Disable "Scan Management" feature-------------
:: ----------------------------------------------------------
echo --- Disable "Scan Management" feature
:: Disable the "ScanManagementConsole" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'ScanManagementConsole'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try { Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch { Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable "Windows Fax and Scan" feature----------
:: ----------------------------------------------------------
echo --- Disable "Windows Fax and Scan" feature
:: Disable the "FaxServicesClientPackage" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'FaxServicesClientPackage'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try { Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch { Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable "Windows Media Player" feature----------
:: ----------------------------------------------------------
echo --- Disable "Windows Media Player" feature
:: Disable the "WindowsMediaPlayer" feature
PowerShell -ExecutionPolicy Unrestricted -Command "$featureName = 'WindowsMediaPlayer'; $feature = Get-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -ErrorAction Stop; if (-Not $feature) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is not found. No action required."^""; Exit 0; }; if ($feature.State -eq [Microsoft.Dism.Commands.FeatureState]::Disabled) { Write-Output "^""Skipping: The feature `"^""$featureName`"^"" is already disabled. No action required."^""; Exit 0; }; try { Write-Host "^""Disabling feature: `"^""$featureName`"^""."^""; Disable-WindowsOptionalFeature -FeatureName "^""$featureName"^"" -Online -NoRestart -LogLevel ([Microsoft.Dism.Commands.LogLevel]::Errors) -WarningAction SilentlyContinue -ErrorAction Stop | Out-Null; } catch { Write-Error "^""Failed to disable the feature `"^""$featureName`"^"": $($_.Exception.Message)"^""; Exit 1; }; Write-Output "^""Successfully disabled the feature `"^""$featureName`"^""."^""; Exit 0"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable Microsoft Office logging-------------
:: ----------------------------------------------------------
echo --- Disable Microsoft Office logging
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Mail!EnableLogging"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Mail'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Mail' /v 'EnableLogging' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Mail!EnableLogging"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Mail'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Mail' /v 'EnableLogging' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Calendar!EnableCalendarLogging"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Calendar'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Calendar' /v 'EnableCalendarLogging' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Calendar!EnableCalendarLogging"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Calendar'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Calendar' /v 'EnableCalendarLogging' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Options!EnableLogging"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Options'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Options' /v 'EnableLogging' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Options!EnableLogging"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Options'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Options' /v 'EnableLogging' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM!EnableLogging"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM'; $data =  '0'; reg add 'HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM' /v 'EnableLogging' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM!EnableLogging"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM'; $data =  '0'; reg add 'HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM' /v 'EnableLogging' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM!EnableUpload"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM'; $data =  '0'; reg add 'HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM' /v 'EnableUpload' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM!EnableUpload"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM'; $data =  '0'; reg add 'HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM' /v 'EnableUpload' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable Microsoft Office client telemetry---------
:: ----------------------------------------------------------
echo --- Disable Microsoft Office client telemetry
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry!DisableTelemetry"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry'; $data =  '1'; reg add 'HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry' /v 'DisableTelemetry' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Office\15.0\Common\ClientTelemetry!DisableTelemetry"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Office\15.0\Common\ClientTelemetry'; $data =  '1'; reg add 'HKCU\SOFTWARE\Microsoft\Office\15.0\Common\ClientTelemetry' /v 'DisableTelemetry' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry!DisableTelemetry"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry'; $data =  '1'; reg add 'HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry' /v 'DisableTelemetry' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry!VerboseLogging"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry' /v 'VerboseLogging' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Office\15.0\Common\ClientTelemetry!VerboseLogging"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Office\15.0\Common\ClientTelemetry'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Office\15.0\Common\ClientTelemetry' /v 'VerboseLogging' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry!VerboseLogging"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry' /v 'VerboseLogging' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: Disable user participation in Office Customer Experience Improvement Program (CEIP)
echo --- Disable user participation in Office Customer Experience Improvement Program (CEIP)
:: Set the registry value: "HKCU\Software\Policies\Microsoft\Office\15.0\Common!QMEnable"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Policies\Microsoft\Office\15.0\Common'; $data =  '0'; reg add 'HKCU\Software\Policies\Microsoft\Office\15.0\Common' /v 'QMEnable' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\Software\Policies\Microsoft\Office\16.0\Common!QMEnable"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Policies\Microsoft\Office\16.0\Common'; $data =  '0'; reg add 'HKCU\Software\Policies\Microsoft\Office\16.0\Common' /v 'QMEnable' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Disable Microsoft Office feedback-------------
:: ----------------------------------------------------------
echo --- Disable Microsoft Office feedback
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Office\15.0\Common\Feedback!Enabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Office\15.0\Common\Feedback'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Office\15.0\Common\Feedback' /v 'Enabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\Feedback!Enabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Microsoft\Office\16.0\Common\Feedback'; $data =  '0'; reg add 'HKCU\SOFTWARE\Microsoft\Office\16.0\Common\Feedback' /v 'Enabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable Microsoft Office telemetry agent---------
:: ----------------------------------------------------------
echo --- Disable Microsoft Office telemetry agent
:: Disable scheduled task(s): `\Microsoft\Office\OfficeTelemetryAgentFallBack`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Microsoft\Office\'; $taskNamePattern='OfficeTelemetryAgentFallBack'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) { Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) { $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) { Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try { $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch { Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) { Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable scheduled task(s): `\Microsoft\Office\OfficeTelemetryAgentFallBack2016`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Microsoft\Office\'; $taskNamePattern='OfficeTelemetryAgentFallBack2016'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) { Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) { $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) { Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try { $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch { Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) { Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable scheduled task(s): `\Microsoft\Office\OfficeTelemetryAgentLogOn`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Microsoft\Office\'; $taskNamePattern='OfficeTelemetryAgentLogOn'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) { Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) { $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) { Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try { $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch { Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) { Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable scheduled task(s): `\Microsoft\Office\OfficeTelemetryAgentLogOn2016`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Microsoft\Office\'; $taskNamePattern='OfficeTelemetryAgentLogOn2016'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) { Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) { $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) { Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try { $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch { Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) { Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Disable "Microsoft Office Subscription Heartbeat" task--
:: ----------------------------------------------------------
echo --- Disable "Microsoft Office Subscription Heartbeat" task
:: Disable scheduled task(s): `\Microsoft\Office\Office 15 Subscription Heartbeat`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Microsoft\Office\'; $taskNamePattern='Office 15 Subscription Heartbeat'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) { Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) { $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) { Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try { $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch { Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) { Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable Cloud Clipboard (breaks clipboard sync)------
:: ----------------------------------------------------------
echo --- Disable Cloud Clipboard (breaks clipboard sync)
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\System!AllowCrossDeviceClipboard"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System' /v 'AllowCrossDeviceClipboard' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\Software\Microsoft\Clipboard!CloudClipboardAutomaticUpload"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Microsoft\Clipboard'; $data =  '0'; reg add 'HKCU\Software\Microsoft\Clipboard' /v 'CloudClipboardAutomaticUpload' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------------Disable clipboard history-----------------
:: ----------------------------------------------------------
echo --- Disable clipboard history
:: Set the registry value: "HKCU\Software\Microsoft\Clipboard!EnableClipboardHistory"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\Software\Microsoft\Clipboard'; $data =  '0'; reg add 'HKCU\Software\Microsoft\Clipboard' /v 'EnableClipboardHistory' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\System!AllowClipboardHistory"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\System' /v 'AllowClipboardHistory' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: Disable background clipboard data collection (`cbdhsvc`) (breaks clipboard history and sync)
echo --- Disable background clipboard data collection (`cbdhsvc`) (breaks clipboard history and sync)
:: Disable per-user "cbdhsvc" service for all users
:: Disable the service `cbdhsvc` 
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceQuery = 'cbdhsvc'; $stopWithDependencies= $false; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceQuery -ErrorAction SilentlyContinue; if(!$service) { Write-Host "^""Service query `"^""$serviceQuery`"^"" did not yield any results, no need to disable it."^""; Exit 0; }; $serviceName = $service.Name; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) { Write-Host "^""`"^""$serviceName`"^"" is running, attempting to stop it."^""; try { Write-Host "^""Stopping the service `"^""$serviceName`"^""."^""; $stopParams = @{ Name = $ServiceName; Force = $true; ErrorAction = 'Stop'; }; if (-not $stopWithDependencies) { $stopParams['NoWait'] = $true; }; Stop-Service @stopParams; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch { if ($_.FullyQualifiedErrorId -eq 'CouldNotStopService,Microsoft.PowerShell.Commands.StopServiceCommand') { Write-Warning "^""The service `"^""$serviceName`"^"" does not accept a stop command and may need to be stopped manually or on reboot."^""; } else { Write-Warning "^""Failed to stop service `"^""$ServiceName`"^"". It will be stopped after reboot. Error: $($_.Exception.Message)"^""; }; }; } else { Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if service info is not found in registry #>; $registryKey = "^""HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"^""; if (-Not (Test-Path $registryKey)) { Write-Host "^""`"^""$registryKey`"^"" is not found in registry, cannot enable it."^""; Exit 0; }; <# -- 4. Skip if already disabled #>; if( $(Get-ItemProperty -Path "^""$registryKey"^"").Start -eq 4) { Write-Host "^""`"^""$serviceName`"^"" is already disabled from start, no further action is needed."^""; Exit 0; }; <# -- 5. Disable service #>; try { Set-ItemProperty -LiteralPath $registryKey -Name "^""Start"^"" -Value 4 -ErrorAction Stop; Write-Host 'Successfully disabled the service. It will not start automatically on next boot.'; } catch { Write-Error "^""Failed to disable the service. Error: $($_.Exception.Message)"^""; Exit 1; }"
:: Disable per-user "cbdhsvc" service for individual user accounts
:: Disable the service `cbdhsvc_*` 
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceQuery = 'cbdhsvc_*'; $stopWithDependencies= $false; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceQuery -ErrorAction SilentlyContinue; if(!$service) { Write-Host "^""Service query `"^""$serviceQuery`"^"" did not yield any results, no need to disable it."^""; Exit 0; }; $serviceName = $service.Name; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) { Write-Host "^""`"^""$serviceName`"^"" is running, attempting to stop it."^""; try { Write-Host "^""Stopping the service `"^""$serviceName`"^""."^""; $stopParams = @{ Name = $ServiceName; Force = $true; ErrorAction = 'Stop'; }; if (-not $stopWithDependencies) { $stopParams['NoWait'] = $true; }; Stop-Service @stopParams; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch { if ($_.FullyQualifiedErrorId -eq 'CouldNotStopService,Microsoft.PowerShell.Commands.StopServiceCommand') { Write-Warning "^""The service `"^""$serviceName`"^"" does not accept a stop command and may need to be stopped manually or on reboot."^""; } else { Write-Warning "^""Failed to stop service `"^""$ServiceName`"^"". It will be stopped after reboot. Error: $($_.Exception.Message)"^""; }; }; } else { Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if service info is not found in registry #>; $registryKey = "^""HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"^""; if (-Not (Test-Path $registryKey)) { Write-Host "^""`"^""$registryKey`"^"" is not found in registry, cannot enable it."^""; Exit 0; }; <# -- 4. Skip if already disabled #>; if( $(Get-ItemProperty -Path "^""$registryKey"^"").Start -eq 4) { Write-Host "^""`"^""$serviceName`"^"" is already disabled from start, no further action is needed."^""; Exit 0; }; <# -- 5. Disable service #>; try { Set-ItemProperty -LiteralPath $registryKey -Name "^""Start"^"" -Value 4 -ErrorAction Stop; Write-Host 'Successfully disabled the service. It will not start automatically on next boot.'; } catch { Write-Error "^""Failed to disable the service. Error: $($_.Exception.Message)"^""; Exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Disable AutoPlay and AutoRun---------------
:: ----------------------------------------------------------
echo --- Disable AutoPlay and AutoRun
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer!NoDriveTypeAutoRun"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer'; $data =  '255'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' /v 'NoDriveTypeAutoRun' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer!NoAutorun"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer' /v 'NoAutorun' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer!NoAutoplayfornonVolume"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer' /v 'NoAutoplayfornonVolume' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: Pause the script to view the final state
pause
:: Restore previous environment settings
endlocal
:: Exit the script successfully
exit /b 0