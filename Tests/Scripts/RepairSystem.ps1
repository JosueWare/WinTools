# ENV
[bool]$Connected = Test-Connection -ComputerName "8.8.8.8" -Count 1 -Quiet
[int]$TryCounts = "0"

# Exis Commands
[bool]$Dism_exis = $true
[bool]$sfc_exis = $true

# Script Blocks
[scriptblock]$execDISM = {
    Dism.exe "/Online /Cleanup-image /Restorehealth"
}
[scriptblock]$execSFC = {
    sfc.exe "/scannow"
}

# Check Connection
if ($Connected) {
    # Check Command [DISM.exe]
    if (Get-Command "Dism.exe" -ErrorAction SilentlyContinue) {
        $Dism_exis = $true
    }
    elseif (Test-Path -Path "$env:SystemRoot/System32/DISM.exe") {
        $exe_SFC = "$env:SystemRoot/System32/DISM.exe"
    }
    else {
        $Dism_exis = $false
    }

    # Check Command [sfc.exe]
    if (Get-Command "sfc.exe" -ErrorAction SilentlyContinue) {
        $sfc_exis = $true
    }
    elseif (Test-Path -Path "$env:SystemRoot/System32/sfc.exe") {
        $exe_SFC = "$env:SystemRoot/System32/sfc.exe"
    }
    else {
        $sfc_exis = $false
    }

        # Check boths
        if (($Dism_exis) -and $sfc_exis) {} <# RUN #>
        else {
            . "Scripts/Main/Errors/MissingCmds.ps1"
        }
}
else {
    Clear-Host
        Write-Host ""
    Write-Host "    Erro de conexão" -ForegroundColor Red
        Write-Host ""

        Start-Sleep -Seconds 1
    do {
        Clear-Host
            Write-Host ""
        Write-Host "    Erro de conexão" -ForegroundColor Red
            Write-Host ""
        Write-Host "    Tentando novamente.." -NoNewline
        Write-Host " ${TryCounts}"
            Write-Host ""

        Start-Sleep -Seconds 1

        # ENV
        [bool]$Connected = Test-Connection -ComputerName "8.8.8.8" -Count 1 -Quiet
        $TryCounts += 1
    } until (($Connected -eq $true) -or ($TryCounts -eq 11))
    # Check Connection [Again]
    if ($Connected) {
        Clear-Host
            Write-Host ""
        Write-Host "    Conectado!" -ForegroundColor Green
            Write-Host ""

            Start-Sleep -Seconds 1
        
        . "$PSScriptRoot/RepairSystem.ps1"
    }
    elseif ($TryCounts -gt 10) {
        Clear-Host
            Write-Host ""
        Write-Host "    Número de tentativas excedidas" -ForegroundColor Red
            Write-Host ""
            Start-Sleep -Seconds 1
        Write-Host "    Tente novamente mais tarde.." -ForegroundColor Red
            Write-Host ""

            Start-Sleep -Seconds 1
        
            Write-Host ""
        Write-Host "    Pressione qualquer tecla para voltar..."
            Write-Host ""
        . $PressAnyKey
    }
}