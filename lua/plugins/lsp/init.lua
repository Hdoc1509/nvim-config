local nvim_lsp = require('lspconfig')
local servers = require('plugins.lsp.servers')

for server, setting in pairs(servers) do
  nvim_lsp[server].setup(setting)
end

-- Change diagnostic signs
local signs = { Error = '✗', Warn = '!', Hint = '', Info = '' }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
