function! SourceConfig(file)
  let fullPath = g:configPath . '/config/' . a:file . '.vim'
  exec 'source ' . fullPath
endfunction

function! SourcePlugin(file)
  let fullPath = g:configPath . '/plugins/' . a:file
  exec 'source ' . fullPath
endfunction

