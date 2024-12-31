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
      local buf_line = vim.api.nvim_buf_get_lines(bufnr, item.line - 1, item.line, false)[1]
      local is_comment = string.match(buf_line, '%s*//') ~= nil

      if is_comment then
        goto continue
      end

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

      ::continue::
    end

    return diagnostics
  end,
}
