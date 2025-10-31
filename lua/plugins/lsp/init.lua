local config = function()
  local nvim_lsp = require('lspconfig')
  local servers = require('plugins.lsp.servers')

  -- TODO: once updated to nvim 0.10 try to use the following setup logic
  -- instead of hooks:
  -- https://github.com/folke/lazydev.nvim/blob/main/lua/lazydev/lsp.lua
  require('plugins.lsp.servers.hooks').setup()
  require('plugins.lsp.attach').setup()

  for server, setting in pairs(servers) do
    nvim_lsp[server].setup(setting)
  end
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'b0o/schemastore.nvim',
    {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      dependencies = {
        {
          'williamboman/mason.nvim',
          -- NOTE: until update to nvim-0.10
          commit = '0f6fea935578039a271cdb52a5fdfcc58474bc5d',
        },
      },
      init = function()
        require('plugins.lsp.mason')
      end,
    },
    { 'folke/neodev.nvim', opts = {} },
    { 'folke/neoconf.nvim', opts = {} },
    -- { dir = '~/dev/nvim-plugins/hygen.nvim' },
    -- { 'Hdoc1509/hygen.nvim', version = '*' },
    { 'Hdoc1509/hygen.nvim', branch = '0.3.1-next' },
    -- { dir = '~/dev/nvim-plugins/gh-actions.nvim' },
    { 'Hdoc1509/gh-actions.nvim', version = '*' },
    -- { 'Hdoc1509/hygen.nvim', branch = 'master' },
    -- { dir = '~/dev/nvim-plugins/vim-map-side.nvim' },
    { 'Hdoc1509/vim-map-side.nvim', version = '0.1.0' },
    -- { 'Hdoc1509/vim-map-side.nvim', branch = 'master' },
  },
  event = 'BufReadPre',
  config = config,
  -- NOTE: until update to nvim-0.10
  commit = 'cb33dea610b7eff240985be9f6fe219920e630ef',
}
