# "sfc.exe"
if (-not ($sfc_exis)) {
    Clear-Host
        Write-Host ""
    Write-Host "    O comando 'sfc.exe' não foi encontrado" -ForegroundColor Red
        Write-Host ""

        Start-Sleep -Seconds 1

    Write-Host "    Pressione qualquer tecla para voltar..."
        Write-Host ""
    . $PressAnyKey
}

# "Dism.exe"
if (-not ($Dism_exis)) {
    Clear-Host
        Write-Host ""
    Write-Host "    O comando 'Dism.exe' não foi encontrado" -ForegroundColor Red
        Write-Host ""

        Start-Sleep -Seconds 1

    Write-Host "    Pressione qualquer tecla para voltar..."
        Write-Host ""
    . $PressAnyKey
}

# "winget.exe"

# "pwsh.exe"