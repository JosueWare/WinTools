# Status de execução ADMIN
$runnigAdmin = ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# Verificar se o 'WinTools' estiver sendo executado pelo PowerShell Core
if ($PSVersionTable.PSEdition -eq "Core") {
    if ($runnigAdmin) { <# Verificar se está sendo executado como administrador #>
        & (Join-Path -Path $PSScriptRoot -ChildPath @("Config", "Main", "Menu.ps1"))
    }
        else {
            Write-Host "WinTools requer que você execute como administrador" -ForegroundColor Yellow
        }
}
    else {
        Write-Host "WinTools nao é suportado para o Windows PowerShell 5.1" -ForegroundColor Red
    }