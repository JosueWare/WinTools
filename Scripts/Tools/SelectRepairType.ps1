# Check Request
if (-not (($GetRequest -eq $true) -and ($RequestType -eq "SelectRepairType"))) {
    Write-Host "NEGADO" -ForegroundColor Red
    exit
}

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

    "1" {& "Scripts/Tools/Maintenance/SystemFileChecker.ps1"}
    "2" {& "Scripts/Tools/Maintenance/RepairSystem.ps1"}

    Default {& $ErrorResponse}
}