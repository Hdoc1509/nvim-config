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
      'embedded_template',
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
      'vimdoc',
      'yaml',
    },
    sync_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true }, -- nvim-ts-autotag
  })

  vim.treesitter.language.register('embedded_template', 'ejs')
end

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    {
      'JoosepAlviste/nvim-ts-context-commentstring',
      config = function()
        require('ts_context_commentstring').setup({
          enable_autocmd = false,
        })
      end,
    },
    'windwp/nvim-ts-autotag',
  },
  config = config,
  event = { 'BufReadPre', 'BufNewFile' },
}
