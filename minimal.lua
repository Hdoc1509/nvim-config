require('globals')
require('options')

vim.cmd([[
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'EdenEast/nightfox.nvim'
call plug#end()
]])

require('plugins.lightline')
require('plugins.nightfox')
