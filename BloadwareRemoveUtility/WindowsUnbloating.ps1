# Windows 10-11 Unbloating

# Uninstall default Microsoft applications
$MsftBloatApps =  @(
	"Microsoft.3DBuilder"
	"Clipchamp.Clipchamp"
	"Microsoft.BingFinance"
	"Microsoft.3DBuilder"
	"Microsoft.BingTranslator"
	"Microsoft.BingTravel"
	"Microsoft.BingNews"
	"Microsoft.News"
	"Microsoft.BingSports"
	"Microsoft.BingWeather"
	"Microsoft.BingFinance"
	"Microsoft.BingFoodAndDrink"
	"Microsoft.BingHealthAndFitness"
	"Microsoft.Getstarted"
	"Microsoft.MicrosoftOfficeHub"
	"Microsoft.MicrosoftSolitaireCollection"
	"Microsoft.Office.OneNote"
	"Microsoft.Office.Sway"
	"Microsoft.OneConnect"
	"Microsoft.People"
	"Microsoft.Getstarted"   # Cannot be uninstalled in Windows 11
	"Microsoft.SkypeApp"
	"Microsoft.Todos"
	"Microsoft.WindowsAlarms"
	"microsoft.windowscommunicationsapps"
	"Microsoft.WindowsMaps"
	"Microsoft.WindowsPhone"
	"Microsoft.WindowsSoundRecorder"
	"Microsoft.ZuneMusic"
	"Microsoft.ZuneVideo"
	"Microsoft.AppConnector"
	"Microsoft.ConnectivityStore"
	"Microsoft.Office.Sway"
	"Microsoft.Messaging"
	"Microsoft.CommsPhone"
	"Microsoft.MixedReality.Portal"
	"Microsoft.OneConnect"
	"Microsoft.WindowsFeedbackHub"
	"Microsoft.MinecraftUWP"
	"Microsoft.MicrosoftPowerBIForWindows"
	"Microsoft.NetworkSpeedTest"
	"Microsoft.Microsoft3DViewer"
	"Microsoft.MicrosoftJournal"
	"Microsoft.WindowsFeedbackHub"
	"Microsoft.RemoteDesktop"
	"Microsoft.Print3D"
	"Microsoft.YourPhone"
	"Microsoft.GamingApp"
	"Microsoft.OutlookForWindows"
	"Microsoft.windowscommunicationsapps"
	"Microsoft.People"
	"MicrosoftCorporationII.QuickAssist"
	"Microsoft.XboxApp"
	"Microsoft.XboxIdentityProvider"
	"Microsoft.XboxSpeechToTextOverlay"
	"Microsoft.XboxGameOverlay"
	"Microsoft.XboxGamingOverlay"
	"Microsoft.Xbox.TCUI"
	"Microsoft.Windows.DevHome"
	"MicrosoftTeams"
    "MSTeams"
	"MicrosoftCorporationII.MicrosoftFamily"   # Family Safety App
	"Microsoft.549981C3F5F10"   #Cortana app
)

# Uninstall default third party applications
$ThirdPartyBloatApps = @(
	"ACGMediaPlayer"
	"ActiproSoftwareLLC"
	"AdobeSystemsIncorporated.AdobePhotoshopExpress"
	"Amazon.com.Amazon"
	"AmazonVideo.PrimeVideo"
	"Asphalt8Airborne "
	"AutodeskSketchBook"
	"CaesarsSlotsFreeCasino"
	"COOKINGFEVER"
	"CyberLinkMediaSuiteEssentials"
	"DisneyMagicKingdoms"
	"Disney"
	"DrawboardPDF"
	"Duolingo-LearnLanguagesforFree"
	"EclipseManager"
	"Facebook"
	"FarmVille2CountryEscape"
	"fitbit"
	"Flipboard"
	"Clipchamp"
	"HiddenCity"
	"HULULLC.HULUPLUS"
	"iHeartRadio"
	"Instagram"
	"king.com.BubbleWitch3Saga"
	"king.com.CandyCrushSaga"
	"king.com.CandyCrushSodaSaga"
	"LinkedInforWindows"
	"MarchofEmpires"
	"Netflix"
	"NYTCrossword"
	"OneCalendar"
	"PandoraMediaInc"
	"PhototasticCollage"
	"PicsArt-PhotoStudio"
	"Plex"
	"PolarrPhotoEditorAcademicEdition"
	"Royal Revolt"
	"Shazam"
	"Sidia.LiveWallpaper"
	"SlingTV"
	"Spotify"
	"TikTok"
	"TuneInRadio"
	"Twitter"
	"Viber"
	"LinkedIn"
	"WinZipUniversal"
	"Wunderlist"
	"XING"

)

#Remove Microsoft Bloat Apps
foreach ($MsftBloatApp in $MsftBloatApps) {

    Get-AppxPackage -Name $MsftBloatApp -AllUsers | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue
}

#Remove provisioned app from OS image, so the app won't be installed for any new users
foreach ($MsftBloatApp in $MsftBloatApps) {
	
    Get-AppXProvisionedPackage -Online | Where-Object { $_.PackageName -like $MsftBloatApp } | ForEach-Object { Remove-ProvisionedAppxPackage -Online -AllUsers -PackageName $_.PackageName }
}

#Remove Third Party Apps
foreach ($ThirdPartyBloatApp in $ThirdPartyBloatApps) {

    Get-AppxPackage -Name $ThirdPartyBloatApp -AllUsers | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue
}

#Remove Third Party App from OS image, so the app won't be installed for any new users
foreach ($ThirdPartyBloatApp in $ThirdPartyBloatApps) {

    Get-AppXProvisionedPackage -Online | Where-Object { $_.PackageName -like $ThirdPartyBloatApp } | ForEach-Object { Remove-ProvisionedAppxPackage -Online -AllUsers -PackageName $_.PackageName }
}

#Disable Xbox gaming features
Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Type DWord -Value 0
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR")) {
	New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR"
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" -Type DWord -Value 0

#Disable Telemetry
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0


#Disable Wi-Fi Sense
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting")) {

	New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Force | Out-Null

}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Type DWord -Value 0

#Disable Bing Search in Start Menu
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type DWord -Value 0
If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {

	New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force | Out-Null

}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch" -Type DWord -Value 1