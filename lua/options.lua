local set = vim.o

set.number = true
set.numberwidth = 1
set.relativenumber = true

set.cursorline = true
set.guicursor = 'a:blinkwait500-blinkoff500-blinkon500-Cursor'

set.mouse = 'a'
set.clipboard = 'unnamedplus'

set.colorcolumn = '80,100,120'

set.encoding = 'utf-8'

set.showmatch = true
set.ignorecase = true
set.smartcase = true

set.showmode = false
-- set.showtabline = 2

set.splitright = true
set.splitbelow = false

set.expandtab = false
set.tabstop = 2
set.shiftwidth = 2

set.backup = false
set.swapfile = false
set.writebackup = false

set.fileformat = 'unix'
set.fileformats = 'unix,dos'

set.termguicolors = true

set.updatetime = 500

set.title = true

set.foldcolumn = '1'
set.foldlevel = 99
set.foldlevelstart = 99
set.foldenable = true
set.fillchars = 'eob: ,fold: ,foldopen:󰚶,foldsep: ,foldclose:󰨃'

set.signcolumn = 'yes:1'

set.wrap = false

set.laststatus = 3

set.winborder = 'rounded'

vim.cmd([[if has('win32') | set shell=cmd | endif]])
