require('user.globals')
require('user.options')
require('user.lazy_bootstrap')
require('lazy').setup({
  { import = 'plugins.lightline' },
  { import = 'plugins.colorscheme' },
})
require('user.maps')
