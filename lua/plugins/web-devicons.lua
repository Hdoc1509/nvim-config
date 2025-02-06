return {
  'nvim-tree/nvim-web-devicons',
  dependencies = {
    -- { dir = '~/dev/hygen.nvim' },
    { 'Hdoc1509/hygen.nvim', tag = 'v0.2.0' },
  },
  config = function()
    local COLORS = require('colors')

    require('nvim-web-devicons').setup({
      override_by_extension = {
        ['astro'] = {
          icon = '',
          color = COLORS['deep-purple-A200'],
          name = 'Astro',
        },
      },
    })
    require('hygen.web-devicons').setup()
  end,
}
