let plugins_config = [
  \ 'lspconfig.lua',
  \ 'cmp.lua',
  \ 'gitsigns.lua',
  \ 'nightfox.lua',
  \ 'nvim-tree.lua',
  \ 'lightline.vim',
  \ 'virt-column.vim',
  \ 'highlight-colors.lua',
  \ 'indent-blankline.lua',
  \ 'formatter.lua',
  \ 'fzf.vim',
  \ 'surround.lua',
  \ 'treesitter.lua',
  \ 'notify.lua',
  \ 'todo-comments.lua',
  \ 'vim-vsnip.vim',
  \ 'markdown-preview.vim',
  \ ]

for plugin in plugins_config
  exec 'so ' . g:configPath . '/plugins/' . plugin
endfor

