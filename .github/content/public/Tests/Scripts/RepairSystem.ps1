# ENV
[bool]$Internet_NET = Test-Connection -TargetName "8.8.8.8" -Count 1 -Quiet
[int]$LimitsTryCounts = "0"

# Scripts Blocks
[scriptblock]$Execute_DISM = {
    Clear-Host
        Write-Host <##>
    Write-Host " AVISO:" -ForegroundColor Yellow
        Write-Host <##>

        Start-Sleep -Seconds 1

        Write-Host <##>
    Write-Host "    Este processo irá demorar e não pode ser interrompido pois será
    baixada uma nova imagem de disco do sistema e em seguida será
    feito uma verificação da integridade dos arquivos do sistema (System File Checker)." -ForegroundColor Yellow
        Write-Host <##>

        Start-Sleep -Seconds 2

        Write-Host <##>
    Write-Host "    Após isso o computador será reinciado." -ForegroundColor Yellow
        Write-Host <##>

        Start-Sleep -Seconds 2

        Write-Host <##>
    Write-Host "    Deseja prosseguir?"
        Write-Host <##>
        Start-Sleep -Milliseconds 500
    Write-Host "        [S] Sim | [N] Não"
        Write-Host <##>
}

<#=============#>

# [INIT]
# Check Internet Connection
if (-not ($Internet_NET)) {
    Clear-Host
        Write-Host <##>
    Write-Host "    Erro de conexão" -ForegroundColor Red
        Write-Host <##>

        Start-Sleep -Seconds 1

        Write-Host <##>
    Write-Host "    Tentando novamente " -ForegroundColor Yellow -NoNewline
    Write-Host "$LimitsTryCounts" -ForegroundColor Cyan
        Write-Host <##>

        do { <# Loop [INI] #>
        # ENV
        [bool]$Internet_NET = Test-Connection -TargetName "8.8.8.8" -Count 1 -Quiet
        $LimitsTryCounts++

        Clear-Host
            Write-Host <##>
        Write-Host "    Erro de conexão" -ForegroundColor Red
            Write-Host <##>

            Write-Host <##>
        Write-Host "    Tentando novamente " -ForegroundColor Yellow -NoNewline
        Write-Host "$LimitsTryCounts" -ForegroundColor Cyan
            Write-Host <##>
        } until (($Internet_NET -eq $true) -or ($LimitsTryCounts -gt 20))

        if ($Internet_NET -eq $true) {
            Clear-Host
                Write-Host "" <##>
            Write-Host "    Reconectado" -ForegroundColor Green
                Write-Host "" <##>

                Start-Sleep -Seconds 2

            & $Execute_DISM
        }
            else {
                Clear-Host
                    Write-Host "" <##>
                Write-Host "    Número de tentativas excedidas" -ForegroundColor Red
                    Write-Host "" <##>

            Set-Location $HOME
            }
}
    else {& $Execute_DISM}