return {
  'shortcuts/no-neck-pain.nvim',
  dependencies = {
    'folke/twilight.nvim',
    opts = {},
  },
  keys = {
    { '<leader>z', ':NoNeckPain<cr>' },
    { '<leader>Z', ':NoNeckPain<cr>:Twilight<cr>' },
  },
  version = '*',
}
