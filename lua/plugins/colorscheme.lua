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
        FolderGithub = { fg = COLORS['blue-gray-600'] },
        FolderDesktop = { fg = COLORS['light-blue-600'] },
        FolderDownloads = { fg = COLORS['green-500'] },
        FolderLibrary = { fg = COLORS['lime-600'] },
        FolderMusic = { fg = COLORS['red-400'] },
        FolderImages = { fg = COLORS['teal-500'] },
        FolderPublic = { fg = COLORS['light-blue-600'] },
        FolderTemplate = { fg = COLORS['brown-400'] },
        FolderTrash = { fg = COLORS['red-500'] },
        FolderVideo = { fg = COLORS['orange-500'] },
        FolderDist = { fg = COLORS['red-300'] },
        FolderBoot = { fg = COLORS['yellow-800'] },
        FolderTheme = { fg = COLORS['blue-600'] },
        FolderDevelopment = { fg = COLORS['light-blue-700'] },
        FolderDocs = { fg = COLORS['light-blue-800'] },
        FolderGreen = { fg = COLORS['green-600'] },
        FolderHome = { fg = COLORS['red-A200'] },
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
