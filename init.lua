require('globals')
require('options')
require('filetypes')
require('autocmds')
require('lazy_bootstrap')
require('lazy').setup('plugins', {
  install = {
    colorscheme = { 'carbonfox' },
  },
})
require('maps')
require('diagnostic')
