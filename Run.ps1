$isADMIN = ([Security.Principal.WindowsPrincipal] `
[Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

$MainScript = Resolve-Path (Join-Path (Join-Path "GUI" "Main") "Menu.ps1")
$dpPwsh = Resolve-Path (Join-Path (Join-Path (Join-Path "GUI" "Main") "Depedences") "dpPwsh.ps1")

# GUI
if (Get-Command "pwsh.exe" -ErrorAction SilentlyContinue) {
    if (-not ($PSVersionTable.PSEdition) -eq "Core") {
        Write-Host "Execute com o PowerShell Core" -ForegroundColor Yellow
            Start-Sleep -Seconds 1
        $questStartPwshCore = Read-Host "(S/N)"
        switch ($questStartPwshCore) {
            "S" {Start-Process -FilePath "pwsh.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command & $MainScript"}
            Default {<# IGNORE #>}
        }
    }
}
else {
    Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command & $dpPwsh"
}