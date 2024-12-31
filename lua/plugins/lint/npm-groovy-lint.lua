---@type lint.Linter
---@diagnostic disable-next-line: missing-fields
return {
  cmd = 'npm-groovy-lint',
  args = { '--output', 'json' },
  ignore_exitcode = true,
  parser = function(output, bufnr)
    if output == '' then
      return {}
    end

    local decoded = vim.json.decode(output)

    if decoded == nil then
      return {}
    end

    local buf_name = vim.api.nvim_buf_get_name(bufnr)
    local diagnostics = {}

    for _, item in ipairs(decoded.files[buf_name].errors) do
      local diagnostic = {
        lnum = item.line - 1,
        end_lnum = item.line - 1,
        col = 0,
        message = item.msg,
        severity = vim.diagnostic.severity[string.upper(item.severity)],
        source = 'npm-groovy-lint [' .. item.rule .. ']',
      }

      if item.range ~= nil then
        diagnostic.col = item.range.start.character
        diagnostic.end_col = item.range['end'].character
      end

      table.insert(diagnostics, diagnostic)
    end

    return diagnostics
  end,
}
