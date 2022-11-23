let exclude = {
  \ 'dir' : ['dist'],
  \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
  \ '*.gif', '*.svg', '*.ico', '*.db', '*.tgz', '*.tar.gz', '*.gz',
  \ '*.zip', '*.bin', '*.pptx', '*.xlsx', '*.docx', '*.pdf', '*.tmp',
  \ '*.wmv', '*.mkv', '*.mp4', '*.rmvb', '*.ttf', '*.ttc', '*.otf',
  \ '*.mp3', '*.aac', 'package-lock.json']
  \ }

let total_exclude = join(exclude.file, ',') . ',' . join(exclude.dir, ',')

let $FZF_DEFAULT_COMMAND='fd --exclude={'. total_exclude . '} --type f --hidden --follow --exclude .git'
let $FZF_DEFAULT_OPTS='--layout=reverse'
