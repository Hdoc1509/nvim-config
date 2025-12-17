local config = function()
  local servers = require('plugins.lsp.servers')

  require('plugins.lsp.attach').setup()

  vim.lsp.config('*', {
    capabilities = require('plugins.lsp.capabilities'),
  })

  for server, setting in pairs(servers) do
    if #vim.tbl_keys(setting) > 0 then
      vim.lsp.config(server, setting)
    end
  end

  vim.lsp.enable(vim.tbl_keys(servers))
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
    'Hdoc1509/hygen.nvim',
    'Hdoc1509/gh-actions.nvim',
    'Hdoc1509/vim-map-side.nvim',
    { 'smjonas/inc-rename.nvim', opts = {} },
  },
  config = config,
}
