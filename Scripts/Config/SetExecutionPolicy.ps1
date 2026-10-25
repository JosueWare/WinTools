$ExecutionPolicyType = Get-ExecutionPolicy
Clear-Host
    Write-Host ""
Write-Host "    A política de execução está definida como " -NoNewline
Write-Host "${ExecutionPolicyType}" -ForegroundColor Cyan
    Write-Host ""
    Start-Sleep -Seconds 1
    Write-Host ""
Write-Host "    Deseja alterar a política de execução?"
    Write-Host ""
Write-Host "        [S] Sim / [N] Não"
    Write-Host ""
$questSetNewExecutionPolicy = Read-Host
switch ($questSetNewExecutionPolicy) {
    "S" {
        Clear-Host
        <# Set-ExecutionPolicy #>
        Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
        Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser -Force
        Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine -Force

            Write-Host ""
        Write-Host "    Volte a executar o script" -ForegroundColor Yellow
            Write-Host ""
            Start-Sleep -Seconds 2
        (Get-Process -Id $PID).CloseMainWindow(0)
    }
    Default {
        (Get-Process -Id $PID).CloseMainWindow(0)
    }
}