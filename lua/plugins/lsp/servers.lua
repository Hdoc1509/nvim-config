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
          select = { '.eslintrc', 'package.json', 'tsconfig.json', 'jsconfig.json' },
        }),
        validate = { enable = true },
      },
    },
  }),
  ['lua_ls'] = merge(default_settings, {
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
      },
    },
  }),
  ['marksman'] = default_settings,
  -- ['mdx_analyzer'] = default_settings,
  ['ts_ls'] = default_settings,
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
