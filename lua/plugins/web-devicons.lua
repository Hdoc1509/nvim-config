return {
  'nvim-tree/nvim-web-devicons',
  dependencies = {
    -- { dir = '~/dev/hygen.nvim' },
    { 'Hdoc1509/hygen.nvim', version = '*' },
  },
  config = function()
    local devicons = require('nvim-web-devicons')
    local ICONS = require('icons.files')

    devicons.setup({
      override_by_filename = ICONS.name,
      override_by_extension = ICONS.extension,
    })

    require('hygen.web-devicons').setup()
    devicons.set_icon({
      test = {
        icon = '',
        color = '#90a850',
        name = 'TSTest',
      },
    })
    devicons.set_icon_by_filetype({
      powershell = 'ps1',
      cmd = 'bat',
    })
  end,
  lazy = true,
}
