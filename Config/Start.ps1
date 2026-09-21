# Logon

    # ENV

        # fullpath
        $fullpath_MainScript = (Join-Path -Path "Config" -ChildPath "Main")
        $fullpath_MainScript = (Join-Path -Path $fullpath_MainScript -ChildPath "Menu.ps1")

        $fullpath_dpPowerShell = (Join-Path -Path "Config" -ChildPath "Main")
        $fullpath_dpPowerShell = (Join-Path -Path $fullpath_dpPowerShell -ChildPath "Depedences")
        $fullpath_dpPowerShell = (Join-Path -Path $fullpath_dpPowerShell -ChildPath "dpPowerShell.ps1")

        $fullpath_dpWindows = (Join-Path -Path "Config" -ChildPath "Main")
        $fullpath_dpWindows = (Join-Path -Path $fullpath_dpWindows -ChildPath "Depedences")
        $fullpath_dpWindows = (Join-Path -Path $fullpath_dpWindows -ChildPath "dpWindows.ps1")

        # Resolve-Path
        $MainScript = Resolve-Path $fullpath_MainScript

            # Depedences
            $dpPowerShell = Resolve-Path $fullpath_dpPowerShell
            $dpWindowsOS = Resolve-Path $fullpath_dpWindows

# Init

    # Check OS
    if ($env:OS -eq "Windows_NT") {
        if (Get-Command "pwsh.exe" -ErrorAction SilentlyContinue) {
            Start-Process -FilePath "pwsh.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command & $MainScript" -Verb RunAs
        }
            else {
                Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command & $dpPowerShell"
            }
    }
        else {
            Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command & $dpWindowsOS"
        }