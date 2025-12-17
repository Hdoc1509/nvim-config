---@param diagnostic lsp.Diagnostic
---@param uri string
local function is_diagnostic_ignored(diagnostic, uri)
  return diagnostic.code == 80001
    or (uri:match('tree%-sitter%-hygen%-template/grammar%.js') ~= nil and diagnostic.code == 7016)
end

return {
  handlers = {
    ---@param params lsp.PublishDiagnosticsParams
    ---@param ctx lsp.HandlerContext
    ['textDocument/publishDiagnostics'] = function(_, params, ctx)
      -- print(vim.inspect(params))

      params.diagnostics = vim.tbl_filter(function(diagnostic)
        return not is_diagnostic_ignored(diagnostic, params.uri)
      end, params.diagnostics)

      vim.lsp.diagnostic.on_publish_diagnostics(_, params, ctx)
    end,
  },
}
