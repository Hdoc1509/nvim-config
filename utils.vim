function! SourceConfig(file)
  let fullPath = g:configPath . '/config/' . a:file . '.vim'
  exec 'source ' . fullPath
endfunction

function! ShellAliasesToTable() range
  let linesRange = a:firstline . ',' . a:lastline
  let commands = ['s/^alias/|/e', "s/='/ | /e", "s/'$/ |/e", "g/^$/d"]

  for command in commands | silent exec linesRange . command | endfor

  silent execute a:firstline . "norm O| Alias | Command |\n| -- | -- |"
endfunction
