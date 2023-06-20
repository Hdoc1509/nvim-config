# Neovim configuration

This repository hosts my Neovim configuration that I'm using for Linux and Windows.

## Features

- Written in Vimscript and Lua.
- Blinking cursor.
- Custom [mappings](#mappings).
- Settings for [`neovim-qt`](https://github.com/equalsraf/neovim-qt) and [`neovide`](https://github.com/neovide/neovide).
- Plugin management via [`vim-plug`](https://github.com/junegunn/vim-plug).
- Code highlighting via [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter).
- Better statusline via [`lightline.vim`](https://github.com/itchyny/lightline.vim).
- File tree explorer via [`nvim-tree.lua`](https://github.com/nvim-tree/nvim-tree.lua).
- File fuzzy finder via [`fzf`](https://github.com/junegunn/fzf).
- Autopairing via [`auto-pairs`](https://github.com/jiangmiao/auto-pairs) and [`nvim-ts-autotag`](https://github.com/windwp/nvim-ts-autotag).
- Snippets support with [`vim-vsnip`](https://github.com/hrsh7th/vim-vsnip) and [`friendly-snippets`](https://github.com/rafamadriz/friendly-snippets)
- Move lines and selections easier with [`vim-move`](https://github.com/matze/vim-move).
- Formatters support via [`formatter.nvim`](https://github.com/mhartington/formatter.nvim).
- Easier pair surrounding with [`nvim-surround`](https://github.com/kylechui/nvim-surround)
- Easier comments with [`nerdcommenter`](https://github.com/scrooloose/nerdcommenter).
- Better TODO comments with [`todo-comments.nvim`](https://github.com/folke/todo-comments.nvim/).
- Better colorscheme with [`nightfox.nvim`](https://github.com/EdenEast/nightfox.nvim)
- Completion engine via [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp/).
- LSP support with [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig), [`lspkind.nvim`](https://github.com/onsails/lspkind.nvim) and [`cmp-nvim-lsp-signature-help`](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help).
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
- LSP Servers:
  - [`bashls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls)
  - [`cssls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls)
  - [`eslint`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint)
  - [`emmet_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#emmet_ls)
  - [`html`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html)
  - [`jsonls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls)
  - [`marksman`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#marksman)
  - [`lua_ls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls)
  - [`tsserver`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver)
  - [`vimls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vimls)
  - [`yamlls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls)
- Treesitter parsers:
  - c (required)
  - cpp (required)
  - bash
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
  - typescript
  - vim
  - yaml

## Requirements

- [Neovim >= 0.9.0](https://github.com/neovim/neovim/releases)
- [Node.js](https://nodejs.org/en/download)
- [Yarn](https://yarnpkg.com/getting-started/install)
- [Git](https://git-scm.com/downloads)
- [FZF](https://github.com/junegunn/fzf#installation)
- [fd](https://github.com/sharkdp/fd#installation)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- Formatters:
  - [Prettier](https://prettier.io/docs/en/install.html)
  - [Stylua](https://github.com/JohnnyMorganz/StyLua#installation)
  - [shfmt](https://github.com/mvdan/sh#shfmt)
- [ShellCheck](https://github.com/koalaman/shellcheck#installing)
- [jq](https://stedolan.github.io/jq/download/)
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

**IF YOU ARE A WINDOWS USER,** set the environment variable `XDG_CONFIG_HOME`
with `cmd`:

```cmd
setx XDG_CONFIG_HOME %USERPROFILE%\.config
```

### Install plugins

First, you need to install [`vim-plug`](https://github.com/junegunn/vim-plug#neovim):

- UNIX systems:

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

- Windows via `powershell`:

```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

Finally, run the following command for install all the plugins:

```sh
nvim -es -u ~/.config/nvim/core/plugins.vim +PlugInstall +qa
```

### Install lsp-servers

- Run the following `npm` command for install most of required lsp-servers:

```sh
npm i -g vscode-langservers-extracted typescript typescript-language-server vim-language-server bash-language-server yaml-language-server emmet-ls
```

- For install `lua-language-server`, follow its official [installation guide](https://github.com/sumneko/lua-language-server/wiki/Getting-Started#command-line).

- For install `marksman`, follow its official [installation guide](https://github.com/artempyanykh/marksman#how-to-install).

### Install Treesitter dependencies

Be sure that you have all [software requirements for nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter#requirements).

Then, open a terminal and run the following commands:

- Installing tree-sitter-cli:

```sh
npm i -g tree-sitter-cli
```

- Installing treesitter parsers for `c` and `cpp`:

```sh
nvim --headless -c ":TSInstallSync c cpp" +qa
```

Rest of parser will be installed once you open Neovim.

## Mappings

Used mapleader is `space key`.

| Mapping       | Mode            | Description                                          |
| ------------- | --------------- | ---------------------------------------------------- |
| `<F1>`        | Normal          | Toggle `nvim-tree` with focus in current file        |
| `<Leader>w`   | Normal          | Save current buffer if has been modified             |
| `<Leader>q`   | Normal          | Save current buffer if modified and quit             |
| `<Leader>tq`  | Normal          | Close current tab                                    |
| `<Leader>to`  | Normal          | Close all other tabs                                 |
| `<Leader>th`  | Normal          | Move tab to left                                     |
| `<Leader>tl`  | Normal          | Move tab to right                                    |
| `<Leader>tj`  | Normal          | Go to previous tab                                   |
| `<Leader>tk`  | Normal          | Go to next tab                                       |
| `<Leader>Q`   | Normal          | Quit from Neovim                                     |
| `<Leader>j`   | Normal          | Scroll down 10 lines                                 |
| `<Leader>J`   | Normal          | Scroll down 20 lines                                 |
| `<Leader>k`   | Normal          | Scroll up 10 lines                                   |
| `<Leader>K`   | Normal          | Scroll up 20 lines                                   |
| `<Leader>>`   | Normal          | Resize current split 10 pixels to left               |
| `<Leader><`   | Normal          | Resize current split 10 pixels to right              |
| `<Leader>;`   | Normal          | Add a semi colon at the end of line                  |
| `<Leader>,`   | Normal          | Add a coma at the end of line                        |
| `<Leader>.`   | Normal          | Add a dot at the end of line                         |
| `<Leader>e`   | Normal          | Open `$MYVIMRC` file in current tab                  |
| `<Leader>ev`  | Normal          | Open `$MYVIMRC` file in a vertical split             |
| `<Leader>sv`  | Normal (\*)     | Source `$MYVIMRC` file                               |
| `<Leader>sf`  | Normal (\*)     | Source current file                                  |
| `<Leader>chh` | Normal          | Run `:checkhealth`                                   |
| `<C-h>`       | Normal          | Move to left split                                   |
| `<C-j>`       | Normal          | Move to bottom split                                 |
| `<C-k>`       | Normal          | Move to top split                                    |
| `<C-l>`       | Normal          | Move to right split                                  |
| `<Leader>h`   | Normal          | Move to left split                                   |
| `<Leader>l`   | Normal          | Move to right split                                  |
| `<Leader>gaa` | Normal          | Execute `git add --all`                              |
| `<Leader>gd`  | Normal          | Execute `git diff`                                   |
| `<Leader>gp`  | Normal          | Execute `git push`                                   |
| `<Leader>gl`  | Normal          | Execute `git pull`                                   |
| `<Leader>gs`  | Normal          | Execute `git status`                                 |
| `<Leader>gc`  | Normal          | Execute `git commit`                                 |
| `<C-u>`       | Normal / Insert | Toggle Uppercase in current word                     |
| `<C-t>`       | Normal / Insert | Toggle Title Case in current word                    |
| `<C-d>`       | Normal / Insert | Remove current line                                  |
| `<Leader>ya`  | Normal          | Copy all text of current buffer to clipboard         |
| `<Leader>fzf` | Normal          | Run `FZF` in current working directory               |
| `]t`          | Normal          | Jump to next TODO comment                            |
| `[t`          | Normal          | Jump to previous TODO comment                        |
| `<Leader>pc`  | Normal          | Execute `PlugClean`                                  |
| `<Leader>pi`  | Normal          | Execute `PlugInstall`                                |
| `<Leader>ps`  | Normal          | Execute `PlugStatus`                                 |
| `<Leader>pud` | Normal          | Execute `PlugUpdate`                                 |
| `<Leader>pug` | Normal          | Execute `PlugUpgrade`                                |
| `gx`          | Normal          | Open URL under cursor with browser in `g:browser`    |
| `<Leader>/`   | Normal          | Clear search highlighting                            |
| `<Leader>rr`  | Normal          | Run HTTP request under the cursor                    |
| `<Leader>rl`  | Normal          | Re-run the last HTTP request                         |
| `vh`          | Command         | Open help in vertical split                          |
| `<Leader>mp`  | Normal (\*)     | Start Markdwon preview of current `.md` file         |
| `<Leader>mps` | Normal (\*)     | Stop Markdown preview of current `.md` file          |
| `<Leader>f`   | Normal (\*)     | Format current buffer                                |
| `<Leader>fw`  | Normal (\*)     | Format and save current buffer                       |
| `<Leader>o`   | Normal          | Add blanklines above current line                    |
| `<Leader>O`   | Normal          | Add blanklines below current line                    |
| `<Leader>fs`  | Normal          | Enable Fullscreen. Only for `nvim-qt`                |
| `<Leader>Fs`  | Normal          | Disable Fullscreen. Only for `nvim-qt`               |
| `<F11>`       | Normal          | Toggle Fullscreen. Only for `neovide`                |

**(\*): Mappings those show a notify window.**

### Markdown mappings

The following mappings just run on `*.md` files:

| Mapping       | Mode        | Description                                                         |
| ------------- | ----------- | ------------------------------------------------------------------- |
| `<Leader>sat` | Visual Line | Create a table from shell aliases definitions and run `FormatWrite` |

## Global variables

This configuration use some custom global variables:

- **g:browser**: Binary name of your favorite browser. Default to `firefox`.

You can add or change these global variables in `core/globals.lua`.

## Git integration

This configuration provides a minimal configuration file for integration with
git.

To use it, run the following command:

```sh
git config --global core.editor "nvim -u ~/.config/nvim/minimal.vim"
```

## Customization

If you want to integrate your older configuration or want to extend this
configuration, follow next indications:

- Custom global variables and Mapleader must be in `core/globals.lua`.
- General options must be placed in `core/options.vim`.
- Custom autocommands must be setted in `core/autocmds.lua`.
- Plugins call must be setted in `core/plugins.vim`.
- Plugins configurations must be added inside `lua/plugins` folder and
  then sourced in `lua/plugins/init.lua`
- Simple mappings must be setted in `core/maps.vim`.
- Complex mappings must be setted in `lua/maps.lua`.
- Options related to colorschemes and custom GUI highlighting goes in `core/colors.vim`.
- Options for Neovim GUI's are in `ginit.vim`.
- Util functions must be placed in `lua/utils.lua`.

If you want to integrate more LSP servers, see the list of all [available LSP
servers](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).
Once you have all software requirements for desired LSP server, just add its
server name inside list of servers in `lua/plugins/lsp/init.lua`.

## Troubleshooting

- If you are a Windows user and have problems to install `treesitter` parser,
  install `zig` and retry to install.
- If you are a Windows user and have problems to use `rest.nvim` because of
  `curl --compressed` option, prepend the path of the `curl` binary that comes
  bundled with `git-for-windows` to your system `PATH`:
  - `64-bit` version: `C:\Program Files\Git\mingw64\bin`.
  - `32-bit` version: `C:\Program Files (x86)\Git\mingw64\bin`.

## My other software configurations

- [git-bash-config](https://github.com/Hdoc1509/git-bash-config)
- [wezterm-config](https://github.com/Hdoc1509/wezterm-config)
