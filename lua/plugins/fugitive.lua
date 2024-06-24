local config = function()
  local nmap = require('utils').nmap

  nmap('<leader>gaa', '<cmd>Git add --all<cr>', { desc = 'Git add all' })
  nmap('<leader>gd', '<cmd>Git diff<cr>', { desc = 'Git diff' })
  nmap('<leader>gp', '<cmd>Git push<cr>', { desc = 'Git push' })
  nmap('<leader>gl', '<cmd>Git pull<cr>', { desc = 'Git pull' })
  nmap('<leader>gs', '<cmd>Git status<cr>', { desc = 'Git status' })
  nmap('<leader>gc', '<cmd>Git commit<cr>', { desc = 'Git commit' })
end

return {
  'tpope/vim-fugitive',
  cmd = { 'Git' },
  config = config,
}
