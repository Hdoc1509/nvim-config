return {
  'b0o/incline.nvim',
  dependencies = {
    'itchyny/lightline.vim',
    'nvim-tree/nvim-web-devicons',
    'nanozuki/tabby.nvim',
    'Hdoc1509/hygen.nvim',
  },
  config = function()
    require('incline').setup({
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      hide = { cursorline = 'focused_win' },
      ignore = {
        filetypes = { 'gitcommit', 'qf', 'gitrebase' },
      },
      render = require('plugins.incline.render'),
    })
  end,
  event = 'VeryLazy',
  version = '0.1.0',
}
