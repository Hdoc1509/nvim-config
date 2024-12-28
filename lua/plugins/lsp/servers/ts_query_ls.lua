local merge = require('utils').merge
local default_settings = require('plugins.lsp.servers._default_settings')

return merge(default_settings, {
  settings = {
    parser_install_directories = {
      vim.fn.stdpath('data') .. '/lazy/nvim-treesitter/parser/',
    },
  },
})
