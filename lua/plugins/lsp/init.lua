local nvim_lsp = require('lspconfig')
local servers = require("plugins.lsp.servers")
local fn = vim.fn

for server, setting in pairs(servers) do
  nvim_lsp[server].setup(setting)
end

-- Change diagnostic signs
fn.sign_define('DiagnosticSignError', { text = '✗', texthl = 'DiagnosticSignError' })
fn.sign_define('DiagnosticSignWarn', { text = '!', texthl = 'DiagnosticSignWarn' })
fn.sign_define('DiagnosticSignInformation', { text = '', texthl = 'DiagnosticSignInfo' })
fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
