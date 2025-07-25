return {
  'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
  submodules = false,
  init = function()
    ---@type rainbow_delimiters.config
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
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }
  end,
}
