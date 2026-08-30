![PowerShell](https://powershellgallery.com/Content/Images/Branding/packageDefaultIcon.svg)

# WinTools
Conjunto de ferramentas de scripts para reparar, limpar e fazer manutenção do sistema Windows
ultilizando o PowerShell.

## Como ultilizar?
Primeira mente você precisa ter o PowerShell 7 instalado, por motivo de preferência
eu optei que o Windows PowerShell 5.1 não pode ser usado.

## Guia
Execute o arquivo `Run.bat`

No menu inicial haverá estas opções:
- `[1]. Reparação do Windows`
- `[2]. Procurar por atualizações de Software (Winget)`
- `[3]. Limpar arquivos temporários"`
- `[X] Sair`

### 1. Reparação do Windows
Ao selecionar esta opção, primeiramente perguntará "Deseja fazer uma verificação
de integridade do Windows ou uma Reparação completa da imagem do sistema?" e
você terá que escolher entre duas opções:

1. Verificação `sfc /scannow`
2. Reparação `DISM.exe`

Se você selecionar a opção número **1** será feito um sistema de verificação de integridade
dos arquivos do Windows. Antes de iniciar a verificação, perguntará se você deseja desligar
ou reiniciar o computador após o processo ser concluído.

Pelo outro lado, se você selecionar a opção número **2** será executado uma outra ferramenta,
que irá para baixar e substuir a imagem do sistema, combinando com o comando `sfc /scannow`
igual a primeira opção, porém o será executado primeiro o `DISM.exe` e em seguida o `sfc /scannow`
e será obrigatório a reinicialização do computador.

### 2. Procurar por atualizações de Software (Winget)

### 3. Limpar arquivos temporários