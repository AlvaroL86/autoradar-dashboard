@echo off
REM ═══════════════════════════════════════════════════════════════════════════
REM AutoRadar Dashboard — PUSH AUTOMÁTICO (Ultra rápido - SIN preguntas)
REM Doble click → Subir TODO automáticamente → Listo en 10 segundos
REM ═══════════════════════════════════════════════════════════════════════════

setlocal enabledelayedexpansion

REM Ir a la carpeta del proyecto
cd /d C:\Users\jania\Desktop\autoradar-dashboard

REM Agregar cambios
git add .

REM Hacer commit automático con timestamp
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
for /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a-%%b)

git commit -m "Update dashboard %mydate% %mytime%"

REM Subir a GitHub
git push origin main

REM Mensaje de éxito
echo.
echo ✅ ¡Cambios subidos!
echo 🚀 Vercel redeploy automático...
echo 📊 https://autoradar-dashboard.vercel.app
echo.

REM Cerrar después de 3 segundos
timeout /t 3 /nobreak
