---@param diagnostic lsp.Diagnostic
---@param uri string
local function is_diagnostic_ignored(diagnostic, uri)
  local buf_name = vim.uri_to_fname(uri)

  return buf_name:match('%.env.*$') and diagnostic.source == 'shellcheck' and diagnostic.code == 'SC2034'
end

return {
  filetypes = { 'sh', 'zsh' },
  handlers = {
    ---@param result { diagnostics: lsp.Diagnostic[], uri: string }
    ['textDocument/publishDiagnostics'] = function(_, result, ctx)
      -- print(vim.inspect(result))

      result.diagnostics = vim.tbl_filter(function(diagnostic)
        return not is_diagnostic_ignored(diagnostic, result.uri)
      end, result.diagnostics)

      vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx)
    end,
  },
}
