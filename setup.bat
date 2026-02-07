@echo off
REM Gulistan Management System - Setup Script for Windows

echo.
echo ===============================================
echo Gulistan Management System - Installation Setup
echo ===============================================
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

echo Node.js found: 
node --version
npm --version
echo.

REM Install dependencies
echo Installing dependencies...
call npm install
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo ===============================================
echo Installation Complete!
echo ===============================================
echo.
echo To start the server, run one of these commands:
echo   npm start
echo   npm run serve
echo.
echo Then open your browser to: http://localhost:8000
echo.
echo To install as PWA (standalone app):
echo   1. Open http://localhost:8000 in Chrome/Edge
echo   2. Click the install button in the address bar
echo   3. Follow the prompts
echo.
pause
