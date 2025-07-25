local default_settings = require('plugins.lsp.servers._default_settings')

return require('utils').merge(default_settings, {
  settings = {
    parser_install_directories = {
      vim.fn.stdpath('data') .. '/lazy/nvim-treesitter/parser/',
    },
    valid_predicates = require('plugins.lsp.servers.ts_query_ls.predicates'),
    valid_directives = require('plugins.lsp.servers.ts_query_ls.directives'),
  },
}, require('hygen.ts-query-ls'))
