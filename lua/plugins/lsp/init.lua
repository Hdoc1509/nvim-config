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
    -- { dir = '~/dev/nvim-plugins/hygen.nvim' },
    { 'Hdoc1509/hygen.nvim', version = '^0.4.2' },
    -- { 'Hdoc1509/hygen.nvim', branch = '0.3.1-next' },
    -- { dir = '~/dev/nvim-plugins/gh-actions.nvim' },
    { 'Hdoc1509/gh-actions.nvim', version = '0.1.0' },
    -- { 'Hdoc1509/hygen.nvim', branch = 'master' },
    -- { dir = '~/dev/nvim-plugins/vim-map-side.nvim' },
    { 'Hdoc1509/vim-map-side.nvim', version = '0.1.0' },
    -- { 'Hdoc1509/vim-map-side.nvim', branch = 'master' },
    { 'smjonas/inc-rename.nvim', opts = {} },
  },
  event = 'BufReadPre',
  config = config,
  -- NOTE: until update to nvim-0.11
  commit = 'fb02680e755fe789e0999df2d208d9adb8fed676',
}
