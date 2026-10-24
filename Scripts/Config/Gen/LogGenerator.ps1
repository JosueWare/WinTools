if ($GetLog) {
    switch ($LogName) {

        "" {}
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