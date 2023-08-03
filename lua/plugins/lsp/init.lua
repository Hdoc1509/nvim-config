local config = function()
  local nvim_lsp = require('lspconfig')
  local servers = require('plugins.lsp.servers')

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
      dependencies = 'williamboman/mason.nvim',
      init = function()
        require('plugins.lsp.mason')
      end,
    },
  },
  event = 'BufReadPre',
  config = config,
}
