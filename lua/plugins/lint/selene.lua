local base_selene = require('lint.linters.selene')
local base_parser = base_selene.parser

local user_config = vim.fn.expand('~/.config/nvim')

-- NOTE: max 4 levels of indentation

---@param bufnr number
---@param diagnostic Diagnostic
local function is_diagnostic_ignored(bufnr, diagnostic)
  local buf_name = vim.api.nvim_buf_get_name(bufnr)
  local message = diagnostic.message
  local line_number = diagnostic.lnum
  local is_undefined_variable = diagnostic.code == 'undefined_variable'
  local is_mixed_table = diagnostic.code == 'mixed_table'
  local is_parse_error = diagnostic.code == 'parse_error'

  if is_parse_error then
    local buf_line = vim.api.nvim_buf_get_lines(bufnr, line_number, line_number + 1, false)
    local line_text = buf_line[1]

    if line_text ~= nil and (string.match(line_text, 'goto') or string.match(line_text, '::')) then
      return true
    else
      local previous_line = vim.api.nvim_buf_get_lines(bufnr, line_number - 1, line_number, false)
      local previous_line_text = previous_line[1]

      if previous_line_text ~= nil and (string.match(previous_line_text, 'goto') ~= nil) then
        return true
      end
    end
  end

  return (is_undefined_variable and (string.match(message, 'vim') ~= nil or string.match(message, 'MiniFiles') ~= nil))
    or (is_mixed_table and string.match(buf_name, user_config) ~= nil)
end

---@type lint.parse
local function custom_parser(output, bufnr)
  local diagnostics = base_parser(output)

  local filtered = vim.tbl_filter(function(diagnostic)
    return not is_diagnostic_ignored(bufnr, diagnostic)
  end, diagnostics)

  -- if #filtered > 0 then
  --   print(vim.inspect(filtered))
  -- end
  return filtered
end

return { parser = custom_parser }
