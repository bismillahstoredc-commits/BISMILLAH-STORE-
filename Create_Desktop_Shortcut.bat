@echo off
setlocal EnableExtensions
title Bismillah Store - Create Desktop Shortcut
chcp 65001 >nul
color 0B

echo.
echo   ================================================
echo      BISMILLAH STORE  -  Desktop Shortcut Toiri
echo   ================================================
echo.
echo   Ektu wait korun...
echo.

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0create_shortcut.ps1"

echo.
pause
endlocal
exit /b 0
