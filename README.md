# Neovim configuration for Windows

## Features

- Written in vimscript
- Blinking cursor
- Custom shortcuts (maps)
- Settings for [`neovim-qt`](https://github.com/equalsraf/neovim-qt) and [`neovide`](https://github.com/neovide/neovide)
- [`vim-plug`](https://github.com/junegunn/vim-plug) as package manager
- Plugins:
  - [`vim-polyglot`](https://github.com/sheerun/vim-polyglot)
  - [`lighline-ale`](https://github.com/maximbaz/lightline-ale)
  - [`lightline.vim`](https://github.com/itchyny/lightline.vim)
  - [`nerdtree`](https://github.com/scrooloose/nerdtree-project-plugin)
  - [`nerdtree-git-plugin`](https://github.com/Xuyuanp/nerdtree-git-plugin)
  - [`auto-pairs`](https://github.com/jiangmiao/auto-pairs)
  - [`vim-closetag`](https://github.com/alvan/vim-closetag)
  - [`emmet-vim`](https://github.com/mattn/emmet-vim)
  - [`nightfox.nvim`](https://github.com/EdenEast/nightfox.nvim)
  - [`vim-tmux-navigator`](https://github.com/christoomey/vim-tmux-navigator)
  - [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig)
  - [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp/)
  - [`vim-vsnip`](https://github.com/hrsh7th/vim-vsnip)
  - [`lspkind.nvim`](https://github.com/onsails/lspkind.nvim)
  - [`editorconfig-vim`](https://github.com/editorconfig/editorconfig-vim)
  - [`gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim)
  - [`nerdcommenter`](https://github.com/scrooloose/nerdcommenter)
  - [`vim-fugitive`](https://github.com/tpope/vim-fugitive)
  - [`neovim-gui-shim`](https://github.com/equalsraf/neovim-gui-shim)
  - [`vim-devicons`](https://github.com/ryanoasis/vim-devicons)

## Installation
Clone repository into your user-specific configurations folder: `$HOME/.config`.

Then symlink `init.vim` in `$LOCALAPPDATA/nvim` to `$HOME/.config/nvim/init.vim`.

If you will use `nvim-qt` symlink `ginit.vim` in `$LOCALAPPDATA/nvim` to `$HOME/.config/nvim/config/nvim-qt.vim`.

### Cloning

- Via `git clone`:

```sh
# With cmd
git clone --depth 1 https://github.com/Hdoc1509/nvim-config-win.git %userprofile%\.config\nvim
```

```sh
# With git-bash
git clone --depth 1 https://github.com/Hdoc1509/nvim-config-win.git ~/.config/nvim
```

- Via [`tiged`](https://github.com/tiged/tiged) (degit):

```sh
# With cmd
degit Hdoc1509/nvim-config-win %userprofile%\.config\nvim
```

```sh
# With git-bash
degit Hdoc1509/nvim-config-win ~/.config/nvim
```

### Symlink

Be sure to open a terminal as administrator or that your session has the necessary permissions.

- Via `git-bash`:

```sh
ln -s ~/.config/nvim/init.vim $LOCALAPPDATA/nvim/init.vim
ln -s ~/.config/nvim/config/nvim-qt.vim $LOCALAPPDATA/nvim/ginit.vim
```

- Via `cmd`:

```sh
mklink %localappdata%\nvim\init.vim %userprofile%\.config\nvim\init.vim
mklink %localappdata%\nvim\ginit.vim %userprofile%\.config\nvim\config\nvim-qt.vim
```

### Install plugins

First, you need to install `vim-plug` via `powershell`:

```sh
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

Then, open neovim and run command `:PlugInstall` to install all the plugins.

### Install lsp-servers

- Run the following command for install most of required lsp-servers:

```sh
npm i -g vscode-langservers-extracted typescript typescript-language-server vim-language-server bash-language-server
```

- For install `yaml-language-server` you will need `yarn`:

```sh
yarn global add yaml-language-server
```

- For install `lua-language-server` download the precompiled binary from [here](https://github.com/sumneko/lua-language-server/releases). Then extract its content and add its `bin` folder to your $PATH.

- For install `marksman`, download `marksman.exe` from [releases page](https://github.com/artempyanykh/marksman/releases). Then move it to `$HOME/.local/bin/`. Make sure sure this folder is in your $PATH.

## Custom shortcuts

Used mapleader is `space key`. You can change mapleader in `config/maps.vim`.

| Shortcut      | Mode            | Description                                                   |
|---------------|-----------------|---------------------------------------------------------------|
| `<Leader>nt`  | Normal          | Open nerdtree in current directory                            |
| `<Leader>w`   | Normal          | Save current buffer content                                   |
| `<Leader>q`   | Normal          | Quit current buffer                                           |
| `<Leader>j`   | Normal          | Scroll down 10 lines                                          |
| `<Leader>k`   | Normal          | Scroll up 10 lines                                            |
| `<Leader>>`   | Normal          | Resize current split 10 pixels to left                        |
| `<Leader><`   | Normal          | Resize current split 10 pixels to right                       |
| `<Leader>;`   | Normal          | Add a semi colon at the end of line                           |
| `<Leader>,`   | Normal          | Add a coma at the end of line                                 |
| `<Leader>rts` | Normal          | Replace all tabs to spaces                                    |
| `<Leader>e`   | Normal          | Open $MYVIMRC file in current buffer                          |
| `<Leader>ev`  | Normal          | Open $MYVIMRC file in a vertical split                        |
| `<Leader>sv`  | Normal          | Source $MYVIMRC file                                          |
| `<Leader>h`   | Normal          | Move to left split                                            |
| `<Leader>l`   | Normal          | Move to right split                                           |
| `<Leader>gaa` | Normal          | Execute `git add -all`                                        |
| `<Leader>gd`  | Normal          | Execute `git diff`                                            |
| `<Leader>gp`  | Normal          | Execute `git push`                                            |
| `<Leader>gl`  | Normal          | Execute `git pull`                                            |
| `<Leader>gs`  | Normal          | Execute `git status`                                          |
| `<C-u>`       | Normal / Insert | Uppercase current word                                        |
| `<C-d>`       | Normal / Insert | Remove current line                                           |
| `<C-a>`       | Normal / Insert | Copy all text to clipboard                                    |
| `<Leader>fs`  | Normal          | Enable Fullscreen. Only available in `nvim-qt` and `neovide`  |
| `<Leader>Fs`  | Normal          | Disable Fullscreen. Only available in `nvim-qt` and `neovide` |
| `<C-e>,`      | Insert          | Expand emmet snippet                                          |

