-- TODO: ensure hrsh7th/cmp-nvim-lsp is loaded for plugins that uses this module

local capabilities = require('cmp_nvim_lsp').default_capabilities() --[[@as table]]

-- required for nvim-ufo
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

return capabilities
