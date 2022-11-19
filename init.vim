let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:configPath = stdpath('config')
let g:browser = 'chrome'

exec 'so ' . g:configPath  . '/utils.vim'

call SourceConfig('options')
call SourceConfig('plugins')
call SourceConfig('plugins-config')
call SourceConfig('maps')
call SourceConfig('colors')

