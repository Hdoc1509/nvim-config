---@param diagnostic vim.Diagnostic
---@param uri string
local function is_diagnostic_ignored(diagnostic, uri)
  if uri:match('hotbar%-keys') == nil then
    return false
  end

  local message = diagnostic.message

  return message:match('Constants cannot be resolved') ~= nil
    or message:match('CommonClass cannot be resolved') ~= nil
    or message:match('FabricPlatformHelper') ~= nil
    or message:match('IPlatformHelper') ~= nil
    or message:match('platform%.services cannot be resolved') ~= nil
end

return {
  -- remove status from statusline
  ['language/status'] = function() end,
  -- disable some diagnostics
  -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#publishDiagnosticsParams
  -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#diagnostic
  ---@param result { diagnostics: vim.Diagnostic[], uri: string }
  ['textDocument/publishDiagnostics'] = function(_, result, ctx, config)
    -- print(vim.inspect(result))

    result.diagnostics = vim.tbl_filter(function(diagnostic)
      return not is_diagnostic_ignored(diagnostic, result.uri)
    end, result.diagnostics)

    -- FIX: params has changed
    vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
  end,
}
