return {
  'nvim-tree/nvim-web-devicons',
  dependencies = {
    -- { dir = '~/dev/hygen.nvim' },
    -- { 'Hdoc1509/hygen.nvim', version = '*' },
    { 'Hdoc1509/hygen.nvim', branch = '0.3.1-next' },
  },
  config = function()
    local devicons = require('nvim-web-devicons')
    local devicons_by_name = require('nvim-web-devicons.default.icons_by_filename')
    local devicons_by_extension = require('nvim-web-devicons.default.icons_by_file_extension')
    local ICONS = require('icons.files')

    devicons.setup({
      override_by_filename = ICONS.name({
        filename = devicons_by_name,
        extension = devicons_by_extension,
      }),
      override_by_extension = ICONS.extension({
        filename = devicons_by_name,
        extension = devicons_by_extension,
      }),
    })

    require('hygen.web-devicons').setup()
    devicons.set_icon({
      test = {
        icon = devicons_by_extension['test.js'].icon,
        color = devicons_by_extension.query.color,
        name = 'TSTest',
      },
      minifiles = {
        icon = '󰙅',
        -- from: https://github.com/echasnovski/mini.nvim/blob/main/logo.png
        color = '#B3DAF9',
        name = 'MiniFiles',
      },
      -- NOTE: quickfix icon   (maybe)
    })
    devicons.set_icon_by_filetype({
      powershell = 'ps1',
      cmd = 'bat',
      fugitive = 'git',
      minifiles = 'minifiles',
    })
  end,
  lazy = true,
}
