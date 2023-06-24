let core_files = [
  \ 'globals.lua',
  \ 'autocmds.lua',
  \ 'plugins.vim',
  \]

lua require('options')

for file in core_files
  execute 'source ' . stdpath('config') . '/core/' . file
endfor

lua require('maps')
