if ($GetLog) {
    switch ($LogName) {

        "RepairSystem" {
            # Check Log Folder
            if (-not (Test-Path -Path "Logs/RepairSystem")) {
                New-Item -Path "Logs/RepairSystem" -ItemType Directory | Out-Null
            }

            # Set Content Value
            $nameDate = Get-Date -Format "dd-MM-yyyy_HH-mm-ss"

            $nowDate = Get-Date -Format "dd/MM/yyyy"
            $nowHour = Get-Date -Format "HH:mm:ss"

            # Value string content
            $valueDISM = @(
                "DISM.exe executado em ${nowDate} as ${nowHour}"
            )
            $valueSFC = @(
                "SystemFileChecker executado em ${nowDate} as ${nowHour}"
            )

            # Prepare value
            $valueContent = @(
                "RepairSystem"
                ""
                "${valueDISM}"
                "${valueSFC}"
            )

            # Create
            New-Item -Path "Logs/RepairSystem/${nameDate}.log" -ItemType File | Out-Null

            Add-Content -Path "Logs/RepairSystem/${nameDate}.log" -Value $valueContent
        }

        "" {}

        Default {
            Write-Host "Unspecified log" -ForegroundColor Red
        }
    }
}
else {
    Write-Host "Log denied" -ForegroundColor Red
}

# Call log
<#

$LogName = ""
. $MakeLog

#>