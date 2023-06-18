let core_files = [
  \ 'globals.lua',
  \ 'options.vim',
  \ 'autocmds.lua',
  \ 'plugins.vim',
  \ 'maps.vim' ,
  \ 'colors.vim' ,
  \]

for file in core_files
  execute 'source ' . stdpath('config') . '/core/' . file
endfor

