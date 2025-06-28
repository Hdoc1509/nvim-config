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
  },
  event = 'BufReadPre',
  config = config,
  -- NOTE: until update to nvim-0.10
  commit = 'cb33dea610b7eff240985be9f6fe219920e630ef',
}
