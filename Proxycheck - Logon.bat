@echo off 

REM check status of vpn connection

wmic path win32_networkadapter where Description="SonicWALL Virtual NIC" get netenabled | findstr /c:"TRUE"
IF %ERRORLEVEL% == 0 GOTO REMOVE ELSE GOTO TAP

:TAP
wmic path win32_networkadapter where Description="TAP-Windows Adapter V9" get netenabled | findstr /c:"TRUE"
IF %ERRORLEVEL% == 0 GOTO REMOVE ELSE GOTO TAP2

:TAP2
wmic path win32_networkadapter where Description="TAP-Windows Adapter V9 #2" get netenabled | findstr /c:"TRUE"
IF %ERRORLEVEL% == 0 GOTO REMOVE ELSE GOTO TAP3

:TAP3
wmic path win32_networkadapter where Description="TAP-Windows Adapter V9 #3" get netenabled | findstr /c:"TRUE"
IF %ERRORLEVEL% == 0 GOTO REMOVE ELSE GOTO TAP4

:TAP4
wmic path win32_networkadapter where Description="TAP-Windows Adapter V9 #4" get netenabled | findstr /c:"TRUE"
IF %ERRORLEVEL% == 0 GOTO REMOVE ELSE GOTO TAP5

:TAP5
wmic path win32_networkadapter where Description="TAP-Windows Adapter V9 #5" get netenabled | findstr /c:"TRUE"
IF %ERRORLEVEL% == 0 GOTO REMOVE ELSE GOTO TAP6

:TAP6
wmic path win32_networkadapter where Description="TAP-Windows Adapter V9 #6" get netenabled | findstr /c:"TRUE"
IF %ERRORLEVEL% == 0 GOTO REMOVE ELSE GOTO TAP7

:TAP7
wmic path win32_networkadapter where Description="TAP-Windows Adapter V9 #7" get netenabled | findstr /c:"TRUE"
IF %ERRORLEVEL% == 0 GOTO REMOVE

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d 127.0.0.1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f

cd /D "%APPDATA%\Mozilla\Firefox\Profiles"
cd *.default-release
set ffile=%cd%

echo user_pref("network.proxy.http", "127.0.0.1");>>"%ffile%\prefs.js"
echo user_pref("network.proxy.http_port", 80);>>"%ffile%\prefs.js"
echo user_pref("network.proxy.socks", "127.0.0.1");>>"%ffile%\prefs.js"
echo user_pref("network.proxy.socks_port", 443);>>"%ffile%\prefs.js"
echo user_pref("network.proxy.ssl", "127.0.0.1");>>"%ffile%\prefs.js"
echo user_pref("network.proxy.ssl_port", 443);>>"%ffile%\prefs.js"
echo user_pref("network.proxy.type", 1);>>"%ffile%\prefs.js"

set ffile=
cd %windir%

Msg * "Notice from Patra Service Desk: You will not have Internet Access until you log into VPN" 

END
EXIT

:REMOVE
REM status is 2 and on then do this to remove proxy

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f

cd /D "%APPDATA%\Mozilla\Firefox\Profiles"
cd *.default-release
set ffile=%cd%

echo user_pref("network.proxy.type", 0);>>"%ffile%\prefs.js"

set ffile=
cd %windir%

END
EXIT

REM create loop to keep checking every 5 minutes or use task scheduler 