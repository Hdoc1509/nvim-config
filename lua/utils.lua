local M = {}

local map_opts = { silent = true, noremap = true }

M.keymap = function(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, map_opts) end

M.map_notify = function(message)
  vim.notify(message, 'info', {
    title = 'Mapping',
  })
end

M.merge = function(...) return vim.tbl_deep_extend('force', ...) end

M.nmap = function(lhs, rhs) vim.keymap.set('n', lhs, rhs, map_opts) end

return M
