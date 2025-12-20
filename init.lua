require('globals')
require('options')
require('filetypes')
require('autocmds')
require('lazy_bootstrap')
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
  dev = {
    path = '~/dev/nvim-plugins',
  },
})
require('maps')
require('diagnostic')
