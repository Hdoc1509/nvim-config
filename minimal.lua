require('globals')
require('options')
require('lazy_bootstrap')
require('lazy').setup({
  { import = 'plugins.lightline' },
  { import = 'plugins.colorscheme' },
  { 'jiangmiao/auto-pairs' },
})
require('maps')
