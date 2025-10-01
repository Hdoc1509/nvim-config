---@param diagnostic lsp.Diagnostic
---@param uri string
local function is_diagnostic_ignored(diagnostic, uri)
  return diagnostic.code == 80001
    or (uri:match('tree%-sitter%-hygen%-template/grammar%.js') ~= nil and diagnostic.code == 7016)
end

return {
  handlers = {
    ---@param result { diagnostics: lsp.Diagnostic[], uri: string }
    ['textDocument/publishDiagnostics'] = function(_, result, ctx, config)
      -- print(vim.inspect(result))

      result.diagnostics = vim.tbl_filter(function(diagnostic)
        return not is_diagnostic_ignored(diagnostic, result.uri)
      end, result.diagnostics)

      vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
    end,
  },
}
