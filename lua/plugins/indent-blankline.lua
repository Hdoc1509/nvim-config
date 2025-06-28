vim.opt.list = true
vim.opt.listchars = 'trail:·'

return {
  'lukas-reineke/indent-blankline.nvim',
  dependencies = { 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim' },
  main = 'ibl',
  ---@type ibl.config
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
  ---@param opts ibl.config
  config = function(_, opts)
    local hooks = require('ibl.hooks')

    require('ibl').setup(opts)

    -- NOTE: updates colors once colorscheme is loaded
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
  -- NOTE: until update to nvim-0.10
  commit = '3d08501caef2329aba5121b753e903904088f7e6',
}
