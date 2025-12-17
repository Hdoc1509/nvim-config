-- NOTE: move config to its own file if it uses more than 7 lines
return {
  ['astro'] = {},
  ['bashls'] = require('plugins.lsp.servers.bashls'),
  ['cssls'] = {},
  ['css_variables'] = {},
  ['emmet_ls'] = require('plugins.lsp.servers.emmet_ls'),
  ['eslint'] = {},
  gh_actions_ls = require('plugins.lsp.servers.gh_actions_ls'),
  ['gradle_ls'] = {},
  ['html'] = {
    filetypes = { 'html', 'ejs' },
  },
  ['jsonls'] = require('plugins.lsp.servers.jsonls'),
  ['jqls'] = {},
  ['kulala_ls'] = {},
  ['lua_ls'] = {
    settings = {
      Lua = {
        ['semantic.annotation'] = false,
      },
    },
  },
  ['marksman'] = {},
  -- ['mdx_analyzer'] = default_settings,
  ['somesass_ls'] = {},
  superhtml = require('plugins.lsp.servers.superhtml'),
  ['ts_ls'] = require('plugins.lsp.servers.ts_ls'),
  ['ts_query_ls'] = require('plugins.lsp.servers.ts_query_ls'),
  ['typos_lsp'] = require('plugins.lsp.servers.typos-lsp'),
  ['vimls'] = {},
  ['yamlls'] = require('plugins.lsp.servers.yamlls'),
}
