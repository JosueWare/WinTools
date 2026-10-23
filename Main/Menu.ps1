Set-Location (Join-Path -Path $PSScriptRoot -ChildPath @("..", ".."))

# Get Language
if (Get-Command "Get-Culture" -ErrorAction SilentlyContinue) {
    $currentLanguage = (Get-Culture).Name
}
else {
    $currentLanguage = "en-US"
}

# Config Language
$Lang = Get-Content -Raw (Join-Path -Path "Lang" -ChildPath "${currentLanguage}.json") | ConvertFrom-Json

# ENV

    # Scripts Blocks
    [ScriptBlock]$questRepairWindowsSystem = {
        Clear-Host

            Start-Sleep -Seconds 1

            Write-Host ""
            Write-Host $Lang.Tab.tab4 -NoNewline
        Write-Host $Lang.MainMenu.SubOptions.RepairWindowsORVerify.BR_1
        Write-Host $Lang.MainMenu.SubOptions.RepairWindowsORVerify.BR_2
        Write-Host $Lang.MainMenu.SubOptions.RepairWindowsORVerify.BR_3
            Write-Host ""
        Start-Sleep -Seconds 1
            Write-Host ""
            Write-Host $Lang.Tab.tab8 -NoNewline
        Write-Host $Lang.MainMenu.SubOptions.selectVerify_OR_Repair.Option_1
        Write-Host $Lang.MainMenu.SubOptions.selectVerify_OR_Repair.Option_2
            Write-Host ""

        $questVerify_OR_Repair = Read-Host

            switch ($questVerify_OR_Repair) {

                "1" {& (Join-Path -Path "Scripts" -ChildPath @("Tools", "SystemFileChecker.ps1"))}
                "2" {& (Join-Path -Path "Scripts" -ChildPath @("Tools", "RepairSystem.ps1"))}

                Default {
                    Clear-Host
                        Write-Host ""
                        Write-Host $Lang.Tab.tab4 -NoNewline
                    Write-Host $Lang.General.InvalidResponse -ForegroundColor Red
                        Write-Host ""
                        Start-Sleep -Seconds 1
                    & (Join-Path -Path "GUI" -ChildPath @("Main", "Menu.ps1"))
                }
            }
        }

    [scriptblock]$BackToMainMenu = {
        & (Join-Path -Path "GUI" -ChildPath @("Main", "Menu.ps1"))
    }

    [ScriptBlock]$ErrorResponse = {
        Clear-Host
            Write-Host ""
            Write-Host $Lang.Tab.tab4 -NoNewline
        Write-Host $Lang.General.InvalidResponse -ForegroundColor Red
            Write-Host ""

            Start-Sleep -Seconds 1

        Clear-Host
        & $BackToMainMenu
    }

    [ScriptBlock]$ExitTerminalSession = {
        Clear-Host
        Start-Sleep -Milliseconds 250
        $Host.SetShouldExit(0)
    }

# Menu
Clear-Host

    Write-Host ""
Write-Host "                    WinTools"
    Write-Host ""

    Start-Sleep -Milliseconds 500

# Options

    Write-Host ""
Write-Host $Lang.Tab.tab4 -NoNewline
Write-Host $Lang.General.Options
    Write-Host ""

    Start-Sleep -Seconds 1
    
    Write-Host ""
    Write-Host $Lang.Tab.tab8 -NoNewline
Write-Host $Lang.MainMenu.Options.WindowsRepair
    Write-Host $Lang.Tab.tab8 -NoNewline
Write-Host $Lang.MainMenu.Options.CheckSoftwareUpdates
    Write-Host $Lang.Tab.tab8 -NoNewline
Write-Host $Lang.MainMenu.Options.ClearTemporaryFiles
    Write-Host $Lang.Tab.tab8 -NoNewline
Write-Host $lang.MainMenu.Options.OptimizeUnits
    Write-Host $Lang.Tab.tab8 -NoNewline
Write-Host $lang.MainMenu.Options.AccessBIOS
    Write-Host ""
    Write-Host $Lang.Tab.tab8 -NoNewline
Write-Host $Lang.MainMenu.Options.Exit
    Write-Host ""

$switchSelectOptions = Read-Host
switch ($switchSelectOptions) {
    "1" {& $questRepairWindowsSystem}
    "2" {& (Join-Path -Path "Scripts" -ChildPath "SearchUpdateApps.ps1")}
    "3" {& (Join-Path -Path "Scripts" -ChildPath @("Tools", "Cleanup", "TempClean.ps1"))}
    "4" {& (Join-Path -Path "Scripts" -ChildPath "Defrag.ps1")}
    "5" {& (Join-Path -Path "Scripts" -ChildPath "BIOS_Access.ps1")}

    "X" {& $ExitTerminalSession}

    Default {& $ErrorResponse}
}