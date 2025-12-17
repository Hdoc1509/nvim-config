local utils = require('utils')

local ignored_self_closing_tags = { 'meta', 'link', 'input', 'img' }

---@param uri string
local function is_diagnostic_ignored(diagnostic, uri)
  local message = diagnostic.message

  if message == 'html_elements_cant_self_close' then
    local bufnr = vim.uri_to_bufnr(uri)
    local start_row = diagnostic.range.start.line
    local start_col = diagnostic.range.start.character
    local end_col = diagnostic.range['end'].character
    local tag = vim.api.nvim_buf_get_text(bufnr, start_row, start_col, start_row, end_col, {})

    return vim.tbl_contains(ignored_self_closing_tags, tag[1])
  end

  return false
end

return {
  handlers = {
    ---@param params lsp.PublishDiagnosticsParams
    ---@param ctx lsp.HandlerContext
    ['textDocument/publishDiagnostics'] = function(_, params, ctx)
      -- print(vim.inspect(params))
      local filtered = {}

      for _, diagnostic in ipairs(params.diagnostics) do
        if not is_diagnostic_ignored(diagnostic, params.uri) then
          table.insert(filtered, utils.merge(diagnostic, { source = 'superhtml' }))
        end
      end

      params.diagnostics = filtered

      vim.lsp.diagnostic.on_publish_diagnostics(_, params, ctx)
    end,
  },
  root_dir = function(bufnr, on_dir)
    if not vim.bo[bufnr].filetype == 'ejs' then
      on_dir(vim.fn.getcwd())
    end
  end,
}
