local config = function()
  local nvim_lsp = require('lspconfig')
  local servers = require('plugins.lsp.servers')

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
      'williamboman/mason.nvim',
      config = function()
        require('plugins.lsp.mason')
      end,
      version = '^2.1.0',
    },
    { 'folke/neoconf.nvim', opts = {} },
    -- '~/dev/nvim-plugins/hygen.nvim',
    'Hdoc1509/hygen.nvim',
    -- '~/dev/nvim-plugins/gh-actions.nvim',
    'Hdoc1509/gh-actions.nvim',
    -- '~/dev/nvim-plugins/vim-map-side.nvim',
    'Hdoc1509/vim-map-side.nvim',
    { 'smjonas/inc-rename.nvim', opts = {} },
  },
  event = 'BufReadPre',
  config = config,
  -- NOTE: until update to nvim-0.11
  commit = 'fb02680e755fe789e0999df2d208d9adb8fed676',
}
