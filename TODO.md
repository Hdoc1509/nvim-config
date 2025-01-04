# TODO

## LSP

### Install

- Explain that `ts_query_ls` should be downloaded manually from releases page of
  its repo: https://github.com/ribru17/ts_query_ls/releases

### New features/configs

- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#cssls
- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#html
- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#jsonls
- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls

### Try

- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#spyglassmc_language_server
- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#taplo

## Treesitter

- Update list of parsers
- Add links to parser repositories

### Grammars

#### Mcfunction

- https://github.com/IoeCmcomc/tree-sitter-mcfunction
  or https://github.com/theusaf/tree-sitter-mcfunction-lang

### Queries

#### Yaml

- Highlight Github Workflow built-in functions
  see: https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/evaluate-expressions-in-workflows-and-actions#functions

## Linters

### Shellcheck within `bashls`

- Ignore SC2034 for `.env*` files

### Markdownlint

- Ingore `MD013` for `CHANGELOG.md` files
- Ignore `MD024` for `TODO.md` files
- Ignore `MD034` for `TODO.md` files

## Try

- https://github.com/DariusCorvus/tree-sitter-language-injection.nvim
- https://github.com/bennypowers/template-literal-comments.nvim
- https://github.com/vzze/calculator.nvim
  or https://vimtricks.com/p/vim-calculator/
- https://github.com/bennypowers/svgo.nvim
  using config of svgmog: https://github.com/jakearchibald/svgomg/blob/main/src/config.json
  need to install https://github.com/svg/svgo
