let plugins = [ 'nvim-lspconfig', 'nvim-cmp', 'gitsigns', 'nightfox', 'nerdtree', 'closetag', 'emmet', 'lightline', 'virt-column' ]

for plugin in plugins
  call SourcePlugin(plugin)
endfor

