local merge = require('utils').merge
local default_handlers = require('plugins.lsp.handlers')

---@param diagnostic Diagnostic
---@param uri string
local function is_diagnostic_ignored(diagnostic, uri)
  if string.match(uri, 'hotbar%-keys') == nil then
    return false
  end

  local message = diagnostic.message

  return string.match(message, 'Constants cannot be resolved') ~= nil
    or string.match(message, 'CommonClass cannot be resolved') ~= nil
    or string.match(message, 'FabricPlatformHelper') ~= nil
    or string.match(message, 'IPlatformHelper') ~= nil
    or string.match(message, 'platform%.services cannot be resolved') ~= nil
end

local handlers = merge(default_handlers, {
  -- remove status from statusline
  ['language/status'] = function() end,
  -- disable some diagnostics
  -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#publishDiagnosticsParams
  -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#diagnostic
  ---@param result { diagnostics: Diagnostic[], uri: string }
  ['textDocument/publishDiagnostics'] = function(_, result, ctx, config)
    -- print(vim.inspect(result))

    result.diagnostics = vim.tbl_filter(function(diagnostic)
      return not is_diagnostic_ignored(diagnostic, result.uri)
    end, result.diagnostics)

    vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
  end,
})

return handlers
