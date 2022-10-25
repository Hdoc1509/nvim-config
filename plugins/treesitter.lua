require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'bash', 'css', 'gitignore', 'html', 'javascript', 'json', 'lua', 'scss', 'typescript', 'yaml' },
  highlight = {
    enable = true,
    disable = { 'vim' },
  },
  indent = { enable = true },
  -- Config for nvim-ts-autotag
  autotag = { enable = true },
}

