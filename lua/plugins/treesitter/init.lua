local config = function()
  local parsers_to_install = require('plugins.treesitter.ensure-installed')
  local textobjects = require('plugins.treesitter.textobjects')

  require('nvim-treesitter.install').prefer_git = false
  require('nvim-treesitter.install').compilers = { 'zig', 'gcc' }

  require('hygen.tree-sitter').setup()
  require('gh-actions.tree-sitter').setup({ from_grammar = true })
  require('vim-map-side.tree-sitter').setup({
    from_grammar = true,
    revision = 'v0.1.0',
    custom_fns = {
      keymap = { 'keymap', 'utils.keymap' },
      modemap = { 'nmap', 'buf_nmap', 'utils.nmap' },
    },
  })
  require('plugins.treesitter.parsers').setup()

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
    -- '~/dev/nvim-plugins/hygen.nvim',
    { 'Hdoc1509/hygen.nvim', version = '^0.4.2' },
    -- { 'Hdoc1509/hygen.nvim', branch = '0.3.1-next' },
    -- '~/dev/nvim-plugins/gh-actions.nvim',
    { 'Hdoc1509/gh-actions.nvim', version = '^0.2.0' },
    -- { 'Hdoc1509/gh-actions.nvim', branch = 'master' },
    -- { dir = '~/dev/nvim-plugins/vim-map-side.nvim' },
    { 'Hdoc1509/vim-map-side.nvim', version = '^0.2.0' },
    -- { 'Hdoc1509/vim-map-side.nvim', branch = 'master' },
    {
      -- FIX: try to set comment correctly for ejs files
      'JoosepAlviste/nvim-ts-context-commentstring',
      opts = {
        enable_autocmd = false,
      },
    },
    -- NOTE: use `main` branch once it defines a range of supported versions of neovim
    { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'master' },
  },
  config = config,
  lazy = false,
  -- NOTE: until update to nvim-0.11 in `main` branch
  branch = 'master',
}
