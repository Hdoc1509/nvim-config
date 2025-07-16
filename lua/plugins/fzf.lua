local config = function()
  -- Use these options if fzf options are not set by user shell
  if vim.fn.empty(vim.env.FZF_DEFAULT_COMMAND) == 1 then
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
    vim.env.FZF_DEFAULT_OPTS = '--layout=reverse --exact'
  end
end

return {
  {
    'junegunn/fzf',
    config = config,
    build = './install --bin', -- ensure latest version for neovim
    keys = {
      { '<leader>e', '<cmd>FZF<cr>' },
    },
  },
  {
    'junegunn/fzf.vim',
    dependencies = 'junegunn/fzf',
    keys = {
      { '<leader>E', '<cmd>Buffers<cr>' },
      { '<leader>?', '<cmd>Helptags<cr>' },
      { '<leader>R', '<cmd>Rg<cr>' },
      { '<leader>D', '<cmd>GFiles?<cr>' },
    },
  },
}
