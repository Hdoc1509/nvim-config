local nmap = require('utils').nmap

local api = require('nvim-tree.api')

local open_tab_silent = function(node)
  api.node.open.tab(node)
  vim.cmd('tabprev | NvimTreeOpen')
end

local copy_file_to = function()
  local node = api.tree.get_node_under_cursor()
  local file_src = node.absolute_path
  local file_out = vim.fn.input('Copy to: ', file_src, 'file')
  local dir = vim.fn.fnamemodify(file_out, ':h')

  vim.fn.system({ 'mkdir', '-p', dir })
  vim.fn.system({ 'cp', '-R', file_src, file_out })
end

---@type function
local open_drop = api.node.open.drop

return function(bufnr)
  api.config.mappings.default_on_attach(bufnr)

  nmap('h', api.node.navigate.parent_close, { desc = 'Close directory', buffer = bufnr })
  nmap('l', open_drop, { desc = 'Open', buffer = bufnr })
  nmap('T', open_tab_silent, { desc = 'Open in tab silent', buffer = bufnr })
  nmap('<CR>', open_drop, { desc = 'Open', buffer = bufnr })
  nmap('c', copy_file_to, { desc = 'Copy file to', buffer = bufnr })
end
