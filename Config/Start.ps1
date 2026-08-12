# ENV
$MainScript = Resolve-Path ".\Config\Main\Menu.ps1"
$DepedencesScript = Resolve-Path ".\Config\Main\Depedences\dpPowerShell.ps1"

# Logon
if (Get-Command "pwsh.exe" -ErrorAction SilentlyContinue) {
    Start-Process -FilePath "pwsh.exe" -ArgumentList "-NoProfile", "-NoExit", "-ExecutionPolicy Bypass", "-Command $MainScript" -Verb RunAs
}
    else {
            Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-NoExit", "-ExecutionPolicy Bypass", "-Command $DepedencesScript" -Verb RunAs
    }