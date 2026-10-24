if ($GetRequest) {
    switch ($RequestType) {

        # Tools
        "SelectRepairType" {. "Scripts/Tools/SelectRepairType.ps1"}
        "SearchUpdateApps" {}
        "TempClean" {}
        "Defrag" {}
        "BIOS_Access" {}

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