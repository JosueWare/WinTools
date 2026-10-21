# ENV
[bool]$Internet_NET = Test-Connection -TargetName "8.8.8.8" -Count 1 -Quiet
[int]$LimitsTryCounts = "0"

# Scripts Blocks
[scriptblock]$Execute_DISM = {
    Clear-Host
        Write-Host ""
        Write-Host " " -NoNewline
    Write-Host $Lang.General.WARNING -ForegroundColor Yellow
        Write-Host ""

        Start-Sleep -Seconds 1

        Write-Host ""
        Write-Host $Lang.TAB.tab4 -NoNewline
    Write-Host $Lang.Scripts.RepairSystem.Exclamantion.BR_1 -ForegroundColor Yellow
    Write-Host $Lang.Scripts.RepairSystem.Exclamantion.BR_2 -ForegroundColor Yellow
    Write-Host $Lang.Scripts.RepairSystem.Exclamantion.BR_3 -ForegroundColor Yellow
        Write-Host ""

        Start-Sleep -Seconds 2

        Write-Host ""
        Write-Host $Lang.TAB.tab4 -NoNewline
    Write-Host $Lang.Scripts.RepairSystem.Exclamantion.BR_4 -ForegroundColor Yellow
        Write-Host ""

        Start-Sleep -Seconds 2

        Write-Host ""
        Write-Host $Lang.TAB.tab4 -NoNewline
    Write-Host $Lang.Scripts.RepairSystem.questProceed
        Write-Host ""
        Start-Sleep -Milliseconds 500
        Write-Host $Lang.TAB.tab8 -NoNewline
    Write-Host $Lang.General.YES_OR_NOT
        Write-Host ""

    $questProssidExecute_DISM_ = Read-Host

        switch ($questProssidExecute_DISM_) {

            "S" {
                Clear-Host

                    Start-Sleep -Seconds 1

                    Write-Host ""
                Write-Host "    Iniciando.."
                    Write-Host ""

                    Start-Sleep -Seconds 2

                Clear-Host <# Step 1 #>
                    Write-Host ""
                Write-Host "    Passo 1: " -NoNewline
                    Start-Sleep -Seconds 1
                Write-Host "Executando o " -NoNewline
                Write-Host "DISM.exe" -ForegroundColor Magenta
                    Write-Host ""

                    Start-Sleep -Seconds 1

                Start-Process -FilePath "cmd.exe" -ArgumentList "/c DISM.exe /Online /Cleanup-image /Restorehealth" -Verb RunAs -Wait

                    Write-Host ""
                Write-Host "    Processo finalizado." -ForegroundColor Green
                    Write-Host ""

                Clear-Host <# Step 2 #>
                    Write-Host ""
                Write-Host "    Passo 2: " -NoNewline
                    Start-Sleep -Seconds 1
                Write-Host "Executado o " -NoNewline
                Write-Host "System File Checker" -ForegroundColor Magenta
                    Write-Host ""

                    Start-Sleep -Seconds 1

                Start-Process -FilePath "cmd.exe" -ArgumentList "/c sfc /scannow" -Verb RunAs -Wait

                    Write-Host ""
                Write-Host "    Processo finalizado" -ForegroundColor Green
                    Write-Host ""

                    Start-Sleep -Seconds 1

                    Write-Host ""
                Write-Host "    Reiniciando o computador" -ForegroundColor Yellow
                    Write-Host ""

                    Start-Sleep -Seconds 2

                Restart-Computer
            }

            "N" {
                Write-Host ""
                Set-Location $HOME
            }

            Default {
                Clear-Host
                    Write-Host ""
                Write-Host "    Resposta inválida" -ForegroundColor Red
                    Write-Host ""

                Set-Location $HOME
            }
        }
}

<#=============#>

# [INIT]
# Check Internet Connection
if (-not ($Internet_NET)) {
    Clear-Host
        Write-Host ""
    Write-Host "    Erro de conexão" -ForegroundColor Red
        Write-Host ""

        Start-Sleep -Seconds 1

        Write-Host ""
    Write-Host "    Tentando novamente " -ForegroundColor Yellow -NoNewline
    Write-Host "$LimitsTryCounts" -ForegroundColor Cyan
        Write-Host ""

        do { <# Loop [INI] #>
        # ENV
        [bool]$Internet_NET = Test-Connection -TargetName "8.8.8.8" -Count 1 -Quiet
        $LimitsTryCounts++

        Clear-Host
            Write-Host ""
        Write-Host "    Erro de conexão" -ForegroundColor Red
            Write-Host ""

            Write-Host ""
        Write-Host "    Tentando novamente " -ForegroundColor Yellow -NoNewline
        Write-Host "$LimitsTryCounts" -ForegroundColor Cyan
            Write-Host ""
        } until (($Internet_NET -eq $true) -or ($LimitsTryCounts -gt 20))

        if ($Internet_NET -eq $true) {
            Clear-Host
                Write-Host ""
            Write-Host "    Reconectado" -ForegroundColor Green
                Write-Host ""

                Start-Sleep -Seconds 2

            & $Execute_DISM
        }
            else {
                Clear-Host
                    Write-Host ""
                Write-Host "    Número de tentativas excedidas" -ForegroundColor Red
                    Write-Host ""

            Set-Location $HOME
            }
}
    else {& $Execute_DISM}