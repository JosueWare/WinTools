Set-Location "$PSScriptRoot/../.."

# Startup scripts
. "Scripts/Config/DefaultFolders.ps1"

# ENV

    # Scripts Blocks
    [scriptblock]$BackToMainMenu = {
        . "Scripts/Main/Menu.ps1"
    }

    [scriptblock]$ErrorResponse = {
        Clear-Host
            Write-Host ""
        Write-Host "    Resposta Inválida" -ForegroundColor Red
            Write-Host ""

            Start-Sleep -Seconds 1

        Clear-Host
        . $BackToMainMenu
    }

    [scriptblock]$ExitTerminalSession = {
        Clear-Host
        Start-Sleep -Milliseconds 250
        (Get-Process -Id $PID).CloseMainWindow()
    }

    [scriptblock]$SendRequest = {
        $GetRequest = $true
        . "Scripts/Config/RequestSystem.ps1"
    }

    [scriptblock]$MakeLog = {
        $GetLog = $true
        . "Scripts/Config/Gen/LogGenerator.ps1"
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
    "1" {. "Scripts/Tools/SelectRepairType.ps1"}
    "2" {. "Scripts/Tools/SearchUpdateApps.ps1"}
    "3" {. "Scripts/Tools/Cleaning/TempClean.ps1"}
    "4" {. "Scripts/Tools/Defrag.ps1"}
    "5" {. "Scripts/Tools/BIOS_Access.ps1"}

    "X" {. $ExitTerminalSession}

    Default {. $ErrorResponse}
}

# Send Request
. $SendRequest