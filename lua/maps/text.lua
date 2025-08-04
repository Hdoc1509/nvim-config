local utils = require('utils')

local nmap = utils.nmap
local keymap = utils.keymap

-- Indent and keep selection
keymap('x', '<', '<gv')
keymap('x', '>', '>gv')

nmap('<leader>ya', '<cmd>%yank<cr>', { desc = 'Copy all text to clipboard' })

nmap('<leader>o', "printf('m`%so<esc>``', v:count1)", {
  desc = 'Add blankline(s) below current line',
  expr = true,
})
nmap('<leader>O', "printf('m`%sO<esc>``', v:count1)", {
  desc = 'Add blankline(s) above current line',
  expr = true,
})

keymap({ 'i', 'n' }, '<F3>', '<cmd>set spell!<cr>', {
  desc = 'Toggle spell check',
  silent = false,
})

keymap(
  'x',
  '<leader>r',
  'y:%s/<c-r>0/replace/gc<left><left><left><c-w>',
  { desc = 'Replace selected text in current file' }
)
-- NOTE: this can be done using ast-grep as command
keymap(
  'x',
  '<leader>R',
  'y:vimgrep /<c-r>0/ ** | copen |cdo %s/<c-r>0/replace/gc<left><left><left><c-w>',
  { desc = 'Replace selected text in all files' }
)
