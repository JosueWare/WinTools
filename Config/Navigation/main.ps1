# Logon

    Set-Location "$PSScriptRoot\..\..\"

    <#--ScriptsBlocks--[INI]#>

        [ScriptBlock]$questRepairWindowsSystem = {

            Clear-Host

                Start-Sleep -Seconds 1

                Write-Host "" <#SPACE#>
            Write-Host "    Deseja fazer uma verificação de integridade"
            Write-Host "    do Windows ou uma Reparação completa"
            Write-Host "    da imagem do sistema?"
                Write-Host "" <#SPACE#>

                Start-Sleep -Seconds 1

            Write-Host "        [1]. Verificação   (sfc /scannow)"
            Write-Host "        [2]. Reparação     (DISM.exe)"
                Write-Host "" <#SPACE#>

            $questVerify_OR_Repair = Read-Host

                switch ($questVerify_OR_Repair) {

                    "1" {& ".\Config\Scripts\Tools\sfc_scannow.ps1"}
                    "2" {& ".\Config\Scripts\Tools\repair_system.ps1"}

                    Default {

                        Clear-Host

                            Write-Host "" <#SPACE#>
                        Write-Host "    Resposta inválida" -ForegroundColor Red
                            Write-Host "" <#SPACE#>

                            Start-Sleep -Seconds 2

                        Stop-Process -Id $PID
                    }
                }
        }

        [ScriptBlock]$WrongResponse = {

            Clear-Host

                Write-Host "" <#SPACE#>
            Write-Host "    Resposta inválida" -ForegroundColor Red
                Write-Host "" <#SPACE#>

                Start-Sleep -Seconds 1

            Stop-Process -Id $PID
        }

        [ScriptBlock]$ExitWinToolsSession = {

            Clear-Host

                Start-Sleep -Seconds 1

            Stop-Process -Id $PID
        }

    <#--ScriptsBlocks#--[END]#>

# Inicialização

Clear-Host

    Write-Host "" <#SPACE#>
Write-Host "                    WinTools"
    Write-Host "" <#SPACE#>

    Start-Sleep -Seconds 1

    # Menu

        Write-Host "" <#SPACE#>
    Write-Host "    Opções:"
        Write-Host "" <#SPACE#>

        Start-Sleep -Seconds 1
        
        Write-Host "" <#SPACE#>
    Write-Host "        [1]. Reparação do Windows"
    Write-Host "        [2]. Procurar por atualizações de Software (Winget)"
        Write-Host "" <#SPACE#>
        Write-Host "" <#SPACE#>
    Write-Host "    [X]. Sair"
        Write-Host "" <#SPACE#>

    $SelectOptions = Read-Host

        switch ($SelectOptions) {

            "1" {& $questRepairWindowsSystem}
            "2" {& ".\Config\Scripts\wingetSearchUpgrade.ps1"}

            "X" {& $ExitWinToolsSession}

            Default {& $WrongResponse}
        }