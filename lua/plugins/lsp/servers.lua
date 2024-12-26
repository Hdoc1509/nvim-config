local schema_store = require('schemastore')
local merge = require('utils').merge
local handlers = require('plugins.lsp.handlers')
local capabilities = require('plugins.lsp.capabilities')

-- LSP GENERAL SETTINGS
local default_settings = {
  capabilities = capabilities,
  handlers = handlers,
}

return {
  ['ast_grep'] = default_settings,
  ['astro'] = default_settings,
  ['bashls'] = merge(default_settings, {
    filetypes = { 'sh', 'zsh' },
  }),
  ['cssls'] = default_settings,
  ['emmet_ls'] = merge(default_settings, {
    root_dir = function()
      return vim.loop.cwd()
    end,
  }),
  ['eslint'] = default_settings,
  ['gradle_ls'] = default_settings,
  -- ['groovyls'] = default_settings,
  ['html'] = default_settings,
  ['jsonls'] = merge(default_settings, {
    settings = {
      json = {
        schemas = schema_store.json.schemas({
          select = { '.eslintrc', 'package.json', 'tsconfig.json', 'jsconfig.json', 'luarc' },
          extra = {
            {
              description = 'JSON schema for .luarc.json',
              fileMatch = { '.luarc.json', '.luarc.jsonc' },
              name = 'luarc',
              url = 'https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json',
            },
          },
        }),
        validate = { enable = true },
      },
    },
  }),
  ['lua_ls'] = merge(default_settings, {
    settings = {
      Lua = {
        -- only needed if lua-language-server < 3.6.5
        -- telemetry = { enable = false },
      },
    },
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name

        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
          return
        end
      end

      local runtime_files = vim.api.nvim_get_runtime_file('', true)

      for k, v in ipairs(runtime_files) do
        if v == vim.fn.expand('~/.config/nvim/after') or v == vim.fn.expand('~/.config/nvim') then
          table.remove(runtime_files, k)
        end
      end

      client.config.settings.Lua = merge(client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT',
        },
        workspace = {
          checkThirdParty = false,
          library = runtime_files,
        },
      })
    end,
  }),
  ['marksman'] = default_settings,
  -- ['mdx_analyzer'] = default_settings,
  ['ts_ls'] = default_settings,
  ['ts_query_ls'] = merge(default_settings, {
    settings = {
      parser_install_directories = {
        vim.fn.stdpath('data') .. '/lazy/nvim-treesitter/parser/',
      },
    },
  }),
  ['vimls'] = default_settings,
  ['yamlls'] = merge(default_settings, {
    settings = {
      yaml = {
        schemas = schema_store.yaml.schemas({
          select = { 'GitHub Workflow' },
        }),
      },
    },
  }),
}
