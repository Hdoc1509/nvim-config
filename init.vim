lua require('globals')
lua require('options')
lua require('autocmds')
execute 'source ' . stdpath('config') . '/core/plugins.vim'
lua require('maps')
