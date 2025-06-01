return {
  'nvim-tree/nvim-web-devicons',
  dependencies = {
    -- { dir = '~/dev/hygen.nvim' },
    { 'Hdoc1509/hygen.nvim', tag = 'v0.2.0' },
  },
  config = function()
    local ICONS = require('icons')

    require('nvim-web-devicons').setup({
      override_by_filename = ICONS.file.name,
      override_by_extension = ICONS.file.extension,
    })
    require('hygen.web-devicons').setup()
  end,
}
