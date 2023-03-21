::Delete Existing RCF
del "C:\Users\%username%\AppData\Roaming\SonicWall\Global VPN Client\*.rcf"

::Stop GVPN Svc
net stop SWGVCSvc

::Copy Current RCF to user roaming
xcopy C:\Scripts\GVPNRCF\connections.rcf "C:\Users\%username%\AppData\Roaming\SonicWall\Global VPN Client"
xcopy C:\Scripts\GVPNRCF\backup.rcf "C:\Users\%username%\AppData\Roaming\SonicWall\Global VPN Client"

::Start GVPN Svc
net start SWGVCSvc