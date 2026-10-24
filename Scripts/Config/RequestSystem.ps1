if ($GetRequest) {
    switch ($RequestType) {

        # Tools
        "SelectRepairType" {. "Scripts/Tools/SelectRepairType.ps1"}
        "SearchUpdateApps" {. "Scripts/Tools/SearchUpdateApps.ps1"}
        "TempClean" {. "Scripts/Tools/Cleaning/TempClean.ps1"}
        "Defrag" {. "Scripts/Tools/Defrag.ps1"}
        "BIOS_Access" {. "Scripts/Tools/BIOS_Access.ps1"}

        # Config
        "GenerateLog" {. "Scripts/Config/Gen/LogGenerator.ps1"}

        Default {
            Write-Host "Pedido nulo" -ForegroundColor Red
        }
    }
}
else {
    Write-Host "Nenhum pedido de log" -ForegroundColor Red
}

<# Copy and Paste#>

<#

# Check Request
if (-not (($GetRequest) -and ($RequestType -eq ""))) {
    Write-Host "Execution Denied" -ForegroundColor Red
    exit
}

#>