local capabilities = require('cmp_nvim_lsp').default_capabilities() --[[@as table]]

-- required for nvim-ufo
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

return capabilities
