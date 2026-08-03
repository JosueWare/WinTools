# Logon

    Set-Location "$PSScriptRoot\..\..\"

    #ScriptsBlocks
    [ScriptBlock]$questRepairWindowsSystem = {

        Clear-Host

            Start-Sleep -Seconds 1

            Write-Host "" <#SPACE#>
        Write-Host "    Deseja fazer uma verificação de integridade"
        Write-Host "    do Windows ou uma Reparação completa"
        Write-Host "    da imagem do sistema?"
            Write-Host "" <#SPACE#>
        Start-Sleep -Seconds 1
            Write-Host "" <#SPACE#>
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

                    Set-Location "$HOME"
                }
            }
        }

        [ScriptBlock]$ErrorResponse = {

            Clear-Host

                Write-Host "" <#SPACE#>
            Write-Host "    Resposta inválida" -ForegroundColor Red
                Write-Host "" <#SPACE#>

                Start-Sleep -Seconds 1

            Set-Location "$HOME"
        }

        [ScriptBlock]$ExitTerminalSession = {

            Clear-Host

                Start-Sleep -Seconds 1

            $Host.SetShouldExit(0)
        }

    <#--ScriptsBlocks#--[END]#>

    #Functions
    function R {& ".\Config\Navigation\main.ps1"}

# Inicialização

Clear-Host

    Write-Host "" <#SPACE#>
Write-Host "                    WinTools"
    Write-Host "" <#SPACE#>

    Start-Sleep -Milliseconds 500

    # Menu

        Write-Host "" <#SPACE#>
    Write-Host "    Opções:"
        Write-Host "" <#SPACE#>

        Start-Sleep -Seconds 1
        
        Write-Host "" <#SPACE#>
    Write-Host "        [1]. Reparação do Windows"
    Write-Host "        [2]. Procurar por atualizações de Software (Winget)"
    Write-Host "        [3]. Limpar arquivos temporários]"
        Write-Host "" <#SPACE#>
        Write-Host "" <#SPACE#>
    Write-Host "    [X]. Sair"
        Write-Host "" <#SPACE#>

    $SelectOptions = Read-Host

        switch ($SelectOptions) {

            "1" {& $questRepairWindowsSystem}
            "2" {& ".\Config\Scripts\wingetSearchUpgrade.ps1"}
            "3" {& ".\Config\Scripts\Tools\Cleanup\tmp_clean.ps1"}

            "X" {& $ExitTerminalSession}

            Default {& $ErrorResponse}
        }