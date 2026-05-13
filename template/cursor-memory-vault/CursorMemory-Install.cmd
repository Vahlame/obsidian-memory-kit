@echo off
setlocal
title Cursor Memory One-Click Install

echo ===============================================
echo   Cursor Memory One-Click Install
echo ===============================================
echo.

set /p REPO_URL=Repo URL privado del vault (https://github.com/usuario/cursor-memory-vault.git): 
if "%REPO_URL%"=="" (
  echo [ERROR] Debes ingresar REPO_URL.
  pause
  exit /b 1
)

set "VAULT_PATH=%USERPROFILE%\Documents\cursor-memory-vault"
set "BOOTSTRAP_PS=%VAULT_PATH%\cursor-install\bootstrap-from-github.ps1"

where git >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Git no esta instalado o no esta en PATH.
  pause
  exit /b 1
)

if not exist "%VAULT_PATH%" (
  echo Clonando vault...
  git clone "%REPO_URL%" "%VAULT_PATH%"
  if errorlevel 1 (
    echo [ERROR] No se pudo clonar el repo.
    pause
    exit /b 1
  )
)

if not exist "%BOOTSTRAP_PS%" (
  echo [ERROR] No se encontro script bootstrap:
  echo %BOOTSTRAP_PS%
  pause
  exit /b 1
)

powershell -ExecutionPolicy Bypass -File "%BOOTSTRAP_PS%" -RepoUrl "%REPO_URL%"
if errorlevel 1 (
  echo [ERROR] Fallo bootstrap.
  pause
  exit /b 1
)

echo.
echo Instalacion completa. Reinicia Cursor.
echo.
pause
exit /b 0
