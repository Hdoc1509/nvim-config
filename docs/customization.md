# Customization

If you want to integrate your older configuration or want to extend this
configuration, follow next indications:

- Custom global variables and Mapleader must be in [`lua/globals.lua`](./lua/globals.lua)
- General options must be placed in [`lua/options.lua`](./lua/options.lua)
- Custom autocommands must be set in [`lua/autocmds.lua`](./lua/autocmds.lua)
- Plugins configurations must be added inside [`lua/plugins`](./lua/plugins)
  folder (can be a `*.lua` file or a folder with an `init.lua` file). Config
  files of plugins will be loaded automatically by `lazy.nvim`
- Mappings must be set in [`lua/maps.lua`](./lua/maps.lua)
- Settings about diagnostic are in [`lua/diagnostic.lua`](./lua/diagnostic.lua)
- Custom icons must be declared in [`lua/icons/init.lua`](./lua/icons/init.lua)
- Options related to colorscheme and custom GUI highlighting goes in
  [`lua/plugins/colorscheme.lua`](./lua/plugins/colorscheme.lua)
- Custom colors are declared in [`lua/colors.lua`](./lua/colors.lua)
- Util functions must be placed in [`lua/utils.lua`](./lua/utils.lua)

If you want to integrate more LSP servers, see the list of all [available LSP
servers](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).
Once you have all software requirements for desired LSP server, you need to:

- Configure it in the list of servers in [`lua/plugins/lsp/servers.lua`](./lua/plugins/lsp/servers).
- Add it to the list of mason tools in [`lua/plugins/lsp/mason.lua`](./lua/plugins/lsp/mason.lua).
