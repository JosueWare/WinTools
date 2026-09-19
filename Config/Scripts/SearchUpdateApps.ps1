# ENV
[bool]$Internet_NET = Test-Connection -TargetName "8.8.8.8" -Count 1 -Quiet
[int]$LimitsTryCounts = "0"

# Scripts Blocks
[scriptblock]$WingetSearchUpgrade = {
    Clear-Host

    Winget Upgrade <# CMD #>

        Start-Sleep -Seconds 1

        Write-Host "" <##>
    Write-Host "    Deseja atualizar todos os programas ou só algum específico?"
        Write-Host "" <##>
        Start-Sleep -Seconds 1
    Write-Host "        [A] Atualizar Todos | [E] Específico | [N] Nenhum"
        Write-Host "" <##>
    $questUpgradeAllPrograms = Read-Host

        switch ($questUpgradeAllPrograms) {

            "A" {
                Clear-Host

                Winget Upgrade --All

                    Start-Sleep -Seconds 1

                    Write-Host "" <##>
                Write-Host "    Deseja voltar ao início?"
                    Write-Host "" <##>
                    Start-Sleep -Seconds 1
                Write-Host "        [S] Sim | [N] Não (encerrar)"
                    Write-Host "" <##>

                $questReturnToMainMenu = Read-Host

                    switch ($questReturnToMainMenu) {

                        "S" {& ".\Config\Main\Menu.ps1"}
                        "N" {& $ExitTerminalSession}

                        Default {}
                    }
            }

            "E" {
                Clear-Host
                Winget Upgrade

                    Start-Sleep -Seconds 1

                    Write-Host "" <##>
                Write-Host "    Digite o programa específico:"
                    Write-Host "" <##>

                $selectedProgramToUpdate = Read-Host

                Clear-Host

                Winget Upgrade "$selectedProgramToUpdate"

                    Start-Sleep -Seconds 1

                    Write-Host "" <##>
                Write-Host "    Deseja voltar ao início?"
                    Write-Host "" <##>
                    Start-Sleep -Seconds 1
                Write-Host "        [S] Sim | [N] Não (encerrar)"
                    Write-Host "" <##>

                $questReturnToMainMenu = Read-Host

                    switch ($questReturnToMainMenu) {

                        "S" {
                            Clear-Host
                            & ".\Config\Main\Menu.ps1"
                        }

                        "N" {& $ExitTerminalSession}

                        Default {}
                    }
            }

            "N" {
                Clear-History
                & ".\Config\Main\Menu.ps1"
            }

            Default {
                Clear-Host
                    Write-Host "" <##>
                Write-Host "    Resposta inválida" -ForegroundColor Red
                    Write-Host "" <##>

                    Start-Sleep -Seconds 1

                & ".\Config\Scripts\SearchUpdateApps.ps1"
            }
        }
}

# [INI]
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

        Start-Sleep -Seconds 1

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

    <# Reconnect #>
    if ($Internet_NET -eq $true) {
        Clear-Host

            Write-Host "" <##>
        Write-Host "    Reconectado" -ForegroundColor Green
            Write-Host "" <##>

            Start-Sleep -Seconds 2

        # Check Command 'Winget'
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
    
    if ($LimitsTryCounts -gt 20) {
        Clear-Host
            Write-Host "" <##>
        Write-Host "    Limite de tentativas excecidos" -ForegroundColor Red
            Write-Host "" <##>

        Set-Location $HOME
    }
}
    else {
        # Check Command 'Winget'
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

# [END]