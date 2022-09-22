let plugins_path = expand('~/.config/nvim/plugins')
let plugins = [ 'nvim-lspconfig', 'nvim-cmp', 'gitsigns', 'nightfox', 'nerdtree', 'closetag', 'emmet', 'lightline' ]

for plugin in plugins
  execute 'source ' . plugins_path . '/' . plugin . '.vim'
endfor

