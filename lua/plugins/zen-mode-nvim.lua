return {
  'folke/zen-mode.nvim',
  config = function()
    local nmap = require('utils').nmap

    nmap('<leader>z', '<cmd>ZenMode<cr>')
  end,
}
