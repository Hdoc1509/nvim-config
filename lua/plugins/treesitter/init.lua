local config = function()
  local parsers_to_install = require('plugins.treesitter.ensure-installed')

  require('hygen.tree-sitter').setup()
  require('gh-actions.tree-sitter').setup({
    revision = 'v0.5.0',
  })
  require('vim-map-side.tree-sitter').setup({
    revision = 'v0.1.0',
    custom_fns = {
      keymap = { 'keymap', 'utils.keymap' },
      modemap = { 'nmap', 'buf_nmap', 'utils.nmap' },
    },
  })

  if #vim.api.nvim_list_uis() == 0 then
    require('nvim-treesitter').install(parsers_to_install):wait(300000)
  else
    require('nvim-treesitter').install(parsers_to_install)
  end

  require('plugins.treesitter.register').setup()
  require('plugins.treesitter.directives').setup()
  require('plugins.treesitter.predicates').setup()

  require('utils').autocmd('FileType', {
    callback = function()
      pcall(vim.treesitter.start)
    end,
  })
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      { 'Hdoc1509/hygen.nvim', version = '^0.4.2', dev = false },
      -- { 'Hdoc1509/hygen.nvim', branch = '0.3.1-next' },
      { 'Hdoc1509/gh-actions.nvim', version = '^0.2.0', dev = false },
      -- { 'Hdoc1509/gh-actions.nvim', branch = 'master' },
      { 'Hdoc1509/vim-map-side.nvim', version = '^0.2.1', dev = false },
      -- { 'Hdoc1509/vim-map-side.nvim', branch = 'master' },
    },
    config = config,
    lazy = false,
    branch = 'main',
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    init = function()
      vim.g.no_plugins_maps = true
    end,
    config = require('plugins.treesitter.textobjects').setup,
  },
  {
    -- FIX: try to set comment correctly for ejs files
    'JoosepAlviste/nvim-ts-context-commentstring',
    opts = {
      enable_autocmd = false,
    },
  },
}
