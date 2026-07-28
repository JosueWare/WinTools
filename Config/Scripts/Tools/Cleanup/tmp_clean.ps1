# ENV

    # System Folders
    $folderAppData_Local = [System.Environment]::GetFolderPath('LocalApplicationData')
    $folderWindows = [System.Environment]::GetFolderPath('Windows')

# Cleanup Process
Clear-Host

    Start-Sleep -Seconds 1

    Write-Host "" <##>
Write-Host "    Deseja limpar os arquivos agora?" -NoNewline
    Start-Sleep -Milliseconds 500
Write-Host "    (Dir: 'Local\Temp', 'Windows\Temp', 'Windows\Prefetch')" -ForegroundColor DarkGray
    Write-Host "" <##>