# Changelog
[Voltar](README.md)

## 1.3.0

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