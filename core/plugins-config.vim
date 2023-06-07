lua require('plugins')

"""""""""""""""""""" FZF """"""""""""""""""""
let exclude = {
  \ 'dir' : ['dist', 'node_modules', '.git'],
  \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
  \ '*.gif', '*.svg', '*.ico', '*.db', '*.tgz', '*.tar.gz', '*.gz',
  \ '*.zip', '*.bin', '*.pptx', '*.xlsx', '*.docx', '*.pdf', '*.tmp',
  \ '*.wmv', '*.mkv', '*.mp4', '*.rmvb', '*.ttf', '*.ttc', '*.otf',
  \ '*.mp3', '*.aac', 'package-lock.json']
  \ }

let total_exclude = join(exclude.file, ',') . ',' . join(exclude.dir, ',')

let $FZF_DEFAULT_COMMAND="fd --exclude={'". total_exclude . "'} --type f --hidden --follow --no-ignore"
let $FZF_DEFAULT_OPTS='--layout=reverse'

"""""""""""""""""""" Markdonw-preview """"""""""""""""""""
let g:mkdp_theme = 'dark'

"""""""""""""""""""" Nerdcommenter """"""""""""""""""""
let g:NERDSpaceDelims = 1

"""""""""""""""""""" Vim-vsnip """"""""""""""""""""
" Jump forward or backward
inoremap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
snoremap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
inoremap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
snoremap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Extend filetypes
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.typescript = ['javascript']
