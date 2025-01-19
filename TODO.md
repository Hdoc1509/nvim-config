# TODO

## LSP

### ts_ls

- Ignore `80001` error. "File ... may be converted to an ES module"
- Ignore `7016` error about `missing declaration file` of
  `tree-sitter-embedded-template` in `grammar.js` of my project
  `tree-sitter-hygen-template`

### Try

- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#spyglassmc_language_server
- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#taplo
- https://github.com/actions/languageservices/tree/main/languageserver
  - use `https://github.com/strozw/github-actions-languageserver` as binary

## Treesitter

- Add links to parser repositories once updated to Neovim `~0.10.0`

### Grammars

#### Mcfunction

- https://github.com/IoeCmcomc/tree-sitter-mcfunction
  or https://github.com/theusaf/tree-sitter-mcfunction-lang

### Queries

#### Yaml

- Highlight Gith Workflow expressions (injections)
  https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/evaluate-expressions-in-workflows-and-actions
  maybe develop tree-sitter-github-workflow-expression parser?

## Linters

### Shellcheck within `bashls`

- Ignore SC2034 for `.env*` files

## Try

- https://github.com/DariusCorvus/tree-sitter-language-injection.nvim
- https://github.com/bennypowers/template-literal-comments.nvim
- https://github.com/vzze/calculator.nvim
  or https://vimtricks.com/p/vim-calculator/
- https://github.com/bennypowers/svgo.nvim
  using config of svgmog: https://github.com/jakearchibald/svgomg/blob/main/src/config.json
  need to install https://github.com/svg/svgo
