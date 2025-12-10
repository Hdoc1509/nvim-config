---@module 'mini.files'

local M = {}

local set_mark = function(id, path, desc)
  MiniFiles.set_bookmark(id, path, { desc = desc })
end

M.setup = function()
  set_mark('c', vim.fn.stdpath('config'), 'Config')
  set_mark('w', vim.fn.getcwd, 'Current working directory')
  set_mark('~', '~', 'Home directory')
end

return M
