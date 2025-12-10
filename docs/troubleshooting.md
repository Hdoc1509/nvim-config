# Troubleshooting

## Fail to install treesitter parser

If you are a Windows user and have problems to install `treesitter` parser,
install `zig` and retry to install.

## Fail to use load `kulala_http` parser

1. Run `:TSInstallFromGrammar` and select `kulala_http` parser
2. Reopen file.

## Fail to use `eslint/prettier` with `astro` files

Be sure to install:

- [`eslint-plugin-astro`](https://github.com/ota-meshi/eslint-plugin-astro)
- [`prettier-plugin-astro`](https://github.com/withastro/prettier-plugin-astro)

## Fail to install `tree-sitter-test` parser

> [!NOTE]
> All of the following commands should be run in `command` mode

You will need to run `:chdir` to the installation path of `tree-sitter-test`
plugin. Then, run:

```bash
mkdir -p parser && tree-sitter build -o parser/test.so
```

## `mini.files` opens when opening `fugitive`s summary window

Go up to root path of current working directory and remove `fugitive:` directory

> [!NOTE]
> This is a extremely rare case. It only happened twice
