set runtimepath^=~/.vim runtimepath+=/.vim/after
let &packpath=&runtimepath

so ~/.config/nvim/config/settings.vim
so ~/.config/nvim/plugins/plugins.vim
so ~/.config/nvim/plugins/plugins-config.vim
so ~/.config/nvim/config/maps.vim
so ~/.config/nvim/config/neovide.vim

colorscheme carbonfox

