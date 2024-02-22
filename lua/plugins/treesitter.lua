local config = function()
  require('nvim-treesitter.install').prefer_git = false
  require('nvim-treesitter.install').compilers = { 'zig', 'gcc' }

  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'astro',
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
end

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    'windwp/nvim-ts-autotag',
  },
  config = config,
  event = { 'BufReadPre', 'BufNewFile' },
}
