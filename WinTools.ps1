Set-Location $PSScriptRoot

$isADMIN = ([Security.Principal.WindowsPrincipal] `
[Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (($PSVersionTable.PSEdition) -eq "Core") {
    if ($isADMIN) {
        . (Join-Path -Path "GUI" -ChildPath @("Main", "Menu.ps1"))
    }
    else {
            Write-Host ""
        Write-Host "    Execute o Pwsh.exe como Administrador" -ForegroundColor Red
            Write-Host ""

            Start-Sleep -Seconds 1

        Write-Host "    Deseja executar?"
            Write-Host ""
            Start-Sleep -Milliseconds 500
        Write-Host "        [S] Sim | [N] Não"
            Write-Host ""
        $questStartPowerShellCore = Read-Host
        switch ($questStartPowerShellCore) {

            "S" {. (Join-Path -Path "Config" -ChildPath "Start.ps1")}
            Default {}
        }
    }
}
else {
        Write-Host ""
    Write-Host "    Execute com o PowerShell Core" -ForegroundColor Yellow
        Start-Sleep -Seconds 1
        Write-Host ""
    Write-Host "    Deseja executar?" -ForegroundColor Yellow
        Write-Host ""
    Write-Host "        [S]/[N]"
        Write-Host ""
    $questStartPowerShellCore = Read-Host
    switch ($questStartPowerShellCore) {
        "S" {
            & (Join-Path "Config" "Start.ps1")
        }
        Default {
            Start-Sleep -Seconds 0
        }
    }
}