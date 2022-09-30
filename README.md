# Neovim configuration

## Features

- Written in Vimscript
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
  - [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig)
  - [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp/)
  - [`vim-vsnip`](https://github.com/hrsh7th/vim-vsnip)
  - [`lspkind.nvim`](https://github.com/onsails/lspkind.nvim)
  - [`editorconfig-vim`](https://github.com/editorconfig/editorconfig-vim)
  - [`gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim)
  - [`nerdcommenter`](https://github.com/scrooloose/nerdcommenter)
  - [`vim-fugitive`](https://github.com/tpope/vim-fugitive)
  - [`neovim-gui-shim`](https://github.com/equalsraf/neovim-gui-shim)
  - [`virt-column.nvim`](https://github.com/lukas-reineke/virt-column.nvim)
  - [`vim-devicons`](https://github.com/ryanoasis/vim-devicons)
- LSP Servers:
  - [`bashls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls)
  - [`cssls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls)
  - [`eslint`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint)
  - [`html`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html)
  - [`marksman`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#marksman)
  - [`sumneko_lua`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua)
  - [`tsserver`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver)
  - [`vimls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vimls)
  - [`yamlls`](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#yamlls)

## Installation

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

## Shortcuts

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
| `<C-h>`       | Normal          | Move to left split                                            |
| `<C-j>`       | Normal          | Move to bottom split                                          |
| `<C-k>`       | Normal          | Move to top split                                             |
| `<C-l>`       | Normal          | Move to right split                                           |
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

## Windows accessibility

For better accessibility in Windows, make a symlink from `$HOME/.config/nvim` to `$LOCALAPPDATA/nvim`.

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

