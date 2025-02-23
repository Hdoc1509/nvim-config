return {
  'nvim-tree/nvim-web-devicons',
  dependencies = {
    -- { dir = '~/dev/hygen.nvim' },
    { 'Hdoc1509/hygen.nvim', tag = 'v0.2.0' },
  },
  config = function()
    local COLORS = require('colors')
    local ICONS = require('icons')

    require('nvim-web-devicons').setup({
      override_by_filename = {
        ['todo.md'] = {
          icon = ICONS.file.name['TODO.md'],
          color = COLORS['light-green-600'],
          name = 'Todo',
        },
      },
      override_by_extension = ICONS.file.extension,
    })
    require('hygen.web-devicons').setup()
  end,
}
