function! SourceConfig(file)
  let fullPath = g:configPath . '/core/' . a:file . '.vim'
  exec 'source ' . fullPath
endfunction

