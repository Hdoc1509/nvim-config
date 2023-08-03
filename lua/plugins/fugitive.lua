local config = function()
  local nmap = require('utils').nmap

  nmap('<Leader>gaa', '<cmd>Git add --all<CR>', { desc = 'Git add all' })
  nmap('<Leader>gd', '<cmd>Git diff<CR>', { desc = 'Git diff' })
  nmap('<Leader>gp', '<cmd>Git push<CR>', { desc = 'Git push' })
  nmap('<Leader>gl', '<cmd>Git pull<CR>', { desc = 'Git pull' })
  nmap('<Leader>gs', '<cmd>Git status<CR>', { desc = 'Git status' })
  nmap('<Leader>gc', '<cmd>Git commit<CR>', { desc = 'Git commit' })
end

return {
  'tpope/vim-fugitive',
  cmd = { 'Git' },
  config = config,
}
