local config = function()
  local directives = require('plugins.treesitter.directives')
  local langs_to_register = require('plugins.treesitter.register')
  local parsers_to_install = require('plugins.treesitter.ensure-installed')

  require('nvim-treesitter.install').prefer_git = false
  require('nvim-treesitter.install').compilers = { 'zig', 'gcc' }

  require('nvim-treesitter.configs').setup({
    ensure_installed = parsers_to_install,
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true }, -- nvim-ts-autotag
  })

  -- REGISTER LANGUAGES
  for parser_name, filetype in pairs(langs_to_register) do
    vim.treesitter.language.register(parser_name, filetype)
  end

  -- DIRECTIVES
  for directive, callback in pairs(directives) do
    vim.treesitter.query.add_directive(directive, callback, {})
  end
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
