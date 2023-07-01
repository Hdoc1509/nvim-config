local M = {}

local map_opts = { silent = true, noremap = true }

---Create an autocommand
---@param event string | string[]
---@param opts table
M.autocmd = function (event, opts)
  vim.api.nvim_create_autocmd(event, opts)
end

---Create a keymap
---@param mode string | string[]
---@param lhs string left-hand side of mapping
---@param rhs string | function right-hand side of mapping
---@param opts? table aditional options
M.keymap = function(mode, lhs, rhs, opts)
  opts = opts or {}
  vim.keymap.set(mode, lhs, rhs, M.merge(map_opts, opts))
end

---Returns a nmap creator for the specified buffer
---@param bufnr number
M.create_buf_nmapper = function (bufnr)
  ---Add a buffer nmap
  ---@param lhs string left-hand side of mapping
  ---@param rhs string right-hand side of mapping
  ---@param opts? table aditional options
  return function(lhs,rhs, opts)
    opts = opts or {}
    vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, rhs, M.merge(map_opts, opts))
  end
end

M.map_notify = function(message)
  vim.notify(message, 'info', {
    title = 'Mapping',
  })
end

---Merge two or more tables recursively
---@param tableA table
---@param tableB table
---@param ... table
---@return table
M.merge = function(tableA, tableB, ...)
  return vim.tbl_deep_extend('force', tableA, tableB, ...)
end

---Create a nmap
---@param lhs string left-hand side of nmap
---@param rhs string | function righ-hand side of nmap
---@param opts? table aditional options
M.nmap = function(lhs, rhs, opts)
  opts = opts or {}
  vim.keymap.set('n', lhs, rhs, M.merge(map_opts, opts))
end

---Create a nmap expression
---@param lhs string left-hand side of nmap
---@param rhs string | function righ-hand side of nmap
---@param opts? table aditional options
M.nmap_expr = function (lhs,rhs, opts)
  opts = opts or {}
  vim.keymap.set('n', lhs, rhs, M.merge({ expr = true }, map_opts, opts))
end

return M
