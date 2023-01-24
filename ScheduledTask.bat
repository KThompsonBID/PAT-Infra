schtasks /create /sc ONLOGON /tn "VPN Security Lockout - logon" /tr "C:\Hideproxycheck - Logon.vbs"
schtasks /create /sc minute /mo 1 /tn "VPN Security Lockout" /tr "C:\Hideproxycheck.vbs"