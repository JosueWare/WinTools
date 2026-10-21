# ENV
[bool]$Internet_NET = Test-Connection -TargetName "8.8.8.8" -Count 1 -Quiet
[int]$LimitsTryCounts = "0"

# Scripts Blocks
[scriptblock]$WingetSearchUpgrade = {
    Clear-Host

    Winget Upgrade <# CMD #>

        Start-Sleep -Seconds 1

        Write-Host ""
        Write-Host $Lang.TAB.tab4 -NoNewline
    Write-Host $Lang.Scripts.SearchUpdateApps.questUpdateAllPrograms_OR
        Write-Host ""
        Start-Sleep -Seconds 1
        Write-Host $Lang.TAB.tab8 -NoNewline
    Write-Host $Lang.Scripts.SearchUpdateApps.ShowOptions
        Write-Host ""
    $questUpgradeAllPrograms = Read-Host

        switch ($questUpgradeAllPrograms) {

            "A" {
                Clear-Host

                Winget Upgrade --All

                    Start-Sleep -Seconds 1

                    Write-Host ""
                    Write-Host $Lang.TAB.tab4 -NoNewline
                Write-Host $Lang.General.questBackToMainMenu
                    Write-Host ""
                    Start-Sleep -Seconds 1
                    Write-Host $Lang.TAB.tab8 -NoNewline
                Write-Host $Lang.Scripts.TempClean.optionsBackToMainMenu.Option_2
                    Write-Host ""

                $questReturnToMainMenu = Read-Host

                    switch ($questReturnToMainMenu) {

                        "S" {& $BackToMainMenu}
                        "N" {& $ExitTerminalSession}

                        Default {& $ErrorResponse}
                    }
            }

            "E" {
                Clear-Host
                Winget Upgrade

                    Start-Sleep -Seconds 1

                    Write-Host ""
                    Write-Host $Lang.TAB.tab4 -NoNewline
                Write-Host $Lang.Scripts.SearchUpdateApps.EnterSpecificProgram
                    Write-Host ""

                $selectedProgramToUpdate = Read-Host

                Clear-Host

                if (($selectedProgramToUpdate) -eq "Spotify.Spotify") {
                    Start-Process -FilePath "pwsh.exe" -ArgumentList @(
                        "-NoProfile",
                        "-Command",
                        "winget upgrade Spotify.Spotify"
                    ) -Wait

                        Start-Sleep -Seconds 1

                        Write-Host ""
                        Write-Host $Lang.TAB.tab4 -NoNewline
                    Write-Host $Lang.General.questBackToMainMenu
                        Write-Host ""
                        Start-Sleep -Seconds 1
                        Write-Host $Lang.TAB.tab8 -NoNewline
                    Write-Host $Lang.Scripts.TempClean.optionsBackToMainMenu.Option_2
                        Write-Host ""

                    $questReturnToMainMenu = Read-Host

                        switch ($questReturnToMainMenu) {
                            "S" {& $BackToMainMenu}
                            "N" {& $ExitTerminalSession}
                            Default {& $ErrorResponse}
                        }
                }
                else {
                    Winget Upgrade "$selectedProgramToUpdate"

                        Start-Sleep -Seconds 1

                        Write-Host ""
                        Write-Host $Lang.TAB.tab4 -NoNewline
                    Write-Host $Lang.General.questBackToMainMenu
                        Write-Host ""
                        Start-Sleep -Seconds 1
                        Write-Host $Lang.TAB.tab8 -NoNewline
                    Write-Host $Lang.Scripts.TempClean.optionsBackToMainMenu.Option_2
                        Write-Host ""

                    $questReturnToMainMenu = Read-Host

                        switch ($questReturnToMainMenu) {
                            "S" {& $BackToMainMenu}
                            "N" {& $ExitTerminalSession}
                            Default {& $ErrorResponse}
                    }
                }
            }

            "N" {
                Clear-History
                & $BackToMainMenu
            }

            Default {& $ErrorResponse}
        }
}

# [INI]
# Check Connection Internet
if (-not ($Internet_NET)) {
    Clear-Host
        Write-Host ""
        Write-Host $Lang.TAB.tab4 -NoNewline
    Write-Host $Lang.General.Errors.ConnectionError -ForegroundColor Red
        Write-Host ""

        Start-Sleep -Seconds 1

        Write-Host ""
        Write-Host $Lang.TAB.tab4 -NoNewline
    Write-Host $Lang.General.TryingAgain
    Write-Host "$LimitsTryCounts"
        Write-Host ""

        Start-Sleep -Seconds 1

    <# Loop #>
    do {
        <# ENV #>
        $Internet_NET = Test-Connection -TargetName "8.8.8.8" -Count 1 -Quiet
        $LimitsTryCounts++

        Clear-Host
            Write-Host ""
        Write-Host $Lang.General.Errors.ConnectionError -ForegroundColor Red
            Write-Host ""

            Write-Host ""
            Write-Host $Lang.TAB.tab4 -NoNewline
        Write-Host $Lang.General.TryingAgain
        Write-Host "$LimitsTryCounts"
            Write-Host ""
    } until (($Internet_NET -eq $true) -or ($LimitsTryCounts -gt 20))

    <# Reconnect #>
    if ($Internet_NET -eq $true) {
        Clear-Host

            Write-Host ""
            Write-Host $Lang.TAB.tab4 -NoNewline
        Write-Host $Lang.General.Reconnected -ForegroundColor Green
            Write-Host ""

            Start-Sleep -Seconds 2

        # Check Command 'Winget'
        if (Get-Command "winget.exe" -ErrorAction SilentlyContinue) {
            & $WingetSearchUpgrade
        }
            else {
                Clear-Host
                    Write-Host ""
                    Write-Host $Lang.TAB.tab4 -NoNewline
                Write-Host $Lang.General.Errors.msgError -ForegroundColor Red
                    Write-Host ""

                    Start-Sleep -Seconds 1

                    Write-Host ""
                    Write-Host $Lang.TAB.tab4 -NoNewline
                Write-Host $Lang.General.MissingCommands.Winget -ForegroundColor Red
                    Write-Host ""

                Set-Location $HOME
            }
    }
    
    if ($LimitsTryCounts -gt 20) {
        Clear-Host
            Write-Host ""
            Write-Host $Lang.TAB.tab4 -NoNewline
        Write-Host $Lang.General.TryLimitsExceeded -ForegroundColor Red
            Write-Host ""

        Set-Location $HOME
    }
}
    else {
        # Check Command 'Winget'
        if (Get-Command "winget.exe" -ErrorAction SilentlyContinue) {
            & $WingetSearchUpgrade
        }
            else {
                Clear-Host
                    Write-Host ""
                    Write-Host $Lang.TAB.tab4 -NoNewline
                Write-Host $Lang.General.Errors.msgError -ForegroundColor Red
                    Write-Host ""

                    Start-Sleep -Seconds 1

                    Write-Host ""
                    Write-Host $Lang.TAB.tab4 -NoNewline
                Write-Host $Lang.General.MissingCommands.Winget -ForegroundColor Red
                    Write-Host ""

                Set-Location $HOME
            }
    }

# [END]