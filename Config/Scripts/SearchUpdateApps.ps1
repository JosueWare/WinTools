# Check the 'winget.exe'
if (-not (Get-Command "winget.exe")) {
    & ".\Config\Main\Depedences\dpWinget.ps1"
}

# Test Connection of Internet
if (-not (Test-Connection -TargetName "8.8.8.8" -Count 2 -Quiet)) {
    Clear-Host

        Write-Host ""
    Write-Host "    Não foi possível prosseguir pois
    não está conectado a internet." -ForegroundColor Red
        Write-Host ""

    exit
}

# Search Upgrade with Winget.exe
Clear-Host
Winget Upgrade

    Start-Sleep -Seconds 1

    Write-Host ""
Write-Host "    Deseja atualizar todos os programas?"
    Write-Host ""
    Start-Sleep -Milliseconds 500
    Write-Host ""
Write-Host "        [S] Sim | [N] Não"
    Write-Host ""
$questUpdateAllProgramsWithWinget = Read-Host

    switch ($questUpdateAllProgramsWithWinget) {

        "S" {
            Winget Upgrade --All
            Set-Location $HOME
        }

        "N" {Set-Location $HOME}

        Default {& $ErrorResponse}
    }