@echo off
setlocal EnableExtensions
title Bismillah Store - Launcher
chcp 65001 >nul
color 0B

set "APP_DIR=%~dp0"
set "APP=%APP_DIR%BismillahStore.html"

echo.
echo   ================================================
echo      BISMILLAH STORE  -  Starting Application
echo   ================================================
echo.

rem --- Make sure the app file actually exists next to this launcher ---
if exist "%APP%" goto :fileok
color 0C
echo   [ERROR] BismillahStore.html file khuje paoa jayni!
echo.
echo   Checked location:
echo     %APP%
echo.
echo   Please make sure "Run_BismillahStore.bat" and
echo   "BismillahStore.html" ache same folder-e.
echo.
pause
exit /b 1

:fileok
rem --- Known install locations for Edge / Chrome (64-bit, 32-bit, and per-user installs) ---
rem --- Note: paths are checked with GOTO (not parenthesised IF blocks) because
rem --- "Program Files (x86)" itself contains literal parentheses, which can
rem --- break multi-line IF ( ... ) blocks in cmd.exe.
set "EDGE1=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
set "EDGE2=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
set "CHROME1=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
set "CHROME2=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
set "CHROME3=%LocalAppData%\Google\Chrome\Application\chrome.exe"

if exist "%EDGE1%" goto :useEdge1
if exist "%EDGE2%" goto :useEdge2
if exist "%CHROME1%" goto :useChrome1
if exist "%CHROME2%" goto :useChrome2
if exist "%CHROME3%" goto :useChrome3
goto :useDefault

:useEdge1
echo   Microsoft Edge paoa geche. App khola hocche...
start "" "%EDGE1%" --app="%APP%"
goto :launched

:useEdge2
echo   Microsoft Edge paoa geche. App khola hocche...
start "" "%EDGE2%" --app="%APP%"
goto :launched

:useChrome1
echo   Google Chrome paoa geche. App khola hocche...
start "" "%CHROME1%" --app="%APP%"
goto :launched

:useChrome2
echo   Google Chrome paoa geche. App khola hocche...
start "" "%CHROME2%" --app="%APP%"
goto :launched

:useChrome3
echo   Google Chrome paoa geche. App khola hocche...
start "" "%CHROME3%" --app="%APP%"
goto :launched

:useDefault
rem --- Neither Edge nor Chrome found: fall back to the system default browser ---
color 0E
echo   [WARNING] Microsoft Edge ba Google Chrome khuje paoa jayni.
echo   App-ti apnar default browser-e khola hocche.
echo   Purono/onno browser hole kichu modern feature thik moto
echo   nao chalte pare - best result-er jonno Edge ba Chrome
echo   install korar poramorsho deya hocche.
echo.
start "" "%APP%"

:launched
echo.
echo   Bismillah Store cholche. Ei window ekhon bondho kore dite paren.
echo.
timeout /t 3 >nul
endlocal
exit /b 0
