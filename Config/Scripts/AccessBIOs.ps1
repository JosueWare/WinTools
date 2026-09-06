# Logon

    # Scripts Blocks
    [scriptblock]$ExecBIOsAccess = {
        shutdown.exe /r /fw /t 0
    }

# Begin
Clear-Host
Start-Sleep -Seconds 1

    Write-Host "" <##>
Write-Host " Aviso:" -ForegroundColor Yellow
    Start-Sleep -Seconds 1
Write-Host @(
    "
    A sua placa-mãe precisa ser compatível a esta função
    "
) -ForegroundColor Yellow

    Start-Sleep -Seconds 1

    Write-Host "" <##>
Write-Host "    Deseja prosseguir? (Salve seus arquivos da área de trabalho!)" -ForegroundColor Yellow
    Write-Host "" <##>
    Start-Sleep -Milliseconds 500
Write-Host "        [S] Sim | [N] Não"
    Write-Host "" <##>

$questProssid = Read-Host

    switch ($questProssid) {

        "S" {
            Clear-Host
            Start-Sleep -Seconds 2
            & $ExecBIOsAccess
        }

        "N" {& ".\Config\Main\Menu.ps1"}

        Default {& $ErrorResponse}
    }