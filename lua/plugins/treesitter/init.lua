local config = function()
  local langs_to_register = require('plugins.treesitter.register')
  local parsers_to_install = require('plugins.treesitter.ensure-installed')
  local textobjects = require('plugins.treesitter.textobjects')

  require('nvim-treesitter.install').prefer_git = false
  require('nvim-treesitter.install').compilers = { 'zig', 'gcc' }

  require('hygen.tree-sitter').setup()

  ---@diagnostic disable-next-line: missing-fields
  require('nvim-treesitter.configs').setup({
    ensure_installed = parsers_to_install,
    highlight = { enable = true },
    indent = { enable = true },
    textobjects = textobjects,
  })

  -- REGISTER LANGUAGES
  for parser_name, filetype in pairs(langs_to_register) do
    vim.treesitter.language.register(parser_name, filetype)
  end
end

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    -- { dir = '~/dev/hygen.nvim' },
    { 'Hdoc1509/hygen.nvim', tag = 'v0.2.0' },
    {
      'JoosepAlviste/nvim-ts-context-commentstring',
      config = function()
        ---@diagnostic disable-next-line: missing-fields
        require('ts_context_commentstring').setup({
          enable_autocmd = false,
        })
      end,
    },
    {
      'windwp/nvim-ts-autotag',
      config = true,
      event = { 'BufReadPre', 'BufNewFile' },
    },
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = config,
  event = { 'BufReadPre', 'BufNewFile' },
}
