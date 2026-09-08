# Logon
Set-Location $HOME

    # Set 'UTF-8'
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Menu
Clear-Host
    Write-Host "" <##>
Write-Host "    Erro:" -ForegroundColor Red -NoNewline
    Start-Sleep -Milliseconds 500
Write-Host " PowerShell 7 não foi encontrado" -ForegroundColor Yellow
    Write-Host "" <##>