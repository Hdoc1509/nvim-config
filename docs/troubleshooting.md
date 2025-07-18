# Troubleshooting

## Fail to install treesitter parser

If you are a Windows user and have problems to install `treesitter` parser,
install `zig` and retry to install.

## Fail to use `rest.nvim`

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

## Fail to use `eslint/prettier` with `astro` files

If you have problems to use `astro` files, follow instructions in:

## Fail to install `tree-sitter-test` parser

> [NOTE!]
> All of the following commands should be run in `command` mode

You will need to run `:chdir` to the installation path of `tree-sitter-test`
plugin. Then, run:

```bash
!mkdir -p parser && tree-sitter build -o parser/test.so
```

- [`eslint-plugin-astro`](https://github.com/ota-meshi/eslint-plugin-astro)
- [`prettier-plugin-astro`](https://github.com/withastro/prettier-plugin-astro)

## `mini.files` opens when opening `fugitive`s summary window

Go up to root path of current working directory and remove `fugitive:` directory

> [NOTE!]
> This is a extremely rare case. It only happened twice
