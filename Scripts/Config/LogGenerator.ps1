if ($GetRequest) {
    switch ($RequestType) {

        "RepairSystem" {}

        Default {
            Write-Host "Pedido de log nulo" -ForegroundColor Red
        }
    }
}
else {
    Write-Host "Nenhum pedido de log" -ForegroundColor Red
}