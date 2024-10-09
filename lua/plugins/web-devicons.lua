return {
  'nvim-tree/nvim-web-devicons',
  dependencies = {
    { dir = '~/dev/hygen.nvim' },
    -- { 'Hdoc1509/hygen.nvim', tag = 'v0.1.0' },
  },
  config = function()
    require('nvim-web-devicons').setup({
      override_by_extension = {
        ['astro'] = {
          icon = '',
          color = '#f1502f',
          name = 'Astro',
        },
        ['http'] = {
          icon = '󰖟',
          color = '#228be6',
          name = 'Http',
        },
      },
    })
    require('hygen.web-devicons').setup()
  end,
}
