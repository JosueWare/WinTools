# Logon

    # ENV
    $MainScript = @(
        (Join-Path (Join-Path "GUI" "Main") "Menu.ps1")
    )
    $dpPwsh = @(
        (Join-Path (Join-Path (Join-Path "GUI" "Main") "Depedences") "dpPwsh.ps1")
    )
    $dpWinOS = @(
        (Join-Path (Join-Path (Join-Path "GUI" "Main") "Depedences") "dpWinOS.ps1")
    )

# Init

    # Check OS
    if ($env:OS -eq "Windows_NT") {
        if (Get-Command "pwsh.exe" -ErrorAction SilentlyContinue) {
            Start-Process -FilePath "pwsh.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command & $MainScript" -Verb RunAs
        }
        else {
            Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command & $dpPwsh"
        }
    }
    else {
        Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command & $dpWinOS"
    }