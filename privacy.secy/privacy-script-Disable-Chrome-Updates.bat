@echo off & color 1f


:: ----------------------------------------------------------
:: ---------Disable "Google Update Service" services---------
:: ----------------------------------------------------------
echo --- Disable "Google Update Service" services
:: Disable service(s): `gupdate`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'gupdate'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) { Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) { Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try { Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch { Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else { Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if (!$startupType) { $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) { $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if ($startupType -eq 'Disabled') { Write-Host "^""$serviceName is already disabled, no further action is needed"^""; Exit 0; }; <# -- 4. Disable service #>; try { Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch { Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: Disable service(s): `gupdatem`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'gupdatem'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) { Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) { Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try { Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch { Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else { Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if (!$startupType) { $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) { $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if ($startupType -eq 'Disabled') { Write-Host "^""$serviceName is already disabled, no further action is needed"^""; Exit 0; }; <# -- 4. Disable service #>; try { Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch { Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: Disable Google automatic updates scheduled tasks (breaks Google Credential Provider)
echo --- Disable Google automatic updates scheduled tasks (breaks Google Credential Provider)
:: Disable scheduled task(s): `\GoogleUpdateTaskMachineCore`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\'; $taskNamePattern='GoogleUpdateTaskMachineCore'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) { Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) { $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) { Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try { $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch { Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) { Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable scheduled task(s): `\GoogleUpdateTaskMachineUA`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\'; $taskNamePattern='GoogleUpdateTaskMachineUA'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) { Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) { $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) { Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try { $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch { Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) { Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable scheduled task(s): `\GoogleUpdateTaskMachineCore{*}`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\'; $taskNamePattern='GoogleUpdateTaskMachineCore{*}'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) { Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) { $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) { Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try { $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch { Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) { Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable scheduled task(s): `\GoogleUpdateTaskMachineUA{*}`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\'; $taskNamePattern='GoogleUpdateTaskMachineUA{*}'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) { Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) { $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) { Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try { $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch { Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) { Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable sharing scanned software data with Google-----
:: ----------------------------------------------------------
echo --- Disable sharing scanned software data with Google
:: Configure "ChromeCleanupReportingEnabled" Chrome policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Google\Chrome!ChromeCleanupReportingEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Google\Chrome'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Google\Chrome' /v 'ChromeCleanupReportingEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable Chrome system cleanup scans------------
:: ----------------------------------------------------------
echo --- Disable Chrome system cleanup scans
:: Configure "ChromeCleanupEnabled" Chrome policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Google\Chrome!ChromeCleanupEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Google\Chrome'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Google\Chrome' /v 'ChromeCleanupEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting Chrome for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Google Chrome.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable outdated Chrome Software Reporter Tool------
:: ----------------------------------------------------------
echo --- Disable outdated Chrome Software Reporter Tool
:: Check and terminate the running process "software_reporter_tool.exe"
tasklist /fi "ImageName eq software_reporter_tool.exe" /fo csv 2>NUL | find /i "software_reporter_tool.exe">NUL && (
    echo software_reporter_tool.exe is running and will be killed.
    taskkill /f /im software_reporter_tool.exe
) || (
    echo Skipping, software_reporter_tool.exe is not running.
)
:: Configure termination of "software_reporter_tool.exe" immediately upon its startup
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\software_reporter_tool.exe!Debugger"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\software_reporter_tool.exe'; $data =  '%SYSTEMROOT%\System32\taskkill.exe'; reg add 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\software_reporter_tool.exe' /v 'Debugger' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Add a rule to prevent the executable "software_reporter_tool.exe" from running via File Explorer
PowerShell -ExecutionPolicy Unrestricted -Command "$executableFilename='software_reporter_tool.exe'; try { $registryPathForDisallowRun='HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun'; $existingBlockEntries = Get-ItemProperty -Path "^""$registryPathForDisallowRun"^"" -ErrorAction Ignore; $nextFreeRuleIndex = 1; if ($existingBlockEntries) { $existingBlockingRuleForExecutable = $existingBlockEntries.PSObject.Properties | Where-Object { $_.Value -eq $executableFilename }; if ($existingBlockingRuleForExecutable) { $existingBlockingRuleIndexForExecutable = $existingBlockingRuleForExecutable.Name; Write-Output "^""Skipping, no action needed: '$executableFilename' is already blocked under rule index `"^""$existingBlockingRuleIndexForExecutable`"^""."^""; exit 0; }; $occupiedRuleIndexes = $existingBlockEntries.PSObject.Properties | Where-Object { $_.Name -Match '^\d+$' } | Select -ExpandProperty Name; if ($occupiedRuleIndexes) { while ($occupiedRuleIndexes -Contains $nextFreeRuleIndex) { $nextFreeRuleIndex += 1; }; }; }; Write-Output "^""Adding block rule for `"^""$executableFilename`"^"" under rule index `"^""$nextFreeRuleIndex`"^""."^""; if (!(Test-Path $registryPathForDisallowRun)) { New-Item -Path "^""$registryPathForDisallowRun"^"" -Force -ErrorAction Stop | Out-Null; }; New-ItemProperty -Path "^""$registryPathForDisallowRun"^"" -Name "^""$nextFreeRuleIndex"^"" -PropertyType String -Value "^""$executableFilename"^"" ` -ErrorAction Stop | Out-Null; Write-Output "^""Successfully blocked `"^""$executableFilename`"^"" with rule index `"^""$nextFreeRuleIndex`"^""."^""; } catch { Write-Error "^""Failed to block `"^""$executableFilename`"^"": $_"^""; Exit 1; }"
:: Activate the DisallowRun policy to block specified programs from running via File Explorer
PowerShell -ExecutionPolicy Unrestricted -Command "try { $fileExplorerDisallowRunRegistryPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer'; $currentDisallowRunPolicyValue = Get-ItemProperty -Path "^""$fileExplorerDisallowRunRegistryPath"^"" -Name 'DisallowRun' -ErrorAction Ignore | Select -ExpandProperty DisallowRun; if ([string]::IsNullOrEmpty($currentDisallowRunPolicyValue)) { Write-Output "^""Creating DisallowRun policy at `"^""$fileExplorerDisallowRunRegistryPath`"^""."^""; if (!(Test-Path $fileExplorerDisallowRunRegistryPath)) { New-Item -Path "^""$fileExplorerDisallowRunRegistryPath"^"" -Force -ErrorAction Stop | Out-Null; }; New-ItemProperty -Path "^""$fileExplorerDisallowRunRegistryPath"^"" -Name 'DisallowRun' -Value 1 -PropertyType DWORD -Force -ErrorAction Stop | Out-Null; Write-Output 'Successfully activated DisallowRun policy.'; Exit 0; }; if ($currentDisallowRunPolicyValue -eq 1) { Write-Output 'Skipping, no action needed: DisallowRun policy is already in place.'; Exit 0; }; Write-Output 'Updating DisallowRun policy from unexpected value `"^""$currentDisallowRunPolicyValue`"^"" to `"^""1`"^"".'; Set-ItemProperty -Path "^""$fileExplorerDisallowRunRegistryPath"^"" -Name 'DisallowRun' -Value 1 -Type DWORD -Force -ErrorAction Stop | Out-Null; Write-Output 'Successfully activated DisallowRun policy.'; } catch { Write-Error "^""Failed to activate DisallowRun policy: $_"^""; Exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable Chrome metrics reporting-------------
:: ----------------------------------------------------------
echo --- Disable Chrome metrics reporting
:: Configure "MetricsReportingEnabled" Chrome policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Google\Chrome!MetricsReportingEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Google\Chrome'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Google\Chrome' /v 'MetricsReportingEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting Chrome for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Google Chrome.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: Pause the script to view the final state
pause
:: Restore previous environment settings
endlocal
:: Exit the script successfully
exit /b 0