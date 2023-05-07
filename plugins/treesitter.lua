require('nvim-treesitter.install').compilers = { 'zig', 'gcc' }

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'c',
    'cpp',
    'bash',
    'css',
    'gitignore',
    'html',
    'javascript',
    'jsdoc',
    'jsonc',
    'lua',
    'scss',
    'typescript',
    'vim',
    'yaml',
  },
  highlight = { enable = true },
  indent = { enable = true },
  -- Config for nvim-ts-autotag
  autotag = { enable = true },
})
