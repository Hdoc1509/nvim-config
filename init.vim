set runtimepath^=~/.vim runtimepath+=/.vim/after
let &packpath=&runtimepath

so ~/.config/nvim/utils/source.vim

call SourceConfig('settings')
call SourceConfig('plugins-call')
call SourceConfig('plugins-config')
call SourceConfig('maps')
call SourceConfig('neovide')

colorscheme carbonfox

