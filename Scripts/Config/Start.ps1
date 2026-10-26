# Check Execution Policy
$TargetScript = Resolve-Path "Scripts/Config/SetExecutionPolicy.ps1"
if (-not ((Get-ExecutionPolicy) -eq "Bypass")) {
    if (($PSVersionTable.PSEdition) -eq "Core") {
        Start-Process -FilePath "pwsh.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command & $TargetScript"
        exit
    }
    else {
        Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command & $TargetScript"
        exit
    }
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