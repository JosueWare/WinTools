# Changelog
[README](README.md)

[ToDo](ToDo.md)

## 1.3.4
23/10/2026

Geral:
- Removido a tradução `pt-BR` na beta do projeto
- E mais outras coisas foram removidas e aprimoradas

Novo script:
- `DefaultFolders.ps1` criará pastas como `Logs` e private automaticamente quando executar o arquivo script principal.

## 1.3.1
18/10/2026

### Changes
- O arquivo script `WinTools.ps1` foi corrigido

## 1.3.0
01/10/2026

### Added

- Adicionado o arquivo `WinTools.ps1` para executar dentro do diretório do projeto.

### Features
- Melhorias no script `SearchUpdateApps.ps1`
  Agora quando executado o script haverá uma pergunta se deseja atualizar todos os programas listados ou algum específico.

    `[A] Atualizar Todos | [E] Específico | [N] Nenhum`

### Changes
- Mudanças no script `Start.ps1`
  Substituição das barras invertidas `\` pelo o `Join-Path`

### Removed
- Removido o bloco de script para o uso integrado com o Git onde o título do projeto era exibido de acordo com a branch posta.
- Deletado a pasta `Env` em `Config`

## 1.2.6
13/09/2026

### Added
- Foi criado a pasta `.vscode` na raíz do projeto para guardar o arquivo `launch.json` com a ultilidade de executar e depurar o projeto apontando sempre para o arquivo `Start.ps1`.

## 1.2.5
07/09/2026

### Added
- Um novo script para facilitar o trabalho com a ferramenta Git.