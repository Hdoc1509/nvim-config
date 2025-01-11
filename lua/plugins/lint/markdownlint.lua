local lint_parser = require('lint.parser')
local default_markdownlint = require('lint.linters.markdownlint')
local merge = require('utils').merge

-- NOTE: update every time nvim-lint is updated
local efm = '%f:%l:%c %m,%f:%l %m'

-- NOTE: update every time nvim-lint is updated
local default_parser = lint_parser.from_errorformat(efm, {
  source = 'markdownlint',
  severity = vim.diagnostic.severity.WARN,
})

---@param message string
local function is_message_to_ignore(message)
  return string.match(message, 'MD0[23]4') ~= nil
end

return merge(default_markdownlint, {
  ---@type lint.parse
  parser = function(output, bufnr, linter_cwd)
    local all_diagnostics = default_parser(output, bufnr, linter_cwd)
    local buf_name = vim.api.nvim_buf_get_name(bufnr)

    local idx = 1

    while idx <= #all_diagnostics do
      ---@type string
      ---@diagnostic disable-next-line: undefined-field
      local message = all_diagnostics[idx].message

      if string.match(buf_name, 'TODO.md$') ~= nil and is_message_to_ignore(message) then
        table.remove(all_diagnostics, idx)
      else
        idx = idx + 1
      end
    end

    return all_diagnostics
  end,
})
