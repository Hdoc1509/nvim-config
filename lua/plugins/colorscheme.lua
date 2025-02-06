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
        bg1 = COLORS.black,
        bg3 = COLORS['gray-890'],
        white = COLORS.white,
        green = COLORS['green-A800'],
        fg1 = COLORS.white,
      },
    },
    groups = {
      all = {
        Cursor = { bg = COLORS['light-blue-A390'] },
        NvimTreeNormal = { bg = COLORS.black },
        NvimTreeExecFile = { fg = COLORS.white, gui = 'nocombine' },
        VirtColumn = { fg = COLORS['light-blue-A390'] },
        MatchParen = { bg = COLORS['gray-850'] },
        Whitespace = { gui = 'bold', fg = COLORS['gray-690'] },
        HighlightYank = { bg = COLORS['gray-850'] },
        -- NOTE: Only create a highlight group for folders
        -- icons are handled by nvim-web-devicons
        FolderCyan = { fg = COLORS.cyan },
        FolderDeepOrange = { fg = COLORS['deep-orange-400'] },
        FolderUtils = { fg = COLORS['light-green-600'] },
        FolderGit = { fg = COLORS['deep-orange-400'] },
        FolderGithub = { fg = COLORS['blue-gray-600'] },
        FolderDesktop = { fg = COLORS['light-blue-600'] },
        FolderDownloads = { fg = COLORS['green-500'] },
        FolderVim = { fg = COLORS['green-600'] },
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
