Set-Location "$PSScriptRoot/.."
exit
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

                "1" {& "Scripts/Tools/SystemFileChecker.ps1"}
                "2" {& "Scripts/Tools/RepairSystem.ps1"}

                Default {
                    Clear-Host
                        Write-Host ""
                    Write-Host "    Resposta Inválida" -ForegroundColor Red
                        Write-Host ""
                        Start-Sleep -Seconds 1
                    & "Scripts/Main/Menu.ps1"
                }
            }
        }

    [scriptblock]$BackToMainMenu = {
        & "Scripts/Main/Menu.ps1"
    }

    [ScriptBlock]$ErrorResponse = {
        Clear-Host
            Write-Host ""
        Write-Host "    Resposta Inválida" -ForegroundColor Red
            Write-Host ""

            Start-Sleep -Seconds 1

        Clear-Host
        & $BackToMainMenu
    }

    [ScriptBlock]$ExitTerminalSession = {
        Clear-Host
        Start-Sleep -Milliseconds 250
        (Get-Process -Id $PID).CloseMainWindow()
    }

# Menu
Clear-Host

    Write-Host ""
Write-Host "                    WinTools"
    Write-Host ""

    Start-Sleep -Milliseconds 500

# Options

    Write-Host ""
Write-Host "    Opções:"
    Write-Host ""

    Start-Sleep -Seconds 1
    
    Write-Host ""
Write-Host "        [1] Reparação do Windows"
Write-Host "        [2] Procurar por atualizações de Software"
Write-Host "        [3] Limpar arquivos temporários"
Write-Host "        [4] Otimizar unidades (Em breve)"
Write-Host "        [5] Acessar BIOS"
    Write-Host ""
Write-Host "    [X] Sair"
    Write-Host ""

$switchSelectOptions = Read-Host
switch ($switchSelectOptions) {
    "1" {& $questRepairWindowsSystem}
    "2" {& ""}
    "3" {& ""}
    "4" {& ""}
    "5" {& ""}

    "X" {& $ExitTerminalSession}

    Default {& $ErrorResponse}
}