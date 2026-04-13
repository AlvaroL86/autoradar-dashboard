@echo off
REM ═══════════════════════════════════════════════════════════════════════════
REM RECREAR REPOSITORIO GIT Y CONECTAR CON GITHUB
REM ═══════════════════════════════════════════════════════════════════════════

setlocal enabledelayedexpansion

echo.
echo ╔═══════════════════════════════════════════════════════════════════════════╗
echo ║                                                                           ║
echo ║            🔧 RECREAR REPOSITORIO GIT Y CONECTAR CON GITHUB             ║
echo ║                                                                           ║
echo ╚═══════════════════════════════════════════════════════════════════════════╝
echo.

REM Ir a la carpeta del script
cd /d "%~dp0"

echo ℹ️  Carpeta actual: %CD%
echo.

REM PASO 1: Verificar Git
echo ════════════════════════════════════════════════════════════════════════════
echo PASO 1: Verificando Git
echo ════════════════════════════════════════════════════════════════════════════

where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Git no instalado
    pause
    exit /b 1
)

echo ✅ Git encontrado
echo.

REM PASO 2: Crear repositorio local
echo ════════════════════════════════════════════════════════════════════════════
echo PASO 2: Inicializando repositorio Git local
echo ════════════════════════════════════════════════════════════════════════════
echo.

if exist .git (
    echo ℹ️  Carpeta .git ya existe. Usando repositorio existente.
) else (
    echo Creando carpeta .git...
    git init
    if %ERRORLEVEL% NEQ 0 (
        echo ❌ Error al crear repositorio
        pause
        exit /b 1
    )
    echo ✅ Repositorio inicializado
)

echo.

REM PASO 3: Configurar Git
echo ════════════════════════════════════════════════════════════════════════════
echo PASO 3: Configurando Git
echo ════════════════════════════════════════════════════════════════════════════
echo.

git config user.name "AutoRadar User" >nul 2>nul
git config user.email "autoradar@local" >nul 2>nul

echo ✅ Configuración completada
echo.

REM PASO 4: Agregar archivos
echo ════════════════════════════════════════════════════════════════════════════
echo PASO 4: Agregando archivos
echo ════════════════════════════════════════════════════════════════════════════
echo.

git add .
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Error
    pause
    exit /b 1
)

echo ✅ Archivos agregados
echo.

REM PASO 5: Commit
echo ════════════════════════════════════════════════════════════════════════════
echo PASO 5: Haciendo commit
echo ════════════════════════════════════════════════════════════════════════════
echo.

git commit -m "Initial commit - AutoRadar Dashboard"
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Error en commit
    pause
    exit /b 1
)

echo ✅ Commit creado
echo.

REM PASO 6: Cambiar rama a main
echo ════════════════════════════════════════════════════════════════════════════
echo PASO 6: Cambiando rama a main
echo ════════════════════════════════════════════════════════════════════════════
echo.

git branch -M main
if %ERRORLEVEL% NEQ 0 (
    echo ⚠️  Error
)

echo ✅ Rama main configurada
echo.

REM PASO 7: Conectar con GitHub
echo ════════════════════════════════════════════════════════════════════════════
echo PASO 7: Conectando con GitHub
echo ════════════════════════════════════════════════════════════════════════════
echo.

REM Eliminar remote anterior si existe
git remote remove origin >nul 2>nul

git remote add origin https://github.com/AlvaroL86/autoradar-dashboard.git
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Error al conectar con GitHub
    pause
    exit /b 1
)

echo ✅ Conectado con GitHub
echo.

REM PASO 8: Subir a GitHub
echo ════════════════════════════════════════════════════════════════════════════
echo PASO 8: Subiendo a GitHub
echo ════════════════════════════════════════════════════════════════════════════
echo.
echo ℹ️  Si pide credenciales, usa tu token de GitHub
echo ℹ️  Token: https://github.com/settings/tokens
echo.

git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ════════════════════════════════════════════════════════════════════════════
    echo ✅ ¡ÉXITO! Repositorio configurado y conectado
    echo ════════════════════════════════════════════════════════════════════════════
    echo.
    echo 🎉 Ahora puedes usar PUSH_SIMPLE.bat o PUSH_MEJORADO.bat
    echo.
) else (
    echo ❌ Error al subir a GitHub
    echo.
    echo Si el error es de autenticación:
    echo   1. Ve a: https://github.com/settings/tokens
    echo   2. Generate new token (classic)
    echo   3. Marca "repo" (full control)
    echo   4. Copia el token
    echo   5. Cuando CMD pida contraseña, pega el token
    echo.
)

pause
