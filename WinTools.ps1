# Status de execução ADMIN
$runnigAdmin = ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# Verificar se o 'WinTools' estiver sendo executado pelo PowerShell Core
if ($PSVersionTable.PSEdition -eq "Core") {
    if ($runnigAdmin) {
        & (Join-Path -Path $PSScriptRoot -ChildPath @("Config", "Main", "Menu.ps1"))
    }
        else {
            Write-Host "WinTools requer que você execute como administrador"
        }
}
    else {
        Write-Host "WinTools requer que você execute pelo PowerShell Core"
    }