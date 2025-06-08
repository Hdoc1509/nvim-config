# Installation

## Requirements

- [Patched nerd-font](https://github.com/ryanoasis/nerd-fonts)
- [Neovim 0.9.5](https://github.com/neovim/neovim/releases/tag/v0.9.5)
- [Node.js](https://nodejs.org/en/download)
- [Yarn](https://yarnpkg.com/getting-started/install)
- [Git](https://git-scm.com/downloads)
- [fd](https://github.com/sharkdp/fd#installation)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [shellcheck](https://github.com/koalaman/shellcheck#installing)
- [go](https://go.dev/doc/install)
- [Zig](https://github.com/ziglang/zig#installation) (optional) - See
  [Troubleshooting](../README.md#troubleshooting) section
- `C` compiler (needed by `nvim-treesitter`):
  - [Windows tutorial](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support)
  - [Linux tutorial](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Linux-Support)

## Before cloning

### Existing configuration

1. Backup your current configuration
2. Remove your `~/.config/nvim` folder

Once you installed this configuration you will be able to integrate your older
configuration. You can see it in [Customization](./customization.md) section

### Windows environment

Set the environment variable `XDG_CONFIG_HOME` by using `cmd`:

```cmd
setx XDG_CONFIG_HOME %USERPROFILE%\.config
```

## Cloning

Clone repository in neovim config path:

```sh
git clone --depth 1 https://github.com/Hdoc1509/nvim-config.git ~/.config/nvim
```

Or start a new repo with [`tiged`](https://github.com/tiged/tiged):

```sh
tiged Hdoc1509/nvim-config ~/.config/nvim
```

## Install plugins

### Automatic

Just open `Neovim` and wait that `Lazy.nvim` installs all plugins.

### CLI

1. To suppress git messages about detached HEAD, run:

   ```bash
   git config --global advice.detachedHead false
   ```

2. To install plugins, run:

   ```bash
   nvim --headless +'Lazy! restore' +TSUpdateSync +quit
   ```

3. Enable git message about detached HEAD:

   ```bash
   git config --global advice.detachedHead false
   ```

## Git integration

This configuration provides a minimal configuration file for integration with
git.

To use it, run the following command:

```sh
git config --global core.editor "nvim -u ~/.config/nvim/minimal.lua"
```
