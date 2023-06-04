if !exists("*ShellAliasesToTable")
  function ShellAliasesToTable() range
    let linesRange = a:firstline . ',' . a:lastline
    let commands = ['s/^alias/|/e', "s/='/ | /e", "s/'$/ |/e", "g/^$/d"]

    for command in commands | silent exec linesRange . command | endfor

    silent execute a:firstline . "norm O| Alias | Command |\n| -- | -- |"
  endfunction
endif

if !hasmapto('ShellAliasesToTable')
  xnoremap <buffer> <silent> <Leader>sat :'<,'>call ShellAliasesToTable() \| FormatWrite<CR>
endif

