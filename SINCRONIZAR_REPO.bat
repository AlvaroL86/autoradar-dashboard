@echo off
REM ═══════════════════════════════════════════════════════════════════════════
REM SINCRONIZAR REPOSITORIO - Resuelve conflicto de versiones
REM ═══════════════════════════════════════════════════════════════════════════

setlocal enabledelayedexpansion

echo.
echo ╔═══════════════════════════════════════════════════════════════════════════╗
echo ║                                                                           ║
echo ║              🔄 SINCRONIZAR REPOSITORIO CON GITHUB                       ║
echo ║                                                                           ║
echo ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

cd /d "%~dp0"

echo ℹ️  Carpeta: %CD%
echo.

REM PASO 1: PULL (traer cambios de GitHub)
echo ════════════════════════════════════════════════════════════════════════════
echo PASO 1: Descargando cambios de GitHub
echo ════════════════════════════════════════════════════════════════════════════
echo.

git pull origin main --allow-unrelated-histories
if %ERRORLEVEL% NEQ 0 (
    echo ⚠️  Pull completado (posible merge)
) else (
    echo ✅ Pull completado
)

echo.

REM PASO 2: AGREGAR cambios locales
echo ════════════════════════════════════════════════════════════════════════════
echo PASO 2: Agregando cambios locales
echo ════════════════════════════════════════════════════════════════════════════
echo.

git add .
echo ✅ Archivos agregados

echo.

REM PASO 3: COMMIT
echo ════════════════════════════════════════════════════════════════════════════
echo PASO 3: Haciendo commit
echo ════════════════════════════════════════════════════════════════════════════
echo.

git commit -m "Sync repository - merge remote and local changes"
if %ERRORLEVEL% NEQ 0 (
    echo ℹ️  No hay cambios nuevos (OK)
) else (
    echo ✅ Commit creado
)

echo.

REM PASO 4: PUSH
echo ════════════════════════════════════════════════════════════════════════════
echo PASO 4: Subiendo a GitHub
echo ════════════════════════════════════════════════════════════════════════════
echo.

git push origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ════════════════════════════════════════════════════════════════════════════
    echo ✅ ¡ÉXITO! Repositorio sincronizado
    echo ════════════════════════════════════════════════════════════════════════════
    echo.
    echo 🎉 Ahora puedes usar PUSH_SIMPLE.bat normalmente
    echo.
) else (
    echo.
    echo ❌ Error al subir
    echo.
)

pause
