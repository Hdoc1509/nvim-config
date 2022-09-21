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

