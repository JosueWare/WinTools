# ENV
[bool]$Internet_NET = Test-Connection -TargetName "8.8.8.8" -Count 1 -Quiet
[int]$LimitsTryCounts = "0"

# Scripts Blocks
[scriptblock]$WingetSearchUpgrade = {
    Clear-Host

    Winget Upgrade <# CMD #>

        Write-Host "" <##>
    Write-Host "    Deseja atualizar todos os programas?"
        Write-Host "" <##>
        Start-Sleep -Milliseconds 500
        Write-Host "" <##>
    Write-Host "    [S] Sim | [N] Não"
        Write-Host "" <##>
    $questUpgradeAllPrograms = Read-Host

        switch ($questUpgradeAllPrograms) {

            "S" {
                Winget Upgrade --All

                Set-Location $HOME
            }
            "N" {
                Set-Location $HOME
            }

            Default {
                    Write-Host "" <##>
                Write-Host "    Resposta inválida" -ForegroundColor Red
                    Write-Host "" <##>

                Set-Location $HOME
            }
        }
}

# Check Connection Internet
if (-not ($Internet_NET)) {
    Clear-Host
        Write-Host "" <##>
    Write-Host "    Erro de conexão" -ForegroundColor Red
        Write-Host "" <##>

        Start-Sleep -Seconds 1

        Write-Host "" <##>
    Write-Host "    Tentando novamente " -ForegroundColor Yellow -NoNewline
    Write-Host "$LimitsTryCounts"
        Write-Host "" <##>

    <# Loop #>
    do {
        <# ENV #>
        $Internet_NET = Test-Connection -TargetName "8.8.8.8" -Count 1 -Quiet
        $LimitsTryCounts++

        Clear-Host
            Write-Host "" <##>
        Write-Host "    Erro de conexão" -ForegroundColor Red
            Write-Host "" <##>

            Write-Host "" <##>
        Write-Host "    Tentando novamente " -ForegroundColor Yellow -NoNewline
        Write-Host "$LimitsTryCounts"
            Write-Host "" <##>
    } until (($Internet_NET -eq $true) -or ($LimitsTryCounts -gt 20))

    <# Check Command #>
    if (Get-Command "winget.exe" -ErrorAction SilentlyContinue) {
        & $WingetSearchUpgrade
    }
        else {
            Clear-Host
                Write-Host "" <##>
            Write-Host "    Erro" -ForegroundColor Red
                Write-Host "" <##>

                Start-Sleep -Seconds 1

                Write-Host "" <##>
            Write-Host "    O comando 'Winget' não foi encontrado" -ForegroundColor Red
                Write-Host "" <##>

            Set-Location $HOME
        }
}
    else {
        Clear-Host
            Write-Host "" <##>
        Write-Host "    Erro" -ForegroundColor Red
            Write-Host "" <##>

            Start-Sleep -Seconds 1

            Write-Host "" <##>
        Write-Host "    O comando 'Winget' não foi encontrado" -ForegroundColor Red
            Write-Host "" <##>

        Set-Location $HOME
    }

# [END]