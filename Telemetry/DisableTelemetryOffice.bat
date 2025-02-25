@echo off & color 1f
setlocal enabledelayedexpansion
cd /d "%~dp0"
Echo           TURN OFF OFFICE TELEMETRY
ECHO.
echo	Scheduler:  5 Office Telemetry related Tasks were set/changed ...
schtasks.exe /Change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack" /Disable
schtasks.exe /Change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn" /Disable
schtasks.exe /Change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack2016" /Disable
schtasks.exe /Change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn2016" /Disable
schtasks.exe /Change /TN "Microsoft\Office\Office ClickToRun Service Monitor" /Disable
echo	Registry:  30 Office Telemetry related User Keys were set/changed ...  
reg.exe add "HKCU\Software\Microsoft\Office\Common\ClientTelemetry" /v "SendTelemetry" /t REG_DWORD /d 3 /f
reg.exe add "HKCU\Software\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "sendcustomerdata" /t REG_DWORD /d 0 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "qmenable" /t REG_DWORD /d 0 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common" /v "updatereliabilitydata" /t REG_DWORD /d 0 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\Feedback" /v "enabled" /t REG_DWORD /d 0 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\Feedback" /v "includescreenshot" /t REG_DWORD /d 0 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "shownfirstrunoptin" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "skydrivesigninoption" /t REG_DWORD /d 0 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\Common\ptwatson" /v "ptwoptin" /t REG_DWORD /d 0 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\Firstrun" /v "disablemovie" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "Enablelogging" /t REG_DWORD /d 0 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d 0 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "EnableFileObfuscation" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "accesssolution" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "olksolution" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "onenotesolution" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "pptsolution" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "projectsolution" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "publishersolution" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "visiosolution" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "wdsolution" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedapplications" /v "xlsolution" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "agave" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "appaddins" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "comaddins" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "documentfiles" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\Software\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "templatefiles" /t REG_DWORD /d 1 /f
  
echo+
Echo	  Registry: 30 Office Telemetry related Machine Group Policies were set/changed ...
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Office\16.0\Common\ClientTelemetry" /v "SendTelemetry" /t REG_DWORD /d 3 /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Office\Common\ClientTelemetry" /v "SendTelemetry" /t REG_DWORD /d 3 /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Office\16.0\Common\ClientTelemetry" /v "SendTelemetry" /t REG_DWORD /d 3 /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Office\Common\ClientTelemetry" /v "SendTelemetry" /t REG_DWORD /d 3 /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Office\16.0\Common" /v "qmenable" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Office\16.0\Common" /v "sendcustomerdata" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Office\16.0\Common\privacy" /v "disconnectedstate" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\Common" /v "qmenable" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\Common" /v "updatereliabilitydata" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\Common\General" /v "shownfirstrunoptin" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\Common\General" /v "skydrivesigninoption" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\Common\ptwatson" /v "ptwoptin" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\Firstrun" /v "disablemovie" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\OSM" /v "Enablelogging" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d 0 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\OSM" /v "EnableFileObfuscation" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "accesssolution" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "olksolution" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "onenotesolution" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "pptsolution" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "projectsolution" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "publishersolution" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "visiosolution" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "wdsolution" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\OSM\preventedapplications" /v "xlsolution" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "agave" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "appaddins" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "comaddins" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "documentfiles" /t REG_DWORD /d 1 /f
reg.exe add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Office\16.0\OSM\preventedsolutiontypes" /v "templatefiles" /t REG_DWORD /d 1 /f
reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\Common" /v "LinkedIn" /t REG_DWORD /d 0 /f
reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Feedback" /v "IncludeEmail" /t REG_DWORD /d 0 /f
reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\Common\Feedback" /v "SurveyEnabled" /t REG_DWORD /d 0 /f
reg.exe add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\Common\MailSettings" /v "InlineTextPrediction" /t REG_DWORD /d 0 /f
timeout 2>nul & Exit /b 0