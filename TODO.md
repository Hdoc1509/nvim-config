# TODO

## Backports

### Patches

- fix `formatter.nvim` config for `svg` filetype. Reference: https://github.com/Hdoc1509/nvim-config/commit/2f8061deaf716d8ff8bdcd3bd201d836f749d82f

### New

- mapping to reselect last pasted text. Reference: https://github.com/Hdoc1509/nvim-config/commit/b72922e3a5ed0352036e8bb6c93513ecc81f88b0
- prevent changing vim register when changing text or deleting a character. Refernce: https://github.com/Hdoc1509/nvim-config/commit/7af2db2982fb3c5203a7db26906042ee1b4cca65
- yaml/injections - `ignore` variants in github workflow file. Reference: https://github.com/Hdoc1509/nvim-config/commit/698ba78828b860f4664203ba1afc83c6252d8718
- html/injections - use `styled` parser instead of `css` for `style` attributes
- use `ini` parser for some filetypes. Reference: https://github.com/Hdoc1509/nvim-config/commit/55524f44a0e988fdb97c3113abb81e98eaaa7b8c
- use `<c-s>` to show signature help

## Docs

- `astro` lsp requires that `typescript` is installed. Reference: https://github.com/Hdoc1509/nvim-config/commit/6716d380ac5d9ea2d9847cc35be1e9c23e3ffa03

## LSP

### Try

- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#spyglassmc_language_server
- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#taplo
- https://github.com/srazzak/tree-sitter-mdx

## Treesitter

### Grammars

#### Mcfunction

- https://github.com/IoeCmcomc/tree-sitter-mcfunction
  or https://github.com/theusaf/tree-sitter-mcfunction-lang

#### sed

https://github.com/mskelton/tree-sitter-sed

inject `tree-sitter-regex`

### Queries

#### printf

https://github.com/tree-sitter-grammars/tree-sitter-printf/blob/main/queries/highlights.scm
