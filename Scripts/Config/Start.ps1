# Logon

    # ENV
    $MainScript = Resolve-Path "Scripts/Main/Menu.ps1"
    $dpPwsh = Resolve-Path "Scripts/Main/Depedences/Pwsh.ps1"

# Start
if (Get-Command "pwsh.exe" -ErrorAction SilentlyContinue) {
    Start-Process -FilePath "pwsh.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command & $MainScript" -Verb RunAs
}
else {
    Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command & $dpPwsh"
}