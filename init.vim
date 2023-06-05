let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:browser = 'firefox'

let core_files = [
  \ 'options.vim',
  \ 'plugins.vim',
  \ 'maps.vim' ,
  \ 'colors.vim' ,
  \]

for file in core_files
  execute 'source ' . stdpath('config') . '/core/' . file
endfor

