set number
set numberwidth=1
set relativenumber

set cursorline
set guicursor=a:blinkwait500-blinkoff500-blinkon500-Cursor

set mouse=a
set clipboard=unnamed

syntax enable

set showcmd
set laststatus=2

set ruler
set colorcolumn=80,100,120

set signcolumn=auto

set encoding=utf-8

set showmatch

set splitright
set nosplitbelow

set expandtab
set shiftwidth=2

set nobackup
set noswapfile
set nowritebackup

set fileformat=unix
set fileformats=unix,dos

set termguicolors

set updatetime=500

set title

let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

if has('win32') | set shell=cmd | endif

