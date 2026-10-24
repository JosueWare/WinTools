# Notes
O sistema de pedido e o gerador de logs estão prontos.

## Fazer pedidos
Em um arquivo de script `.ps1` faça o pedido como este exemplo:

```powershell
# Etapa 1: RequestSystem (Configuração)
[bool]$GetRequest = $false
[string]$RequestType = ""

# Etapa 2: Defina qual tipo de pedido
$RequestType = "Defrag"

# Etapa 3: Confirme o pedido
$GetRequest = $true

<# Procure em executar o script de pedidos #>
```

Assim não será possível executar o determinado script sem passar por esta sessão.

## Gerar logs
Após um evento concluído durante execução de script, execute esses passos por exemplo:
```powershell
```