local merge = require('utils').merge
local default_handlers = require('plugins.lsp.handlers')

local handlers = merge(default_handlers, {
  -- remove status from statusline
  ['language/status'] = function() end,
  -- disable some diagnostics
  ['textDocument/publishDiagnostics'] = function(_, result, ctx, config)
    -- print(vim.inspect(result))
    local hotbar_keys = string.match(result.uri, 'hotbar%-keys')

    if hotbar_keys ~= nil then
      local idx = 1

      while idx <= #result.diagnostics do
        local message = result.diagnostics[idx].message

        if
          string.match(message, 'Constants cannot be resolved') ~= nil
          or string.match(message, 'CommonClass cannot be resolved') ~= nil
          or string.match(message, 'FabricPlatformHelper') ~= nil
          or string.match(message, 'IPlatformHelper') ~= nil
          or string.match(message, 'platform%.services cannot be resolved') ~= nil
        then
          table.remove(result.diagnostics, idx)
        else
          idx = idx + 1
        end
      end
    end

    vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
  end,
})

return handlers
