local config = function()
  local nmap = require('utils').nmap

  -- Use these options if fzf options are not set by user shell
  if not vim.fn.empty(vim.env.FZF_DEFAULT_COMMAND) then
    vim.cmd([[
    let exclude = {
      \ 'dir' : ['dist', 'node_modules', '.git'],
      \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
      \ '*.gif', '*.svg', '*.ico', '*.db', '*.tgz', '*.tar.gz', '*.gz',
      \ '*.zip', '*.bin', '*.pptx', '*.xlsx', '*.docx', '*.pdf', '*.tmp',
      \ '*.wmv', '*.mkv', '*.mp4', '*.rmvb', '*.ttf', '*.ttc', '*.otf',
      \ '*.mp3', '*.aac', 'package-lock.json', 'pnpm-lock.yaml']
      \ }

    let g:fzf_exclude = join(exclude.file, ',') . ',' . join(exclude.dir, ',')
    ]])

    vim.env.FZF_DEFAULT_COMMAND = "fd --type f --hidden --follow --no-ignore --exclude={'" .. vim.g.fzf_exclude .. "'}"
    vim.env.FZF_DEFAULT_OPTS = '--layout=reverse'
  end

  nmap('<Leader>e', '<cmd>FZF<CR>')
end

return {
  'junegunn/fzf',
  config = config,
}
