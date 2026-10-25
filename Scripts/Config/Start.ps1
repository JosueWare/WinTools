# Check Execution Policy
if (-not ((Get-ExecutionPolicy) -eq "Bypass")) {
    & "$PSScriptRoot/SetExecutionPolicy.ps1"
    exit
}

# Logon

    # ENV
    $MainScript = Resolve-Path "Scripts/Main/Menu.ps1"
    $dpPwsh = Resolve-Path "Scripts/Main/Depedences/Pwsh.ps1"

# Start
if (Get-Command "pwsh.exe" -ErrorAction SilentlyContinue) {
    Start-Process -FilePath "pwsh.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command . $MainScript" -Verb RunAs
}
else {
    Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command . $dpPwsh"
}