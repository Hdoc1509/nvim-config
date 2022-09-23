set runtimepath^=~/.vim runtimepath+=/.vim/after
let &packpath=&runtimepath

so ~/.config/nvim/utils/source.vim

call SourceConfig('settings')
call SourcePlugin('plugins-call')
call SourcePlugin('plugins-config')
call SourceConfig('maps')
call SourceConfig('neovide')

colorscheme carbonfox

