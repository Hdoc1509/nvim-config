local config = function()
  local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
  local parsers_to_install = require('plugins.treesitter.ensure-installed')
  local textobjects = require('plugins.treesitter.textobjects')

  require('nvim-treesitter.install').prefer_git = false
  require('nvim-treesitter.install').compilers = { 'zig', 'gcc' }

  require('hygen.tree-sitter').setup()

  ---@diagnostic disable-next-line: inject-field
  parser_config.gh_actions_expressions = {
    install_info = {
      url = 'https://github.com/Hdoc1509/tree-sitter-gh-actions-expressions',
      files = { 'src/parser.c' },
      -- requires Node.js and tree-sitter to be installed
      requires_generate_from_grammar = true,
    },
  }

  ---@diagnostic disable-next-line: missing-fields
  require('nvim-treesitter.configs').setup({
    ensure_installed = parsers_to_install,
    highlight = { enable = true },
    textobjects = textobjects,
    sync_install = #vim.api.nvim_list_uis() == 0,
  })

  require('plugins.treesitter.register').setup()
  require('plugins.treesitter.directives').setup()
  require('plugins.treesitter.predicates').setup()
end

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    -- { dir = '~/dev/hygen.nvim' },
    -- { 'Hdoc1509/hygen.nvim', version = '*' },
    { 'Hdoc1509/hygen.nvim', branch = '0.3.1-next' },
    {
      -- FIX: try to set comment correctly for ejs files
      'JoosepAlviste/nvim-ts-context-commentstring',
      ---@type ts_context_commentstring.Config
      opts = {
        enable_autocmd = false,
      },
    },
    {
      'windwp/nvim-ts-autotag',
      ---@type nvim-ts-autotag.PluginSetup
      opts = {
        aliases = {
          ejs = 'html',
        },
      },
      event = { 'BufReadPre', 'BufNewFile' },
    },
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = config,
  event = { 'BufReadPre', 'BufNewFile' },
  -- NOTE: until update to nvim-0.10
  commit = '377039daa260b71f304c881d1b21d643c501a261',
}
