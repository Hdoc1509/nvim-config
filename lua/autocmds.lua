local utils = require('utils')
local autocmd = utils.autocmd
local nmap = utils.nmap

autocmd('VimResized', {
  callback = function()
    vim.cmd('tabdo wincmd =')
  end,
})

-- Close some filetypes with <q>
autocmd('FileType', {
  pattern = {
    'qf',
    'help',
    'checkhealth',
    'git',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    nmap('q', '<cmd>close<cr>', { buffer = event.buf })
  end,
})

-- Autoclose lsp quickfix list when select item with <e>
autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    local bufnr = vim.fn.bufnr('%')
    nmap('e', function()
      vim.api.nvim_command([[execute "normal! \<cr>"]])
      vim.api.nvim_command(bufnr .. 'bd')
    end, { buffer = bufnr })
  end,
})

-- set foldmethod=marker for .conf files
autocmd('FileType', {
  pattern = 'conf',
  callback = function()
    vim.wo.foldmethod = 'marker'
  end,
})

autocmd('TermOpen', {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
    vim.opt_local.foldcolumn = '0'
  end,
})

-- FIX: this is causing nvim to auto-close the buffer for `:Git diff` when using
-- `delta` as the diff tool
-- autocmd('TermClose', {
--   callback = function()
--     vim.cmd("execute 'bdelete! ' . expand('<abuf>')")
--   end,
-- })

-- highlight copied (yanked) text
autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = 'HighlightYank' })
  end,
})
