local base_selene = require('lint.linters.selene')
local base_parser = base_selene.parser

local lazy_data_path = vim.fn.stdpath('data') .. '/lazy'
local user_config = vim.fn.expand('~/.config/nvim')

-- NOTE: max 4 levels of indentation

---@param bufnr number
---@param diagnostic vim.Diagnostic
local function is_diagnostic_ignored(bufnr, diagnostic)
  local buf_name = vim.api.nvim_buf_get_name(bufnr)

  -- filetype check to prevent linting window of `:InspectTree` command
  if buf_name:match(lazy_data_path) ~= nil or vim.bo[bufnr].filetype ~= 'lua' then
    return true
  end

  local message = diagnostic.message
  local line_number = diagnostic.lnum
  local code = diagnostic.code

  if code == 'parse_error' then
    local buf_line = vim.api.nvim_buf_get_lines(bufnr, line_number, line_number + 1, false)
    local line_text = buf_line[1]

    if line_text ~= nil and (line_text:match('goto') or line_text:match('::')) then
      return true
    else
      local previous_line = vim.api.nvim_buf_get_lines(bufnr, line_number - 1, line_number, false)
      local previous_line_text = previous_line[1]

      if previous_line_text ~= nil and (previous_line_text:match('goto') ~= nil) then
        return true
      end
    end
  end

  return (
    code == 'undefined_variable'
    and (message:match('vim') ~= nil or message:match('MiniFiles') ~= nil or message:match('Snacks') ~= nil)
  )
    or (code == 'unscoped_variables' and message:match('vim') ~= nil)
    or (code == 'mixed_table' and buf_name:match(user_config) ~= nil)
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
