# Logon

    # Blocos de Scripts

        [ScriptBlock]$actionSearchWingetUpgrade = {

            Winget Upgrade

                Start-Sleep -Seconds 1

                Write-Host "" <#SPACE#>
            Write-Host "    Deseja atualizar todos os programas?"

                Write-Host "" <#SPACE#>

                Start-Sleep -Seconds 1

            Write-Host "        [S] Sim / [N] Não"
                Write-Host "" <#SPACE#>

            $questUpgradeAllPrograms = Read-Host

                switch ($questUpgradeAllPrograms) {
                    "S" {
                        
                        Winget Upgrade --All

                        Set-Location $HOME
                        }
                    "N" {Set-Location $HOME}

                    Default {

                        Clear-Host

                            Write-Host "" <#SPACE#>
                        Write-Host " Resposta inválida" -ForegroundColor Red
                            Write-Host "" <#SPACE#>

                            Start-Sleep -Seconds 2

                        Stop-Process -Id $PID
                    }
                }
        }

# Inicialização

    <#--Verificar se o Winget está instalado--#>

        if (Get-Command "winget.exe" -ErrorAction SilentlyContinue) {

            Clear-Host

            & $actionSearchWingetUpgrade
        }

        else {

            Clear-Host

                Write-Host "" <#SPACE#>
            Write-Host " Erro" -ForegroundColor Red
                Write-Host "" <#SPACE#>

                Start-Sleep -Seconds 1

            Write-Host " O Winget não está instalado" -ForegroundColor Red
                Write-Host "" <#SPACE#>

                Start-Sleep -Seconds 1

            Stop-Process -Id $PID
        }