require('user.globals')
require('user.options')
require('user.filetypes')
require('user.autocmds')
require('user.lazy_bootstrap')
require('lazy').setup('plugins', {
  install = {
    colorscheme = { 'carbonfox' },
  },
  ui = {
    size = {
      width = 1,
      height = 0.9,
    },
  },
})
require('user.maps')
require('user.diagnostic')
