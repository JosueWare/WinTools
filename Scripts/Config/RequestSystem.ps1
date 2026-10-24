if ($GetRequest) {
    switch ($RequestType) {

        # Tools
        "" {}
        "" {}
        "" {}
        "" {}
        "" {}

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