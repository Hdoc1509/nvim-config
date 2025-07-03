return {
  'nvim-tree/nvim-web-devicons',
  dependencies = {
    -- { dir = '~/dev/hygen.nvim' },
    {
      'Hdoc1509/hygen.nvim',
      branch = 'more-injections', --[[ tag = 'v0.2.0' ]]
    },
  },
  config = function()
    local devicons = require('nvim-web-devicons')
    local ICONS = require('icons')

    devicons.setup({
      override_by_filename = ICONS.file.name,
      override_by_extension = ICONS.file.extension,
    })

    require('hygen.web-devicons').setup()
    devicons.set_icon_by_filetype({
      powershell = 'ps1',
      cmd = 'bat',
    })
  end,
  lazy = true,
}
