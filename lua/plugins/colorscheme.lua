local config = function()
  local COLORS = require('colors')

  require('nightfox').setup({
    options = {
      styles = {
        comments = 'italic',
        keywords = 'italic',
      },
    },
    palettes = {
      all = {
        bg0 = COLORS['gray-950'],
        bg1 = COLORS['black'],
        bg3 = COLORS['gray-890'],
        white = COLORS['white'],
        green = COLORS['green-A800'],
        fg1 = COLORS['white'],
      },
    },
    groups = {
      all = {
        Cursor = { bg = COLORS['light-blue-A390'] },
        NvimTreeNormal = { bg = COLORS['black'] },
        NvimTreeExecFile = { fg = COLORS['white'], gui = 'nocombine' },
        VirtColumn = { fg = COLORS['light-blue-A390'] },
        MatchParen = { bg = COLORS['gray-850'] },
        Whitespace = { gui = 'bold', fg = COLORS['gray-690'] },
        HighlightYank = { bg = COLORS['gray-850'] },
      },
    },
  })

  vim.cmd('colorscheme carbonfox')
end

return {
  'EdenEast/nightfox.nvim',
  lazy = false,
  priority = 1000,
  config = config,
}
