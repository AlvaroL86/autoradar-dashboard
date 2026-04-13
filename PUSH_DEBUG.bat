@echo off
setlocal enabledelayedexpansion

echo.
echo ════════════════════════════════════════════════════════════════════════════
echo 🔍 DEBUG: Verificando configuración
echo ════════════════════════════════════════════════════════════════════════════
echo.

REM Mostrar ruta actual
echo 📍 Ubicación del script: %~dp0
echo 📍 Carpeta actual: %CD%
echo.

REM Cambiar a la carpeta del script
cd /d "%~dp0"
echo ✅ Cambiado a: %CD%
echo.

REM Verificar que Git existe
echo ════════════════════════════════════════════════════════════════════════════
echo ✓ Verificando Git...
echo ════════════════════════════════════════════════════════════════════════════
where git
if %ERRORLEVEL% EQU 0 (
    echo ✅ Git encontrado
) else (
    echo ❌ Git NO encontrado. Instala desde: https://git-scm.com/download/win
    pause
    exit /b 1
)
echo.

REM Verificar que estamos en repo git
echo ════════════════════════════════════════════════════════════════════════════
echo ✓ Verificando repositorio Git...
echo ════════════════════════════════════════════════════════════════════════════
if exist .git (
    echo ✅ Repositorio .git encontrado
) else (
    echo ❌ No hay carpeta .git - esto no es un repositorio
    echo.
    echo Solución: Copia este script directamente a:
    echo C:\Users\jania\Desktop\autoradar-dashboard\
    pause
    exit /b 1
)
echo.

REM Mostrar estado
echo ════════════════════════════════════════════════════════════════════════════
echo ✓ Estado de Git
echo ════════════════════════════════════════════════════════════════════════════
git status
echo.

REM Mostrar cambios
echo ════════════════════════════════════════════════════════════════════════════
echo ✓ Cambios detectados:
echo ════════════════════════════════════════════════════════════════════════════
git status --short
echo.

REM Listar archivos en la carpeta
echo ════════════════════════════════════════════════════════════════════════════
echo ✓ Archivos en esta carpeta:
echo ════════════════════════════════════════════════════════════════════════════
dir /B
echo.

REM Mostrar remote
echo ════════════════════════════════════════════════════════════════════════════
echo ✓ Configuración de remote:
echo ════════════════════════════════════════════════════════════════════════════
git remote -v
echo.

REM Intentar push
echo ════════════════════════════════════════════════════════════════════════════
echo ✓ Intentando PUSH...
echo ════════════════════════════════════════════════════════════════════════════
git add .
git commit -m "Update %date% %time%"
git push origin main -v

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ✅ ¡ÉXITO! Cambios subidos a GitHub
) else (
    echo.
    echo ❌ Error en push. Lee arriba para más detalles
)

echo.
pause
