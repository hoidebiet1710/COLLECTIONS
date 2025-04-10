@echo off & color 1f


:: ----------------------------------------------------------
:: Disable Firefox default browser and system data reporting-
:: ----------------------------------------------------------
echo --- Disable Firefox default browser and system data reporting
:: Set the registry value: "HKLM\SOFTWARE\Policies\Mozilla\Firefox!DisableDefaultBrowserAgent"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Mozilla\Firefox'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Mozilla\Firefox' /v 'DisableDefaultBrowserAgent' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable Firefox background browser checks---------
:: ----------------------------------------------------------
echo --- Disable Firefox background browser checks
:: Disable scheduled task(s): `\Mozilla\Firefox Default Browser Agent 308046B0AF4A39CB`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Mozilla\'; $taskNamePattern='Firefox Default Browser Agent 308046B0AF4A39CB'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) { Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) { $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) { Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try { $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch { Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) { Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable scheduled task(s): `\Mozilla\Firefox Default Browser Agent D2CEEC440E2074BD`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\Mozilla\'; $taskNamePattern='Firefox Default Browser Agent D2CEEC440E2074BD'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) { Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) { $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) { Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try { $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch { Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) { Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable Firefox telemetry data collection---------
:: ----------------------------------------------------------
echo --- Disable Firefox telemetry data collection
:: Set the registry value: "HKLM\SOFTWARE\Policies\Mozilla\Firefox!DisableTelemetry"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Mozilla\Firefox'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Mozilla\Firefox' /v 'DisableTelemetry' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: Pause the script to view the final state
pause
:: Restore previous environment settings
endlocal
:: Exit the script successfully
exit /b 0