local default_settings = require('plugins.lsp.servers._default_settings')

-- NOTE: ignore errors for `commit` hash in `CHANGELOG.md` files. example:
-- line examples:
-- - <commit-message> ([`<commit-hash>`](<commit-url>))
-- - <commit-hash>: <commit-message>
-- where <commit-hash> is 7 characters long

---@param diagnostic lsp.Diagnostic
---@param uri string
local function is_diagnostic_ignored(diagnostic, uri)
  local range_start = diagnostic.range.start
  local range_end = diagnostic.range['end']
  local line_start = range_start.line
  local buf_name = vim.uri_to_fname(uri)
  local bufnr = vim.uri_to_bufnr(uri)

  if string.match(buf_name, 'CHANGELOG%.md$') and line_start == range_end.line then
    local buf_line = vim.api.nvim_buf_get_lines(bufnr, line_start, line_start + 1, false)[1]
    local commit_start, commit_end = string.find(buf_line, '%(%[`%w%w%w%w%w%w%w`]%(')

    if commit_start ~= nil and range_start.character >= commit_start and range_end.character <= commit_end then
      return true
    end

    commit_start, commit_end = string.find(buf_line, '%-%s%w%w%w%w%w%w%w:')

    if commit_start ~= nil and range_start.character >= commit_start and range_end.character <= commit_end then
      return true
    end
  end

  return vim.bo[bufnr].filetype == 'help'
end

return require('utils').merge(default_settings, {
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
})
