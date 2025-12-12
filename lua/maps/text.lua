local utils = require('utils')

local nmap = utils.nmap
local keymap = utils.keymap

-- Indent and keep selection
keymap('x', '<', '<gv')
keymap('x', '>', '>gv')

nmap('<leader>ya', '<cmd>%yank<cr>', { desc = 'Copy all text to clipboard' })

keymap(
  'x',
  '<leader>r',
  'y:%s/<c-r>0/replace/gc<left><left><left><c-w>',
  { desc = 'Replace selected text in current file' }
)
