@echo off
REM ============================================================
REM AutoRadar Dashboard - PUSH con mensaje personalizado
REM Uso: Doble clic y escribe el mensaje del commit
REM ============================================================

setlocal enabledelayedexpansion

cd /d "%~dp0"

cls
echo.
echo ============================================================
echo    📝 AutoRadar Dashboard - PUSH con Mensaje
echo ============================================================
echo.

if not exist .git (
    echo ❌ ERROR: No es un repositorio Git
    pause
    exit /b 1
)

echo 📋 Estado actual:
echo.
git status --short
echo.

echo ============================================================
set /p "mensaje=Escribe el mensaje del commit: "

if "%mensaje%"=="" (
    echo ❌ El mensaje no puede estar vacío
    pause
    exit /b 1
)

echo.
echo 📝 Haciendo commit: "%mensaje%"
git add .
git commit -m "%mensaje%"

if %errorlevel% neq 0 (
    echo ⚠️  Sin cambios para commitear
    pause
    exit /b 0
)

echo.
echo 📤 Enviando a GitHub...
git push origin main

if %errorlevel% equ 0 (
    echo.
    echo ✅ ¡Cambios subidos exitosamente!
    echo.
) else (
    echo.
    echo ❌ Error al subir a GitHub
    echo.
)

pause
