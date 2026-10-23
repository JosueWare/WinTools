Set-Location (Join-Path -Path $PSScriptRoot -ChildPath @("..", ".."))

# ENV

    # Scripts Blocks
    [ScriptBlock]$questRepairWindowsSystem = {
        Clear-Host

            Start-Sleep -Seconds 1

            Write-Host ""
            Write-Host $Lang.Tab.tab4 -NoNewline
        Write-Host $Lang.MainMenu.SubOptions.RepairWindowsORVerify.BR_1
        Write-Host $Lang.MainMenu.SubOptions.RepairWindowsORVerify.BR_2
        Write-Host $Lang.MainMenu.SubOptions.RepairWindowsORVerify.BR_3
            Write-Host ""
        Start-Sleep -Seconds 1
            Write-Host ""
            Write-Host $Lang.Tab.tab8 -NoNewline
        Write-Host $Lang.MainMenu.SubOptions.selectVerify_OR_Repair.Option_1
        Write-Host $Lang.MainMenu.SubOptions.selectVerify_OR_Repair.Option_2
            Write-Host ""

        $questVerify_OR_Repair = Read-Host

            switch ($questVerify_OR_Repair) {

                "1" {& (Join-Path -Path "Scripts" -ChildPath @("Tools", "SystemFileChecker.ps1"))}
                "2" {& (Join-Path -Path "Scripts" -ChildPath @("Tools", "RepairSystem.ps1"))}

                Default {
                    Clear-Host
                        Write-Host ""
                        Write-Host $Lang.Tab.tab4 -NoNewline
                    Write-Host $Lang.General.InvalidResponse -ForegroundColor Red
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
            Write-Host $Lang.Tab.tab4 -NoNewline
        Write-Host $Lang.General.InvalidResponse -ForegroundColor Red
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
    "2" {& (Join-Path -Path "Scripts" -ChildPath "SearchUpdateApps.ps1")}
    "3" {& (Join-Path -Path "Scripts" -ChildPath @("Tools", "Cleanup", "TempClean.ps1"))}
    "4" {& (Join-Path -Path "Scripts" -ChildPath "Defrag.ps1")}
    "5" {& (Join-Path -Path "Scripts" -ChildPath "BIOS_Access.ps1")}

    "X" {& $ExitTerminalSession}

    Default {& $ErrorResponse}
}