@echo off
REM ============================================================
REM AutoRadar Dashboard - MENÚ PRINCIPAL
REM Gestión completa de Git desde Windows
REM ============================================================

setlocal enabledelayedexpansion

cd /d "%~dp0"

:menu
cls
echo.
echo ============================================================
echo    🚗 AutoRadar Dashboard - MENÚ GIT
echo ============================================================
echo.
echo   1. 📤 PUSH rápido (commit automático)
echo   2. 📝 PUSH con mensaje personalizado
echo   3. 📥 PULL (traer cambios)
echo   4. 📋 Ver estado del repo
echo   5. 🔍 Ver historial de commits
echo   6. 🔧 SETUP inicial
echo   7. ❌ Salir
echo.
echo ============================================================
set /p "opcion=Selecciona una opción (1-7): "

if "%opcion%"=="1" goto push_rapido
if "%opcion%"=="2" goto push_mensaje
if "%opcion%"=="3" goto pull
if "%opcion%"=="4" goto status
if "%opcion%"=="5" goto log
if "%opcion%"=="6" goto setup
if "%opcion%"=="7" exit /b 0

echo.
echo ❌ Opción inválida
pause
goto menu

:push_rapido
cls
echo.
echo 📤 PUSH RÁPIDO
echo ============================================================
echo.
git status --short
echo.
set /p "confirm=¿Subir cambios? (S/N): "
if /i not "!confirm!"=="S" goto menu

for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
for /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)

git add .
git commit -m "Update: !mydate! !mytime!"
git push origin main

if !errorlevel! equ 0 (
    echo.
    echo ✅ Cambios subidos exitosamente
) else (
    echo.
    echo ❌ Error al subir
)

pause
goto menu

:push_mensaje
cls
echo.
echo 📝 PUSH CON MENSAJE
echo ============================================================
echo.
git status --short
echo.
set /p "mensaje=Mensaje del commit: "

if "!mensaje!"=="" (
    echo ❌ El mensaje no puede estar vacío
    pause
    goto menu
)

git add .
git commit -m "!mensaje!"
git push origin main

if !errorlevel! equ 0 (
    echo.
    echo ✅ Cambios subidos exitosamente
) else (
    echo.
    echo ❌ Error al subir
)

pause
goto menu

:pull
cls
echo.
echo 📥 PULL - Traer cambios de GitHub
echo ============================================================
echo.
git pull origin main
echo.
echo ✅ Cambios traídos
pause
goto menu

:status
cls
echo.
echo 📋 ESTADO DEL REPOSITORIO
echo ============================================================
echo.
git status
echo.
pause
goto menu

:log
cls
echo.
echo 🔍 HISTORIAL DE COMMITS (últimos 10)
echo ============================================================
echo.
git log --oneline -10
echo.
pause
goto menu

:setup
cls
echo.
echo 🔧 SETUP INICIAL
echo ============================================================
echo.

git --version >nul 2>&1
if !errorlevel! neq 0 (
    echo ❌ Git no está instalado
    pause
    goto menu
)

echo ✅ Git detectado

git config --global user.name >nul 2>&1
if !errorlevel! neq 0 (
    set /p "username=Tu nombre de usuario GitHub: "
    git config --global user.name "!username!"
)

git config --global user.email >nul 2>&1
if !errorlevel! neq 0 (
    set /p "email=Tu email de GitHub: "
    git config --global user.email "!email!"
)

if not exist .git (
    git init
)

git remote -v >nul 2>&1
if !errorlevel! neq 0 (
    set /p "remote=URL del repositorio GitHub: "
    git remote add origin "!remote!"
)

echo.
echo ✅ SETUP completado
pause
goto menu
