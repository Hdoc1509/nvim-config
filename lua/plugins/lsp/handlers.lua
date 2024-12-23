local lsp = vim.lsp

return {
  ['textDocument/hover'] = lsp.with(lsp.handlers.hover, {
    border = 'rounded',
  }),
  ['textDocument/signatureHelp'] = lsp.with(lsp.handlers.signature_help, {
    border = 'rounded',
  }),
}
