# TODO

## LSP

### Try

- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#spyglassmc_language_server
- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#taplo

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

### lint

- https://github.com/gitleaks/gitleaks
- https://github.com/loeffel-io/ls-lint

## Try

- use [`svgo`](https://github.com/svg/svgo) as formatter for `svg` files
  - create presets based on: https://github.com/jakearchibald/svgomg/blob/main/src/config.json
