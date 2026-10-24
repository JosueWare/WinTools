# Notes
O sistema de pedido e o gerador de logs estão prontos.

## Fazer pedidos
Em um arquivo de script `.ps1` faça o pedido como este exemplo:

```powershell
$RequestType = "Defrag" <# Tipo de pedido #>
$GetRequest = $true <# Confirme o pedido #>

. $scriptblock:SendRequest <# Enviar pedido #>
```

Verificar pedido:
```powershell
# Check Request
if (-not (($GetRequest) -and ($RequestType -eq ""))) { <# Request Name #>
    Write-Host "Execution Denied" -ForegroundColor Red
    exit
}
```

Assim não será possível executar o determinado script sem passar por esta sessão.

## Gerar logs
Após um evento concluído durante execução de script, execute esses passos por exemplo:
```powershell
$LogName = "" <# Nome do Log #>
$GetLog = $true <# Confirma #>
. $scriptblock:makeLog
```