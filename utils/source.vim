let g:rootPath = expand('~/.config/nvim')

function! SourceConfig(relativePath)
  let fullPath = g:rootPath . '/config/' . a:relativePath . '.vim'
  exec 'source ' . fullPath
endfunction

function! SourcePlugin(relativePath)
  let fullPath = g:rootPath . '/plugins/' . a:relativePath . '.vim'
  exec 'source ' . fullPath
endfunction

