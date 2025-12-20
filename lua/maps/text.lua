local utils = require('utils')

local nmap = utils.nmap
local keymap = utils.keymap

-- Indent and keep selection
keymap('x', '<', '<gv')
keymap('x', '>', '>gv')

nmap('<leader>ya', '<cmd>%yank<cr>', { desc = 'Copy all text to clipboard' })

-- NOTE: these doesn't map correctly when using `vim.keymap.set()`
vim.cmd('nmap <leader>o ]<space>') -- Add empty line(s) below current line
vim.cmd('nmap <leader>O [<space>') -- Add empty line(s) above current line

keymap(
  'x',
  '<leader>r',
  'y:%s/<c-r>0/replace/gc<left><left><left><c-w>',
  { desc = 'Replace selected text in current file' }
)
