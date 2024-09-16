@echo off
setlocal

REM                          SETUP 
TITLE Hiptix Web Server Installer  
color 2 
mode con cols=80 lines=25 
chcp 65001 >nul 
cls 

CALL:LOGO

pause >nul 

REM                LOGO 

:LOGO
echo.
echo ███████╗██╗  ██╗██╗██████╗ ████████╗██╗██╗  ██╗    ██╗    ██╗███████╗██████╗     ███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗     ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗
echo ██║  ██║██║██╔══██╗╚══██╔══╝██║╚██╗██╔╝    ██║    ██║██╔════╝██╔══██╗    ██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
echo ███████║██║██████╔╝   ██║   ██║ ╚███╔╝     ██║ █╗ ██║█████╗  ██████╔╝    ███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝    ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
echo ██╔══██║██║██╔═══╝    ██║   ██║ ██╔██╗     ██║███╗██║██╔══╝  ██╔══██╗    ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗    ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
echo ██║  ██║██║██║        ██║   ██║██╔╝ ██╗    ╚███╔███╔╝███████╗██████╔╝    ███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
echo ╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   ╚═╝╚═╝  ╚═╝     ╚══╝╚══╝ ╚══════╝╚═════╝     ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
echo.
echo.

:: Function to display the prompt
:SHOW_PROMPT
set /p option="root@hiptixwebserverinstall~$ "

goto :eof

:MAIN_MENU
cls
echo ========================
echo        MAIN MENU
echo ========================
echo 1. Install Web Servers
echo 2. Uninstall Web Servers
echo 3. Exit
echo ========================
call :SHOW_PROMPT
if "%option%"=="1" goto INSTALL_MENU
if "%option%"=="2" goto UNINSTALL_MENU
if "%option%"=="3" exit
goto MAIN_MENU

:INSTALL_MENU
cls
echo ========================
echo    INSTALL WEB SERVERS
echo ========================
echo 1. Apache HTTP Server
echo 2. Nginx
echo 3. Apache Tomcat
echo 4. Internet Information Services
echo 5. lighttpd
echo 6. Caddy
echo 7. Jetty
echo 8. LiteSpeed Web Server
echo 9. Cherokee
echo 10. Return to Main Menu
echo ========================
call :SHOW_PROMPT
if "%option%"=="1" goto INSTALL_APACHE
if "%option%"=="2" goto INSTALL_NGINX
if "%option%"=="3" goto INSTALL_TOMCAT
if "%option%"=="4" goto INSTALL_IIS
if "%option%"=="5" goto INSTALL_LIGHTTPD
if "%option%"=="6" goto INSTALL_CADDY
if "%option%"=="7" goto INSTALL_JETTY
if "%option%"=="8" goto INSTALL_LITESPEED
if "%option%"=="9" goto INSTALL_CHEROKEE
if "%option%"=="10" goto MAIN_MENU

:UNINSTALL_MENU
cls
echo ========================
echo  UNINSTALL WEB SERVERS
echo ========================
echo 1. Uninstall Web Server
echo 2. Return to Main Menu
echo ========================
call :SHOW_PROMPT
if "%option%"=="1" goto UNINSTALL_WEB_SERVER
if "%option%"=="2" goto MAIN_MENU

:UNINSTALL_WEB_SERVER
cls
echo ========================
echo  UNINSTALL WEB SERVER
echo ========================
echo Detecting installed web servers...
call :CHECK_APACHE
call :CHECK_NGINX
call :CHECK_TOMCAT
call :CHECK_IIS
call :CHECK_LIGHTTPD
call :CHECK_CADDY
call :CHECK_JETTY
call :CHECK_LITESPEED
call :CHECK_CHEROKEE
echo ========================
echo Choose a web server to uninstall:
echo 1. Apache HTTP Server
echo 2. Nginx
echo 3. Apache Tomcat
echo 4. Internet Information Services
echo 5. lighttpd
echo 6. Caddy
echo 7. Jetty
echo 8. LiteSpeed Web Server
echo 9. Cherokee
echo 10. Return to Main Menu
echo ========================
call :SHOW_PROMPT
if "%option%"=="1" goto UNINSTALL_APACHE
if "%option%"=="2" goto UNINSTALL_NGINX
if "%option%"=="3" goto UNINSTALL_TOMCAT
if "%option%"=="4" goto UNINSTALL_IIS
if "%option%"=="5" goto UNINSTALL_LIGHTTPD
if "%option%"=="6" goto UNINSTALL_CADDY
if "%option%"=="7" goto UNINSTALL_JETTY
if "%option%"=="8" goto UNINSTALL_LITESPEED
if "%option%"=="9" goto UNINSTALL_CHEROKEE
if "%option%"=="10" goto MAIN_MENU

:CHECK_APACHE
:: Check for Apache HTTP Server
sc query Apache2.4 >nul 2>&1
if %errorlevel%==0 (
    set apache_installed=true
) else (
    set apache_installed=false
)
goto :eof

:CHECK_NGINX
:: Check for Nginx
sc query nginx >nul 2>&1
if %errorlevel%==0 (
    set nginx_installed=true
) else (
    set nginx_installed=false
)
goto :eof

:CHECK_TOMCAT
:: Check for Apache Tomcat
if exist "C:\Program Files\Apache Software Foundation\Tomcat 9.0\bin\catalina.bat" (
    set tomcat_installed=true
) else (
    set tomcat_installed=false
)
goto :eof

:CHECK_IIS
:: Check for IIS
sc query W3SVC >nul 2>&1
if %errorlevel%==0 (
    set iis_installed=true
) else (
    set iis_installed=false
)
goto :eof

:CHECK_LIGHTTPD
:: Check for lighttpd
:: Assuming lighttpd is installed at a known location or has a service
if exist "C:\Program Files\lighttpd\bin\lighttpd.exe" (
    set lighttpd_installed=true
) else (
    set lighttpd_installed=false
)
goto :eof

:CHECK_CADDY
:: Check for Caddy
if exist "C:\Program Files\Caddy\caddy.exe" (
    set caddy_installed=true
) else (
    set caddy_installed=false
)
goto :eof

:CHECK_JETTY
:: Check for Jetty
if exist "C:\Program Files\Jetty\bin\jetty.bat" (
    set jetty_installed=true
) else (
    set jetty_installed=false
)
goto :eof

:CHECK_LITESPEED
:: Check for LiteSpeed
if exist "C:\Program Files\LiteSpeed\bin\lswsctrl.exe" (
    set litespeed_installed=true
) else (
    set litespeed_installed=false
)
goto :eof

:CHECK_CHEROKEE
:: Check for Cherokee
if exist "C:\Program Files\Cherokee\bin\cherokee.exe" (
    set cherokee_installed=true
) else (
    set cherokee_installed=false
)
goto :eof

:INSTALL_APACHE
set /p install_dir="Enter directory to install Apache HTTP Server: "
echo Installing Apache HTTP Server...
:: Download and install Apache HTTP Server
curl -L -o "%TEMP%\apache.zip" "https://www.apachelounge.com/download/VS16/binaries/httpd-2.4.56-win64-VC15.zip"
powershell -Command "Expand-Archive -Path '%TEMP%\apache.zip' -DestinationPath '%install_dir%'"
pause
goto MAIN_MENU

:INSTALL_NGINX
set /p install_dir="Enter directory to install Nginx: "
echo Installing Nginx...
:: Download and install Nginx
curl -L -o "%TEMP%\nginx.zip" "https://nginx.org/download/nginx-1.24.0.zip"
powershell -Command "Expand-Archive -Path '%TEMP%\nginx.zip' -DestinationPath '%install_dir%'"
pause
goto MAIN_MENU

:INSTALL_TOMCAT
set /p install_dir="Enter directory to install Apache Tomcat: "
echo Installing Apache Tomcat...
:: Download and install Apache Tomcat
curl -L -o "%TEMP%\tomcat.zip" "https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73-windows-x64.zip"
powershell -Command "Expand-Archive -Path '%TEMP%\tomcat.zip' -DestinationPath '%install_dir%'"
pause
goto MAIN_MENU

:INSTALL_IIS
echo Installing Internet Information Services...
:: IIS is installed through Windows Features
dism /online /enable-feature /featurename:IIS-WebServerRole
pause
goto MAIN_MENU

:INSTALL_LIGHTTPD
set /p install_dir="Enter directory to install lighttpd: "
echo Installing lighttpd...
:: Download and install lighttpd
curl -L -o "%TEMP%\lighttpd.zip" "https://www.lighttpd.net/download/lighttpd-1.4.68.zip"
powershell -Command "Expand-Archive -Path '%TEMP%\lighttpd.zip' -DestinationPath '%install_dir%'"
pause
goto MAIN_MENU

:INSTALL_CADDY
set /p install_dir="Enter directory to install Caddy: "
echo Installing Caddy...
:: Download and install Caddy
curl -L -o "%TEMP%\caddy.zip" "https://caddyserver.com/download/builds/caddy-v2.7.4-windows-amd64.zip"
powershell -Command "Expand-Archive -Path '%TEMP%\caddy.zip' -DestinationPath '%install_dir%'"
pause
goto MAIN_MENU

:INSTALL_JETTY
set /p install_dir="Enter directory to install Jetty: "
echo Installing Jetty...
:: Download and install Jetty
curl -L -o "%TEMP%\jetty.zip" "https://download.eclipse.org/jetty/9.4.50.v20220930/dist/jetty-distribution-9.4.50.v20220930.zip"
powershell -Command "Expand-Archive -Path '%TEMP%\jetty.zip' -DestinationPath '%install_dir%'"
pause
goto MAIN_MENU

:INSTALL_LITESPEED
set /p install_dir="Enter directory to install LiteSpeed Web Server: "
echo Installing LiteSpeed Web Server...
:: Download and install LiteSpeed Web Server
curl -L -o "%TEMP%\litespeed.zip" "https://www.litespeedtech.com/packages/lsws-1.8.9-win64.zip"
powershell -Command "Expand-Archive -Path '%TEMP%\litespeed.zip' -DestinationPath '%install_dir%'"
pause
goto MAIN_MENU

:INSTALL_CHEROKEE
set /p install_dir="Enter directory to install Cherokee: "
echo Installing Cherokee...
:: Download and install Cherokee
curl -L -o "%TEMP%\cherokee.zip" "http://www.cherokee-project.com/releases/cherokee-1.2.104-win32.zip"
powershell -Command "Expand-Archive -Path '%TEMP%\cherokee.zip' -DestinationPath '%install_dir%'"
pause
goto MAIN_MENU

:UNINSTALL_APACHE
if "%apache_installed%"=="true" (
    echo Uninstalling Apache HTTP Server...
    :: Stop Apache service and remove directory
    sc stop Apache2.4
    sc delete Apache2.4
    rmdir /s /q "%install_dir%\Apache24"
) else (
    echo Apache HTTP Server is not installed.
)
pause
goto UNINSTALL_MENU

:UNINSTALL_NGINX
if "%nginx_installed%"=="true" (
    echo Uninstalling Nginx...
    :: Stop Nginx service and remove directory
    sc stop nginx
    sc delete nginx
    rmdir /s /q "%install_dir%\nginx"
) else (
    echo Nginx is not installed.
)
pause
goto UNINSTALL_MENU

:UNINSTALL_TOMCAT
if "%tomcat_installed%"=="true" (
    echo Uninstalling Apache Tomcat...
    :: Stop Tomcat service and remove directory
    sc stop Tomcat9
    sc delete Tomcat9
    rmdir /s /q "%install_dir%\Apache Software Foundation\Tomcat 9.0"
) else (
    echo Apache Tomcat is not installed.
)
pause
goto UNINSTALL_MENU

:UNINSTALL_IIS
if "%iis_installed%"=="true" (
    echo Uninstalling Internet Information Services...
    :: IIS is removed through Windows Features
    dism /online /disable-feature /featurename:IIS-WebServerRole
) else (
    echo Internet Information Services is not installed.
)
pause
goto UNINSTALL_MENU

:UNINSTALL_LIGHTTPD
if "%lighttpd_installed%"=="true" (
    echo Uninstalling lighttpd...
    :: Stop lighttpd service and remove directory
    sc stop lighttpd
    sc delete lighttpd
    rmdir /s /q "%install_dir%\lighttpd"
) else (
    echo lighttpd is not installed.
)
pause
goto UNINSTALL_MENU

:UNINSTALL_CADDY
if "%caddy_installed%"=="true" (
    echo Uninstalling Caddy...
    :: Stop Caddy service and remove directory
    sc stop Caddy
    sc delete Caddy
    rmdir /s /q "%install_dir%\Caddy"
) else (
    echo Caddy is not installed.
)
pause
goto UNINSTALL_MENU

:UNINSTALL_JETTY
if "%jetty_installed%"=="true" (
    echo Uninstalling Jetty...
    :: Stop Jetty service and remove directory
    sc stop Jetty
    sc delete Jetty
    rmdir /s /q "%install_dir%\Jetty"
) else (
    echo Jetty is not installed.
)
pause
goto UNINSTALL_MENU

:UNINSTALL_LITESPEED
if "%litespeed_installed%"=="true" (
    echo Uninstalling LiteSpeed Web Server...
    :: Stop LiteSpeed service and remove directory
    sc stop LiteSpeed
    sc delete LiteSpeed
    rmdir /s /q "%install_dir%\LiteSpeed"
) else (
    echo LiteSpeed Web Server is not installed.
)
pause
goto UNINSTALL_MENU

:UNINSTALL_CHEROKEE
if "%cherokee_installed%"=="true" (
    echo Uninstalling Cherokee...
    :: Stop Cherokee service and remove directory
    sc stop Cherokee
    sc delete Cherokee
    rmdir /s /q "%install_dir%\Cherokee"
) else (
    echo Cherokee is not installed.
)
pause
goto UNINSTALL_MENU

:EXIT
endlocal
exit
