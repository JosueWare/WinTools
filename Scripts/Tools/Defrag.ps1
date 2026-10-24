# Check Request
if (-not (($GetRequest) -and ($RequestType -eq "Defrag"))) {
    Write-Host "Execution Denied" -ForegroundColor Red
    exit
}

Clear-Host
    Write-Host ""
Write-Host "    Opção disponível em breve"
    Write-Host ""

    Start-Sleep -Seconds 2

. $BackToMainMenu