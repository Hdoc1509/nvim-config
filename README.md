# Neovim configuration

This repository hosts my Neovim configuration that I'm using for Linux and Windows.

## Features

- Written in Vimscript and Lua.
- Blinking cursor.
- Custom [mappings](#mappings).
- Settings for [`neovim-qt`](https://github.com/equalsraf/neovim-qt) and [`neovide`](https://github.com/neovide/neovide).
- Plugin management via [`lazy.nvim`](https://github.com/folke/lazy.nvim).
- Code highlighting via [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter).
- Better statusline via [`lightline.vim`](https://github.com/itchyny/lightline.vim).
- File tree explorer via [`nvim-tree.lua`](https://github.com/nvim-tree/nvim-tree.lua).
- File fuzzy finder via [`fzf`](https://github.com/junegunn/fzf).
- Autopairing via [`auto-pairs`](https://github.com/jiangmiao/auto-pairs) and [`nvim-ts-autotag`](https://github.com/windwp/nvim-ts-autotag).
- Snippets support with [`vim-vsnip`](https://github.com/hrsh7th/vim-vsnip).
- Move lines and selections easier with [`vim-move`](https://github.com/matze/vim-move).
- Formatters support via [`formatter.nvim`](https://github.com/mhartington/formatter.nvim).
- Easier pair surrounding with [`nvim-surround`](https://github.com/kylechui/nvim-surround)
- Easier comments with [`Comment.nvim`](https://github.com/numToStr/Comment.nvim).
- Better TODO comments with [`todo-comments.nvim`](https://github.com/folke/todo-comments.nvim/).
- Better colorscheme with [`nightfox.nvim`](https://github.com/EdenEast/nightfox.nvim)
- Completion engine via [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp/).
- LSP support with [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig).
- Git integration with [`gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim) and [`vim-fugitive`](https://github.com/tpope/vim-fugitive).
- Markdown previewing with [`markdown-preview.nvim`](https://github.com/iamcco/markdown-preview.nvim).
- Functions and commands for Neovim GUI's via [`neovim-gui-shim`](https://github.com/equalsraf/neovim-gui-shim).
- Better colorcolumn with [`virt-column.nvim`](https://github.com/lukas-reineke/virt-column.nvim).
- Color highlighter with [`nvim-highlight-colors`](https://github.com/brenoprata10/nvim-highlight-colors).
- Indentation guides via [`indent-blankline.nvim`](https://github.com/lukas-reineke/indent-blankline.nvim).
- Beautiful GUI notifications with [`nvim-notify`](https://github.com/rcarriga/nvim-notify).
- Nerd fonts support with [`nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons).
- Unicode completion with [`unicode.vim`](https://github.com/chrisbra/unicode.vim).
- Rest client via [`rest.nvim`](https://github.com/rest-nvim/rest.nvim).
- Better code folding with [`nvim-ufo`](https://github.com/kevinhwang91/nvim-ufo) and [`statuscol.nvim`](https://github.com/luukvbaal/statuscol.nvim).
- Easily install packages with [`mason.nvim`](https://github.com/williamboman/mason.nvim) and [`mason-tool-installer`](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
- Better tabline with [`tabby.nvim`](https://github.com/nanozuki/tabby.nvim)
- Jump out of brackets, quotes and other symbols with [`tabout.nvim`](https://github.com/abecodes/tabout.nvim)
- A.I. powered code-completion with [`codeium.vim`](https://github.com/Exafunction/codeium.vim)
- Beautiful markdown highlighting with [`headlines.nvim`](https://github.com/lukas-reineke/headlines.nvim)
- LSP Servers:
  - [`astro`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#astro)
  - [`bashls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls)
  - [`cssls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls)
  - [`emmet_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#emmet_ls)
  - [`eslint`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint)
  - [`html`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html)
  - [`jsonls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls)
  - [`lua_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls)
  - [`marksman`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#marksman)
  - [`tsserver`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver)
  - [`vimls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vimls)
  - [`yamlls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls)
- Treesitter parsers:
  - astro
  - bash
    <!-- - c (required) -->
    <!-- - cpp (required) -->
  - css
  - gitignore
  - html
  - http
  - javascript
  - jsdoc
  - jsonc
  - lua
  - markdown
  - markdown_inline
  - scss
  - tsx
  - typescript
  - vim
  - yaml

## Requirements

<!-- TODO: Update required neovim version based on plugins requirements -->

- [Neovim >= 0.9.0](https://github.com/neovim/neovim/releases)
- [Node.js](https://nodejs.org/en/download)
- [Yarn](https://yarnpkg.com/getting-started/install)
- [Git](https://git-scm.com/downloads)
- [FZF](https://github.com/junegunn/fzf#installation)
- [fd](https://github.com/sharkdp/fd#installation)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [shellcheck](https://github.com/koalaman/shellcheck#installing)
- [Zig](https://github.com/ziglang/zig#installation) (optional) - See [Troubleshooting](#troubleshooting) section.

## Installation

### Before cloning

- First, you should backup your current configuration.
- Then, remove your `~/.config/nvim` folder.
- Once you installed this configuration you will be able to integrate your older
  configuration. You can see it in [Customization](#customization) section.

### Cloning

Clone repository in neovim config path.

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

Be sure that you have all [software requirements for nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter#requirements).

Then, open Neovim and wait for all plugins to be installed.

## Mappings

Used mapleader is `space key`.

| Mapping       | Mode            | Description                                       |
| ------------- | --------------- | ------------------------------------------------- |
| `<F1>`        | Normal          | Toggle `nvim-tree` with focus in current file     |
| `<F2>`        | Normal          | Toggle `nvim-tree`                                |
| `<Leader>w`   | Normal          | Save current file if has been modified            |
| `<Leader>q`   | Normal          | Save current file if modified and quit            |
| `<Leader>tq`  | Normal          | Close current tab                                 |
| `<Leader>to`  | Normal          | Close all other tabs                              |
| `<Leader>th`  | Normal          | Move tab to left                                  |
| `<Leader>tH`  | Normal          | Move tab to first position                        |
| `<Leader>tl`  | Normal          | Move tab to right                                 |
| `<Leader>tL`  | Normal          | Move tab to last position                         |
| `<Leader>tj`  | Normal          | Go to previous tab                                |
| `<Leader>tJ`  | Normal          | Go to first tab                                   |
| `<Leader>tk`  | Normal          | Go to next tab                                    |
| `<Leader>tK`  | Normal          | Go to last tab                                    |
| `<Leader>[`   | Normal          | Jump to tag under cursor in a split               |
| `<Leader>]`   | Normal          | Jump to tag under cursor in a new tab             |
| `<Leader>Q`   | Normal          | Quit from Neovim                                  |
| `<Leader>j`   | Normal          | Scroll down 10 lines                              |
| `<Leader>J`   | Normal          | Scroll down 20 lines                              |
| `<Leader>k`   | Normal          | Scroll up 10 lines                                |
| `<Leader>K`   | Normal          | Scroll up 20 lines                                |
| `<Leader>>`   | Normal          | Resize current split 10 pixels to left            |
| `<Leader><`   | Normal          | Resize current split 10 pixels to right           |
| `<Leader>chh` | Normal          | Run `:checkhealth`                                |
| `<C-h>`       | Normal          | Jump to left split                                |
| `<C-j>`       | Normal          | Jump to bottom split                              |
| `<C-k>`       | Normal          | Jump to top split                                 |
| `<C-l>`       | Normal          | Jump to right split                               |
| `<Leader>H`   | Normal          | Move window to previous tab                       |
| `<Leader>L`   | Normal          | Move window to next tab                           |
| `<Leader>gaa` | Normal          | Execute `git add --all`                           |
| `<Leader>gd`  | Normal          | Execute `git diff`                                |
| `<Leader>gp`  | Normal          | Execute `git push`                                |
| `<Leader>gl`  | Normal          | Execute `git pull`                                |
| `<Leader>gs`  | Normal          | Execute `git status`                              |
| `<Leader>gc`  | Normal          | Execute `git commit`                              |
| `<C-u>`       | Normal / Insert | Toggle Uppercase of word under cursor             |
| `<C-t>`       | Normal / Insert | Toggle Title Case of word under cursor            |
| `<C-d>`       | Normal / Insert | Remove current line                               |
| `<Leader>ya`  | Normal          | Copy all text of current file to clipboard        |
| `<Leader>e`   | Normal          | Search files with `fzf`                           |
| `]t`          | Normal          | Jump to next TODO comment                         |
| `[t`          | Normal          | Jump to previous TODO comment                     |
| `gx`          | Normal          | Open URL under cursor with browser in `g:browser` |
| `<Leader>/`   | Normal          | Clear search highlighting                         |
| `<Leader>rr`  | Normal          | Run HTTP request under the cursor                 |
| `<Leader>rl`  | Normal          | Re-run the last HTTP request                      |
| `vh`          | Command         | Open help window in vertical split                |
| `th`          | Command         | Open help window in new tab                       |
| `<Leader>mo`  | Normal (\*)     | Start Markdwon preview                            |
| `<Leader>mc`  | Normal (\*)     | Stop Markdown preview                             |
| `<Leader>f`   | Normal          | Format current file                               |
| `<Leader>F`   | Normal          | Format and save current file                      |
| `H`           | Normal          | Preview folded lines                              |
| `<Leader>o`   | Normal [N]      | Add blanklines below current line                 |
| `<Leader>O`   | Normal [N]      | Add blanklines above current line                 |
| `]c`          | Normal          | Jump to next hunk                                 |
| `[c`          | Normal          | Jump to previous hunk                             |
| `<Leader>hp`  | Normal          | Preview hunk                                      |
| `<Leader>hs`  | Normal          | Stage hunk                                        |
| `<Leader>hS`  | Normal          | Stage buffer                                      |
| `<Leader>hu`  | Normal          | Unstage hunk                                      |
| `<C-a>`       | Insert          | Insert codeium suggestion                         |
| `<C-n>`       | Insert          | Next codeium suggestion                           |
| `<C-p>`       | Insert          | Previous codeium suggestion                       |
| `<C-q>`       | Insert          | Clear/Cancel codeium suggestion                   |
| `<F3>`        | Insert / Normal | Toggle spell checking                             |
| `<Leader>r`   | Visual          | Replace selected text in current line             |
| `<Leader>R`   | Visual          | Replace selected text in current file             |
| `<Leader>fs`  | Normal          | Enable Fullscreen. Only for `nvim-qt`             |
| `<Leader>Fs`  | Normal          | Disable Fullscreen. Only for `nvim-qt`            |
| `<F11>`       | Normal          | Toggle Fullscreen. Only for `neovide`             |

**(\*): Mappings that show a notify window.**

**[N]: Mappings that can receive a count.**

### Markdown mappings

The following mappings just run on `*.md` files:

| Mapping       | Mode        | Description                                                         |
| ------------- | ----------- | ------------------------------------------------------------------- |
| `<Leader>sat` | Visual Line | Create a table from shell aliases definitions and run `FormatWrite` |

## Global variables

This configuration use some custom global variables:

- **g:browser**: Binary name of your favorite browser. Default to `firefox`.

You can add or change these global variables in [`lua/globals.lua`](./lua/globals.lua).

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

- Custom global variables and Mapleader must be in [`lua/globals.lua`](./lua/globals.lua).
- General options must be placed in [`lua/options.lua`](./lua/options.lua).
- Custom autocommands must be setted in [`lua/autocmds.lua`](./lua/autocmds.lua).
- Plugins configurations must be added inside [`lua/plugins`](./lua/plugins)
  folder (can be a `*.lua` file or a folder with an `init.lua` file). Config
  files of plugins will be loaded automatically by `lazy.nvim`.
- Mappings must be setted in [`lua/maps.lua`](./lua/maps.lua).
- Settings about diagnostic are in [`lua/diagnostic.lua`](./lua/diagnostic.lua).
- Custom icons must be declared in [`lua/icons.lua`](./lua/icons.lua).
- Options related to colorschemes and custom GUI highlighting goes in
  [`lua/plugins/nightfox.lua`](./lua/plugins/nightfox.lua).
- Options for Neovim GUI's are in [`ginit.vim`](./ginit.vim).
- Util functions must be placed in [`lua/utils.lua`](./lua/utils.lua).

If you want to integrate more LSP servers, see the list of all [available LSP
servers](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).
Once you have all software requirements for desired LSP server, just add its
server name inside table list of servers in [`lua/plugins/lsp/servers.lua`](./lua/plugins/lsp/servers).

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

### Fail to use `:Codeium Auth`

If you have problems for enter your api-key to `:Codeium Auth` command, follow
instructions in [`codeium-auth.http`](codeium-auth.http).

### Fail to use with `astro` files

If you have problems to use `astro` files, follow instructions in:

- [`eslint-plugin-astro`](https://github.com/ota-meshi/eslint-plugin-astro)
- [`prettier-plugin-astro`](https://github.com/withastro/prettier-plugin-astro)

## My dotfiles

[My dotfiles](https://github.com/Hdoc1509/dotfiles)
