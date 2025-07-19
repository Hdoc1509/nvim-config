local utils = require('utils')
local nmap = utils.nmap

-- resizing
nmap('<leader>>', '10<c-w>>', { desc = 'Resize split 10 pixels to left' })
nmap('<leader><', ' 10<c-w><', { desc = 'Resize split 10 pixels to right' })

-- navigation
nmap('<c-h>', '<c-w>h', { desc = 'Jump to left split' })
nmap('<c-j>', '<c-w>j', { desc = 'Jump to bottom split' })
nmap('<c-k>', '<c-w>k', { desc = 'Jump to top split' })
nmap('<c-l>', '<c-w>l', { desc = 'Jump to right split' })

-- moving to adjacent tab
nmap('<leader>H', utils.move_window_to_prev_tab, {
  desc = 'Move current window to previous tab',
})
nmap('<leader>L', utils.move_window_to_next_tab, {
  desc = 'Move current window to next tab',
})
