local config = function()
  -- local lspconfig_configs = require('lspconfig.configs')
  --
  -- NOTE: based on https://github.com/strozw/github-actions-languageserver.nvim
  -- local actions_ls_default_config = {
  --   cmd = {
  --     'github-actions-languageserver',
  --     '--stdio',
  --   },
  --   init_options = {},
  --   filetypes = { 'yaml', 'yml' },
  --   root_dir = function(fname)
  --     if not (string.find(fname, '.github/workflows')) then
  --       return nil
  --     end
  --
  --     return vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
  --   end,
  -- }
  --
  -- lspconfig_configs.github_actions_ls = {
  --   default_config = actions_ls_default_config,
  -- }
  --
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
  },
  event = 'BufReadPre',
  config = config,
  -- NOTE: until update to nvim-0.10
  commit = "cb33dea610b7eff240985be9f6fe219920e630ef",
}
