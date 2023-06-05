function! SourceConfig(file)
  let fullPath = stdpath('config') . '/core/' . a:file . '.vim'
  exec 'source ' . fullPath
endfunction

