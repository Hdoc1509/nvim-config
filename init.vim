set runtimepath^=~/.vim runtimepath+=/.vim/after
let &packpath=&runtimepath
let g:configPath = stdpath('config')

exec 'so ' . g:configPath  . '/utils/source.vim'

call SourceConfig('settings')
call SourceConfig('plugins-call')
call SourceConfig('plugins-config')
call SourceConfig('maps')
call SourceConfig('neovide')

colorscheme carbonfox

