@echo off
cd /d "%~dp0"
git add .
git commit -m "Update %date% %time%"
git push origin main
echo ✅ Listo!
timeout /t 2
