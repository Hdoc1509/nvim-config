local utils = require('utils')

local nmap_expr = utils.nmap_expr
local map_notify = utils.map_notify
local nmap = utils.nmap
local cmd = vim.cmd

-- Edit config file
nmap('<Leader>sv', function()
  map_notify('Sourcing $MYVIMRC file...')
  cmd('source $MYVIMRC')
end)

nmap('<Leader>sf', function()
  map_notify('Sourcing current file...')
  cmd('source %')
end)

-- Copy to clipboard all text
nmap('<Leader>ya', function()
  cmd('%yank')
end)

-- Formatter
nmap('<Leader>f', function()
  map_notify('Formatting...')
  cmd('Format')
end)

nmap('<Leader>fw', function()
  map_notify('Formatting and writing...')
  cmd('FormatWrite')
end)

-- Nvim-ufo
nmap('zR', require('ufo').openAllFolds)

nmap('zM', require('ufo').closeAllFolds)

-- Add blankline below current line
nmap_expr('<Leader>o', "printf('m`%so<ESC>``', v:count1)")

-- Add blankline above current line
nmap_expr('<Leader>O', "printf('m`%sO<ESC>``', v:count1)")
