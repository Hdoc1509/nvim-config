vim.opt.list = true
vim.opt.listchars = 'trail:·'

return {
  'lukas-reineke/indent-blankline.nvim',
  dependencies = { 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim' },
  main = 'ibl',
  opts = {
    indent = { char = '│' },
    scope = {
      show_start = false,
      show_end = false,
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    },
  },
  config = function(_, opts)
    local hooks = require('ibl.hooks')

    require('ibl').setup(opts)

    -- updates colors once colorscheme is loaded
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
  version = '^3.8.8',
}
