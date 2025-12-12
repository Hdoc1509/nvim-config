local lsp_log = require('vim.lsp.log')
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

-- Search highlighting
nmap('<leader>/', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlighting' })

-- Help in vertical split
vim.cmd('cabbrev vh vertical help')
-- Help in new tab
vim.cmd('cabbrev th tab help')

-- override default mapping to open float window
nmap(']d', function()
  vim.diagnostic.jump({ count = vim.v.count1, float = true })
end, { desc = 'Go to next diagnostic' })
-- override default mapping to open float window
nmap('[d', function()
  vim.diagnostic.jump({ count = vim.v.count1 * -1, float = true })
end, { desc = 'Go to previous diagnostic' })
nmap('gdl', vim.diagnostic.setqflist, { desc = 'Show all diagnostics on quickfix list' })

-- source file
nmap('<leader><leader>x', '<cmd>source %<cr>', { desc = 'Source current file' })

-- execute line(s)
nmap('<leader>x', ':.lua<cr>', { desc = 'Execute current line' })
keymap('v', '<leader>x', ':lua<cr>', { desc = 'Execute selected lines' })

-- LSP log
nmap('<leader>ll', function()
  if lsp_log.get_level() == vim.lsp.log_levels.OFF then
    vim.lsp.set_log_level('debug')
    utils.map_notify('LSP log enabled')
  else
    vim.lsp.set_log_level('off')
    utils.map_notify('LSP log disabled')
  end
end, { desc = 'Toggle LSP log' })
