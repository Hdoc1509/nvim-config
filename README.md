# Neovim configuration

This repository hosts my Neovim configuration that I'm using for Linux and Windows.

- Linux Distro: [`Linux Mint 21.2 Cinnamon`](https://www.linuxmint.com/edition.php?id=305)
- Windows Version: Windows 10 _(pending to check subversion)_

## Features

- Written in Lua _(and a little bit of Vimscript)_
- Blinking cursor
- Custom [mappings](#mappings)
- Settings for [`neovim-qt`](https://github.com/equalsraf/neovim-qt) and [`neovide`](https://github.com/neovide/neovide)
- Plugin management via [`lazy.nvim`](https://github.com/folke/lazy.nvim)
- Code highlighting via [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter)
- Better statusline via [`lightline.vim`](https://github.com/itchyny/lightline.vim)
- File explorer via [`mini.files`](https://github.com/echasnovski/mini.files)
- File fuzzy finder via [`fzf`](https://github.com/junegunn/fzf) and [`fzf.vim`](https://github.com/junegunn/fzf.vim)
- Autopairing via [`auto-pairs`](https://github.com/jiangmiao/auto-pairs) and [`nvim-ts-autotag`](https://github.com/windwp/nvim-ts-autotag)
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
- Functions and commands for Neovim GUI's via [`neovim-gui-shim`](https://github.com/equalsraf/neovim-gui-shim)
- Better colorcolumn with [`virt-column.nvim`](https://github.com/lukas-reineke/virt-column.nvim)
- Color highlighter with [`nvim-highlight-colors`](https://github.com/brenoprata10/nvim-highlight-colors)
- Indentation guides via [`indent-blankline.nvim`](https://github.com/lukas-reineke/indent-blankline.nvim)
- Beautiful GUI notifications with [`nvim-notify`](https://github.com/rcarriga/nvim-notify)
- Nerd fonts support with [`nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons)
- Unicode completion with [`unicode.vim`](https://github.com/chrisbra/unicode.vim)
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
- LSP Servers:
  - [`ast_grep`](https://ast-grep.github.io/)
  - [`astro`](https://github.com/withastro/language-tools/tree/main/packages/language-server)
  - [`bashls`](https://github.com/bash-lsp/bash-language-server)
  - [`cssls`](https://github.com/hrsh7th/vscode-langservers-extracted)
  - [`emmet_ls`](https://github.com/aca/emmet-ls)
  - [`eslint`](https://github.com/hrsh7th/vscode-langservers-extracted)
  - [`gh_actions_ls`](https://github.com/lttb/gh-actions-language-server)
  - [`gradle_ls`](https://github.com/microsoft/vscode-gradle)
  - [`html`](https://github.com/hrsh7th/vscode-langservers-extracted)
  - [`jdtls`](https://projects.eclipse.org/projects/eclipse.jdt.ls)
  - [`jsonls`](https://github.com/hrsh7th/vscode-langservers-extracted)
  - [`jqls`](https://github.com/wader/jq-lsp)
  - [`lua_ls`](https://github.com/luals/lua-language-server)
  - [`marksman`](https://github.com/artempyanykh/marksman)
  - [`ts_ls`](https://github.com/typescript-language-server/typescript-language-server)
  - [`ts_query_ls`](https://github.com/ribru17/ts_query_ls) ([manual installation](https://github.com/ribru17/ts_query_ls/releases))
  - [`vimls`](https://github.com/iamcco/vim-language-server)
  - [`yamlls`](https://github.com/redhat-developer/yaml-language-server)
- Linters:
  - [`actionlint`](https://github.com/rhysd/actionlint)
  - [`markdownlint`](https://github.com/DavidAnson/markdownlint)
  - [`npm-groovy-lint`](https://github.com/nvuillam/npm-groovy-lint)
- Treesitter parsers:
  - astro
  - bash
    <!-- - c (required) -->
    <!-- - cpp (required) -->
  - css
  - embedded_template (ejs)
  - gitattributes
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
  - lua
  - luap
  - markdown (also used for `mdx` files)
  - markdown_inline
  - properties
  - regex
  - scss
  - toml
  - typescript
  - tsx
  - vim
  - vimdoc
  - yaml

## Requirements

- [Patched nerd-font](https://github.com/ryanoasis/nerd-fonts)
- [Neovim 0.9.5](https://github.com/neovim/neovim/releases/tag/v0.9.5)
- [Node.js](https://nodejs.org/en/download)
- [Yarn](https://yarnpkg.com/getting-started/install)
- [Git](https://git-scm.com/downloads)
- [FZF](https://github.com/junegunn/fzf#installation)
- [fd](https://github.com/sharkdp/fd#installation)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [shellcheck](https://github.com/koalaman/shellcheck#installing)
- [go](https://go.dev/doc/install)
- [Zig](https://github.com/ziglang/zig#installation) (optional) - See
  [Troubleshooting](#troubleshooting) section
- `C` compiler (needed by `nvim-treesitter`):
  - [Windows tutorial](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support)
  - [Linux tutorial](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Linux-Support)

## Installation

### Before cloning

1. Backup your current configuration
2. Remove your `~/.config/nvim` folder

Once you installed this configuration you will be able to integrate your older
configuration. You can see it in [Customization](#customization) section

### Cloning

Clone repository in neovim config path:

```sh
git clone --depth 1 https://github.com/Hdoc1509/nvim-config.git ~/.config/nvim
```

Or start a new repo with [`tiged`](https://github.com/tiged/tiged):

```sh
tiged Hdoc1509/nvim-config ~/.config/nvim
```

**IF YOU ARE A WINDOWS USER,** set the environment variable `XDG_CONFIG_HOME`
with `cmd`:

```cmd
setx XDG_CONFIG_HOME %USERPROFILE%\.config
```

### Install plugins

1. To suppress git messages about detached HEAD, run:

   ```bash
   git config --global advice.detachedHead false
   ```

2. To install plugins, run:

   ```bash
   nvim --headless +'Lazy! restore' +quit
   ```

3. Due to `headless` mode, some `tree-sitter` parsers can not be successfully
   installed. All you need to do is open `Neovim`.

## Mappings

Used mapleader is `space key`.

| Mapping       | Mode            | Description                                   |
| ------------- | --------------- | --------------------------------------------- |
| `<F1>`        | Normal          | Toggle `nvim-tree` with focus in current file |
| `<F2>`        | Normal          | Toggle `nvim-tree`                            |
| `<leader>w`   | Normal          | Save file                                     |
| `<leader>W`   | Normal          | Save all files                                |
| `<leader>q`   | Normal          | Save and close file                           |
| `<leader>Q`   | Normal          | Save all files and close Neovim               |
| `<leader>tq`  | Normal          | Close current tab                             |
| `<leader>to`  | Normal          | Close all other tabs                          |
| `<leader>th`  | Normal          | Move tab to left                              |
| `<leader>tH`  | Normal          | Move tab to first position                    |
| `<leader>tl`  | Normal          | Move tab to right                             |
| `<leader>tL`  | Normal          | Move tab to last position                     |
| `<leader>tj`  | Normal          | Go to previous tab                            |
| `<leader>tJ`  | Normal          | Go to first tab                               |
| `<leader>tk`  | Normal          | Go to next tab                                |
| `<leader>tK`  | Normal          | Go to last tab                                |
| `<leader>[`   | Normal          | Jump to tag under cursor in a split           |
| `<leader>]`   | Normal          | Jump to tag under cursor in a new tab         |
| `<leader>j`   | Normal / Visual | Scroll down 10 lines                          |
| `<leader>J`   | Normal / Visual | Scroll down 20 lines                          |
| `<leader>k`   | Normal / Visual | Scroll up 10 lines                            |
| `<leader>K`   | Normal / Visual | Scroll up 20 lines                            |
| `<leader>sb`  | Normal          | Toggle scrollbind in windows of current tab   |
| `<leader>>`   | Normal          | Resize current split 10 pixels to left        |
| `<leader><`   | Normal          | Resize current split 10 pixels to right       |
| `<leader>chh` | Normal          | Run `:checkhealth`                            |
| `<c-h>`       | Normal          | Jump to left split                            |
| `<c-j>`       | Normal          | Jump to bottom split                          |
| `<c-k>`       | Normal          | Jump to top split                             |
| `<c-l>`       | Normal          | Jump to right split                           |
| `<leader>H`   | Normal          | Move window to previous tab                   |
| `<leader>L`   | Normal          | Move window to next tab                       |
| `<leader>gG`  | Normal          | Open git summary window                       |
| `<leader>gV`  | Normal          | Open git summary window in vertical split     |
| `<leader>gT`  | Normal          | Open git summary window in new tab            |
| `<leader>gaa` | Normal          | Execute `git add --all`                       |
| `<leader>gd`  | Normal          | Execute `git diff`                            |
| `<leader>gp`  | Normal          | Execute `git push`                            |
| `<leader>gl`  | Normal          | Execute `git pull`                            |
| `<leader>gs`  | Normal          | Execute `git status`                          |
| `<leader>gc`  | Normal          | Execute `git commit`                          |
| `<leader>gb`  | Normal          | Open in browser at hosting provider           |
| `<c-u>`       | Normal / Insert | Toggle Uppercase of word under cursor         |
| `<c-t>`       | Normal / Insert | Toggle Title Case of word under cursor        |
| `<c-d>`       | Normal / Insert | Remove current line                           |
| `<leader>ya`  | Normal          | Copy all text of current file to clipboard    |
| `<leader>e`   | Normal          | Search files with `fzf`                       |
| `<leader>E`   | Normal          | Search buffers with `fzf`                     |
| `]t`          | Normal          | Jump to next TODO comment                     |
| `[t`          | Normal          | Jump to previous TODO comment                 |
| `<leader>/`   | Normal          | Clear search highlighting                     |
| `<leader>rr`  | Normal          | Run HTTP request under the cursor             |
| `<leader>rl`  | Normal          | Re-run the last HTTP request                  |
| `<leader>mo`  | Normal (\*)     | Start Markdwon preview                        |
| `<leader>mc`  | Normal (\*)     | Stop Markdown preview                         |
| `<leader>mt`  | Normal          | Toggle Markdown renderer                      |
| `<leader>f`   | Normal          | Format current file                           |
| `<leader>F`   | Normal          | Format and save current file                  |
| `H`           | Normal          | Preview folded lines                          |
| `<leader>o`   | Normal [N]      | Add blanklines below current line             |
| `<leader>O`   | Normal [N]      | Add blanklines above current line             |
| `]c`          | Normal          | Jump to next hunk                             |
| `[c`          | Normal          | Jump to previous hunk                         |
| `<leader>hs`  | Normal          | Stage hunk under cursor                       |
| `<leader>hs`  | Visual          | Stage selected hunk(s)                        |
| `<leader>hr`  | Normal          | Reset hunk under cursor                       |
| `<leader>hr`  | Visual          | Reset selected hunk(s)                        |
| `<leader>hS`  | Normal          | Stage buffer                                  |
| `<leader>hu`  | Normal          | Unstage hunk under cursor                     |
| `<leader>hR`  | Normal          | Reset buffer                                  |
| `<leader>hp`  | Normal          | Preview hunk under cursor                     |
| `<leader>hP`  | Normal          | Preview hunk under cursor but inline          |
| `<c-a>`       | Insert          | Insert `supermaven` suggestion                |
| `<c-j>`       | Insert          | Accept `supermaven` word suggestion           |
| `<c-q>`       | Insert          | Clear/Cancel `supermaven` suggestion          |
| `-`           | Normal          | Open mini.files in current file               |
| `<leader>-`   | Normal          | Open mini.files in last used path             |
| `<leader>_`   | Normal          | Open mini.files in root path of workspace     |
| `<F3>`        | Insert / Normal | Toggle spell checking                         |
| `<leader>x`   | Normal          | Source current file                           |
| `<leader>r`   | Visual          | Replace selected text in current file         |
| `<leader>R`   | Visual          | Replace selected text in all files            |
| `<leader>z`   | Normal          | Toggle Zen Mode                               |
| `<leader>fs`  | Normal          | Enable Fullscreen. Only for `nvim-qt`         |
| `<leader>Fs`  | Normal          | Disable Fullscreen. Only for `nvim-qt`        |
| `<F11>`       | Normal          | Toggle Fullscreen. Only for `neovide`         |

**(\*): Mappings that show a notify window.**

**[N]: Mappings that can receive a count.**

## Abbreviations

| Abbreviation | Mode    | Expansion     |
| ------------ | ------- | ------------- |
| vh           | Command | vertical help |
| th           | Command | tab help      |

### Markdown mappings

The following mappings just run on `*.md` files:

| Mapping       | Mode        | Description                                                         |
| ------------- | ----------- | ------------------------------------------------------------------- |
| `<leader>sat` | Visual Line | Create a table from shell aliases definitions and run `FormatWrite` |

## Git integration

This configuration provides a minimal configuration file for integration with
git.

To use it, run the following command:

```sh
git config --global core.editor "nvim -u ~/.config/nvim/minimal.lua"
```

## Customization

If you want to integrate your older configuration or want to extend this
configuration, follow next indications:

- Custom global variables and Mapleader must be in [`lua/globals.lua`](./lua/globals.lua)
- General options must be placed in [`lua/options.lua`](./lua/options.lua)
- Custom autocommands must be setted in [`lua/autocmds.lua`](./lua/autocmds.lua)
- Plugins configurations must be added inside [`lua/plugins`](./lua/plugins)
  folder (can be a `*.lua` file or a folder with an `init.lua` file). Config
  files of plugins will be loaded automatically by `lazy.nvim`
- Mappings must be setted in [`lua/maps.lua`](./lua/maps.lua)
- Settings about diagnostic are in [`lua/diagnostic.lua`](./lua/diagnostic.lua)
- Custom icons must be declared in [`lua/icons/init.lua`](./lua/icons/init.lua)
- Options related to colorscheme and custom GUI highlighting goes in
  [`lua/plugins/colorscheme.lua`](./lua/plugins/colorscheme.lua)
- Custom colors are declared in [`lua/colors.lua`](./lua/colors.lua)
- Options for Neovim GUI's are in [`ginit.vim`](./ginit.vim)
- Util functions must be placed in [`lua/utils.lua`](./lua/utils.lua)

If you want to integrate more LSP servers, see the list of all [available LSP
servers](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).
Once you have all software requirements for desired LSP server, you need to:

- Configure it in the list of servers in [`lua/plugins/lsp/servers.lua`](./lua/plugins/lsp/servers).
- Add it to the list of mason tools in [`lua/plugins/lsp/mason.lua`](./lua/plugins/lsp/mason.lua).

## Troubleshooting

### Fail to install treesitter parser

If you are a Windows user and have problems to install `treesitter` parser,
install `zig` and retry to install.

### Fail to use `rest.nvim`

If you are a Windows user and have problems to use `rest.nvim` because of
`curl --compressed` option, you need to prepend the path of the `curl` binary
that comes bundled with `git-for-windows` to your system `PATH`.

Run the following commands with `powershell` as admin:

- `Git 64-bit` version:

  ```powershell
  $GIT_PATH = "C:\Program Files\Git\mingw64\bin"
  ```

- `Git 32-bit` version:

  ```powershell
  $GIT_PATH = "C:\Program Files (x86)\Git\mingw64\bin"
  ```

- Finally, run:

  ```powershell
  [Environment]::SetEnvironmentVariable(
    "Path",
    "$GIT_PATH;" + [Environment]::GetEnvironmentVariable("PATH", "MACHINE"),
    "MACHINE"
  )
  ```

### Fail to use with `astro` files

If you have problems to use `astro` files, follow instructions in:

- [`eslint-plugin-astro`](https://github.com/ota-meshi/eslint-plugin-astro)
- [`prettier-plugin-astro`](https://github.com/withastro/prettier-plugin-astro)

## My dotfiles

[My dotfiles](https://github.com/Hdoc1509/dotfiles)
