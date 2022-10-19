let g:configPath = stdpath('config')

exec 'so ' . g:configPath  . '/utils/source.vim'

call SourceConfig('options')
call SourceConfig('plugins-call')
call SourceConfig('plugins-config')
call SourceConfig('maps')
call SourceConfig('neovide')
call SourceConfig('colors')

