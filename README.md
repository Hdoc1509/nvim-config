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

See [Customization](./docs/customization.md).

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
