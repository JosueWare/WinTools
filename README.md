<img src="https://silentinstallhq.com/wp-content/uploads/2025/08/PowerShell7.png" alt="PowerShell" width="160">

# WinTools
Conjunto de ferramentas de scripts para reparar, limpar e fazer manutenção do sistema Windows
ultilizando o PowerShell 7

## ToDo
[Scripts Testados](.github/public/Tests/ToDo.md)

## Como ultilizar?
Primeira mente você precisa ter o PowerShell 7 instalado, por motivo de preferência
eu optei que o Windows PowerShell 5.1 não pode ser usado.

## Guia
Execute o arquivo `Run.bat`

No menu inicial haverá estas opções:
- `[1] Reparação do Windows`
- `[2] Procurar por atualizações de Software (Winget)`
- `[3] Limpar arquivos temporários"`
- `[4] Otimizar Unidades (Em breve)`
- `[5] Acessar BIOs`
- `[X] Sair`

### 1. Reparação do Windows
Ao selecionar esta opção, primeiramente perguntará "Deseja fazer uma verificação
de integridade do Windows ou uma Reparação completa da imagem do sistema?" e
você terá que escolher entre duas opções:

1. Verificação `sfc /scannow`
2. Reparação `DISM.exe`

- Se você selecionar a opção número **1** será feito um sistema de verificação de integridade
dos arquivos do Windows. Antes de iniciar a verificação, perguntará se você deseja desligar ou
reiniciar o computador após o processo ser concluído.

- Pelo outro lado, se você selecionar a opção número **2** será executado uma outra
ferramenta, que irá para baixar e substuir a imagem do sistema,
combinando com o comando `sfc /scannow` igual a primeira opção, porém o será executado
primeiro o `DISM.exe` e em seguida o `sfc /scannow` e será
obrigatório a reinicialização do computador.

### 2. Procurar por atualizações de Software (Winget)
Esta opção executará o comando `winget upgrade` da ferramenta `winget.exe` que deve estar
instalado no seu computador, caso contrário o processo não prosseguirá.

Ele procurará por atualizações mais recentes de seus programas instalados no seu computador.

Após os programas serem listados haverá uma pergunta "Deseja atualizar todos os programas?"

Se escolher a opção "**S**" será executado o comando `winget upgrade --all` e todos os
programas listados serão baixados e atualizados.

### 3. Limpar arquivos temporários
Limpar os arquivos temporários do Windows que acumulam mais de `1 GB`.

As seguintes pastas que serão varridas:
- `C:\Windows\Temp`
- `C:\Users\%USERPROFILE%\AppData\Local\Temp`
- `C:\Windows\Prefetch`

### 4. Otimizar Unidades
Esta opção ainda não está disponível. Será mais detalhado no futuro.

### 5. Acessar BIOs
Antes selecionar esta opção, você deve saber se o modelo da sua placa mãe
é compatível com a interface <a href="https://www.google.com/search?q=uefi">UEFI</a>, caso contrário poderá retornar erro.