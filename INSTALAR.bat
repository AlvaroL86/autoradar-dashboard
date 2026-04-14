@echo off
REM ============================================================
REM Instalador de scripts BAT - AutoRadar Dashboard
REM ============================================================

setlocal enabledelayedexpansion

cls
echo.
echo ============================================================
echo    📦 Instalador - Scripts BAT AutoRadar Dashboard
echo ============================================================
echo.

REM Detectar carpeta actual
set "project_folder=%cd%"

echo 📂 Carpeta de proyecto: !project_folder!
echo.

REM Verificar si es la carpeta correcta
if not exist "car-tracker.html" (
    echo ❌ ERROR: No encuentro car-tracker.html
    echo.
    echo Esta debe ser la carpeta raíz del proyecto:
    echo   C:\Users\jania\Desktop\autoradar-dashboard\
    echo.
    pause
    exit /b 1
)

echo ✅ Carpeta correcta detectada
echo.

REM Copiar archivos
echo 📋 Instalando scripts...
echo.

copy /Y "MENU.bat" "!project_folder!\MENU.bat" >nul 2>&1
copy /Y "PUSH.bat" "!project_folder!\PUSH.bat" >nul 2>&1
copy /Y "PUSH_CON_MENSAJE.bat" "!project_folder!\PUSH_CON_MENSAJE.bat" >nul 2>&1
copy /Y "SETUP.bat" "!project_folder!\SETUP.bat" >nul 2>&1

if exist "!project_folder!\MENU.bat" (
    echo ✅ MENU.bat
)
if exist "!project_folder!\PUSH.bat" (
    echo ✅ PUSH.bat
)
if exist "!project_folder!\PUSH_CON_MENSAJE.bat" (
    echo ✅ PUSH_CON_MENSAJE.bat
)
if exist "!project_folder!\SETUP.bat" (
    echo ✅ SETUP.bat
)

echo.
echo ============================================================
echo ✅ INSTALACIÓN COMPLETADA
echo.
echo Próximos pasos:
echo   1. Doble clic en SETUP.bat (una sola vez)
echo   2. Luego usa MENU.bat para gestionar Git
echo.
echo 📚 Documentación: README_SCRIPTS_BAT.md
echo ============================================================
echo.

pause
