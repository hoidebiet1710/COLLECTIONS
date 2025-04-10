@echo off & color 1f


:: ----------------------------------------------------------
:: -----------Disable Edge diagnostic data sending-----------
:: ----------------------------------------------------------
echo --- Disable Edge diagnostic data sending
:: Configure "DiagnosticData" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!DiagnosticData"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'DiagnosticData' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable outdated Edge metrics data sending--------
:: ----------------------------------------------------------
echo --- Disable outdated Edge metrics data sending
:: Configure "MetricsReportingEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!MetricsReportingEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'MetricsReportingEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable outdated Edge site information sending------
:: ----------------------------------------------------------
echo --- Disable outdated Edge site information sending
:: Configure "SendSiteInfoToImproveServices" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!SendSiteInfoToImproveServices"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'SendSiteInfoToImproveServices' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Disable Edge Feedback-------------------
:: ----------------------------------------------------------
echo --- Disable Edge Feedback
:: Configure "UserFeedbackAllowed" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!UserFeedbackAllowed"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'UserFeedbackAllowed' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable automatic installation of Edge----------
:: ----------------------------------------------------------
echo --- Disable automatic installation of Edge
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\EdgeUpdate!DoNotUpdateToEdgeWithChromium"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\EdgeUpdate'; $data =  '1'; reg add 'HKLM\SOFTWARE\Microsoft\EdgeUpdate' /v 'DoNotUpdateToEdgeWithChromium' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: Disable automatic installation of Edge across all channels
echo --- Disable automatic installation of Edge across all channels
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate!InstallDefault"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate' /v 'InstallDefault' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate!Install{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate' /v 'Install{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate!Install{2CD8A007-E189-409D-A2C8-9AF4EF3C72AA}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate' /v 'Install{2CD8A007-E189-409D-A2C8-9AF4EF3C72AA}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate!Install{65C35B14-6C1D-4122-AC46-7148CC9D6497}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate' /v 'Install{65C35B14-6C1D-4122-AC46-7148CC9D6497}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate!Install{0D50BFEC-CD6A-4F9A-964C-C7416E3ACB10}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate' /v 'Install{0D50BFEC-CD6A-4F9A-964C-C7416E3ACB10}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Disable automatic installation of WebView and WebView2--
:: ----------------------------------------------------------
echo --- Disable automatic installation of WebView and WebView2
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate!Install{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate' /v 'Install{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable Edge automatic update services----------
:: ----------------------------------------------------------
echo --- Disable Edge automatic update services
:: Disable service(s): `edgeupdate`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'edgeupdate'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) { Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) { Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try { Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch { Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else { Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if (!$startupType) { $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) { $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if ($startupType -eq 'Disabled') { Write-Host "^""$serviceName is already disabled, no further action is needed"^""; Exit 0; }; <# -- 4. Disable service #>; try { Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch { Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: Disable service(s): `edgeupdatem`
PowerShell -ExecutionPolicy Unrestricted -Command "$serviceName = 'edgeupdatem'; Write-Host "^""Disabling service: `"^""$serviceName`"^""."^""; <# -- 1. Skip if service does not exist #>; $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue; if(!$service) { Write-Host "^""Service `"^""$serviceName`"^"" could not be not found, no need to disable it."^""; Exit 0; }; <# -- 2. Stop if running #>; if ($service.Status -eq [System.ServiceProcess.ServiceControllerStatus]::Running) { Write-Host "^""`"^""$serviceName`"^"" is running, stopping it."^""; try { Stop-Service -Name "^""$serviceName"^"" -Force -ErrorAction Stop; Write-Host "^""Stopped `"^""$serviceName`"^"" successfully."^""; } catch { Write-Warning "^""Could not stop `"^""$serviceName`"^"", it will be stopped after reboot: $_"^""; }; } else { Write-Host "^""`"^""$serviceName`"^"" is not running, no need to stop."^""; }; <# -- 3. Skip if already disabled #>; $startupType = $service.StartType <# Does not work before .NET 4.6.1 #>; if (!$startupType) { $startupType = (Get-WmiObject -Query "^""Select StartMode From Win32_Service Where Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; if(!$startupType) { $startupType = (Get-WmiObject -Class Win32_Service -Property StartMode -Filter "^""Name='$serviceName'"^"" -ErrorAction Ignore).StartMode; }; }; if ($startupType -eq 'Disabled') { Write-Host "^""$serviceName is already disabled, no further action is needed"^""; Exit 0; }; <# -- 4. Disable service #>; try { Set-Service -Name "^""$serviceName"^"" -StartupType Disabled -Confirm:$false -ErrorAction Stop; Write-Host "^""Disabled `"^""$serviceName`"^"" successfully."^""; } catch { Write-Error "^""Could not disable `"^""$serviceName`"^"": $_"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable Edge automatic update scheduled tasks-------
:: ----------------------------------------------------------
echo --- Disable Edge automatic update scheduled tasks
:: Disable scheduled task(s): `\MicrosoftEdgeUpdateTaskMachineCore{*}`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\'; $taskNamePattern='MicrosoftEdgeUpdateTaskMachineCore{*}'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) { Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) { $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) { Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try { $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch { Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) { Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: Disable scheduled task(s): `\MicrosoftEdgeUpdateTaskMachineUA{*}`
PowerShell -ExecutionPolicy Unrestricted -Command "$taskPathPattern='\'; $taskNamePattern='MicrosoftEdgeUpdateTaskMachineUA{*}'; Write-Output "^""Disabling tasks matching pattern `"^""$taskNamePattern`"^""."^""; $tasks = @(Get-ScheduledTask -TaskPath $taskPathPattern -TaskName $taskNamePattern -ErrorAction Ignore); if (-Not $tasks) { Write-Output "^""Skipping, no tasks matching pattern `"^""$taskNamePattern`"^"" found, no action needed."^""; exit 0; }; $operationFailed = $false; foreach ($task in $tasks) { $taskName = $task.TaskName; if ($task.State -eq [Microsoft.PowerShell.Cmdletization.GeneratedTypes.ScheduledTask.StateEnum]::Disabled) { Write-Output "^""Skipping, task `"^""$taskName`"^"" is already disabled, no action needed."^""; continue; }; try { $task | Disable-ScheduledTask -ErrorAction Stop | Out-Null; Write-Output "^""Successfully disabled task `"^""$taskName`"^""."^""; } catch { Write-Error "^""Failed to disable task `"^""$taskName`"^"": $($_.Exception.Message)"^""; $operationFailed = $true; }; }; if ($operationFailed) { Write-Output 'Failed to disable some tasks. Check error messages above.'; exit 1; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable Edge update executable--------------
:: ----------------------------------------------------------
echo --- Disable Edge update executable
:: Check and terminate the running process "MicrosoftEdgeUpdate.exe"
tasklist /fi "ImageName eq MicrosoftEdgeUpdate.exe" /fo csv 2>NUL | find /i "MicrosoftEdgeUpdate.exe">NUL && (
    echo MicrosoftEdgeUpdate.exe is running and will be killed.
    taskkill /f /im MicrosoftEdgeUpdate.exe
) || (
    echo Skipping, MicrosoftEdgeUpdate.exe is not running.
)
:: Configure termination of "MicrosoftEdgeUpdate.exe" immediately upon its startup
:: Set the registry value: "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MicrosoftEdgeUpdate.exe!Debugger"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MicrosoftEdgeUpdate.exe'; $data =  '%SYSTEMROOT%\System32\taskkill.exe'; reg add 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MicrosoftEdgeUpdate.exe' /v 'Debugger' /t 'REG_SZ' /d "^""$data"^"" /f"
:: Add a rule to prevent the executable "MicrosoftEdgeUpdate.exe" from running via File Explorer
PowerShell -ExecutionPolicy Unrestricted -Command "$executableFilename='MicrosoftEdgeUpdate.exe'; try { $registryPathForDisallowRun='HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun'; $existingBlockEntries = Get-ItemProperty -Path "^""$registryPathForDisallowRun"^"" -ErrorAction Ignore; $nextFreeRuleIndex = 1; if ($existingBlockEntries) { $existingBlockingRuleForExecutable = $existingBlockEntries.PSObject.Properties | Where-Object { $_.Value -eq $executableFilename }; if ($existingBlockingRuleForExecutable) { $existingBlockingRuleIndexForExecutable = $existingBlockingRuleForExecutable.Name; Write-Output "^""Skipping, no action needed: '$executableFilename' is already blocked under rule index `"^""$existingBlockingRuleIndexForExecutable`"^""."^""; exit 0; }; $occupiedRuleIndexes = $existingBlockEntries.PSObject.Properties | Where-Object { $_.Name -Match '^\d+$' } | Select -ExpandProperty Name; if ($occupiedRuleIndexes) { while ($occupiedRuleIndexes -Contains $nextFreeRuleIndex) { $nextFreeRuleIndex += 1; }; }; }; Write-Output "^""Adding block rule for `"^""$executableFilename`"^"" under rule index `"^""$nextFreeRuleIndex`"^""."^""; if (!(Test-Path $registryPathForDisallowRun)) { New-Item -Path "^""$registryPathForDisallowRun"^"" -Force -ErrorAction Stop | Out-Null; }; New-ItemProperty -Path "^""$registryPathForDisallowRun"^"" -Name "^""$nextFreeRuleIndex"^"" -PropertyType String -Value "^""$executableFilename"^"" ` -ErrorAction Stop | Out-Null; Write-Output "^""Successfully blocked `"^""$executableFilename`"^"" with rule index `"^""$nextFreeRuleIndex`"^""."^""; } catch { Write-Error "^""Failed to block `"^""$executableFilename`"^"": $_"^""; Exit 1; }"
:: Activate the DisallowRun policy to block specified programs from running via File Explorer
PowerShell -ExecutionPolicy Unrestricted -Command "try { $fileExplorerDisallowRunRegistryPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer'; $currentDisallowRunPolicyValue = Get-ItemProperty -Path "^""$fileExplorerDisallowRunRegistryPath"^"" -Name 'DisallowRun' -ErrorAction Ignore | Select -ExpandProperty DisallowRun; if ([string]::IsNullOrEmpty($currentDisallowRunPolicyValue)) { Write-Output "^""Creating DisallowRun policy at `"^""$fileExplorerDisallowRunRegistryPath`"^""."^""; if (!(Test-Path $fileExplorerDisallowRunRegistryPath)) { New-Item -Path "^""$fileExplorerDisallowRunRegistryPath"^"" -Force -ErrorAction Stop | Out-Null; }; New-ItemProperty -Path "^""$fileExplorerDisallowRunRegistryPath"^"" -Name 'DisallowRun' -Value 1 -PropertyType DWORD -Force -ErrorAction Stop | Out-Null; Write-Output 'Successfully activated DisallowRun policy.'; Exit 0; }; if ($currentDisallowRunPolicyValue -eq 1) { Write-Output 'Skipping, no action needed: DisallowRun policy is already in place.'; Exit 0; }; Write-Output 'Updating DisallowRun policy from unexpected value `"^""$currentDisallowRunPolicyValue`"^"" to `"^""1`"^"".'; Set-ItemProperty -Path "^""$fileExplorerDisallowRunRegistryPath"^"" -Name 'DisallowRun' -Value 1 -Type DWORD -Force -ErrorAction Stop | Out-Null; Write-Output 'Successfully activated DisallowRun policy.'; } catch { Write-Error "^""Failed to activate DisallowRun policy: $_"^""; Exit 1; }"
:: Soft delete files matching pattern: "%PROGRAMFILES(x86)%\Microsoft\EdgeUpdate\MicrosoftEdgeUpdate.exe"  
PowerShell -ExecutionPolicy Unrestricted -Command "$pathGlobPattern = "^""%PROGRAMFILES(x86)%\Microsoft\EdgeUpdate\MicrosoftEdgeUpdate.exe"^""; $expandedPath = [System.Environment]::ExpandEnvironmentVariables($pathGlobPattern); Write-Host "^""Searching for items matching pattern: `"^""$($expandedPath)`"^""."^""; $renamedCount   = 0; $skippedCount   = 0; $failedCount    = 0; $foundAbsolutePaths = @(); try { $foundAbsolutePaths += @(; Get-Item -Path $expandedPath -ErrorAction Stop | Select-Object -ExpandProperty FullName; ); } catch [System.Management.Automation.ItemNotFoundException] { <# Swallow, do not run `Test-Path` before, it's unreliable for globs requiring extra permissions #>; }; $foundAbsolutePaths = $foundAbsolutePaths | Select-Object -Unique | Sort-Object -Property { $_.Length } -Descending; if (!$foundAbsolutePaths) { Write-Host 'Skipping, no items available.'; exit 0; }; Write-Host "^""Initiating processing of $($foundAbsolutePaths.Count) items from `"^""$expandedPath`"^""."^""; foreach ($path in $foundAbsolutePaths) { if (Test-Path -Path $path -PathType Container) { Write-Host "^""Skipping folder (not its contents): `"^""$path`"^""."^""; $skippedCount++; continue; }; if($revert -eq $true) { if (-not $path.EndsWith('.OLD')) { Write-Host "^""Skipping non-backup file: `"^""$path`"^""."^""; $skippedCount++; continue; }; } else { if ($path.EndsWith('.OLD')) { Write-Host "^""Skipping backup file: `"^""$path`"^""."^""; $skippedCount++; continue; }; }; $originalFilePath = $path; Write-Host "^""Processing file: `"^""$originalFilePath`"^""."^""; if (-Not (Test-Path $originalFilePath)) { Write-Host "^""Skipping, file `"^""$originalFilePath`"^"" not found."^""; $skippedCount++; exit 0; }; if ($revert -eq $true) { $newFilePath = $originalFilePath.Substring(0, $originalFilePath.Length - 4); } else { $newFilePath = "^""$($originalFilePath).OLD"^""; }; try { Move-Item -LiteralPath "^""$($originalFilePath)"^"" -Destination "^""$newFilePath"^"" -Force -ErrorAction Stop; Write-Host "^""Successfully processed `"^""$originalFilePath`"^""."^""; $renamedCount++; } catch { Write-Error "^""Failed to rename `"^""$originalFilePath`"^"" to `"^""$newFilePath`"^"": $($_.Exception.Message)"^""; $failedCount++; }; }; if (($renamedCount -gt 0) -or ($skippedCount -gt 0)) { Write-Host "^""Successfully processed $renamedCount items and skipped $skippedCount items."^""; }; if ($failedCount -gt 0) { Write-Warning "^""Failed to process $($failedCount) items."^""; }"
:: Soft delete files matching pattern: "%PROGRAMFILES(x86)%\Microsoft\EdgeUpdate\*\MicrosoftEdgeUpdate.exe"  
PowerShell -ExecutionPolicy Unrestricted -Command "$pathGlobPattern = "^""%PROGRAMFILES(x86)%\Microsoft\EdgeUpdate\*\MicrosoftEdgeUpdate.exe"^""; $expandedPath = [System.Environment]::ExpandEnvironmentVariables($pathGlobPattern); Write-Host "^""Searching for items matching pattern: `"^""$($expandedPath)`"^""."^""; $renamedCount   = 0; $skippedCount   = 0; $failedCount    = 0; $foundAbsolutePaths = @(); try { $foundAbsolutePaths += @(; Get-Item -Path $expandedPath -ErrorAction Stop | Select-Object -ExpandProperty FullName; ); } catch [System.Management.Automation.ItemNotFoundException] { <# Swallow, do not run `Test-Path` before, it's unreliable for globs requiring extra permissions #>; }; $foundAbsolutePaths = $foundAbsolutePaths | Select-Object -Unique | Sort-Object -Property { $_.Length } -Descending; if (!$foundAbsolutePaths) { Write-Host 'Skipping, no items available.'; exit 0; }; Write-Host "^""Initiating processing of $($foundAbsolutePaths.Count) items from `"^""$expandedPath`"^""."^""; foreach ($path in $foundAbsolutePaths) { if (Test-Path -Path $path -PathType Container) { Write-Host "^""Skipping folder (not its contents): `"^""$path`"^""."^""; $skippedCount++; continue; }; if($revert -eq $true) { if (-not $path.EndsWith('.OLD')) { Write-Host "^""Skipping non-backup file: `"^""$path`"^""."^""; $skippedCount++; continue; }; } else { if ($path.EndsWith('.OLD')) { Write-Host "^""Skipping backup file: `"^""$path`"^""."^""; $skippedCount++; continue; }; }; $originalFilePath = $path; Write-Host "^""Processing file: `"^""$originalFilePath`"^""."^""; if (-Not (Test-Path $originalFilePath)) { Write-Host "^""Skipping, file `"^""$originalFilePath`"^"" not found."^""; $skippedCount++; exit 0; }; if ($revert -eq $true) { $newFilePath = $originalFilePath.Substring(0, $originalFilePath.Length - 4); } else { $newFilePath = "^""$($originalFilePath).OLD"^""; }; try { Move-Item -LiteralPath "^""$($originalFilePath)"^"" -Destination "^""$newFilePath"^"" -Force -ErrorAction Stop; Write-Host "^""Successfully processed `"^""$originalFilePath`"^""."^""; $renamedCount++; } catch { Write-Error "^""Failed to rename `"^""$originalFilePath`"^"" to `"^""$newFilePath`"^"": $($_.Exception.Message)"^""; $failedCount++; }; }; if (($renamedCount -gt 0) -or ($skippedCount -gt 0)) { Write-Host "^""Successfully processed $renamedCount items and skipped $skippedCount items."^""; }; if ($failedCount -gt 0) { Write-Warning "^""Failed to process $($failedCount) items."^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable Edge automatic updates across all channels----
:: ----------------------------------------------------------
echo --- Disable Edge automatic updates across all channels
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate!UpdateDefault"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate' /v 'UpdateDefault' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate!Update{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate' /v 'Update{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate!Update{2CD8A007-E189-409D-A2C8-9AF4EF3C72AA}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate' /v 'Update{2CD8A007-E189-409D-A2C8-9AF4EF3C72AA}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate!Update{65C35B14-6C1D-4122-AC46-7148CC9D6497}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate' /v 'Update{65C35B14-6C1D-4122-AC46-7148CC9D6497}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate!Update{0D50BFEC-CD6A-4F9A-964C-C7416E3ACB10}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate' /v 'Update{0D50BFEC-CD6A-4F9A-964C-C7416E3ACB10}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate!Update{F3C4FE00-EFD5-403B-9569-398A20F1BA4A}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate' /v 'Update{F3C4FE00-EFD5-403B-9569-398A20F1BA4A}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable Edge WebView and WebView2 updates---------
:: ----------------------------------------------------------
echo --- Disable Edge WebView and WebView2 updates
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate!Update{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate' /v 'Update{F3017226-FE2A-4295-8BDF-00C3A9A7E4C5}' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable Edge automatic update checks-----------
:: ----------------------------------------------------------
echo --- Disable Edge automatic update checks
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate!AutoUpdateCheckPeriodMinutes"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate' /v 'AutoUpdateCheckPeriodMinutes' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Maximize Edge update suppression duration---------
:: ----------------------------------------------------------
echo --- Maximize Edge update suppression duration
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate!UpdatesSuppressedDurationMin"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate'; $data =  '1440'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate' /v 'UpdatesSuppressedDurationMin' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate!UpdatesSuppressedStartHour"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate' /v 'UpdatesSuppressedStartHour' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate!UpdatesSuppressedStartMin"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate' /v 'UpdatesSuppressedStartMin' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable Edge Copilot and Hubs Sidebar-----------
:: ----------------------------------------------------------
echo --- Disable Edge Copilot and Hubs Sidebar
:: Configure "HubsSidebarEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!HubsSidebarEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'HubsSidebarEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Configure "StandaloneHubsSidebarEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!StandaloneHubsSidebarEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'StandaloneHubsSidebarEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------Disable Edge Copilot browsing data collection-------
:: ----------------------------------------------------------
echo --- Disable Edge Copilot browsing data collection
:: Configure "DiscoverPageContextEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!DiscoverPageContextEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'DiscoverPageContextEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Configure "CopilotPageContext" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!CopilotPageContext"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'CopilotPageContext' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Configure "CopilotCDPPageContext" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!CopilotCDPPageContext"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'CopilotCDPPageContext' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable Edge Copilot access on new tab page--------
:: ----------------------------------------------------------
echo --- Disable Edge Copilot access on new tab page
:: Configure "NewTabPageBingChatEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!NewTabPageBingChatEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'NewTabPageBingChatEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable outdated Edge Discover button-----------
:: ----------------------------------------------------------
echo --- Disable outdated Edge Discover button
:: Configure "EdgeDiscoverEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!EdgeDiscoverEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'EdgeDiscoverEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable Edge spotlight recommendations----------
:: ----------------------------------------------------------
echo --- Disable Edge spotlight recommendations
:: Configure "SpotlightExperiencesAndRecommendationsEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!SpotlightExperiencesAndRecommendationsEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'SpotlightExperiencesAndRecommendationsEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------------Disable Edge feature ads-----------------
:: ----------------------------------------------------------
echo --- Disable Edge feature ads
:: Configure "ShowRecommendationsEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!ShowRecommendationsEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'ShowRecommendationsEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------------Disable Edge Bing ads-------------------
:: ----------------------------------------------------------
echo --- Disable Edge Bing ads
:: Configure "BingAdsSuppression" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!BingAdsSuppression"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'BingAdsSuppression' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable Edge promotional pages--------------
:: ----------------------------------------------------------
echo --- Disable Edge promotional pages
:: Configure "PromotionalTabsEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!PromotionalTabsEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'PromotionalTabsEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable Edge browsing history collection for ads-----
:: ----------------------------------------------------------
echo --- Disable Edge browsing history collection for ads
:: Configure "PersonalizationReportingEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!PersonalizationReportingEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'PersonalizationReportingEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------------Disable Edge Insider ads-----------------
:: ----------------------------------------------------------
echo --- Disable Edge Insider ads
:: Configure "MicrosoftEdgeInsiderPromotionEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!MicrosoftEdgeInsiderPromotionEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'MicrosoftEdgeInsiderPromotionEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable Edge Adobe Acrobat subscription ads--------
:: ----------------------------------------------------------
echo --- Disable Edge Adobe Acrobat subscription ads
:: Configure "ShowAcrobatSubscriptionButton" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!ShowAcrobatSubscriptionButton"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'ShowAcrobatSubscriptionButton' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: Disable Edge top sites and sponsored links on new tab page
echo --- Disable Edge top sites and sponsored links on new tab page
:: Configure "NewTabPageHideDefaultTopSites" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!NewTabPageHideDefaultTopSites"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'NewTabPageHideDefaultTopSites' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Enable Edge tracking prevention--------------
:: ----------------------------------------------------------
echo --- Enable Edge tracking prevention
:: Configure "TrackingPrevention" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!TrackingPrevention"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '3'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'TrackingPrevention' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Block Edge third party cookies--------------
:: ----------------------------------------------------------
echo --- Block Edge third party cookies
:: Configure "BlockThirdPartyCookies" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!BlockThirdPartyCookies"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'BlockThirdPartyCookies' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Enable Do Not Track requests---------------
:: ----------------------------------------------------------
echo --- Enable Do Not Track requests
:: Configure "ConfigureDoNotTrack" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!ConfigureDoNotTrack"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'ConfigureDoNotTrack' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Disable Edge Follow feature----------------
:: ----------------------------------------------------------
echo --- Disable Edge Follow feature
:: Configure "EdgeFollowEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!EdgeFollowEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'EdgeFollowEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable Edge Shopping Assistant--------------
:: ----------------------------------------------------------
echo --- Disable Edge Shopping Assistant
:: Configure "EdgeShoppingAssistantEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!EdgeShoppingAssistantEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'EdgeShoppingAssistantEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Disable Edge Search bar on desktop------------
:: ----------------------------------------------------------
echo --- Disable Edge Search bar on desktop
:: Configure "WebWidgetAllowed" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!WebWidgetAllowed"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'WebWidgetAllowed' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Configure "WebWidgetIsEnabledOnStartup" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!WebWidgetIsEnabledOnStartup"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'WebWidgetIsEnabledOnStartup' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Configure "SearchbarAllowed" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!SearchbarAllowed"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'SearchbarAllowed' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Configure "SearchbarIsEnabledOnStartup" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!SearchbarIsEnabledOnStartup"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'SearchbarIsEnabledOnStartup' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable Edge Microsoft Rewards--------------
:: ----------------------------------------------------------
echo --- Disable Edge Microsoft Rewards
:: Configure "ShowMicrosoftRewards" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!ShowMicrosoftRewards"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'ShowMicrosoftRewards' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable Edge Bing suggestions in address bar-------
:: ----------------------------------------------------------
echo --- Disable Edge Bing suggestions in address bar
:: Configure "AddressBarMicrosoftSearchInBingProviderEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!AddressBarMicrosoftSearchInBingProviderEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'AddressBarMicrosoftSearchInBingProviderEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable Edge "Find on Page" data collection--------
:: ----------------------------------------------------------
echo --- Disable Edge "Find on Page" data collection
:: Configure "RelatedMatchesCloudServiceEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!RelatedMatchesCloudServiceEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'RelatedMatchesCloudServiceEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable Edge sign-in prompt on new tab page--------
:: ----------------------------------------------------------
echo --- Disable Edge sign-in prompt on new tab page
:: Configure "SignInCtaOnNtpEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!SignInCtaOnNtpEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'SignInCtaOnNtpEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable Edge search and site suggestions---------
:: ----------------------------------------------------------
echo --- Disable Edge search and site suggestions
:: Configure "SearchSuggestEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!SearchSuggestEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'SearchSuggestEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable outdated Edge automatic image enhancement-----
:: ----------------------------------------------------------
echo --- Disable outdated Edge automatic image enhancement
:: Configure "EdgeEnhanceImagesEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!EdgeEnhanceImagesEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'EdgeEnhanceImagesEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------Disable Edge quick links on the new tab page-------
:: ----------------------------------------------------------
echo --- Disable Edge quick links on the new tab page
:: Configure "NewTabPageQuickLinksEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!NewTabPageQuickLinksEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'NewTabPageQuickLinksEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Disable Edge remote background images on new tab page---
:: ----------------------------------------------------------
echo --- Disable Edge remote background images on new tab page
:: Configure "NewTabPageAllowedBackgroundTypes" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!NewTabPageAllowedBackgroundTypes"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'NewTabPageAllowedBackgroundTypes' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable Edge Collections feature-------------
:: ----------------------------------------------------------
echo --- Disable Edge Collections feature
:: Configure "EdgeCollectionsEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!EdgeCollectionsEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'EdgeCollectionsEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -Disable Edge failed page data collection and suggestions-
:: ----------------------------------------------------------
echo --- Disable Edge failed page data collection and suggestions
:: Configure "AlternateErrorPagesEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!AlternateErrorPagesEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'AlternateErrorPagesEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -------------Disable outdated Edge games menu-------------
:: ----------------------------------------------------------
echo --- Disable outdated Edge games menu
:: Configure "AllowGamesMenu" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!AllowGamesMenu"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'AllowGamesMenu' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------------Disable Edge in-app support----------------
:: ----------------------------------------------------------
echo --- Disable Edge in-app support
:: Configure "InAppSupportEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!InAppSupportEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'InAppSupportEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Suggest restarting Edge for changes to take effect
PowerShell -ExecutionPolicy Unrestricted -Command "$message = 'For the changes to fully take effect, please restart Microsoft Edge.'; $warn =  $false; if ($warn) { Write-Warning "^""$message"^""; } else { Write-Host "^""Note: "^"" -ForegroundColor Blue -NoNewLine; Write-Output "^""$message"^""; }"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable Edge payment data storage and ads---------
:: ----------------------------------------------------------
echo --- Disable Edge payment data storage and ads
:: Configure "AutofillCreditCardEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!AutofillCreditCardEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'AutofillCreditCardEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ------------Disable Edge address data storage-------------
:: ----------------------------------------------------------
echo --- Disable Edge address data storage
:: Configure "AutofillAddressEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!AutofillAddressEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'AutofillAddressEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --Disable Edge experimentation and remote configuration---
:: ----------------------------------------------------------
echo --- Disable Edge experimentation and remote configuration
:: Configure "ExperimentationAndConfigurationServiceControl" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!ExperimentationAndConfigurationServiceControl"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'ExperimentationAndConfigurationServiceControl' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------------Disable Edge automatic startup--------------
:: ----------------------------------------------------------
echo --- Disable Edge automatic startup
:: Configure "StartupBoostEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!StartupBoostEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'StartupBoostEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: --------Disable Edge external connectivity checks---------
:: ----------------------------------------------------------
echo --- Disable Edge external connectivity checks
:: Configure "ResolveNavigationErrorsUseWebService" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!ResolveNavigationErrorsUseWebService"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'ResolveNavigationErrorsUseWebService' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----------Disable Edge Family Safety settings------------
:: ----------------------------------------------------------
echo --- Disable Edge Family Safety settings
:: Configure "FamilySafetySettingsEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!FamilySafetySettingsEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'FamilySafetySettingsEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----Disable Edge site information gathering from Bing-----
:: ----------------------------------------------------------
echo --- Disable Edge site information gathering from Bing
:: Configure "SiteSafetyServicesEnabled" Edge policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\Edge!SiteSafetyServicesEnabled"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\Edge'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\Edge' /v 'SiteSafetyServicesEnabled' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: -----Disable Edge (Legacy) Live Tile data collection------
:: ----------------------------------------------------------
echo --- Disable Edge (Legacy) Live Tile data collection
:: Configure "PreventLiveTileDataCollection" Edge (Legacy) policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main!PreventLiveTileDataCollection"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main'; $data =  '1'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main' /v 'PreventLiveTileDataCollection' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main!PreventLiveTileDataCollection"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main'; $data =  '1'; reg add 'HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main' /v 'PreventLiveTileDataCollection' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ---------Disable Edge (Legacy) search suggestions---------
:: ----------------------------------------------------------
echo --- Disable Edge (Legacy) search suggestions
:: Configure "ShowSearchSuggestionsGlobal" Edge (Legacy) policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\SearchScopes!ShowSearchSuggestionsGlobal"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\SearchScopes'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\SearchScopes' /v 'ShowSearchSuggestionsGlobal' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\SearchScopes!ShowSearchSuggestionsGlobal"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\SearchScopes'; $data =  '0'; reg add 'HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\SearchScopes' /v 'ShowSearchSuggestionsGlobal' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: ----------------------------------------------------------
:: ----------Disable Edge (Legacy) Books telemetry-----------
:: ----------------------------------------------------------
echo --- Disable Edge (Legacy) Books telemetry
:: Configure "EnableExtendedBooksTelemetry" Edge (Legacy) policy
:: Set the registry value: "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary!EnableExtendedBooksTelemetry"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary'; $data =  '0'; reg add 'HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\BooksLibrary' /v 'EnableExtendedBooksTelemetry' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: Set the registry value: "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\BooksLibrary!EnableExtendedBooksTelemetry"
PowerShell -ExecutionPolicy Unrestricted -Command "$registryPath = 'HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\BooksLibrary'; $data =  '0'; reg add 'HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\BooksLibrary' /v 'EnableExtendedBooksTelemetry' /t 'REG_DWORD' /d "^""$data"^"" /f"
:: ----------------------------------------------------------


:: Pause the script to view the final state
pause
:: Restore previous environment settings
endlocal
:: Exit the script successfully
exit /b 0