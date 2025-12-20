local ICONS = require('icons.diagnostics')

---@type vim.diagnostic.Opts.Signs
local signs = { text = {}, linehl = {} }

-- Change diagnostic signs
for type, icon in pairs(ICONS) do
  local hl = 'DiagnosticSign' .. type
  local diagnostic_key = string.upper(type)

  signs.text[diagnostic_key] = icon
  signs.linehl[diagnostic_key] = hl
end

vim.diagnostic.config({
  signs = signs,
  float = { source = true, border = 'rounded' },
})
