# Neovim configuration

This repository hosts my Neovim configuration that I'm using for Linux and Windows.

- Linux Distro: [`Linux Mint 21.2 Cinnamon`](https://www.linuxmint.com/edition.php?id=305)
- Windows Version: Windows 10 _(pending to check subversion)_

## Features

See [Features](./docs/features.md).

## Installation

See [Installation](./docs/install.md).

## Mappings

See [Keymaps](./docs/keymaps.md).

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
