Set-Location "$PSScriptRoot/../.."

# Startup scripts
. "Scripts/Config/DefaultFolders.ps1"

# Log Generator
[bool]$GetLog = $false
[string]$LogName = ""

# RequestSystem
[bool]$GetRequest = $false
[string]$RequestType = ""

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

    "1" {$RequestType = "SelectRepairType"}
    "2" {$RequestType = "SearchUpdateApps"}
    "3" {$RequestType = "TempClean"}
    "4" {$RequestType = "Defrag"}
    "5" {$RequestType = "BIOS_Access"}

    "X" {. $ExitTerminalSession}

    Default {. $ErrorResponse}
}

# Send Request
. $SendRequest