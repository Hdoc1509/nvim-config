let g:lightline = {
  \ 'colorscheme': 'powerlineish',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': { 'gitbranch': 'FugitiveHead' },
  \ }

