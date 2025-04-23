@Echo Off
Title FIX ERRORS FOR CANON 2900 AND 3300 PRINTER & Color 1A
cd %systemroot%\system32
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB001" /v "Parent Device Id" /t REG_SZ /d "USB\VID_03F0&PID_542A\PHCXH09791" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB001" /v "Device Id" /t REG_SZ /d "USB\VID_03F0&PID_542A&MI_00\7&22b2322d&0&0000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB001" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_542a&mi_00#7&22b2322d&0&0000#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB001" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB001" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB001\USB001" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_542a&mi_00#7&22b2322d&0&0000#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB001\USB001" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB001\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB002" /v "Parent Device Id" /t REG_SZ /d "USB\VID_03F0&PID_E82A\CNB4M5RFX7" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB002" /v "Device Id" /t REG_SZ /d "USB\VID_03F0&PID_E82A&MI_00\7&1396f774&0&0000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB002" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_e82a&mi_00#7&1396f774&0&0000#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB002" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB002" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB002\USB002" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_e82a&mi_00#7&1396f774&0&0000#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB002\USB002" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB002\USB003" /v "Device Path" /t REG_SZ /d "\\?\USB#VID_03F0&PID_E82A&PI_01#7&1396F774&0&C001#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB002\USB003" /v "Port Type" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB002\UsbInterfaces" /v "0" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB002\UsbInterfaces" /v "1" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB003" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB003" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2676\00000194P0pX" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB003" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#00000194p0px#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB003" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB003" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB003\USB003" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#00000194p0px#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB003\USB003" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB003\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB004" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB004" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2676\0000A382H0jP" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB004" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000a382h0jp#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB004" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB004" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB004\USB004" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000a382h0jp#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB004\USB004" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB004\USB005" /v "Device Path" /t REG_SZ /d "\\?\USB#VID_03F0&PID_F22A&MI_01#7&28BC5B6&0&0001#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB004\USB005" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB004\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB005" /v "Parent Device Id" /t REG_SZ /d "USB\VID_03F0&PID_F22A\CNB2M8LQ96" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB005" /v "Device Id" /t REG_SZ /d "USB\VID_03F0&PID_F22A&MI_00\7&28bc5b6&0&c000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB005" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_f22a&mi_01#7&28bc5b6&0&0001#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB005" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB005" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB005\USB004" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_f22a&mi_00#7&28bc5b6&0&c000#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB005\USB004" /v "Port Type" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB005\USB005" /v "Device Path" /t REG_SZ /d "\\?\USB#VID_03F0&PID_F22A&MI_01#7&28BC5B6&0&0001#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB005\USB005" /v "Port Type" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB005\UsbInterfaces" /v "0" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB005\UsbInterfaces" /v "1" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB005\UsbInterfaces" /v "2" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB006" /v "Parent Device Id" /t REG_SZ /d "USB\ROOT_HUB30\4&2DC7674B&0&0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB006" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_10D3\CB6FB9" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB006" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_10d3#cb6fb9#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB006" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB006" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB006\USB006" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_10d3#cb6fb9#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB006\USB006" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB006\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB007" /v "Parent Device Id" /t REG_SZ /d "USB\ROOT_HUB30\4&2DC7674B&0&0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB007" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2676\0000A385P7u8" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB007" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000a385p7u8#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB007" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB007" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB007\USB007" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000a385p7u8#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB007\USB007" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB007\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB008" /v "Parent Device Id" /t REG_SZ /d "USB\ROOT_HUB30\4&2DC7674B&0&0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB008" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2676\00000195M6mW" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB008" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#00000195m6mw#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB008" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB008" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB008\USB008" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#00000195m6mw#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB008\USB008" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB008\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB009" /v "Parent Device Id" /t REG_SZ /d "USB\VID_03F0&PID_102A\000000000W487T47PR1A" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB009" /v "Device Id" /t REG_SZ /d "USB\VID_03F0&PID_102A&MI_00\7&2d4c8701&0&0000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB009" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_102a&mi_00#7&2d4c8701&0&0000#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB009" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB009" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB009\USB009" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_102a&mi_00#7&2d4c8701&0&0000#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB009\USB009" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB009\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB010" /v "Parent Device Id" /t REG_SZ /d "USB\ROOT_HUB30\4&2DC7674B&0&0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB010" /v "Device Id" /t REG_SZ /d "USB\VID_04F9&PID_004A\E71076J4N830255" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB010" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04f9&pid_004a#e71076j4n830255#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB010" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB010" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB010\USB010" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04f9&pid_004a#e71076j4n830255#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB010\USB010" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB010\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB011" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB011" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_267E\000011DBID9s" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB011" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_267e#000011dbid9s#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB011" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB011" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB011\USB011" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_267e#000011dbid9s#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB011\USB011" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB011\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB012" /v "Parent Device Id" /t REG_SZ /d "USB\ROOT_HUB30\4&2DC7674B&0&0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB012" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_268B\0000ACA68AJI" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB012" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_268b#0000aca68aji#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB012" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB012" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB012\USB012" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_268b#0000aca68aji#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB012\USB012" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB012\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB013" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB013" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2676\0000A374T0kK" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB013" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000a374t0kk#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB013" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB013" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB013\USB013" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000a374t0kk#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB013\USB013" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB013\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB014" /v "Parent Device Id" /t REG_SZ /d "USB\VID_03F0&PID_E82A\CNB2M6DQQD" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB014" /v "Device Id" /t REG_SZ /d "USB\VID_03F0&PID_E82A&MI_00\7&2df76b07&1&0000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB014" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_e82a&mi_00#7&2df76b07&1&0000#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB014" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB014" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB014\USB014" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_e82a&mi_00#7&2df76b07&1&0000#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB014\USB014" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB014\USB015" /v "Device Path" /t REG_SZ /d "\\?\USB#VID_03F0&PID_E82A&PI_01#7&2DF76B07&1&C001#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB014\USB015" /v "Port Type" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB014\UsbInterfaces" /v "0" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB014\UsbInterfaces" /v "1" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB015" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB015" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_267E\000011D2PFPJ" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB015" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_267e#000011d2pfpj#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB015" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB015" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB015\USB015" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_267e#000011d2pfpj#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB015\USB015" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB015\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB016" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB016" /v "Device Id" /t REG_SZ /d "USB\VID_05CA&PID_0441\RHC8F158" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB016" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_05ca&pid_0441#rhc8f158#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB016" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB016" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB016\USB016" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_05ca&pid_0441#rhc8f158#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB016\USB016" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB016\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB017" /v "Parent Device Id" /t REG_SZ /d "USB\VID_04B8&PID_1143\5835454C3131393395" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB017" /v "Device Id" /t REG_SZ /d "USB\VID_04B8&PID_1143&MI_01\7&33f2572e&0&0001" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB017" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_1143&mi_01#7&33f2572e&0&0001#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB017" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB017" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB017\USB017" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_1143&mi_01#7&33f2572e&0&0001#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB017\USB017" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB017\UsbInterfaces" /v "1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB018" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB018" /v "Device Id" /t REG_SZ /d "USB\VID_04B8&PID_0081\57375A4B3039363648" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB018" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_0081#57375a4b3039363648#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB018" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB018" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB018\USB018" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_0081#57375a4b3039363648#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB018\USB018" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB018\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB019" /v "Parent Device Id" /t REG_SZ /d "USB\VID_03F0&PID_322A\CNB9H6WMCR" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB019" /v "Device Id" /t REG_SZ /d "USB\VID_03F0&PID_322A&MI_01\6&cff9522&0&0001" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB019" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_322a&mi_01#6&cff9522&0&0001#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB019" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB019" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB019\USB019" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_322a&mi_01#6&cff9522&0&0001#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB019\USB019" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB019\UsbInterfaces" /v "1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB020" /v "Parent Device Id" /t REG_SZ /d "USB\VID_03F0&PID_322A\CNB9H6WMCR" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB020" /v "Device Id" /t REG_SZ /d "USB\VID_03F0&PID_322A&MI_01\7&cff9522&0&0001" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB020" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_322a&mi_01#7&cff9522&0&0001#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB020" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB020" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB020\USB020" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_322a&mi_01#7&cff9522&0&0001#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB020\USB020" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB020\UsbInterfaces" /v "1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB021" /v "Parent Device Id" /t REG_SZ /d "USB\VID_03F0&PID_F22A\CNB2M8M1RZ" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB021" /v "Device Id" /t REG_SZ /d "USB\VID_03F0&PID_F22A&MI_01\7&383ed6f3&1&0001" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB021" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_f22a&mi_01#7&383ed6f3&1&0001#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB021" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB021" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB021\USB021" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_f22a&mi_01#7&383ed6f3&1&0001#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB021\USB021" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB021\USB023" /v "Device Path" /t REG_SZ /d "\\?\USB#VID_03F0&PID_F22A&PI_02#7&383ED6F3&1&C002#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB021\USB023" /v "Port Type" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB021\UsbInterfaces" /v "0" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB021\UsbInterfaces" /v "1" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB021\UsbInterfaces" /v "2" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB022" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB022" /v "Device Id" /t REG_SZ /d "USB\VID_04B8&PID_007B\5648524B3035393249" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB022" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_007b#5648524b3035393249#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB022" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB022" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB022\USB022" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_007b#5648524b3035393249#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB022\USB022" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB022\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB023" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB023" /v "Device Id" /t REG_SZ /d "USB\VID_232B&PID_2820\CA3B046190" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB023" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_232b&pid_2820#ca3b046190#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB023" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB023" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB023\USB023" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_232b&pid_2820#ca3b046190#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB023\USB023" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB023\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB024" /v "Parent Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2759\0168O0000C34" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB024" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2759&MI_01\7&38e13dc0&0&0001" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB024" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2759&mi_01#7&38e13dc0&0&0001#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB024" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB024" /v "UsbPrint Only" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB024\USB024" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2759&mi_01#7&38e13dc0&0&0001#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB024\USB024" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB024\UsbInterfaces" /v "1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB025" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB025" /v "Device Id" /t REG_SZ /d "USB\VID_04B8&PID_0007\RE0310911280219410" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB025" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_0007#re0310911280219410#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB025" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB025" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB025\USB025" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_0007#re0310911280219410#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB025\USB025" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB025\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB026" /v "Parent Device Id" /t REG_SZ /d "USB\ROOT_HUB30\4&2DC7674B&0&0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB026" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2690\85680030" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB026" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2690#85680030#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB026" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB026" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB026\USB026" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2690#85680030#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB026\USB026" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB026\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB027" /v "Parent Device Id" /t REG_SZ /d "USB\VID_03F0&PID_542A\PHCXF14959" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB027" /v "Device Id" /t REG_SZ /d "USB\VID_03F0&PID_542A&MI_00\7&27621021&0&0000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB027" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_542a&mi_00#7&27621021&0&0000#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB027" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB027" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB027\USB027" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_542a&mi_00#7&27621021&0&0000#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB027\USB027" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB027\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB028" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB028" /v "Device Id" /t REG_SZ /d "USB\VID_04E8&PID_330F\Z7AWB8GCBA002PP" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB028" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04e8&pid_330f#z7awb8gcba002pp#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB028" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB028" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB028\USB028" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04e8&pid_330f#z7awb8gcba002pp#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB028\USB028" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB028\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB029" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB029" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2676\0000A2B5HAmu" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB029" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000a2b5hamu#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB029" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB029" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB029\USB029" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000a2b5hamu#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB029\USB029" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB029\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB032" /v "Parent Device Id" /t REG_SZ /d "USB\VID_03F0&PID_F22A\CNB1P5W71L" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB032" /v "Device Id" /t REG_SZ /d "USB\VID_03F0&PID_F22A&MI_01\7&1738f217&0&0001" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB032" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_f22a&mi_01#7&1738f217&0&0001#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB032" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB032" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB032\USB032" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_f22a&mi_01#7&1738f217&0&0001#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB032\USB032" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB032\USB033" /v "Device Path" /t REG_SZ /d "\\?\USB#VID_03F0&PID_F22A&PI_02#7&1738F217&0&C002#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB032\USB033" /v "Port Type" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB032\UsbInterfaces" /v "0" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB032\UsbInterfaces" /v "1" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB032\UsbInterfaces" /v "2" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB036" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB036" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2676\0000C1D1CH8L" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB036" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000c1d1ch8l#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB036" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB036" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB036\USB036" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000c1d1ch8l#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB036\USB036" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB036\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB037" /v "Parent Device Id" /t REG_SZ /d "USB\VID_04A9&PID_27D2\01AAJ943E918" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB037" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_27D2&MI_01\7&11bfdf5c&0&0001" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB037" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_27d2&mi_01#7&11bfdf5c&0&0001#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB037" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB037" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB037\USB037" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_27d2&mi_01#7&11bfdf5c&0&0001#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB037\USB037" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB037\UsbInterfaces" /v "1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB038" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB038" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2676\0000A2L82GsM" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB038" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000a2l82gsm#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB038" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB038" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB038\USB038" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000a2l82gsm#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB038\USB038" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB038\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB042" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB042" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2676\0000A2J0U78d" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB042" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000a2j0u78d#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB042" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB042" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB042\USB042" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000a2j0u78d#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB042\USB042" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB042\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB043" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB043" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_267E\000011F197H1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB043" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_267e#000011f197h1#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB043" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB043" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB043\USB043" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_267e#000011f197h1#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB043\USB043" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB043\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB046" /v "Parent Device Id" /t REG_SZ /d "USB\VID_03F0&PID_F22A\CNB2M8M1H4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB046" /v "Device Id" /t REG_SZ /d "USB\VID_03F0&PID_F22A&MI_01\7&287d1bf7&0&0001" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB046" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_f22a&mi_01#7&287d1bf7&0&0001#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB046" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB046" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB046\USB046" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_f22a&mi_01#7&287d1bf7&0&0001#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB046\USB046" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB046\USB047" /v "Device Path" /t REG_SZ /d "\\?\USB#VID_03F0&PID_F22A&PI_02#7&287D1BF7&0&C002#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB046\USB047" /v "Port Type" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB046\UsbInterfaces" /v "0" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB046\UsbInterfaces" /v "1" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB046\UsbInterfaces" /v "2" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB049" /v "Parent Device Id" /t REG_SZ /d "USB\ROOT_HUB30\4&2DC7674B&0&0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB049" /v "Device Id" /t REG_SZ /d "USB\VID_05CA&PID_0441\RH98EEBD" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB049" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_05ca&pid_0441#rh98eebd#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB049" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB049" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB049\USB049" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_05ca&pid_0441#rh98eebd#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB049\USB049" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB049\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB050" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB050" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2718\8f813953" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB050" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2718#8f813953#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB050" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB050" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB050\USB050" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2718#8f813953#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB050\USB050" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB050\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB052" /v "Parent Device Id" /t REG_SZ /d "USB\ROOT_HUB30\4&2DC7674B&0&0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB052" /v "Device Id" /t REG_SZ /d "USB\VID_04F9&PID_0062\E73793M8N662101" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB052" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04f9&pid_0062#e73793m8n662101#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB052" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB052" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB052\USB052" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04f9&pid_0062#e73793m8n662101#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB052\USB052" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB052\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB053" /v "Parent Device Id" /t REG_SZ /d "USB\ROOT_HUB30\4&2DC7674B&0&0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB053" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_267E\000011DBHFCf" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB053" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_267e#000011dbhfcf#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB053" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB053" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB053\USB053" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_267e#000011dbhfcf#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB053\USB053" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB053\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB055" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB055" /v "Device Id" /t REG_SZ /d "USB\VID_04E8&PID_330F\Z7AWB8GD3D00HJK" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB055" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04e8&pid_330f#z7awb8gd3d00hjk#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB055" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB055" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB055\USB055" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04e8&pid_330f#z7awb8gd3d00hjk#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB055\USB055" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB055\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB056" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB056" /v "Device Id" /t REG_SZ /d "USB\VID_04E8&PID_330F\Z7AWB8GD2A0084L" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB056" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04e8&pid_330f#z7awb8gd2a0084l#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB056" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB056" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB056\USB056" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04e8&pid_330f#z7awb8gd2a0084l#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB056\USB056" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB056\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB057" /v "Parent Device Id" /t REG_SZ /d "USB\VID_03F0&PID_F22A\CNB2M58CMR" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB057" /v "Device Id" /t REG_SZ /d "USB\VID_03F0&PID_F22A&MI_01\6&f34b725&0&0001" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB057" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_f22a&mi_01#6&f34b725&0&0001#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB057" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB057" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB057\USB057" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_f22a&mi_01#6&f34b725&0&0001#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB057\USB057" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB057\USB058" /v "Device Path" /t REG_SZ /d "\\?\USB#VID_03F0&PID_F22A&PI_02#6&F34B725&0&C002#{f2f40381-f46d-4e51-bce7-62de6cf2d098}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB057\USB058" /v "Port Type" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB057\UsbInterfaces" /v "0" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB057\UsbInterfaces" /v "1" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB057\UsbInterfaces" /v "2" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB060" /v "Parent Device Id" /t REG_SZ /d "USB\ROOT_HUB30\4&2DC7674B&0&0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB060" /v "Device Id" /t REG_SZ /d "USB\VID_05CA&PID_0441\RHC8F21B" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB060" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_05ca&pid_0441#rhc8f21b#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB060" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB060" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB060\USB060" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_05ca&pid_0441#rhc8f21b#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB060\USB060" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB060\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB063" /v "Parent Device Id" /t REG_SZ /d "USB\VID_04B8&PID_1142\583544573335303762" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB063" /v "Device Id" /t REG_SZ /d "USB\VID_04B8&PID_1142&MI_01\7&4b1d795&0&0001" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB063" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_1142&mi_01#7&4b1d795&0&0001#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB063" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB063" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB063\USB063" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_1142&mi_01#7&4b1d795&0&0001#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB063\USB063" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB063\UsbInterfaces" /v "1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB064" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB064" /v "Device Id" /t REG_SZ /d "USB\VID_04B8&PID_0007\L90021102241350080" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB064" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_0007#l90021102241350080#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB064" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB064" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB064\USB064" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_0007#l90021102241350080#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB064\USB064" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB064\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB065" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB065" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_267E\000011B9DGIv" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB065" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_267e#000011b9dgiv#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB065" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB065" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB065\USB065" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_267e#000011b9dgiv#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB065\USB065" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB065\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB066" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB066" /v "Device Id" /t REG_SZ /d "USB\VID_04B8&PID_0067\55424C593031363719" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB066" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_0067#55424c593031363719#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB066" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB066" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB066\USB066" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_0067#55424c593031363719#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB066\USB066" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB066\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB067" /v "Parent Device Id" /t REG_SZ /d "USB\ROOT_HUB30\4&2DC7674B&0&0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB067" /v "Device Id" /t REG_SZ /d "USB\VID_04B8&PID_0067\55424E593032313895" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB067" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_0067#55424e593032313895#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB067" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB067" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB067\USB067" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_0067#55424e593032313895#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB067\USB067" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB067\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB068" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB068" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2676\0000B1A7E4mP" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB068" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000b1a7e4mp#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB068" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB068" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB068\USB068" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000b1a7e4mp#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB068\USB068" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB068\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB069" /v "Parent Device Id" /t REG_SZ /d "USB\ROOT_HUB30\4&2DC7674B&0&0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB069" /v "Device Id" /t REG_SZ /d "USB\VID_04B8&PID_005E\544E5A4B3038303917" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB069" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_005e#544e5a4b3038303917#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB069" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB069" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB069\USB069" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_005e#544e5a4b3038303917#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB069\USB069" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB069\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB070" /v "Parent Device Id" /t REG_SZ /d "USB\ROOT_HUB30\4&2DC7674B&0&0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB070" /v "Device Id" /t REG_SZ /d "USB\VID_04B8&PID_0067\55424C593033353659" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB070" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_0067#55424c593033353659#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB070" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB070" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB070\USB070" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_0067#55424c593033353659#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB070\USB070" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB070\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB071" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB071" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2676\0000B1B4T1ko" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB071" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000b1b4t1ko#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB071" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB071" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB071\USB071" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000b1b4t1ko#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB071\USB071" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB071\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB072" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB072" /v "Device Id" /t REG_SZ /d "USB\VID_04B8&PID_002A\4C43524B3033343420" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB072" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_002a#4c43524b3033343420#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB072" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB072" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB072\USB072" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_002a#4c43524b3033343420#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB072\USB072" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB072\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB073" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB073" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_267E\000011h033i2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB073" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_267e#000011h033i2#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB073" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB073" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB073\USB073" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_267e#000011h033i2#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB073\USB073" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB073\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB074" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB074" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2676\0000C3JBQHde" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB074" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000c3jbqhde#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB074" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB074" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB074\USB074" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000c3jbqhde#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB074\USB074" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB074\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB075" /v "Parent Device Id" /t REG_SZ /d "USB\VID_03F0&PID_002A\000000000Q8D29M6PR1A" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB075" /v "Device Id" /t REG_SZ /d "USB\VID_03F0&PID_002A&MI_00\7&7a1fa05&0&0000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB075" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_002a&mi_00#7&7a1fa05&0&0000#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB075" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB075" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB075\USB075" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_002a&mi_00#7&7a1fa05&0&0000#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB075\USB075" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB075\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB076" /v "Parent Device Id" /t REG_SZ /d "USB\VID_03F0&PID_AE2A\VNC7K01428" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB076" /v "Device Id" /t REG_SZ /d "USB\VID_03F0&PID_AE2A&MI_00\7&2a0920b8&1&0000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB076" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_ae2a&mi_00#7&2a0920b8&1&0000#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB076" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB076" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB076\USB076" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_ae2a&mi_00#7&2a0920b8&1&0000#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB076\USB076" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB076\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB077" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB077" /v "Device Id" /t REG_SZ /d "USB\VID_04B8&PID_0081\57375A4B3037383591" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB077" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_0081#57375a4b3037383591#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB077" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB077" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB077\USB077" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_0081#57375a4b3037383591#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB077\USB077" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB077\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB078" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB078" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2676\0000C1HBIL0a" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB078" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000c1hbil0a#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB078" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB078" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB078\USB078" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000c1hbil0a#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB078\USB078" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB078\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB079" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB079" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2676\00000195LL70" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB079" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#00000195ll70#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB079" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB079" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB079\USB079" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#00000195ll70#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB079\USB079" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB079\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB081" /v "Parent Device Id" /t REG_SZ /d "USB\VID_04B8&PID_1142\583634423232363392" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB081" /v "Device Id" /t REG_SZ /d "USB\VID_04B8&PID_1142&MI_01\6&39adacc7&0&0001" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB081" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_1142&mi_01#6&39adacc7&0&0001#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB081" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB081" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB081\USB081" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_1142&mi_01#6&39adacc7&0&0001#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB081\USB081" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB081\UsbInterfaces" /v "1" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB082" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB082" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2676\0000C1H5TILW" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB082" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000c1h5tilw#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB082" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB082" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB082\USB082" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000c1h5tilw#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB082\USB082" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB082\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB083" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB083" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2676\0000D2GAACdE" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB083" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000d2gaacde#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB083" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB083" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB083\USB083" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#0000d2gaacde#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB083\USB083" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB083\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB085" /v "Parent Device Id" /t REG_SZ /d "USB\VID_04A9&PID_27B7\0165V11484E3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB085" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_27B7&MI_00\7&296f4ceb&0&0000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB085" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_27b7&mi_00#7&296f4ceb&0&0000#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB085" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB085" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB085\USB085" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_27b7&mi_00#7&296f4ceb&0&0000#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB085\USB085" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB085\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB086" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB086" /v "Device Id" /t REG_SZ /d "USB\VID_04B8&PID_0081\5738374B3031383954" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB086" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_0081#5738374b3031383954#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB086" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB086" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB086\USB086" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_0081#5738374b3031383954#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB086\USB086" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB086\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB087" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB087" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_2676\000001977FAK" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB087" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#000001977fak#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB087" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB087" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB087\USB087" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_2676#000001977fak#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB087\USB087" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB087\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB088" /v "Parent Device Id" /t REG_SZ /d "USB\VID_03F0&PID_612A\VNC3K03246" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB088" /v "Device Id" /t REG_SZ /d "USB\VID_03F0&PID_612A&MI_00\7&2b45e5aa&1&0000" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB088" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_612a&mi_00#7&2b45e5aa&1&0000#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB088" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB088" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB088\USB088" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_03f0&pid_612a&mi_00#7&2b45e5aa&1&0000#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB088\USB088" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB088\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB089" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB089" /v "Device Id" /t REG_SZ /d "USB\VID_04A9&PID_267E\000011F95DHt" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB089" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_267e#000011f95dht#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB089" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB089" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB089\USB089" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04a9&pid_267e#000011f95dht#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB089\USB089" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB089\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB090" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB090" /v "Device Id" /t REG_SZ /d "USB\VID_04F9&PID_0074\H5N789685" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB090" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04f9&pid_0074#h5n789685#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB090" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB090" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB090\USB090" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04f9&pid_0074#h5n789685#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB090\USB090" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB090\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB091" /v "Parent Device Id" /t REG_SZ /d "USB\VID_8087&PID_0024\5&A49CF7F&0&1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB091" /v "Device Id" /t REG_SZ /d "USB\VID_04B8&PID_00A8\58354E463031363340" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB091" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_00a8#58354e463031363340#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB091" /v "Fax Port" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB091" /v "UsbPrint Only" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB091\USB091" /v "Device Path" /t REG_SZ /d "\\?\usb#vid_04b8&pid_00a8#58354e463031363340#{28d78fad-5a12-11d1-ae5b-0000f803a8c2}" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB091\USB091" /v "Port Type" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Print\Monitors\USB Monitor\Ports\USB091\UsbInterfaces" /v "0" /t REG_DWORD /d "1" /f
timeout 3>nul & start "" cmd /c del "%~f0" & Exit /b 1
