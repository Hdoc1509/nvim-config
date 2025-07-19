local utils = require('utils')

local nmap = utils.nmap
local keymap = utils.keymap

require('maps.files')
require('maps.tabs')
require('maps.windows')
require('maps.text')

-- Jump to tags
nmap('<leader>[', '<c-w>]', { desc = 'jump to tag under cursor in a split' })
nmap('<leader>]', '<c-w>]<c-w>T', { desc = 'Jump to tag under cursor in a new tab' })

-- Scrolling
keymap({ 'n', 'x' }, '<leader>j', '10<c-e>', { desc = 'Scroll down 10 lines' })
keymap({ 'n', 'x' }, '<leader>J', '20<c-e>', { desc = 'Scroll down 20 lines' })
keymap({ 'n', 'x' }, '<leader>k', '10<c-y>', { desc = 'Scroll up 10 lines' })
keymap({ 'n', 'x' }, '<leader>K', '20<c-y>', { desc = 'Scroll up 20 lines' })

nmap('<leader>chh', '<cmd>checkhealth<cr>', { desc = 'Run :checkhealth' })

-- Search highlighting
nmap('<leader>/', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlighting' })

-- Help in vertical split
vim.cmd('cabbrev vh vertical help')
-- Help in new tab
vim.cmd('cabbrev th tab help')

nmap(']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
nmap('[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
nmap('<leader>dl', vim.diagnostic.setqflist, { desc = 'Show all diagnostics on quickfix list' })

-- source file
nmap('<leader><leader>x', '<cmd>source %<cr>', { desc = 'Source current file' })

-- NOTE: available since Neovim 0.10.0
-- execute line(s)
-- nmap('<leader>x', ':.lua<cr>', { desc = 'Execute current line' })
-- keymap('v', '<leader>x', ':lua<cr>', { desc = 'Execute selected lines' })

keymap('c', '<c-a>', '<Home>', { desc = 'Go to start of line' })
