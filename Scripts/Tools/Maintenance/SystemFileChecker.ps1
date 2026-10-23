# Logon

    <#--ScriptsBlocks--[INI]#>

        [ScriptBlock]$actionSFCSCANNOW = {

                Write-Host ""
            Write-Host "    Iniciando.."
                Write-Host ""

            Start-Process -FilePath "cmd.exe" -ArgumentList "/c sfc /scannow" -Verb RunAs -Wait

            Write-Host "    Processo concluído" -ForegroundColor Green
        }

    <#--ScriptsBlocks--[END]#>

# Inicialização

Clear-Host

    Start-Sleep -Seconds 1

    Write-Host ""
Write-Host "    Deseja iniciar uma verificação de integridade do sistema agora?"
Write-Host "    (O processo será feito pelo Prompt de comando)"
    Write-Host ""

    Start-Sleep -Seconds 1

Write-Host "        [S] Sim / [N] Não"
    Write-Host ""

$questStartSystemScanner = Read-Host

    switch ($questStartSystemScanner) {

        "S" {

            Clear-Host

                Start-Sleep -Seconds 1

                Write-Host ""
            Write-Host "    Antes de iniciar a verificação"
                Write-Host ""
                
                Start-Sleep -Seconds 1

            Write-Host "    Deseja Desligar ou Reiniciar o sistema"
            Write-Host "    assim que terminar?"
                Write-Host ""

                Start-Sleep -Seconds 1

            Write-Host "        [S] Sim / [N] Não"
                Write-Host ""

            $questStartSystemScanner_Shutdown_OR_Restart_SYS = Read-Host
            
                switch ($questStartSystemScanner_Shutdown_OR_Restart_SYS) {

                    "S" {

                        Clear-Host

                            Write-Host ""
                        Write-Host "    Desligar ou Reiniciar?"
                            Write-Host ""

                        Write-Host "        [D] Desligar / [R] Reiniciar"
                            Write-Host ""

                        $questStartSystemScanner_Shutdown_OR_Restart = Read-Host

                            switch ($questStartSystemScanner_Shutdown_OR_Restart) {

                                "D" { <#--DESLIGAR--#>

                                    & $actionSFCSCANNOW

                                        Start-Sleep -Seconds 2

                                        Write-Host ""
                                    Write-Host "    Desligando.." -ForegroundColor Yellow
                                        Write-Host ""

                                        Start-Sleep -Seconds 2

                                    Stop-Computer
                                }

                                "R" { <#--REINICIAR--#>

                                    & $actionSFCSCANNOW

                                        Start-Sleep -Seconds 2

                                        Write-Host ""
                                    Write-Host "    Reiniciando.." -ForegroundColor Yellow
                                        Write-Host ""

                                        Start-Sleep -Seconds 2

                                    Restart-Computer
                                }

                                Default {& $ErrorResponse}
                            }
                    }
                    "N" {

                        Clear-Host

                            Start-Sleep -Seconds 1

                        & $actionSFCSCANNOW
                            Write-Host ""
                    }

                    Default {& $ErrorResponse}
                }
        }

        "N" {
            Clear-Host
            Set-Location $HOME
        }

        Default {& $ErrorResponse}
    }