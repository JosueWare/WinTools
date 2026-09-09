# Logon

    # ENV
    $MainScript = Resolve-Path ".\Config\Main\Menu.ps1"

        # Depedences
        $dpPowerShell = Resolve-Path ".\Config\Main\Depedences\dpPowerShell.ps1"
        $dpWindowsOS = Resolve-Path ".\Config\Main\Depedences\dpWindows.ps1"

# Init

    # Check OS
    if ($env:OS -eq "Windows_NT") {
        if (Get-Command "pwsh.exe" -ErrorAction SilentlyContinue) {
            Start-Process -FilePath "pwsh.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command & $MainScript" -Verb RunAs
        }
            else {
                Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command & $dpPowerShell"
            }
    }
        else {
            Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command & $dpWindowsOS"
        }