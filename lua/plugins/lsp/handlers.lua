local lsp = vim.lsp

return {
  ['textDocument/signatureHelp'] = lsp.with(lsp.handlers.signature_help, {
    border = 'rounded',
  }),
}
