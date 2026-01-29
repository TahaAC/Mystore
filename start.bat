@echo off
REM Gulistan Management System - Start Script

echo.
echo ===============================================
echo Gulistan Management System - Starting Server
echo ===============================================
echo.

REM Check if node_modules exists
if not exist "node_modules" (
    echo Installing dependencies first...
    call npm install
)

REM Start the server
echo.
echo Starting server on http://localhost:8000
echo.
echo Press CTRL+C to stop the server
echo.

call npm start

pause
