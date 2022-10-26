function! SourceConfig(file)
  let fullPath = g:configPath . '/config/' . a:file . '.vim'
  exec 'source ' . fullPath
endfunction

