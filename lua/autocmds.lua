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

-- quickfix list
autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    local bufnr = vim.fn.bufnr('%')

    nmap('e', '<cr>:cclose<cr>', {
      buffer = bufnr,
      desc = 'Select item and close quickfix list',
    })

    nmap('gt', '<c-w><cr><c-w>Tg<tab><cmd>copen<cr>', {
      buffer = bufnr,
      desc = 'Open item in new tab (silent)',
    })
    nmap('gT', '<c-w><cr>:cclose<cr><c-w>T', {
      buffer = bufnr,
      desc = 'Open item in new tab',
    })

    -- TODO: add to README.md
    nmap('gs', '<c-w><cr>:copen<cr>', {
      buffer = bufnr,
      desc = 'Open item in new split (silent)',
    })
    nmap('gS', '<c-w><cr>:cclose<cr>', {
      buffer = bufnr,
      desc = 'Open item in new split',
    })
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
