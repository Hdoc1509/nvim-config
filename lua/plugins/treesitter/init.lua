local config = function()
  local parsers_to_install = require('plugins.treesitter.ensure-installed')
  local textobjects = require('plugins.treesitter.textobjects')

  require('nvim-treesitter.install').prefer_git = false
  require('nvim-treesitter.install').compilers = { 'zig', 'gcc' }

  require('hygen.tree-sitter').setup()
  require('gh-actions.tree-sitter').setup({
    from_grammar = true,
    revision = 'v0.5.0',
  })
  require('vim-map-side.tree-sitter').setup({
    from_grammar = true,
    revision = 'v0.1.0',
    custom_fns = {
      keymap = { 'keymap', 'utils.keymap' },
      modemap = { 'nmap', 'buf_nmap', 'utils.nmap' },
    },
  })

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
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      { 'Hdoc1509/hygen.nvim', version = '^0.4.2', dev = false },
      { 'Hdoc1509/gh-actions.nvim', version = '^0.2.0', dev = false },
      { 'Hdoc1509/vim-map-side.nvim', version = '^0.2.1', dev = false },
      { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'master' },
    },
    config = config,
    branch = 'master',
    event = { 'BufReadPre', 'BufNewFile' },
    -- NOTE: until update to nvim-0.10
    commit = '377039daa260b71f304c881d1b21d643c501a261',
  },
  {
    -- FIX: try to set comment correctly for ejs files
    'JoosepAlviste/nvim-ts-context-commentstring',
    opts = {
      enable_autocmd = false,
    },
  },
}
