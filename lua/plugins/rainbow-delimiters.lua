return {
  'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
  submodules = false,
  init = function()
    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = 'rainbow-delimiters.strategy.global',
      },
      query = {
        [''] = 'rainbow-delimiters',
      },
      priority = {
        [''] = 110,
        lua = 210,
      },
      highlight = require('plugins.indent-blankline').opts.scope.highlight,
    }
  end,
  version = '^0.10.0',
}
