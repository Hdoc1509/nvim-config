local utils = require('utils')
local nmap = utils.nmap

local M = {}

local excluded_filetypes = { 'fugitive', 'minifiles', 'qf', 'gitcommit' }

---@param onAllowed function
local open_explorer = function(onAllowed)
  if not vim.tbl_contains(excluded_filetypes, vim.bo.filetype) then
    onAllowed()
  end
end

M.setup = function()
  nmap('-', function()
    open_explorer(function()
      MiniFiles.open(vim.api.nvim_buf_get_name(0))
    end)
  end, { desc = 'Open mini.files in current file' })
  nmap('<leader>-', function()
    open_explorer(function()
      MiniFiles.open(MiniFiles.get_latest_path())
    end)
  end, { desc = 'Open mini.files in last used path' })
  nmap('<leader>_', function()
    open_explorer(function()
      MiniFiles.open(nil, false)
    end)
  end, { desc = 'Open mini.files in root path of workspace' })
end

return M
