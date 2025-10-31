return require('utils').merge({
  settings = {
    parser_install_directories = {
      vim.fn.stdpath('data') .. '/lazy/nvim-treesitter/parser/',
    },
    valid_predicates = require('plugins.lsp.servers.ts_query_ls.predicates'),
    valid_directives = require('plugins.lsp.servers.ts_query_ls.directives'),
  },
}, require('hygen.ts-query-ls'), require('gh-actions.ts-query-ls').expressions, require('vim-map-side.ts-query-ls'))
