let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:browser = 'firefox'

exec 'so ' . stdpath('config')  . '/utils.vim'

call SourceConfig('options')
call SourceConfig('plugins')
call SourceConfig('maps')
call SourceConfig('colors')

