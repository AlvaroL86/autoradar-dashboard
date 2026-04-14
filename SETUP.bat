@echo off
REM ============================================================
REM AutoRadar Dashboard - SETUP inicial de Git
REM Ejecuta esto UNA SOLA VEZ antes de usar PUSH.bat
REM ============================================================

setlocal enabledelayedexpansion

cd /d "%~dp0"

cls
echo.
echo ============================================================
echo    ⚙️  AutoRadar Dashboard - SETUP Git
echo ============================================================
echo.

REM Verificar si git está instalado
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ ERROR: Git no está instalado
    echo.
    echo Descárgalo desde: https://git-scm.com/
    pause
    exit /b 1
)

echo ✅ Git detectado correctamente
echo.

REM Configurar usuario global (si no existe)
git config --global user.name >nul 2>&1
if %errorlevel% neq 0 (
    echo 📝 Configurando usuario Git...
    set /p "username=Tu nombre de usuario GitHub: "
    git config --global user.name "!username!"
)

git config --global user.email >nul 2>&1
if %errorlevel% neq 0 (
    echo 📧 Configurando email...
    set /p "email=Tu email de GitHub: "
    git config --global user.email "!email!"
)

echo.
echo 📋 Verificando repositorio...

if not exist .git (
    echo ⚠️  No es un repositorio Git
    echo.
    set /p "init=¿Inicializar como repo git? (S/N): "
    if /i "!init!"=="S" (
        git init
        echo ✅ Repositorio inicializado
    ) else (
        echo ❌ Cancelado
        pause
        exit /b 1
    )
) else (
    echo ✅ Repositorio Git detectado
)

echo.
echo 🔗 Verificando conexión a GitHub...
git remote -v >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠️  Sin remote configurado
    echo.
    set /p "remote=URL del repositorio GitHub (ej: https://github.com/usuario/repo): "
    git remote add origin "!remote!"
    echo ✅ Remote añadido
) else (
    echo ✅ Remote ya configurado:
    git remote -v
)

echo.
echo ============================================================
echo ✅ SETUP completado correctamente
echo.
echo Próximos pasos:
echo   1. Abre PUSH.bat para subir cambios
echo   2. O PUSH_CON_MENSAJE.bat para personalizar el mensaje
echo.
echo ============================================================
echo.

pause
