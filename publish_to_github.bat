@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM Gå till projektmappen. Ändra sökvägen om din terminal inte redan är i mappen!
REM cd "G:\Min enhet\Mhockey\GitHub\New_Mockup_IHL"
REM Kontrollera att du är i rätt mapp när du kör skriptet!

echo.
echo --- Automatiserad Git Push ---
echo.

echo Steg 1: Lägger till alla ändringar (git add .)
git add .
if %errorlevel% neq 0 (
    echo Fel vid 'git add .', avslutar.
    goto :eof
)

echo.
echo Steg 2: Kommitterar ändringar. Ange commit-meddelande:
set /p COMMIT_MSG="> "
if "!COMMIT_MSG!"=="" (
    echo Inget commit-meddelande angivet, anvander standardmeddelande.
    set "COMMIT_MSG=Uppdatering"
)
git commit -m "!COMMIT_MSG!"
if %errorlevel% neq 0 (
    echo Fel vid 'git commit', avslutar.
    goto :eof
)

echo.
echo Steg 3: Pushar till GitHub (git push origin main)
git push origin main
if %errorlevel% neq 0 (
    echo Fel vid 'git push', kolla felmeddelandet ovan.
    goto :eof
)

echo.
echo --- Git Push KLAR! ---
echo.
pause