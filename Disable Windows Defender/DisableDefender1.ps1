#Requires -RunAsAdministrator

# "Disables" Defender by adding exclusions and turning off advanced bits. Run this under an elevated powershell prompt
# Defender will be essentially gutted/disabled without messing with any files/underlying services. Windows Security center will still display that AV is working etc.

$driveletters = [char]'a'..[char]'z'

$paramHash = @{
    AllowDatagramProcessingOnWinServer            = $False
    AllowNetworkProtectionDownLevel               = $False
    AllowNetworkProtectionOnWinServer             = $False
    DisableArchiveScanning                        = $True
    DisableBehaviorMonitoring                     = $True
    DisableBlockAtFirstSeen                       = $True
    DisableCatchupFullScan                        = $True
    DisableCatchupQuickScan                       = $True
    DisableDatagramProcessing                     = $True
    DisableDnsOverTcpParsing                      = $True
    DisableDnsParsing                             = $True
    DisableEmailScanning                          = $True
    DisableHttpParsing                            = $True
    DisableInboundConnectionFiltering             = $True
    DisableIntrusionPreventionSystem              = $True
    DisableIOAVProtection                         = $True
    DisableNetworkProtectionPerfTelemetry         = $True
    DisablePrivacyMode                            = $True
    DisableRdpParsing                             = $True
    DisableRealtimeMonitoring                     = $True
    DisableRemovableDriveScanning                 = $True
    DisableRestorePoint                           = $True
    DisableScanningMappedNetworkDrivesForFullScan = $True
    DisableScanningNetworkFiles                   = $True
    DisableScriptScanning                         = $True
    DisableSshParsing                             = $True
    DisableTDTFeature                             = $True
    DisableTlsParsing                             = $True
    EnableDnsSinkhole                             = $False
    EnableNetworkProtection                       = 0
    ExclusionIPAddress                            = '*'
    ExclusionPath                                 = '*'
    ExclusionProcess                              = '*'
    HighThreatDefaultAction                       = 'Allow'
    LowThreatDefaultAction                        = 'Allow'
    MAPSReporting                                 = 'Disabled'
    ModerateThreatDefaultAction                   = 'Allow'
    PUAProtection                                 = 'Disabled'
    SubmitSamplesConsent                          = 2
    UnknownThreatDefaultAction                    = 'Allow'
}

# Try each parameter since they may vary based on OS version
$paramHash.keys.ForEach({
    $curParam = @{
        "$_" = $paramHash["$_"]
    }
    Set-MpPreference @curParam -ErrorAction Continue -Verbose
})

foreach ($letter in $driveletters) {
    Add-MpPreference -ExclusionPath "${letter}:\" -ErrorAction Continue -Verbose
}
