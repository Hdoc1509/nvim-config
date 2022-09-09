set runtimepath^=~/.vim runtimepath+=/.vim/after
let &packpath=&runtimepath

so ~/.config/nvim/config/settings.vim
so ~/.config/nvim/plugins/plugins.vim
so ~/.config/nvim/plugins/plugins-config.vim
so ~/.config/nvim/config/maps.vim
so ~/.config/nvim/config/neovide.vim

colorscheme carbonfox

let g:lightline = {
      \ 'colorscheme': 'powerlineish',
      \ 'active': {
      \   'right': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

let NERDTreeQuitOnOpen=1
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "➜",
    \ "Untracked" : "U",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
