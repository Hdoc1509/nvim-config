return require('utils').merge({
  settings = {
    parser_install_directories = {
      -- NOTE: needed because of update of `nvim-treesitter` to `main` branch
      vim.fn.stdpath('data') .. '/site/parser/',
    },
    valid_predicates = require('plugins.lsp.servers.ts_query_ls.predicates'),
    valid_directives = require('plugins.lsp.servers.ts_query_ls.directives'),
  },
}, require('hygen.ts-query-ls'), require('gh-actions.ts-query-ls').expressions, require('vim-map-side.ts-query-ls'))
