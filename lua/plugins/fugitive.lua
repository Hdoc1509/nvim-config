return {
  'tpope/vim-fugitive',
  dependencies = { 'tpope/vim-rhubarb' },
  cmd = { 'Git' },
  keys = {
    { '<leader>gG', '<cmd>Git<cr>', desc = 'Git summary window' },
    { '<leader>gV', '<cmd>vert Git<cr>', desc = 'Git summary window in vertical split' },
    { '<leader>gT', '<cmd>tabnew | Git<cr><c-w>o<cr>', desc = 'Git summary window in new tab' },
    { '<leader>gaa', '<cmd>Git add --all<cr>', desc = 'Git add all' },
    { '<leader>gp', '<cmd>Git push<cr>', desc = 'Git push' },
    { '<leader>gl', '<cmd>Git pull<cr>', desc = 'Git pull' },
    { '<leader>gc', '<cmd>Git commit<cr>', desc = 'Git commit' },
    { '<leader>gC', '<cmd>Git commit --verbose<cr>', desc = 'Git commit verbose' },
    { '<leader>gb', '<cmd>GBrowse<cr>', desc = 'Open in browser at hosting provider' },
  },
}
