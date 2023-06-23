local utils = require('utils')

local nmap_expr = utils.nmap_expr
local map_notify = utils.map_notify
local nmap = utils.nmap

nmap('<Leader>sv', function()
  map_notify('Sourcing $MYVIMRC file...')
  vim.cmd('source $MYVIMRC')
end)

-- Copy to clipboard all text
nmap('<Leader>ya', '<cmd>%yank<CR>')

-- Add blankline below current line
nmap_expr('<Leader>o', "printf('m`%so<ESC>``', v:count1)")

-- Add blankline above current line
nmap_expr('<Leader>O', "printf('m`%sO<ESC>``', v:count1)")
