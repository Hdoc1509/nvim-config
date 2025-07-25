local utils = require('utils')
local autocmd = utils.autocmd
local nmap = utils.nmap

autocmd('VimResized', { command = 'tabdo wincmd =' })

-- Close some filetypes with <q>
autocmd('FileType', {
  pattern = { 'qf', 'help', 'checkhealth', 'git' },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    nmap('q', '<cmd>close<cr>', { buffer = event.buf })
  end,
})

-- highlight copied (yanked) text
autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = 'HighlightYank' })
  end,
})

-- https://github.com/neovim/neovim/issues/26346#issuecomment-1872418636
autocmd('CmdwinEnter', {
  pattern = '[:>]',
  group = vim.api.nvim_create_augroup('cmdwin_syntax', {}),
  callback = function()
    local is_loadable = pcall(vim.treesitter.language.add, 'vim')

    if is_loadable then
      vim.cmd('set syntax=vim')
    end
  end,
})
