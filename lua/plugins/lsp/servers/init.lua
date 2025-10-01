local merge = require('utils').merge
local default_settings = require('plugins.lsp.servers._default_settings')

-- NOTE: move config to its own file if it uses more than 5 lines
return {
  ['astro'] = default_settings,
  ['bashls'] = merge(default_settings, require('plugins.lsp.servers.bashls')),
  ['cssls'] = default_settings,
  ['css_variables'] = default_settings,
  ['emmet_ls'] = merge(default_settings, require('plugins.lsp.servers.emmet_ls')),
  ['eslint'] = default_settings,
  gh_actions_ls = merge(default_settings, require('plugins.lsp.servers.gh_actions_ls')),
  ['gradle_ls'] = default_settings,
  ['html'] = merge(default_settings, {
    filetypes = { 'html', 'ejs' },
  }),
  ['jsonls'] = merge(default_settings, require('plugins.lsp.servers.jsonls')),
  ['jqls'] = default_settings,
  ['kulala_ls'] = default_settings,
  ['lua_ls'] = default_settings,
  ['marksman'] = default_settings,
  -- ['mdx_analyzer'] = default_settings,
  ['somesass_ls'] = default_settings,
  superhtml = merge(default_settings, require('plugins.lsp.servers.superhtml')),
  ['ts_ls'] = merge(default_settings, require('plugins.lsp.servers.ts_ls')),
  ['ts_query_ls'] = merge(default_settings, require('plugins.lsp.servers.ts_query_ls')),
  ['typos_lsp'] = merge(default_settings, require('plugins.lsp.servers.typos-lsp')),
  ['vimls'] = default_settings,
  ['yamlls'] = merge(default_settings, require('plugins.lsp.servers.yamlls')),
}
