# ENV
[bool]$Connected = Test-Connection -ComputerName "8.8.8.8" -Count 1 -Quiet
[int]$TryCounts = "0"

# Script Blocks
[scriptblock]$execDISM = {
    DISM.exe /Online /Cleanup-image /Restorehealth
}

# Check Connection
if ($Connected) {
    # Check Command [DISM.exe / SFC.exe]
    if (Get-Command "winget.exe" -ErrorAction SilentlyContinue) {}
    else {}
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