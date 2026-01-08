# TODO

## Backports

### Patches

- [ ] Remove `numhl` option from `vim.fn.sign_define()`. Reference: https://github.com/Hdoc1509/nvim-config/commit/36424a58a452e21b34eaa8a55944dd1648254c95
- [ ] Update [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) to https://github.com/hrsh7th/cmp-nvim-lsp/commit/cbc7b02
- [ ] Correct option for `vim.diagnostic.config`. Reference: https://github.com/Hdoc1509/nvim-config/commit/4d5fdeaa198e323f948c18284320ec626443727b
- fix `formatter.nvim` config for `svg` filetype. Reference: https://github.com/Hdoc1509/nvim-config/commit/2f8061deaf716d8ff8bdcd3bd201d836f749d82f

### New

- mapping to reselect last pasted text. Reference: https://github.com/Hdoc1509/nvim-config/commit/b72922e3a5ed0352036e8bb6c93513ecc81f88b0
- prevent changing vim register when changing text or deleting a character. Refernce: https://github.com/Hdoc1509/nvim-config/commit/7af2db2982fb3c5203a7db26906042ee1b4cca65
- yaml/injections - `ignore` variants in github workflow file. Reference: https://github.com/Hdoc1509/nvim-config/commit/698ba78828b860f4664203ba1afc83c6252d8718
- html/injections - use `styled` parser instead of `css` for `style` attributes
- use `ini` parser for some filetypes. Reference: https://github.com/Hdoc1509/nvim-config/commit/55524f44a0e988fdb97c3113abb81e98eaaa7b8c
- use `<c-s>` to show signature help

## LSP

### Try

- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#spyglassmc_language_server
- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#taplo
- Update `nvim-lspconfig` to correct version before end of support for neovim 0.10: https://github.com/neovim/nvim-lspconfig/commit/62e1955d7e9a3dca543635effad54d29947cb91e.

  Related to: https://github.com/Hdoc1509/nvim-config/commit/c580fbe9817e238bcc9b38f9ae761539b4f42a3e

## Treesitter

### Grammars

#### Mcfunction

- https://github.com/IoeCmcomc/tree-sitter-mcfunction
  or https://github.com/theusaf/tree-sitter-mcfunction-lang

#### sed

https://github.com/mskelton/tree-sitter-sed

inject `tree-sitter-regex`

#### mdx

Use https://github.com/srazzak/tree-sitter-mdx or:

Emulate MDX syntax with existing parsers and custom tweaks.

- [x] Parse `markdown.mdx` filetype with `markdown` parser
- [ ] Disable pattern of inline links conceal from
      `markdown_inline/highlights.scm`. 2 options:

  1. Use `TSQuery:disable_pattern()`. Available from nvim-0.11. See:

     - https://neovim.io/doc/user/treesitter.html#TSQuery%3Adisable_pattern()
     - https://github.com/MeanderingProgrammer/render-markdown.nvim/issues/493#issuecomment-3181054044

  2. Override runtime query `markdown_inline/highlights.scm` with
     `vim.treesitter.query.set()`

- [ ] Extend `markdown_inline/highlights.scm` to conceal inline links that are
      not part of an `inline` node that starts with `export`. Avoid conceal of
      JavaScript literal arrays.
- [ ] Combined injection of `astro` parser to `markdown_inline` if contains
      JavaScript code within `{` and `}` or JSX components.

Try with:

```mdx
## Hello <Thing />

## Hello {name.toUpperCase()}

The current year is {year}

## Hello {props.name.toUpperCase()}

The current year is {props.year}

## Hello _<Planet />_

You can also use objects with components, such as the `thisOne` component on
the `myComponents` object: <myComponents.thisOne />
```

### Queries

#### printf

https://github.com/tree-sitter-grammars/tree-sitter-printf/blob/main/queries/highlights.scm
