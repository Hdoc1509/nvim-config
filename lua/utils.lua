local M = {}

local map_opts = { silent = true, noremap = true }

M.keymap = function(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, map_opts) end

---Returns a keymap creator for the specified buffer
---@param bufnr number
M.create_buf_keymapper = function(bufnr)
  ---Add a buffer keymap
  ---@param mode string | string[]
  ---@param lhs string left-hand side of mapping
  ---@param rhs string right-hand side of mapping
  return function(mode, lhs, rhs)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, map_opts)
  end
end

---Returns a nmap creator for the specified buffer
---@param bufnr number
M.create_buf_nmapper = function (bufnr)
  ---Add a buffer nmap
  ---@param lhs string left-hand side of mapping
  ---@param rhs string righ-hand side of mapping
  return function(lhs,rhs)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, rhs, map_opts)
  end
end

M.map_notify = function(message)
  vim.notify(message, 'info', {
    title = 'Mapping',
  })
end

M.merge = function(...) return vim.tbl_deep_extend('force', ...) end

M.nmap = function(lhs, rhs) vim.keymap.set('n', lhs, rhs, map_opts) end

return M
