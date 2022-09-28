function! SourceConfig(relativePath)
  let fullPath = g:configPath . '/config/' . a:relativePath . '.vim'
  exec 'source ' . fullPath
endfunction

function! SourcePlugin(relativePath)
  let fullPath = g:configPath . '/plugins/' . a:relativePath . '.vim'
  exec 'source ' . fullPath
endfunction

