local default_settings = require('plugins.lsp.servers._default_settings')

-- TODO: ignore errors for `commit` hash in `CHANGELOG.md` files. example:
-- {
--   diagnostics = { {
--       data = {
--         corrections = { "by", "be" }
--       },
--       message = "`ba` should be `by`, `be`",
--       range = {
--         ["end"] = {
--           character = 49,
--           line = 76
--         },
--         start = {
--           character = 47,
--           line = 76
--         }
--       },
--       source = "typos"
--     } },
--   uri = "file://<path>/CHANGELOG.md",
--   version = 0
-- }
-- line example:
-- - <commit-message> ([`43e21ba`](<commit-url>))

---@param diagnostic Diagnostic
---@param uri string
local function is_diagnostic_ignored(diagnostic, uri)
  return false
end

return require('utils').merge(default_settings, {
  handlers = {
    ---@param result { diagnostics: Diagnostic[], uri: string }
    ['textDocument/publishDiagnostics'] = function(_, result, ctx, config)
      -- print(vim.inspect(result))

      result.diagnostics = vim.tbl_filter(function(diagnostic)
        return not is_diagnostic_ignored(diagnostic, result.uri)
      end, result.diagnostics)

      vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
    end,
  },
})
