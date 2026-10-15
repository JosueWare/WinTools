$isADMIN = ([Security.Principal.WindowsPrincipal] `
[Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

<#==========#>
if (($PSVersionTable.PSEdition) -eq "Core") {
    if ($isADMIN -eq $true) {
        & (Join-Path -Path "GUI" -ChildPath @("Main", "Menu.ps1"))
    }
    else {
            Write-Host ""
        Write-Host "    Execute como administrador" -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -Seconds 1
        Write-Host "    Deseja inicar como administrador?"
            Write-Host ""
        $questStartPwsh = Read-Host "(S/N)"
        switch ($questStartPwsh) {
            "S" {
                & (Join-Path -Path $PSScriptRoot -ChildPath @("Config", "Start.ps1"))
            }
            Default {<# IGNORE #>}
        }
    }
}
else {
        Write-Host ""
    Write-Host "    Execute com o PowerShell Core" -ForegroundColor Yellow
        Start-Sleep -Seconds 1
        Write-Host ""
    Write-Host "    Deseja executar?"
        Write-Host ""
    $questStartPwsh = Read-Host "(S/N)"
    if ($questStartPwsh -eq "S") {
        & (Join-Path (Join-Path "$PSScriptRoot" "Config") "Start.ps1")
    }
    else {<# IGNORE #>}
}