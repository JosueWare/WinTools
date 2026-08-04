# Logon

    # VAR
    $MainScript = Resolve-Path ".\Config\Main\Main.ps1"
    $DepedencesScript = Resolve-Path ".\Config\Main\Help\Depedences.ps1"

# Init
if (Get-Command "pwsh.exe" -ErrorAction SilentlyContinue) {
    Start-Process -FilePath "pwsh.exe" -ArgumentList "-NoProfile", "-NoExit", "-ExecutionPolicy Bypass", "-Command $MainScript" -Verb RunAs
}
    else {
            Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-NoExit", "-ExecutionPolicy Bypass", "-Command $DepedencesScript" -Verb RunAs
    }