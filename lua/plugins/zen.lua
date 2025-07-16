return {
  'shortcuts/no-neck-pain.nvim',
  dependencies = {
    'folke/twilight.nvim',
    opts = {},
  },
  opts = {
    autocmds = {
      skipEnteringNoNeckPainBuffer = true,
    },
  },
  keys = {
    { '<leader>z', ':NoNeckPain<cr>' },
    { '<leader>Z', ':NoNeckPain<cr>:Twilight<cr>' },
  },
  version = '*',
}
