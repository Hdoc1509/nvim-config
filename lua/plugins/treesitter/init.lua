local config = function()
  local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
  local directives = require('plugins.treesitter.directives')
  local predicates = require('plugins.treesitter.predicates')
  local langs_to_register = require('plugins.treesitter.register')
  local parsers_to_install = require('plugins.treesitter.ensure-installed')
  local textobjects = require('plugins.treesitter.textobjects')

  require('nvim-treesitter.install').prefer_git = false
  require('nvim-treesitter.install').compilers = { 'zig', 'gcc' }

  require('hygen.tree-sitter').setup()

  ---@diagnostic disable-next-line: inject-field
  parser_config.githubactions = {
    install_info = {
      url = 'https://github.com/disrupted/tree-sitter-github-actions',
      files = { 'src/parser.c' },
      branch = 'main',
    },
  }

  ---@diagnostic disable-next-line: missing-fields
  require('nvim-treesitter.configs').setup({
    ensure_installed = parsers_to_install,
    highlight = { enable = true },
    textobjects = textobjects,
    sync_install = #vim.api.nvim_list_uis() == 0,
  })

  -- REGISTER LANGUAGES
  for parser_name, filetype in pairs(langs_to_register) do
    vim.treesitter.language.register(parser_name, filetype)
  end

  -- DIRECTIVES
  for _, directive in ipairs(directives) do
    vim.treesitter.query.add_directive(directive.name, directive.callback, directive.opts)
  end

  -- PREDICATES
  for _, predicate in ipairs(predicates) do
    vim.treesitter.query.add_predicate(predicate.name, predicate.callback, predicate.opts)
  end
end

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    -- { dir = '~/dev/hygen.nvim' },
    { 'Hdoc1509/hygen.nvim', version = '*' },
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
