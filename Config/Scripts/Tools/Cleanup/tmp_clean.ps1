# ENV

    # System Folders
    $folderAppData_Local = [System.Environment]::GetFolderPath('LocalApplicationData')
    $folderWindows = [System.Environment]::GetFolderPath('Windows')

# Cleanup Process (GUI)
Clear-Host

    Start-Sleep -Seconds 1

    Write-Host "" <##>
Write-Host "    Deseja limpar os arquivos agora?" -NoNewline
    Start-Sleep -Milliseconds 500
Write-Host "    (Dir: 'Local\Temp', 'Windows\Temp', 'Windows\Prefetch')" -ForegroundColor DarkGray
    Write-Host "" <##>
    Start-Sleep -Milliseconds 500
    Write-Host "" <##>
Write-Host "        [S] Sim / [N] Não"
    Write-Host "" <##>

$questStartCleanupProcess = Read-Host

    switch ($questStartCleanupProcess) {

        "S" {
            Clear-Host

                Start-Sleep -Milliseconds 500

            <# Folder 1 #>
                Write-Host "" <##>
            Write-Host "    Limpando a pasta 'Temp' do Usuário.." -NoNewline
                Start-Sleep -Milliseconds 500
            Remove-Item -Path "$folderAppData_Local\Temp\*" -Recurse -Force
            Write-Host " Limpo!" -ForegroundColor Green
                Write-Host "" <##>

            <# Folder 2 #>
                Write-Host "" <##>
            Write-Host "    Limpando a pasta 'Temp' do Windows.." -NoNewline
                Start-Sleep -Milliseconds 500
            Remove-Item -Path "$folderWindows\Temp\*" -Recurse -Force
            Write-Host " Limpo" -ForegroundColor Green
                Write-Host "" <##>

            <# Folder 3 #>
                Write-Host "" <##>
            Write-Host "    Limpando a pasta 'Prefetch' do Windows.." -NoNewline
                Start-Sleep -Milliseconds 500
            Remove-Item -Path "$folderWindows\Prefetch\*" -Recurse -Force
            Write-Host " Limpo" -ForegroundColor Green
                Write-Host "" <##>

                Start-Sleep -Seconds 1

                Write-Host "" <##>
            Write-Host "    Limpeza concluída." -ForegroundColor Green
                Write-Host "" <##>

            Set-Location $HOME
        }

        "N" {& $ExitTerminalSession}

        Default {
                Write-Host "" <##>
            Write-Host "    Resposta inválida" -ForegroundColor Red
                Write-Host "" <##>

            Set-Location "$HOME"
        }
    }