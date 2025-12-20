---@param diagnostic lsp.Diagnostic
---@param uri string
local function is_diagnostic_ignored(diagnostic, uri)
  local buf_name = vim.uri_to_fname(uri)

  return buf_name:match('%.env.*$') and diagnostic.source == 'shellcheck' and diagnostic.code == 'SC2034'
end

return {
  filetypes = { 'sh', 'zsh' },
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
