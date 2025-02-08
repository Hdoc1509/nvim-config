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
        FolderApi = { fg = COLORS['yellow-700'] },
        FolderApp = { fg = COLORS['red-400'] },
        FolderAudio = { fg = COLORS['red-400'] },
        FolderBoot = { fg = COLORS['yellow-800'] },
        FolderChangesets = { fg = COLORS['blue-500'] },
        FolderClass = { fg = COLORS['red-400'] },
        FolderClient = { fg = COLORS['light-blue-600'] },
        FolderComponents = { fg = COLORS['lime-600'] },
        FolderConfig = { fg = COLORS['cyan-600'] },
        FolderConnection = { fg = COLORS['cyan-600'] },
        FolderContent = { fg = COLORS['cyan-500'] },
        FolderController = { fg = COLORS['amber-500'] },
        FolderDatabase = { fg = COLORS['amber-400'] },
        FolderDeepOrange = { fg = COLORS['deep-orange-400'] },
        FolderDesktop = { fg = COLORS['light-blue-600'] },
        FolderDevelopment = { fg = COLORS['light-blue-700'] },
        FolderDist = { fg = COLORS['red-300'] },
        FolderDocs = { fg = COLORS['light-blue-800'] },
        FolderDownload = { fg = COLORS['green-500'] },
        FolderError = { fg = COLORS['red-400'] },
        FolderExamples = { fg = COLORS['teal-500'] },
        FolderFavorites = { fg = COLORS['red-400'] },
        FolderFont = { fg = COLORS['red-A200'] },
        FolderFunctions = { fg = COLORS['light-blue-700'] },
        FolderGenerator = { fg = COLORS['red-400'] },
        FolderGithub = { fg = COLORS['blue-gray-600'] },
        FolderHome = { fg = COLORS['red-A200'] },
        FolderI18n = { fg = COLORS['indigo-400'] },
        FolderImages = { fg = COLORS['teal-500'] },
        FolderIntellij = { fg = COLORS['blue-gray-600'] },
        FolderLayout = { fg = COLORS['light-blue-600'] },
        FolderLib = { fg = COLORS['lime-600'] },
        FolderLocal = { fg = COLORS['cyan-600'] },
        FolderLog = { fg = COLORS['lime-700'] },
        FolderLsp = { fg = COLORS['blue-A800'] },
        FolderMappings = { fg = COLORS['lime-700'] },
        FolderMnt = { fg = COLORS['yellow-700'] },
        FolderMock = { fg = COLORS['brown-400'] },
        FolderNetlify = { fg = COLORS['teal-400'] },
        FolderNode = { fg = COLORS['light-green-500'] },
        FolderOther = { fg = COLORS['deep-orange-400'] },
        FolderPackages = { fg = COLORS['blue-600'] },
        FolderPlugin = { fg = COLORS['light-blue-700'] },
        FolderPnpm = { fg = COLORS['yellow-850'] },
        FolderPublic = { fg = COLORS['light-blue-600'] },
        FolderResource = { fg = COLORS['yellow-700'] },
        FolderRoot = { fg = COLORS['yellow-700'] },
        FolderScripts = { fg = COLORS['blue-gray-600'] },
        FolderServer = { fg = COLORS['yellow-700'] },
        FolderShared = { fg = COLORS['purple-400'] },
        FolderSnippets = { fg = COLORS['orange-500'] },
        FolderSrc = { fg = COLORS['green-500'] },
        FolderStore = { fg = COLORS['deep-orange-400'] },
        FolderSyntax = { fg = COLORS['red-400'] },
        FolderTemp = { fg = COLORS['cyan-700'] },
        FolderTemplate = { fg = COLORS['brown-400'] },
        FolderTest = { fg = COLORS['teal-A700'] },
        FolderTheme = { fg = COLORS['blue-600'] },
        FolderTrash = { fg = COLORS['red-500'] },
        FolderUi = { fg = COLORS['purple-400'] },
        FolderUtils = { fg = COLORS['light-green-600'] },
        FolderVideo = { fg = COLORS['orange-500'] },
        FolderVscode = { fg = COLORS['blue-400'] },
        FolderViews = { fg = COLORS['deep-orange-400'] },
        FolderVite = { fg = COLORS['amber-A700'] },
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
