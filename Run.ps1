$isADMIN = ([Security.Principal.WindowsPrincipal] `
[Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# GUI
if (-not (($PSVersionTable.PSEdition) -eq "Core")) {
    Write-Host "Execute o script com o PowerShell Core" -ForegroundColor Red
}