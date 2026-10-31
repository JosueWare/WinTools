# Scripts Blocks
$execSFC = {
    sfc /scannow
}

# Set Preferences
[bool]$ShutdownRestart_After = $false
[string]$Shutdown_OR_Restart = "null"

# Check Command
if (Get-Command "sfc" -ErrorAction SilentlyContinue) {
    Clear-Host
        Write-Host ""
    Write-Host "    Este processo irá demorar pois será feito"
    Write-Host "    uma verificação profunda no sistema."
        Write-Host ""
        Start-Sleep -Seconds 1
    Write-Host "    Deseja prosseguir?"
        Write-Host ""
        Start-Sleep -Milliseconds 500
    Write-Host "        [S] Sim / [N] Não"
        Write-Host ""
    $questExecuteSystemFileChecker = Read-Host
    switch ($questExecuteSystemFileChecker) {

        "S" {
            Clear-Host
            Start-Sleep -Seconds 2
                Write-Host ""
            Write-Host "    Antes de iniciar"
            Start-Sleep -Seconds 1
            Write-Host "    Deseja desligar ou reiniciar"
            Write-Host "    o computador assim que terminar?"
                Write-Host ""
                Start-Sleep -Milliseconds 500
            Write-Host "        [S] Sim / [N] Não"
                Write-Host ""
            $questDoWantShutdown_OR_Restart_AfterProcess = Read-Host
            switch ($questDoWantShutdown_OR_Restart_AfterProcess) {

                "S" {
                    $ShutdownRestart_After = $true
                    Clear-Host
                        Write-Host ""
                    Write-Host "    Desligar ou Reiniciar?"
                        Write-Host ""
                    Write-Host "        [D] Desligar / [R] Reiniciar"
                        Write-Host ""
                    $questShutdown_OR_Restart = Read-Host
                    switch ($questShutdown_OR_Restart) {
                        "D" {$Shutdown_OR_Restart = "Shutdown"}
                        "R" {$Shutdown_OR_Restart = "Restart"}
                        Default {. $InvalidResponse}
                    }
                }

                "N" {$ShutdownRestart_After = $false}

                Default {
                    . $InvalidResponse
                }
            }

            # Execute 'SFC'
            Clear-Host
                Write-Host ""
            Write-Host "    Iniciando.."
                Write-Host ""
            Start-Sleep -Seconds 1
            <# Command #>
            . $execSFC
                Write-Host ""
            Write-Host "    Processo Finalizado" -ForegroundColor Green
                Write-Host ""

            if ($ShutdownRestart_After) {}
            else {
                Write-Host ""
            Write-Host "    Pressione qualquer tecla para voltar ao início"
                Write-Host ""
            $null = [System.Console]::ReadKey($true)
            . $BackToMainMenu
            }
        }

        "N" {. $BackToMainMenu}

        Default {. $InvalidResponse}
    }
}
else {
    Clear-Host
        Write-Host ""
    Write-Host "    O comando 'sfc' não foi encontrado"
        Write-Host ""

        Start-Sleep -Seconds 2

        Write-Host ""
    Write-Host "    Deseja voltar ao início?"
        Write-Host ""
    Write-Host "    [S] Sim / [N] Não"
        Write-Host ""
}