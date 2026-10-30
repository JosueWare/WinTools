@echo off
setlocal

if /i "%OS%"=="Windows_NT" (
    PowerShell -NoProfile -ExecutionPolicy Bypass -File "%~dp0Scripts\Config\Start.ps1"
) else (
    start "%~dp0Notes\MISSING.txt"
)

endlocal