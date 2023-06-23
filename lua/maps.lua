local utils = require('utils')

local nmap_expr = utils.nmap_expr
local nmap = utils.nmap

nmap('<Leader>sv', function()
  vim.cmd('source $MYVIMRC')
  vim.notify('Neovim config succesfully reloaded!', 'info')
end)

-- Copy to clipboard all text
nmap('<Leader>ya', '<cmd>%yank<CR>')

-- Add blankline below current line
nmap_expr('<Leader>o', "printf('m`%so<ESC>``', v:count1)")

-- Add blankline above current line
nmap_expr('<Leader>O', "printf('m`%sO<ESC>``', v:count1)")
