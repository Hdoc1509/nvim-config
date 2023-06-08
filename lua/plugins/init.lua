local plugins_config = {
  'lspconfig',
  'cmp',
  'gitsigns',
  'nightfox',
  'nvim-tree',
  'lightline',
  'virt-column',
  'highlight-colors',
  'indent-blankline',
  'formatter',
  'surround',
  'treesitter',
  'notify',
  'todo-comments',
  'vim-vsnip',
  'rest-nvim',
  'nvim-ufo',
  'statuscol',
}

for _, plugin in ipairs(plugins_config) do
  require('plugins.' .. plugin)
end
