let plugins_config = [
  \ 'emmet.vim',
  \ 'nvim-lspconfig.lua',
  \ 'cmp.lua',
  \ 'gitsigns.lua',
  \ 'nightfox.lua',
  \ 'nerdtree.vim',
  \ 'lightline.vim',
  \ 'virt-column.vim',
  \ 'nvim-colorizer.lua',
  \ 'indent-blankline.lua',
  \ 'formatter.lua',
  \ 'fzf.vim',
  \ 'nvim-surround.lua',
  \ 'treesitter.lua',
  \ 'notify.lua',
  \ ]

for plugin in plugins_config
  exec 'so ' . g:configPath . '/plugins/' . plugin
endfor

