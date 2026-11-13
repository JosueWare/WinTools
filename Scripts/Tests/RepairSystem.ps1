# ENV
[bool]$Connected = Test-Connection -TargetName "8.8.8.8" -Count 1 -Quiet
[int]$TryCounts = "0"

# Script Blocks
[scriptblock]$execDISM = {
    DISM.exe /Online /Cleanup-image /Restorehealth
}

# Check Connection
if ($Connected) {}
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
        [bool]$Connected = Test-Connection -TargetName "8.8.8.8" -Count 1 -Quiet
        $TryCounts += 1
    } until (($Connected -eq $true) -or ($TryCounts -eq 11))
}