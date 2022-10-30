# Neovim configuration

## Introduction

This repository hosts my Neovim configuration that I'm using for Linux and Windows.

## Features

- Written in Vimscript and Lua.
- Blinking cursor.
- Custom [mappings](#mappings).
- Settings for [`neovim-qt`](https://github.com/equalsraf/neovim-qt) and [`neovide`](https://github.com/neovide/neovide).
- Plugin management via [`vim-plug`](https://github.com/junegunn/vim-plug).
- Better colorscheme with [`nightfox.nvim`](https://github.com/EdenEast/nightfox.nvim)
- Code highlighting via [`vim-polyglot`](https://github.com/sheerun/vim-polyglot) and [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter).
- Better statusline via [`lighline-ale`](https://github.com/maximbaz/lightline-ale) and [`lightline.vim`](https://github.com/itchyny/lightline.vim).
- File tree explorer via [`nerdtree`](https://github.com/scrooloose/nerdtree-project-plugin) and [`fzf`](https://github.com/junegunn/fzf).
- Git integration with [`nerdtree-git-plugin`](https://github.com/Xuyuanp/nerdtree-git-plugin), [`gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim) and [`vim-fugitive`](https://github.com/tpope/vim-fugitive).
- Autopairing via [`auto-pairs`](https://github.com/jiangmiao/auto-pairs) and [`nvim-ts-autotag`](https://github.com/windwp/nvim-ts-autotag).
- Emmet support with [`emmet-vim`](https://github.com/mattn/emmet-vim).
- Completion engine via [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp/).
- Snippets support with [`vim-vsnip`](https://github.com/hrsh7th/vim-vsnip) and [`friendly-snippets`](https://github.com/rafamadriz/friendly-snippets)
- Move lines and selections easier with [`vim-move`](https://github.com/matze/vim-move).
- Formatters support via [`formatter.nvim`](https://github.com/mhartington/formatter.nvim).
- Easier pair surrounding with [`nvim-surround`](https://github.com/kylechui/nvim-surround)
- LSP support with [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) and [`lspkind.nvim`](https://github.com/onsails/lspkind.nvim).
- Editorconfig support via [`editorconfig.nvim`](https://github.com/gpanders/editorconfig.nvim).
- Easier comments with [`nerdcommenter`](https://github.com/scrooloose/nerdcommenter).
- Markdown previewing with [`markdown-preview.nvim`](https://github.com/iamcco/markdown-preview.nvim).
- Functions and commands for Neovim GUI's via [`neovim-gui-shim`](https://github.com/equalsraf/neovim-gui-shim).
- Better colorcolumn with [`virt-column.nvim`](https://github.com/lukas-reineke/virt-column.nvim).
- Color highlighter with [`nvim-colorizer`](https://github.com/norcalli/nvim-colorizer.lua).
- Indentation guides via [`indent-blankline.nvim`](https://github.com/lukas-reineke/indent-blankline.nvim).
- Beautiful GUI notifications with [`nvim-notify`](https://github.com/rcarriga/nvim-notify).
- Nerd fonts support with [`vim-devicons`](https://github.com/ryanoasis/vim-devicons).
- LSP Servers:
  - [`bashls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls)
  - [`cssls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls)
  - [`eslint`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint)
  - [`html`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html)
  - [`jsonls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls)
  - [`marksman`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#marksman)
  - [`sumneko_lua`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua)
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
  - javascript
  - json
  - lua
  - scss
  - typescript
  - yaml

## Requirements

- Nvim [latest stable release](https://github.com/neovim/neovim/releases/tag/stable)
- Python3
- Node.js
- Yarn
- Git
- [FZF](https://github.com/junegunn/fzf#installation)
- [fd](https://github.com/sharkdp/fd#installation)
- Formatters:
  - [Prettier](https://prettier.io/docs/en/install.html)
  - [Stylua](https://github.com/JohnnyMorganz/StyLua#installation)
- [Zig](https://github.com/ziglang/zig#installation) (optional)

## Installation

### Before cloning

- First, you should backup your current configuration.
- Then, remove your `~/.config/nvim` folder.
- Once you installed this configuration you will be able to integrate your older
  configuration. You can see it in [Customization](#customization) section.

### Cloning

Clone repository in your neovim config path.

- UNIX systems:

  - Via `git clone`:

  ```sh
  git clone --depth 1 https://github.com/Hdoc1509/nvim-config-vim.git ~/.config/nvim
  ```

  - Via [`tiged`](https://github.com/tiged/tiged) (degit):

  ```sh
  degit Hdoc1509/nvim-config-vim ~/.config/nvim
  ```

- Windows with `cmd`:

  - Via `git clone`:

  ```sh
  git clone --depth 1 https://github.com/Hdoc1509/nvim-config-vim.git %localappdata%\nvim
  ```

  - Via [`tiged`](https://github.com/tiged/tiged) (degit):

  ```sh
  degit Hdoc1509/nvim-config-vim %localappdata%\nvim
  ```

- Windows with `git-bash`:

  - Via `git clone`:

  ```sh
  git clone --depth 1 https://github.com/Hdoc1509/nvim-config-vim.git $LOCALAPPDATA/nvim
  ```

  - Via [`tiged`](https://github.com/tiged/tiged) (degit):

  ```sh
  degit Hdoc1509/nvim-config-win $LOCALAPPDATA/nvim
  ```

### Install plugins

First, you need to install [`vim-plug`](https://github.com/junegunn/vim-plug):

- UNIX systems:

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

- Windows via `powershell`:

```sh
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

Then, open a terminal and run the following command for install all the plugins:

```sh
nvim -es -u ~/.config/nvim/config/plugins-call.vim +PlugInstall +qa
```

### Install lsp-servers

- Run the following `npm` command for install most of required lsp-servers:

```sh
npm i -g vscode-langservers-extracted typescript typescript-language-server vim-language-server bash-language-server yaml-language-server
```

- For install `lua-language-server`, download the precompiled binary from
  [releases page](https://github.com/sumneko/lua-language-server/releases).
  Then extract its content and add its `bin` folder to your $PATH.

- For install `marksman`, follow the official [installation guide](https://github.com/artempyanykh/marksman#how-to-install).

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

| Shortcut       | Mode                 | Description                                      |
| -------------- | -------------------- | ------------------------------------------------ |
| `<Leader>nt`   | Normal               | Open `nerdtree` in current working directory     |
| `<Leader>ntrr` | Normal               | Refresh `nerdtree` root                          |
| `<Leader>w`    | Normal               | Save current buffer content                      |
| `<Leader>q`    | Normal               | Quit current buffer                              |
| `<Leader>Q`    | Normal               | Forced quit of current buffer                    |
| `<Leader>qa`   | Normal               | Quit from Neovim                                 |
| `<Leader>Qa`   | Normal               | Forced quit from Neovim                          |
| `<Leader>fu`   | Normal               | Set `fileformat` to `unix` in current buffer     |
| `<Leader>fd`   | Normal               | Set `fileformat` to `dos` in current buffer      |
| `<Leader>fm`   | Normal               | Set `fileformat` to `mac` in current buffer      |
| `<Leader>j`    | Normal               | Scroll down 10 lines                             |
| `<Leader>J`    | Normal               | Scroll down 20 lines                             |
| `<Leader>k`    | Normal               | Scroll up 10 lines                               |
| `<Leader>K`    | Normal               | Scroll up 20 lines                               |
| `<Leader>>`    | Normal               | Resize current split 10 pixels to left           |
| `<Leader><`    | Normal               | Resize current split 10 pixels to right          |
| `<Leader>;`    | Normal               | Add a semi colon at the end of line              |
| `<Leader>,`    | Normal               | Add a coma at the end of line                    |
| `<Leader>rts`  | Normal               | Replace all tabs to spaces                       |
| `<Leader>e`    | Normal               | Open `$MYVIMRC` file in current tab              |
| `<Leader>ev`   | Normal               | Open `$MYVIMRC` file in a vertical split         |
| `<Leader>sv`   | Normal (\*)          | Source `$MYVIMRC` file                           |
| `<Leader>sf`   | Normal (\*)          | Source current file                              |
| `<Leader>chh`  | Normal               | Runs `:checkhealth`                              |
| `<C-h>`        | Normal               | Move to left split                               |
| `<C-j>`        | Normal               | Move to bottom split                             |
| `<C-k>`        | Normal               | Move to top split                                |
| `<C-l>`        | Normal               | Move to right split                              |
| `<Leader>h`    | Normal               | Move to left split                               |
| `<Leader>l`    | Normal               | Move to right split                              |
| `<Leader>gaa`  | Normal               | Execute `git add --all`                          |
| `<Leader>gd`   | Normal               | Execute `git diff`                               |
| `<Leader>gp`   | Normal               | Execute `git push`                               |
| `<Leader>gl`   | Normal               | Execute `git pull`                               |
| `<Leader>gs`   | Normal               | Execute `git status`                             |
| `<C-u>`        | Normal / Insert      | Toggle Uppercase in current word                 |
| `<C-t>`        | Normal / Insert      | Toggle Title Case in current word                |
| `<C-d>`        | Normal / Insert      | Remove current line                              |
| `<C-a>`        | Normal / Insert (\*) | Copy all text to clipboard                       |
| `<Leader>fzf`  | Normal               | Open `FZF` searcher in current working directory |
| `<Leader>mp`   | Normal (\*)          | Start Markdwon preview of current `.md` file     |
| `<Leader>mps`  | Normal (\*)          | Stop Markdown preview of current `.md` file      |
| `<Leader>f`    | Normal (\*)          | Run a formatter for current buffer               |
| `<Leader>fw`   | Normal (\*)          | Run a formatter for current buffer and save it   |
| `<Leader>fs`   | Normal               | Enable Fullscreen. Only for `nvim-qt`            |
| `<Leader>Fs`   | Normal               | Disable Fullscreen. Only for `nvim-qt`           |
| `<F11>`        | Normal               | Toggle Fullscreen. Only for `neovide`            |
| `<C-e>,`       | Insert               | Expand `emmet` snippet                           |

**(\*): Mappings those show a notify window.**

## Customization

If you want to integrate your older configuration or want to extend this
configuration, follow next indications:

- General options must be placed in `config/options.vim`.
- Plugins call must be setted in `config/plugins.vim`.
- Plugins configurations must be added inside `plugins` folder and then sourced
- in `config/plugins-config.vim` with pattern `filename.extension`.
- Mapleader and simple mappings must be setted in `config/maps.vim`.
- Complex mappings must be setted in `lua/maps.lua`.
- Options related to colorschemes and custom GUI highlighting goes in `config/colors.vim`.
- Options for Neovim GUI's are in `ginit.vim`.
- Util functions in Vimscript must be declared in `utils.vim`.
- Util functions in Lua must be place in `lua/utils.lua`.

If you want to integrate more LSP servers, see the list of all [available LSP
servers](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).
Once you have all software requirements for desired LSP server, just add its
server name inside list of servers in `plugins/nvim-lspconfig.lua`.

## Windows accessibility

For better accessibility in Windows, make a symlink from `$HOME/.config/nvim` to
`$LOCALAPPDATA/nvim`.

- Via `cmd`:

```sh
mklink %userprofile%\.config\nvim %localappdata%\nvim
```

- Via `git-bash`:

```sh
ln -s $LOCALAPPDATA/nvim ~/.config/nvim
```

## My other software configurations

- [git-bash-config](https://github.com/Hdoc1509/git-bash-config)
- [wezterm-config](https://github.com/Hdoc1509/wezterm-config)
