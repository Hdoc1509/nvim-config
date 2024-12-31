local config = function()
  local lint = require('lint')
  local autocmd = require('utils').autocmd

  local linting_events = { 'BufRead', 'InsertLeave', 'TextChanged' }

  lint.linters_by_ft = {
    groovy = { 'groovy_lint' },
  }

  ---@diagnostic disable-next-line: missing-fields
  lint.linters.groovy_lint = {
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

  autocmd(linting_events, {
    pattern = '*.github/workflows/*.yml,*.github/workflows/*.yaml',
    callback = function()
      lint.try_lint('actionlint')
    end,
  })

  autocmd(linting_events, {
    callback = function()
      lint.try_lint()
    end,
  })
end

return {
  'mfussenegger/nvim-lint',
  config = config,
}
