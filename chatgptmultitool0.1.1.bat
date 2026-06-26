@echo off
title Cat's Multitool by ChatGPT 0.1
color 0B
mode con: cols=80 lines=30

:menu
cls
echo =====================================================
echo          Cat's Multitool by ChatGPT 0.1
echo =====================================================
echo.
echo 1. Network Information
echo 2. Port Scanner
echo 3. Wi-Fi Scanner
echo 4. Saved Wi-Fi Profiles
echo 5. DNS Lookup
echo 6. Ping Host
echo 7. Exit
echo.
set /p choice=Select an option: 

if "%choice%"=="1" goto netinfo
if "%choice%"=="2" goto portscan
if "%choice%"=="3" goto wifiscan
if "%choice%"=="4" goto profiles
if "%choice%"=="5" goto dns
if "%choice%"=="6" goto pingtest
if "%choice%"=="7" exit
goto menu

:netinfo
cls
echo === Network Information ===
ipconfig /all
pause
goto menu

:portscan
cls
echo === Simple TCP Port Scanner ===
set /p host=Host/IP:
set /p ports=Ports (example: 22 80 443 3389):
echo.

for %%P in (%ports%) do (
    powershell -NoProfile -Command ^
    "$c=New-Object Net.Sockets.TcpClient; ^
    try{$c.Connect('%host%',%%P);Write-Host 'Port %%P OPEN'} ^
    catch{Write-Host 'Port %%P CLOSED'}; ^
    $c.Dispose()"
)

pause
goto menu

:wifiscan
cls
echo === Nearby Wi-Fi Networks ===
netsh wlan show networks mode=bssid
pause
goto menu

:profiles
cls
echo === Saved Wi-Fi Profiles ===
netsh wlan show profiles
pause
goto menu

:dns
cls
echo === DNS Lookup ===
set /p domain=Domain:
nslookup %domain%
pause
goto menu

:pingtest
cls
echo === Ping Test ===
set /p host=Host/IP:
ping %host%
pause
goto menu