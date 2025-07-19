local base_markdownlint = require('lint.linters.markdownlint')

local base_parser = base_markdownlint.parser
local lazy_data_path = vim.fn.stdpath('data') .. '/lazy'
local lazy_state_path = vim.fn.stdpath('state') .. '/lazy'

---INFO: see https://github.com/DavidAnson/markdownlint/tree/main/doc for rules

---@param bufnr number
---@param diagnostic vim.Diagnostic
local function is_diagnostic_ignored(bufnr, diagnostic)
  local buf_name = vim.api.nvim_buf_get_name(bufnr)

  if (string.match(buf_name, lazy_data_path) ~= nil) or (string.match(buf_name, lazy_state_path) ~= nil) then
    return true
  end

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

---@type lint.parse
local custom_parser = function(output, bufnr, linter_cwd)
  local diagnostics = base_parser(output, bufnr, linter_cwd)

  local filtered = vim.tbl_filter(function(diagnostic)
    return not is_diagnostic_ignored(bufnr, diagnostic)
  end, diagnostics)

  -- if #filtered > 0 then
  --   print(vim.inspect(filtered))
  -- end
  return filtered
end

return { parser = custom_parser }
