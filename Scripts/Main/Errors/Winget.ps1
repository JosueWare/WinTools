    Write-Host ""
Write-Host "    O 'Winget.exe' não está instalado" -ForegroundColor Red
    Write-Host ""
$null = [console]::ReadKey($true)
(Get-Process -Id $PID).CloseMainWindow()