lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'bash', 'css', 'gitignore', 'html', 'javascript', 'json', 'lua', 'scss', 'typescript', 'yaml' },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
EOF
