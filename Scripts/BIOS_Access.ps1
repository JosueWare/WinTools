# Logon

    # Scripts Blocks
    [scriptblock]$ExecBIOsAccess = {
        shutdown.exe /r /fw /t 0
    }

# GUI
if ((Confirm-SecureBootUEFI) -eq $true) {
    Clear-Host
        Write-Host ""
        Write-Host $Lang.Tab.tab4 -NoNewline
    Write-Host $Lang.Scripts.BIOS_Access.SaveYourItemsFromDesktop -ForegroundColor Yellow
        Write-Host ""

        Start-Sleep -Seconds 2

        Write-Host $Lang.Tab.tab4 -NoNewline
    Write-Host $Lang.Scripts.BIOS_Access.$questRestartComputerNow
        Write-Host ""
        Start-Sleep -Seconds 1
        Write-Host $Lang.Tab.tab8 -NoNewline
    Write-Host $Lang.General.YES_OR_NOT
        Write-Host ""

    $questRestartComputerNow = Read-Host

        switch ($questRestartComputerNow) {

            "S" {
                Clear-Host
                    Write-Host ""
                    Write-Host $Lang.Tab.tab4 -NoNewline
                Write-Host $Lang.General.Restarting -ForegroundColor Yellow
                    Write-Host ""

                    Start-Sleep -Seconds 1

                & $ExecBIOsAccess
            }
            
            "N" {& $BackToMainMenu}

            Default {& $ErrorResponse}
        }
}
elseif ((Confirm-SecureBootUEFI) -eq $false) {
    Clear-Host
        Write-Host ""
        Write-Host " " -NoNewline
    Write-Host $Lang.General.WARNING -ForegroundColor Yellow
        Start-Sleep -Seconds 1
    Write-Host $Lang.Scripts.AccessBIOS.SecureBootState.TRUE_but_inactive -ForegroundColor Yellow

        Start-Sleep -Seconds 2

        Write-Host $Lang.Tab.tab4 -NoNewline
    Write-Host $Lang.Scripts.AccessBIOS.questRestartComputerNow
        Write-Host ""
        Start-Sleep -Seconds 1
        Write-Host $Lang.Tab.tab8 -NoNewline
    Write-Host $Lang.General.YES_OR_NOT
        Write-Host ""

    $questRestartComputerNow = Read-Host

        switch ($questRestartComputerNow) {

            "S" {
                Clear-Host
                    Write-Host ""
                    Write-Host $Lang.Tab.tab4 -NoNewline
                Write-Host $Lang.General.Restarting -ForegroundColor Yellow
                    Write-Host ""

                    Start-Sleep -Seconds 1

                & $ExecBIOsAccess
            }
            
            "N" {& $BackToMainMenu}

            Default {& $ErrorResponse}
        }
}
else {
    Clear-Host
        Write-Host ""
        Write-Host $Lang.Tab.tab4 -NoNewline
    Write-Host $Lang.Scripts.AccessBIOS.SecureBootState.Incompatible.BR_1 -ForegroundColor Red
    Write-Host $Lang.Scripts.AccessBIOS.SecureBootState.Incompatible.BR_2 -ForegroundColor Red
        Write-Host ""

        Start-Sleep -Seconds 1

        Write-Host ""
        Write-Host $Lang.Tab.tab4 -NoNewline
    Write-Host $Lang.General.questBackToMainMenu
        Write-Host ""
        Start-Sleep -Milliseconds 500
        Write-Host $Lang.Tab.tab8 -NoNewline
    Write-Host $Lang.General.YES_OR_NOT
        Write-Host ""

    $questBackToMainMenu = Read-Host

        switch ($questBackToMainMenu) {

            "S" {& $BackToMainMenu}
            "Y" {& $BackToMainMenu}
            "N" {& $ExitTerminalSession}

            Default {& $ErrorResponse}
        }
}