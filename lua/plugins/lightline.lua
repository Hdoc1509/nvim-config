vim.g.lightline = {
  colorscheme = 'powerlineish',
  active = {
    left = {
      { 'mode', 'paste' },
      { 'gitbranch', 'readonly', 'filename', 'modified' },
    },
  },
  component_function = { gitbranch = 'FugitiveHead' },
  enable = { tabline = 0 },
}

return {
  'itchyny/lightline.vim',
  dependencies = {
    'tpope/vim-fugitive',
  },
}
