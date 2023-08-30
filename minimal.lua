require('globals')
require('options')
require('lazy_bootstrap')
require('lazy').setup({
  { import = 'plugins.lightline' },
  { import = 'plugins.nightfox' },
  { 'jiangmiao/auto-pairs' },
})
require('maps')
