# Auto Elevate to Admin
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -WindowStyle Hidden -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Disable Defender + Tamper Protection via Registry
$defenderRegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender"
New-Item -Path $defenderRegPath -Force | Out-Null

# Disable AntiSpyware (Tamper Protection Bypass via Policy)
New-ItemProperty -Path $defenderRegPath -Name "DisableAntiSpyware" -Value 1 -PropertyType DWORD -Force | Out-Null

# Real-time Protection Registry
$rtp = "$defenderRegPath\Real-Time Protection"
New-Item -Path $rtp -Force | Out-Null
Set-ItemProperty -Path $rtp -Name "DisableAntiSpyware"            -Value 1 -Force
Set-ItemProperty -Path $rtp -Name "DisableRealtimeMonitoring"      -Value 1 -Force
Set-ItemProperty -Path $rtp -Name "DisableBehaviorMonitoring"      -Value 1 -Force
Set-ItemProperty -Path $rtp -Name "DisableOnAccessProtection"      -Value 1 -Force
Set-ItemProperty -Path $rtp -Name "DisableScanOnRealtimeEnable"    -Value 1 -Force
Set-ItemProperty -Path $rtp -Name "DisableRoutinelyTakingAction"   -Value 1 -Force

# MAPS (Cloud Protection) Registry
$maps = "$defenderRegPath\Spynet"
New-Item -Path $maps -Force | Out-Null
Set-ItemProperty -Path $maps -Name "SpynetReporting"      -Value 0 -Force
Set-ItemProperty -Path $maps -Name "SubmitSamplesConsent" -Value 2 -Force

# Merged Defender Preferences
$mpPrefs = @{
    DisableRealtimeMonitoring            = $true
    DisableBehaviorMonitoring            = $true
    DisableBlockAtFirstSeen              = $true
    DisableIOAVProtection                = $true
    DisablePrivacyMode                   = $true
    DisableIntrusionPreventionSystem     = $true
    DisableScriptScanning                = $true
    MAPSReporting                        = 0
    SubmitSamplesConsent                 = 2
    AllowDatagramProcessingOnWinServer            = $false
    AllowNetworkProtectionDownLevel               = $false
    AllowNetworkProtectionOnWinServer             = $false
    DisableArchiveScanning                        = $true
    DisableCatchupFullScan                        = $true
    DisableCatchupQuickScan                       = $true
    DisableDatagramProcessing                     = $true
    DisableDnsOverTcpParsing                      = $true
    DisableDnsParsing                             = $true
    DisableEmailScanning                          = $true
    DisableHttpParsing                            = $true
    DisableInboundConnectionFiltering             = $true
    DisableNetworkProtectionPerfTelemetry         = $true
    DisableRdpParsing                             = $true
    DisableRemovableDriveScanning                 = $true
    DisableRestorePoint                           = $true
    DisableScanningMappedNetworkDrivesForFullScan = $true
    DisableScanningNetworkFiles                   = $true
    DisableSshParsing                             = $true
    DisableTDTFeature                             = $true
    EnableDnsSinkhole                             = $false
    EnableNetworkProtection                       = 0
    ExclusionIPAddress                            = '*'
    ExclusionPath                                 = '*'
    ExclusionProcess                              = '*'
    HighThreatDefaultAction                       = 'Allow'
    LowThreatDefaultAction                        = 'Allow'
    ModerateThreatDefaultAction                   = 'Allow'
    PUAProtection                                 = 'Disabled'
    UnknownThreatDefaultAction                    = 'Allow'
    DisableOnAccessProtection                    = $true
    SignatureDisableUpdateOnStartupWithoutEngine = $true
}

Try {
    Set-MpPreference @mpPrefs
} Catch { }

# Stop + Disable Defender Services
$defenderServices = @("WinDefend","WdFilter","WdNisDrv","WdNisSvc","wscsvc","SecurityHealthService")

ForEach ($svc in $defenderServices) {
    Try {
        Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\$svc" -Name "Start" -Value 4 -Force
    } Catch {     }
}

# Disable Defender Scheduled Tasks (Including Subfolders)
try {
    $defenderTasks = Get-ScheduledTask | Where-Object { $_.TaskPath -like "\Microsoft\Windows\Windows Defender\*" }
    if ($defenderTasks) {
        $defenderTasks | Disable-ScheduledTask -ErrorAction SilentlyContinue
    } else { }
} Catch { }

Write-Host "[✓] Completed...."
Start-Sleep -Seconds 2
exit