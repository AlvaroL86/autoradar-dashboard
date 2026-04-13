@echo off
REM Toca todos los archivos para que Git los detecte como modificados
cd /d "%~dp0"

for %%F in (*.*) do (
    copy "%%F" "%%F" >nul 2>&1
)

git add .
git commit -m "Update all files - Touch timestamp"
git push origin main

echo ✅ Todos los archivos se actualizaron en GitHub
timeout /t 3
