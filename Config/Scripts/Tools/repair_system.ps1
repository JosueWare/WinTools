# Logon

    <#--ScriptsBlocks--[INI]#>

        [ScriptBlock]$actionExecute_DISM = {
            
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c DISM.exe /Online /Cleanup-image /Restorehealth" -Verb RunAs -Wait
        }

        [ScriptBlock]$actionExecute_SystemFileChecker = {

            Start-Process -FilePath "cmd.exe" -ArgumentList "/c sfc /scannow" -Verb RunAs -Wait
        }

        # Default

            [ScriptBlock]$WinTools_ErrorResponse = {

                Clear-Host

                    Write-Host "" <#SPACE#>
                Write-Host "    Resposta inválida" -ForegroundColor Red
                    Write-Host "" <#SPACE#>

                    Start-Sleep -Seconds 1

                Stop-Process -Id $PID
            }

            [ScriptBlock]$WinTools_ExitResponse = {

                Clear-Host

                    Start-Sleep -Seconds 1

                Stop-Process -Id $PID
            }

    <#--ScriptsBlocks--[END]#>

# Inicialização

    Clear-Host

        Start-Sleep -Seconds 1

        Write-Host "" <#SPACE#>
    Write-Host " Aviso:" -ForegroundColor Yellow
        Write-Host "" <#SPACE#>

        Start-Sleep -Seconds 1
                                            # Quebra de Linha (Na 2° linha)
    Write-Host "    Este processo será um pouco demorado e não
    pode ser interrompido pois será baixada
    uma nova imagem do sistema na nuvem e em
    seguida será feito uma verificação de
    integridade do sistema (System File Checker).
    
    Após isso o computador será reiniciado." -ForegroundColor Yellow
        Write-Host "" <#SPACE#>

        Start-Sleep -Seconds 2

    Write-Host "    Deseja prosseguir?" -ForegroundColor Yellow
        Write-Host "" <#SPACE#>

        Start-Sleep -Seconds 1

    Write-Host "        [S] Sim / [N] Não" -ForegroundColor Yellow
        Write-Host "" <#SPACE#>

    $questProssesDepences_SN = Read-Host

        switch ($questProssesDepences_SN) {

            "S" {

                Clear-Host

                    Write-Host "" <#SPACE#>
                Write-Host "    Passo 1:"

                    Start-Sleep -Seconds 1

                    Write-Host "" <#SPACE#>
                Write-Host "        Executando o DISM"
                    Write-Host "" <#SPACE#>

                    Start-Sleep -Seconds 1

                & $actionExecute_DISM <#--[Script 1]--#>

                    Start-Sleep -Seconds 1

                    Write-Host "" <#SPACE#>
                Write-Host "    Passo 2:"

                    Start-Sleep -Seconds 1

                    Write-Host "" <#SPACE#>
                Write-Host "        Executando o SystemFileChecker"
                    Write-Host "" <#SPACE#>

                & $actionExecute_SystemFileChecker

                    Start-Sleep -Seconds 1

                    Write-Host "" <#SPACE#>
                Write-Host "    Processo finalizado." -ForegroundColor Green
                    Write-Host "" <#SPACE#>

                    Start-Sleep -Seconds 1

                    Write-Host "" <#SPACE#>
                Write-Host "    Reiniciando o sistema.." -ForegroundColor Yellow
                    Write-Host "" <#SPACE#>

                    Start-Sleep -Seconds 1

                Restart-Computer
            }

            "N" {& $WinTools_ExitResponse}

            Default {& $WinTools_ErrorResponse}
        }