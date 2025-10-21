local config = function()
  local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
  local parsers_to_install = require('plugins.treesitter.ensure-installed')
  local textobjects = require('plugins.treesitter.textobjects')

  require('nvim-treesitter.install').prefer_git = false
  require('nvim-treesitter.install').compilers = { 'zig', 'gcc' }

  ---@diagnostic disable-next-line: inject-field
  parser_configs.vim_map_side = {
    install_info = {
      url = 'https://github.com/Hdoc1509/tree-sitter-vim-map-side',
      files = { 'src/parser.c' },
      requires_generate_from_grammar = true,
      revision = '83b142872e0f66d6fe2335ec5e2b62af793eb71a',
    },
    filetype = 'vms',
  }

  require('hygen.tree-sitter').setup()
  require('gh-actions.tree-sitter').setup({ from_grammar = true })

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
    -- { dir = '~/dev/nvim-plugins/hygen.nvim' },
    -- { 'Hdoc1509/hygen.nvim', version = '*' },
    { 'Hdoc1509/hygen.nvim', branch = '0.3.1-next' },
    -- { dir = '~/dev/nvim-plugins/gh-actions.nvim' },
    { 'Hdoc1509/gh-actions.nvim', version = '*' },
    -- { 'Hdoc1509/hygen.nvim', branch = 'name' },
    {
      -- FIX: try to set comment correctly for ejs files
      'JoosepAlviste/nvim-ts-context-commentstring',
      opts = {
        enable_autocmd = false,
      },
    },
    {
      'windwp/nvim-ts-autotag',
      opts = {
        aliases = {
          ejs = 'html',
        },
      },
    },
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = config,
  event = { 'BufReadPre', 'BufNewFile' },
  -- NOTE: until update to nvim-0.10
  commit = '377039daa260b71f304c881d1b21d643c501a261',
}
