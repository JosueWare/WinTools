Clear-Host
    Write-Host ""
Write-Host "    Este sistema de scripts foram feitos para funcionarem no sistema Windows"
    Write-Host ""
$null = [console]::ReadKey($true)
(Get-Process -Id $PID).CloseMainWindow()