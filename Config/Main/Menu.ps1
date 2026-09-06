Set-Location "$PSScriptRoot\..\.."

    # ENV

    # ScriptsBlocks
    [ScriptBlock]$questRepairWindowsSystem = {
        Clear-Host

            Start-Sleep -Seconds 1

            Write-Host "" <##>
        Write-Host "    Deseja fazer uma verificação de integridade"
        Write-Host "    do Windows ou uma Reparação completa"
        Write-Host "    da imagem do sistema?"
            Write-Host "" <##>
        Start-Sleep -Seconds 1
            Write-Host "" <##>
        Write-Host "        [1]. Verificação   (sfc /scannow)"
        Write-Host "        [2]. Reparação     (DISM.exe)"
            Write-Host "" <##>

        $questVerify_OR_Repair = Read-Host

            switch ($questVerify_OR_Repair) {

                "1" {& ".\Config\Scripts\Tools\SystemFileChecker.ps1"}
                "2" {& ".\Config\Scripts\Tools\RepairSystem.ps1"}

                Default {
                    Clear-Host

                        Write-Host "" <##>
                    Write-Host "    Resposta inválida" -ForegroundColor Red
                        Write-Host "" <##>

                        Start-Sleep -Seconds 1

                    Set-Location $HOME
                }
            }
        }

    [ScriptBlock]$ErrorResponse = {
        Clear-Host
            Write-Host "" <##>
        Write-Host "    Resposta inválida" -ForegroundColor Red
            Write-Host "" <##>

            Start-Sleep -Seconds 2

        Clear-Host
        & ".\Config\Main\Menu.ps1"
    }

    [ScriptBlock]$ExitTerminalSession = {
        Clear-Host
        Start-Sleep -Milliseconds 250
        $Host.SetShouldExit(0)
    }

# Menu
Clear-Host

    Write-Host "" <##>
Write-Host "                    WinTools"
    Write-Host "" <##>

    Start-Sleep -Milliseconds 500

    # Menu

        Write-Host "" <##>
    Write-Host "    Opções:"
        Write-Host "" <##>

        Start-Sleep -Seconds 1
        
        Write-Host "" <##>
    Write-Host "        [1] Reparação do Windows"
    Write-Host "        [2] Procurar por atualizações de Software (Winget)"
    Write-Host "        [3] Limpar arquivos temporários"
    Write-Host "        [5] Acessar BIOs"
        Write-Host "" <##>
        Write-Host "" <##>
    Write-Host "    [X] Sair"
        Write-Host "" <##>

    $SelectOptions = Read-Host

        switch ($SelectOptions) {

            "1" {& $questRepairWindowsSystem}
            "2" {& ".\Config\Scripts\SearchUpdateApps.ps1"}
            "3" {& ".\Config\Scripts\Tools\Cleanup\TempClean.ps1"}
            "5" {& ".\Config\Scripts\AccessBIOs.ps1"}

            "X" {& $ExitTerminalSession}

            Default {& $ErrorResponse}
        }