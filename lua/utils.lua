local M = {}

M.merge = function(...) return vim.tbl_deep_extend('force', ...) end

return M
