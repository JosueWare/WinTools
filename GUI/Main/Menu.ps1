Set-Location (Join-Path -Path $PSScriptRoot -ChildPath @("..", ".."))

# ENV

    # Scripts Blocks
    [ScriptBlock]$questRepairWindowsSystem = {
        Clear-Host

            Start-Sleep -Seconds 1

            Write-Host ""
        Write-Host "    Deseja fazer uma verificação de integridade"
        Write-Host "    do Windows ou uma Reparação completa"
        Write-Host "    da imagem do sistema?"
            Write-Host ""
        Start-Sleep -Seconds 1
            Write-Host ""
        Write-Host "        [1]. Verificação   (sfc /scannow)"
        Write-Host "        [2]. Reparação     (DISM.exe)"
            Write-Host ""

        $questVerify_OR_Repair = Read-Host

            switch ($questVerify_OR_Repair) {

                "1" {& (Join-Path -Path "Scripts" -ChildPath @("Tools", "SystemFileChecker.ps1"))}
                "2" {& (Join-Path -Path "Scripts" -ChildPath @("Tools", "RepairSystem.ps1"))}

                Default {
                    Clear-Host
                        Write-Host ""
                    Write-Host "    Resposta inválida" -ForegroundColor Red
                        Write-Host ""
                        Start-Sleep -Seconds 1
                    & (Join-Path -Path "GUI" -ChildPath @("Main", "Menu.ps1"))
                }
            }
        }

    [scriptblock]$BackToMainMenu = {
        & (Join-Path -Path "GUI" -ChildPath @("Main", "Menu.ps1"))
    }

    [ScriptBlock]$ErrorResponse = {
        Clear-Host
            Write-Host ""
        Write-Host "    Resposta inválida" -ForegroundColor Red
            Write-Host ""

            Start-Sleep -Seconds 1

        Clear-Host
        & $BackToMainMenu
    }

    [ScriptBlock]$ExitTerminalSession = {
        Clear-Host
        Start-Sleep -Milliseconds 250
        $Host.SetShouldExit(0)
    }

# Menu
Clear-Host

    Write-Host ""
Write-Host "                    WinTools"
    Write-Host ""

    Start-Sleep -Milliseconds 500

    # Menu

        Write-Host ""
    Write-Host "    Opções:"
        Write-Host ""

        Start-Sleep -Seconds 1
        
        Write-Host ""
    Write-Host "        [1] Reparação do Windows"
    Write-Host "        [2] Procurar por atualizações de Software (Winget)"
    Write-Host "        [3] Limpar arquivos temporários"
    Write-Host "        [4] Otimizar unidades (Em breve!)"
    Write-Host "        [5] Acessar BIOs"
        Write-Host ""
        Write-Host ""
    Write-Host "    [X] Sair"
        Write-Host ""

    $switchSelectOptions = Read-Host

        switch ($switchSelectOptions) {

            "1" {& $questRepairWindowsSystem}
            "2" {& (Join-Path -Path "Scripts" -ChildPath "SearchUpdateApps.ps1")}
            "3" {& (Join-Path -Path "Scripts" -ChildPath @("Tools", "Cleanup", "TempClean.ps1"))}
            "4" {
                Clear-Host
                    Write-Host ""
                Write-Host "    Opção disponível em breve!"
                    Write-Host ""

                    Start-Sleep -Seconds 2

                & $BackToMainMenu
            }
            "5" {& (Join-Path -Path "Scripts" -ChildPath "AccessBIOs.ps1")}

            "X" {& $ExitTerminalSession}

            Default {& $ErrorResponse}
        }