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

                    "N" {
                            Write-Host "" <##>
                        Set-Location $HOME
                    }

                    Default {
                            Write-Host "" <#SPACE#>
                        Write-Host "    Resposta inválida" -ForegroundColor Red
                            Write-Host "" <#SPACE#>

                            Start-Sleep -Seconds 1

                        Set-Location "$HOME"
                    }
                }
        }

# Init

    <# Check the Winget.exe #>

        if (Get-Command "winget.exe" -ErrorAction SilentlyContinue) {
            Clear-Host
            & $actionSearchWingetUpgrade
        }

        else {
            Clear-Host

                Write-Host "" <#SPACE#>
            Write-Host "    Erro" -ForegroundColor Red
                Write-Host "" <#SPACE#>

                Start-Sleep -Seconds 1
                
                Write-Host "" <#SPACE#>
            Write-Host "    O Winget não está instalado" -ForegroundColor Red
                Write-Host "" <#SPACE#>

                Start-Sleep -Seconds 1

            Set-Location "$HOME"
        }