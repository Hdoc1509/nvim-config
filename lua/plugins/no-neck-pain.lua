return {
  'shortcuts/no-neck-pain.nvim',
  opts = {
    autocmds = {
      skipEnteringNoNeckPainBuffer = true,
    },
  },
  keys = {
    { '<leader>z', ':NoNeckPain<cr>' },
  },
  version = '*',
}
