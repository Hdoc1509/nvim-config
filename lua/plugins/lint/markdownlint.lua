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

local function is_diagnostic_ignored(bufnr, diagnostic)
  local buf_name = vim.api.nvim_buf_get_name(bufnr)
  local message = diagnostic.message
  local line_number = diagnostic.lnum
  local buf_line = vim.api.nvim_buf_get_lines(bufnr, line_number, line_number + 1, false)[1]

  local is_MD012 = string.match(message, 'MD012') ~= nil

  if buf_line == nil and is_MD012 then
    buf_line = vim.api.nvim_buf_get_lines(bufnr, line_number - 1, line_number, false)[1]
  end

  local is_changelog_file = string.match(buf_name, 'CHANGELOG%.md$') ~= nil
  local is_tmpl_file = string.match(buf_name, '%.tmpl%.md$') ~= nil

  return (string.match(buf_name, 'TODO%.md$') ~= nil and string.match(message, 'MD0[23]4') ~= nil)
    or ((string.match(buf_line, '^|') ~= nil or is_changelog_file or is_tmpl_file) and string.match(message, 'MD013') ~= nil)
    or (is_changelog_file and string.match(message, 'MD024') ~= nil)
    or (is_tmpl_file and is_MD012)
    or (is_tmpl_file and string.match(message, 'MD041') ~= nil)
end

return merge(default_markdownlint, {
  ---@type lint.parse
  parser = function(output, bufnr, linter_cwd)
    local all_diagnostics = default_parser(output, bufnr, linter_cwd)
    -- print(vim.inspect(all_diagnostics))

    -- NOTE: can I use vim.fn.filter() instead of this loop?
    local idx = 1

    while idx <= #all_diagnostics do
      if is_diagnostic_ignored(bufnr, all_diagnostics[idx]) then
        table.remove(all_diagnostics, idx)
      else
        idx = idx + 1
      end
    end

    return all_diagnostics
  end,
})
