@echo off
color 0A
title DNS Switcher - Created by ImanNaeimian
cls

echo ========================================
echo         Created by ImanNaeimian
echo ========================================
echo.

:: Detect active network interface (Wi-Fi or Ethernet only)

set "activeInterface="
for /f "tokens=1,2,3,*" %%a in ('netsh interface show interface ^| findstr /R /C:"Connected"') do (
    echo %%d | findstr /I "Wi-Fi Ethernet" >nul && set "activeInterface=%%d"
)
if "%activeInterface%"=="" (
    echo No physical network interface found.
    pause
    exit /b
)

echo Active interface detected: %activeInterface%
echo.

:: Flush DNS
echo Flushing DNS cache...
ipconfig /flushdns >nul
echo DNS cache flushed.
echo.

:: DNS choice
echo Choose a DNS:
echo 1. RadarGame   (10.202.10.10 / 10.202.10.11)
echo 2. Electro     (78.157.42.100 / 78.157.42.101)
echo 3. Shekan      (178.22.122.100 / 185.51.200.2)
echo 4. 403         (10.202.10.102 / 10.202.10.202)
echo 5. Google Pu   (8.8.8.8 / 8.8.4.4)
echo 6. OpenDNS     (208.67.222.222 / 208.67.220.22)
echo 7. Cloudflare  (1.1.1.1 / 1.1.0.0)
echo. 

set /p dnsChoice=Enter your choice : 

if "%dnsChoice%"=="1" (
    echo Setting DNS to RadarGame...
    netsh interface ip set dns name="%activeInterface%" static 10.202.10.10 >nul
    netsh interface ip add dns name="%activeInterface%" 10.202.10.11 index=2 >nul
    echo DNS successfully set to RadarGame.
) else if "%dnsChoice%"=="2" (
    echo Setting DNS to Electro...
    netsh interface ip set dns name="%activeInterface%" static 78.157.42.101 >nul
    netsh interface ip add dns name="%activeInterface%" 78.157.42.100 index=2 >nul
    echo DNS successfully set to Electro.
)else if "%dnsChoice%"=="3" (
    echo Setting DNS to Shekan...
    netsh interface ip set dns name="%activeInterface%" static 178.22.122.100 >nul
    netsh interface ip add dns name="%activeInterface%" 185.51.200.2 index=2 >nul
    echo DNS successfully set to Electro.
)else if "%dnsChoice%"=="4" (
    echo Setting DNS to 403...
    netsh interface ip set dns name="%activeInterface%" static 10.202.10.102 >nul
    netsh interface ip add dns name="%activeInterface%" 10.202.10.202 index=2 >nul
    echo DNS successfully set to Electro.
)else if "%dnsChoice%"=="5" (
    echo Setting DNS to Google Public...
    netsh interface ip set dns name="%activeInterface%" static 8.8.8.8 >nul
    netsh interface ip add dns name="%activeInterface%" 8.8.4.4 index=2 >nul
    echo DNS successfully set to Google Public.
)else if "%dnsChoice%"=="6" (
    echo Setting DNS to OpenDNS...
    netsh interface ip set dns name="%activeInterface%" static 208.67.222.222 >nul
    netsh interface ip add dns name="%activeInterface%" 208.67.220.22 index=2 >nul
    echo DNS successfully set to OpenDNS.
)else if "%dnsChoice%"=="7" (
    echo Setting DNS to Cloudflare...
    netsh interface ip set dns name="%activeInterface%" static 1.1.1.1 >nul
    netsh interface ip add dns name="%activeInterface%" 1.1.0.0 index=2 >nul
    echo DNS successfully set to Cloudflare.
)

 else (
    echo Invalid choice. Please enter 1 to 7.
)

echo.
pause
::Created by ImanNaeimian