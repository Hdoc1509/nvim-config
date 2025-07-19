local ICONS = require('icons.diagnostics')

-- Change diagnostic signs
for type, icon in pairs(ICONS) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = false,
  float = { source = 'always', border = 'rounded' },
})
