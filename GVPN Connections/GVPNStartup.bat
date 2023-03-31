::Delete Existing RCF
del "C:\Users\%username%\AppData\Roaming\SonicWall\Global VPN Client\*.rcf"

::Copy Current RCF to user roaming
xcopy C:\Scripts\GVPNRCF\connections.rcf "C:\Users\%username%\AppData\Roaming\SonicWall\Global VPN Client\" /I /f /R /Y
xcopy C:\Scripts\GVPNRCF\backup.rcf "C:\Users\%username%\AppData\Roaming\SonicWall\Global VPN Client\" /I /f /R /Y
