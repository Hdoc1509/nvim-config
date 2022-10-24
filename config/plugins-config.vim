let plugins = [
  \ 'nvim-lspconfig',
  \ 'nvim-cmp',
  \ 'gitsigns',
  \ 'nightfox',
  \ 'nerdtree',
  \ 'emmet',
  \ 'lightline',
  \ 'virt-column',
  \ 'nvim-colorizer',
  \ 'indent-blankline',
  \ 'formatter',
  \ 'fzf',
  \ 'nvim-surround',
  \ 'treesitter',
  \ ]

for plugin in plugins
  call SourcePlugin(plugin)
endfor

