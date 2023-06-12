local plugins_config = {
  'lsp',
  'cmp',
  'gitsigns',
  'nightfox',
  'nvim-tree',
  'lightline',
  'virt-column',
  'highlight-colors',
  'indent-blankline',
  'formatter',
  'fzf',
  'surround',
  'treesitter',
  'notify',
  'todo-comments',
  'vim-vsnip',
  'markdown-preview',
  'nerdcommenter',
  'rest-nvim',
  'nvim-ufo',
  'statuscol',
}

for _, plugin in ipairs(plugins_config) do
  require('plugins.' .. plugin)
end
