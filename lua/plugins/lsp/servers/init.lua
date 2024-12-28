local merge = require('utils').merge
local default_settings = require('plugins.lsp.servers._default_settings')

-- NOTE: move config to its own file if it uses more than 5 lines
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
  ['jsonls'] = require('plugins.lsp.servers.jsonls'),
  ['lua_ls'] = require('plugins.lsp.servers.lua_ls'),
  ['marksman'] = default_settings,
  -- ['mdx_analyzer'] = default_settings,
  ['ts_ls'] = default_settings,
  ['ts_query_ls'] = require('plugins.lsp.servers.ts_query_ls'),
  ['vimls'] = default_settings,
  ['yamlls'] = require('plugins.lsp.servers.yamlls'),
}
