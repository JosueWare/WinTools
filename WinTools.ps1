$isADMIN = ([Security.Principal.WindowsPrincipal] `
[Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

<#==========#>
if (($PSVersionTable.PSEdition) -eq "Core") {
    & (Join-Path -Path "GUI" -ChildPath @("Main", "Menu.ps1"))
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
        Write-Host "TRUE" -ForegroundColor Green
    }
    else {<# IGNORE #>}
}