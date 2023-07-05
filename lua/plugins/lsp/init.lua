require('plugins.lsp.mason')

local nvim_lsp = require('lspconfig')
local servers = require('plugins.lsp.servers')

for server, setting in pairs(servers) do
  nvim_lsp[server].setup(setting)
end
