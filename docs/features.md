# Features

## Basic

- Written in Lua _(and a little bit of Vimscript)_
- Blinking cursor
- Custom [mappings](./keymaps.md)

## Plugins

- Plugin management via [`lazy.nvim`](https://github.com/folke/lazy.nvim)
- Code highlighting via [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter)
- Better statusline via [`lightline.vim`](https://github.com/itchyny/lightline.vim)
- File explorer via [`mini.files`](https://github.com/echasnovski/mini.files)
- File fuzzy finder via [`fzf`](https://github.com/junegunn/fzf) and
  [`fzf.vim`](https://github.com/junegunn/fzf.vim)
- Autopairing via [`nvim-ts-autotag`](https://github.com/windwp/nvim-ts-autotag)
- Snippets support with [`vim-vsnip`](https://github.com/hrsh7th/vim-vsnip)
- Move lines and selections easier with [`vim-move`](https://github.com/matze/vim-move)
- Formatters support via [`formatter.nvim`](https://github.com/mhartington/formatter.nvim)
- Easier pair surrounding with [`nvim-surround`](https://github.com/kylechui/nvim-surround)
- Easier comments with [`Comment.nvim`](https://github.com/numToStr/Comment.nvim)
- Better TODO comments with [`todo-comments.nvim`](https://github.com/folke/todo-comments.nvim/)
- Better colorscheme with [`nightfox.nvim`](https://github.com/EdenEast/nightfox.nvim)
- Completion engine via [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp/)
- LSP support with [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig)
- Linter plugin with [`nvim-lint`](https://github.com/mfussenegger/nvim-lint)
- Git integration with [`gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim)
  and [`vim-fugitive`](https://github.com/tpope/vim-fugitive)
- Github integration with for `vim-fugitive` by [`vim-rhubarb`](https://github.com/tpope/vim-rhubarb)
- Markdown previewing with [`markdown-preview.nvim`](https://github.com/iamcco/markdown-preview.nvim)
- Better colorcolumn with [`virt-column.nvim`](https://github.com/lukas-reineke/virt-column.nvim)
- Color highlighter with [`nvim-highlight-colors`](https://github.com/brenoprata10/nvim-highlight-colors)
- Indentation guides via [`indent-blankline.nvim`](https://github.com/lukas-reineke/indent-blankline.nvim)
- Beautiful GUI notifications with [`nvim-notify`](https://github.com/rcarriga/nvim-notify)
- Nerd fonts support with [`nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons)
- Rest client via [`rest.nvim`](https://github.com/rest-nvim/rest.nvim)
- Better code folding with [`nvim-ufo`](https://github.com/kevinhwang91/nvim-ufo)
  and [`statuscol.nvim`](https://github.com/luukvbaal/statuscol.nvim)
- Easily install packages with [`mason.nvim`](https://github.com/williamboman/mason.nvim)
  and [`mason-tool-installer`](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
- Better tabline with [`tabby.nvim`](https://github.com/nanozuki/tabby.nvim)
- Jump out of brackets, quotes and other symbols with [`tabout.nvim`](https://github.com/abecodes/tabout.nvim)
- A.I. powered code-completion with [`supermaven-nvim`](https://github.com/supermaven-inc/supermaven-nvim)
- Beautiful markdown highlighting with [`markdown.nvim`](https://github.com/MeanderingProgrammer/markdown.nvim)
- Better `gx` with [`gx.nvim`](https://github.com/chrishrb/gx.nvim)
- Distaction-free coding with [`zen-mode.nvim`](https://github.com/folke/zen-mode.nvim)
- Support for [`Hygen`](https://github.com/jondot/hygen) templates with
  [`hygen.nvim`](https://github.com/Hdoc1509/hygen.nvim)
- Css unit conversion via [`convert.nvim`](https://github.com/cjodo/convert.nvim)
- Highlighting of delimiters with [`rainbow-delimiters.nvim`](https://gitlab.com/HiPhish/rainbow-delimiters.nvim)
- Better window separator with [`colorful-winsep.nvim`](https://github.com/nvim-zh/colorful-winsep.nvim)
- Secondary statusline with [`incline.nvim`](https://github.com/b0o/incline.nvim)

## Tools

### LSP Servers

- [`ast_grep`](https://ast-grep.github.io/)
- [`astro`](https://github.com/withastro/language-tools/tree/main/packages/language-server)
- [`bashls`](https://github.com/bash-lsp/bash-language-server)
- [`cssls`](https://github.com/hrsh7th/vscode-langservers-extracted)
- [`css_variables`](https://github.com/vunguyentuan/vscode-css-variables/tree/master/packages/css-variables-language-server)
- [`emmet_ls`](https://github.com/aca/emmet-ls)
- [`eslint`](https://github.com/hrsh7th/vscode-langservers-extracted)
- [`gh_actions_ls`](https://github.com/lttb/gh-actions-language-server)
- [`gradle_ls`](https://github.com/microsoft/vscode-gradle)
- [`html`](https://github.com/hrsh7th/vscode-langservers-extracted)
- [`jdtls`](https://projects.eclipse.org/projects/eclipse.jdt.ls)
- [`jsonls`](https://github.com/hrsh7th/vscode-langservers-extracted)
- [`jqls`](https://github.com/wader/jq-lsp)
- [`kulala_ls`](https://github.com/mistweaverco/kulala-ls)
- [`lua_ls`](https://github.com/luals/lua-language-server)
- [`marksman`](https://github.com/artempyanykh/marksman)
- [`somesass_ls`](https://github.com/wkillerud/some-sass/tree/main/packages/language-server)
- [`ts_ls`](https://github.com/typescript-language-server/typescript-language-server)
- [`ts_query_ls`](https://github.com/ribru17/ts_query_ls)
- [`typos_lsp`](https://github.com/tekumara/typos-lsp)
- [`vimls`](https://github.com/iamcco/vim-language-server)
- [`yamlls`](https://github.com/redhat-developer/yaml-language-server)

### Linters

- [`actionlint`](https://github.com/rhysd/actionlint)
- [`markdownlint`](https://github.com/DavidAnson/markdownlint)
- [`npm-groovy-lint`](https://github.com/nvuillam/npm-groovy-lint)
- [`selene`](https://github.com/Kampfkarren/selene)

## Treesitter parsers

- astro
- bash
  <!-- - c (required) -->
  <!-- - cpp (required) -->
- css
- diff
- embedded_template (ejs)
- gitattributes
- gitcommit
- gitignore
- groovy
- html
- http
- hygen_template
- java
- javascript
- jsdoc
- json
- jsonc
- jq
- lua
- luap
- markdown (also used for `mdx` files)
- markdown_inline
- powershell (only used for [Troubleshooting](./troubleshooting.md))
- properties
- query
- regex
- scss
- toml
- tsx
- typescript
- vim
- vimdoc
- yaml
