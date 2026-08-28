# Logon

    # ENV
    $TryCount = "0"

    $Internet_ONLINE = $true

    <# ScriptsBlocks #>

        [ScriptBlock]$actionExecute_DISM = {
            
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c DISM.exe /Online /Cleanup-image /Restorehealth" -Verb RunAs -Wait
        }

        [ScriptBlock]$actionExecute_SystemFileChecker = {

            Start-Process -FilePath "cmd.exe" -ArgumentList "/c sfc /scannow" -Verb RunAs -Wait
        }

# Init

    Clear-Host

    # Test Connection
    if (-not (Test-Connection -TargetName "8.8.8.8" -Count 1 -Quiet)) {
            Write-Host "" <##>
        Write-Host "    Erro de conexão" -ForegroundColor Red
            Write-Host "" <##>

            Start-Sleep -Seconds 1

            Write-Host "" <##>
        Write-Host "    Tentando novamente.. " -NoNewline -ForegroundColor Yellow
        Write-Host "$TryCount"
            Write-Host "" <##>

            # Try-Again

            do {
                    Write-Host "" <##>
                Write-Host "    Erro de conexão" -ForegroundColor Red
                    Write-Host "" <##>
                    Write-Host "" <##>
                Write-Host "    Tentando novamente.. " -NoNewline -ForegroundColor Yellow
                Write-Host "$TryCount"
                    Write-Host "" <##>

                $TryCount++

                Start-Sleep -Seconds 1

            } until ($Internet_ONLINE -eq $true) -or ($TryCount -eq 100)
    }

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

                    Start-Sleep -Seconds 1

                & $actionExecute_SystemFileChecker <#--[Script 2]--#>

                    Start-Sleep -Seconds 1

                    Write-Host "" <#SPACE#>
                Write-Host "    Processo finalizado." -ForegroundColor Green
                    Write-Host "" <#SPACE#>

                    Start-Sleep -Seconds 2

                    Write-Host "" <#SPACE#>
                Write-Host "    Reiniciando o sistema.." -ForegroundColor Yellow
                    Write-Host "" <#SPACE#>

                    Start-Sleep -Seconds 1

                Restart-Computer
            }

            "N" {& $ExitTerminalSession}

            Default {& $ErrorResponse}
        }