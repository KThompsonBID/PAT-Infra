xcopy "C:\Scripts\PAT-Infra-main\GVPN Connections\GVPNStartup.bat" "C:\Scripts\PAT-Infra-main\GVPNRCF"
schtasks /create /sc ONLOGON /tn "GVPNRCF" /tr "C:\Scripts\GVPNRCF\GVPNStartup.bat"
