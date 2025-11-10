local base_markdownlint = require('lint.linters.markdownlint')

local base_parser = base_markdownlint.parser
local lazy_data_path = vim.fn.stdpath('data') .. '/lazy'
local lazy_state_path = vim.fn.stdpath('state') .. '/lazy'

---INFO: see https://github.com/DavidAnson/markdownlint/tree/main/doc for rules

---@param bufnr number
---@param diagnostic vim.Diagnostic
local function is_diagnostic_ignored(bufnr, diagnostic)
  local buf_name = vim.api.nvim_buf_get_name(bufnr)

  if (buf_name:match(lazy_data_path) ~= nil) or (buf_name:match(lazy_state_path) ~= nil) then
    return true
  end

  local message = diagnostic.message
  local line_number = diagnostic.lnum
  local buf_line = vim.api.nvim_buf_get_lines(bufnr, line_number, line_number + 1, false)[1]

  local is_MD012 = message:match('MD012') ~= nil

  if buf_line == nil and is_MD012 then
    buf_line = vim.api.nvim_buf_get_lines(bufnr, line_number - 1, line_number, false)[1]
  end

  local is_changelog_file = buf_name:match('CHANGELOG%.md$') ~= nil
  local is_tmpl_file = buf_name:match('%.tmpl%.md$') ~= nil
  local is_changesets_file = buf_name:match('%.changeset/.+%.md$') ~= nil

  return (buf_name:match('TODO%.md$') ~= nil and message:match('MD0[23]4') ~= nil)
    or ((buf_line:match('^|') ~= nil or is_changelog_file or is_tmpl_file) and message:match('MD013') ~= nil)
    or (is_changelog_file and message:match('MD024') ~= nil)
    or (is_tmpl_file and is_MD012)
    or ((is_tmpl_file or is_changesets_file) and message:match('MD041') ~= nil)
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
