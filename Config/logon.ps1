# Logon

    # VAR

        $main_file = Resolve-Path "Config\Navigation\main.ps1"

# Init

    <# PowerShell #>

        if (Get-Command "pwsh.exe" -ErrorAction SilentlyContinue) {

            Start-Process -FilePath "pwsh.exe" -ArgumentList "-NoProfile", "-NoExit", "-ExecutionPolicy Bypass", "-Command $main_file" -Verb RunAs
        }

        else {

            Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-NoExit", "-ExecutionPolicy Bypass", "-Command $main_file" -Verb RunAs
        }