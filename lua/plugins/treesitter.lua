require('nvim-treesitter.install').compilers = { 'zig', 'gcc' }

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'c',
    'cpp',
    'bash',
    'css',
    'gitignore',
    'html',
    'http',
    'javascript',
    'jsdoc',
    'jsonc',
    'lua',
    'markdown',
    'markdown_inline',
    'scss',
    'typescript',
    'tsx',
    'vim',
    'yaml',
  },
  sync_install = true,
  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true }, -- nvim-ts-autotag
  context_commentstring = { -- nvim-ts-context-commentstring
    enable = true,
    enable_autocmd = false,
  },
})
