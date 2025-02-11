Clear-Host

Write-Host "1 -> Never check for updates"
Write-Host "2 -> Disable Windows Firewall"
Write-Host "3 -> Disable Windows Defender"


Write-Host "Enter any character to exit"
Write-Host
switch(Read-Host "Choose Window Update Settings"){
       1 {$UpdateValue = 1}
       2 {$UpdateValue = 2}
       2 {$UpdateValue = 3}
       Default{Exit}
}

$WindowsUpdatePath = "HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\"
$AutoUpdatePath    = "HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"

If(Test-Path -Path $WindowsUpdatePath) {
    Remove-Item -Path $WindowsUpdatePath -Recurse
}


If ($UpdateValue -eq 1) {
    Write-Host "[+] Disable AutoUpdate:"
    Set-ItemProperty -Path $AutoUpdatePath -Name NoAutoUpdate -Value 1
    Write-Host "[+] Disabel Windows update ScheduledTask"
    Get-ScheduledTask -TaskPath "\Microsoft\Windows\WindowsUpdate\" | Disable-ScheduledTask
    Write-Host "[+] Take Windows update  Orchestrator ownership"
    takeown /F C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator /A /R
    icacls C:\Windows\System32\Tasks\Microsoft\Windows\UpdateOrchestrator /grant Administrators:F /T
    Write-Host "[+] List Windows update  Orchestrator ownership"
    Get-ScheduledTask -TaskPath "\Microsoft\Windows\UpdateOrchestrator\" | Disable-ScheduledTask
    Write-Host "[+] Disable Windows Update Server AutoStartup"
    Set-Service wuauserv -StartupType Disabled
    sc.exe config wuauserv start=disabled 
    Write-Host "[+] Disable Windows Update Running Service"
    Stop-Service wuauserv 
    sc.exe stop wuauserv 
     Write-Host "[+] Check Windows Update Service state"
    sc.exe query wuauserv | findstr "STATE"

}

If ($UpdateValue -eq 2) {
    netsh advfirewall set allprofiles state off
}

If ($UpdateValue -eq 3){
    Set-MpPreference -DisableRealtimeMonitoring $true
}
