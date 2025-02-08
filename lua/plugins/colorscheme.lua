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
        FolderChangesets = { fg = COLORS['blue-500'] },
        FolderIntellij = { fg = COLORS['blue-gray-600'] },
        FolderLocal = { fg = COLORS['cyan-600'] },
        FolderVscode = { fg = COLORS['blue-400'] },
        FolderApi = { fg = COLORS['yellow-700'] },
        FolderDeepOrange = { fg = COLORS['deep-orange-400'] },
        FolderApp = { fg = COLORS['red-400'] },
        FolderAudio = { fg = COLORS['red-400'] },
        FolderDist = { fg = COLORS['red-300'] },
        FolderBoot = { fg = COLORS['yellow-800'] },
        FolderClass = { fg = COLORS['red-400'] },
        FolderClient = { fg = COLORS['light-blue-600'] },
        FolderConfig = { fg = COLORS['cyan-600'] },
        FolderConnection = { fg = COLORS['cyan-600'] },
        FolderContent = { fg = COLORS['cyan-500'] },
        FolderController = { fg = COLORS['amber-500'] },
        FolderCompiler = { fg = COLORS['green-600'] },
        FolderComponents = { fg = COLORS['lime-600'] },
        FolderDesktop = { fg = COLORS['light-blue-600'] },
        FolderDevelopment = { fg = COLORS['light-blue-700'] },
        FolderDocs = { fg = COLORS['light-blue-800'] },
        FolderDownload = { fg = COLORS['green-500'] },
        FolderError = { fg = COLORS['red-400'] },
        FolderOther = { fg = COLORS['deep-orange-400'] },
        FolderExamples = { fg = COLORS['teal-500'] },
        FolderFavorites = { fg = COLORS['red-400'] },
        FolderFont = { fg = COLORS['red-A200'] },
        FolderFunctions = { fg = COLORS['light-blue-700'] },
        FolderGenerator = { fg = COLORS['red-400'] },
        FolderGithub = { fg = COLORS['blue-gray-600'] },
        FolderHome = { fg = COLORS['red-A200'] },
        FolderI18n = { fg = COLORS['indigo-400'] },
        FolderImages = { fg = COLORS['teal-500'] },
        FolderIndent = { fg = COLORS['green-600'] },
        FolderLayout = { fg = COLORS['light-blue-600'] },
        FolderLib = { fg = COLORS['lime-600'] },
        FolderLog = { fg = COLORS['lime-700'] },
        FolderLsp = { fg = COLORS['blue-A800'] },
        FolderMappings = { fg = COLORS['lime-700'] },
        FolderVideo = { fg = COLORS['orange-500'] },
        FolderMnt = { fg = COLORS['yellow-700'] },
        FolderMock = { fg = COLORS['brown-400'] },
        FolderNetlify = { fg = COLORS['teal-400'] },
        FolderNode = { fg = COLORS['light-green-500'] },
        FolderOpt = { fg = COLORS['yellow-700'] },

        FolderUtils = { fg = COLORS['light-green-600'] },
        FolderDownloads = { fg = COLORS['green-500'] },
        FolderMusic = { fg = COLORS['red-400'] },
        FolderPublic = { fg = COLORS['light-blue-600'] },
        FolderTemplate = { fg = COLORS['brown-400'] },
        FolderTrash = { fg = COLORS['red-500'] },
        FolderTheme = { fg = COLORS['blue-600'] },
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
