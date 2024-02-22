local nmap = require('utils').nmap

local api = require('nvim-tree.api')

local open_tab_silent = function(node)
  api.node.open.tab(node)
  vim.cmd('tabprev | NvimTreeOpen')
end

---@type function
local open_drop = api.node.open.drop

return function(bufnr)
  api.config.mappings.default_on_attach(bufnr)

  nmap('h', api.node.navigate.parent_close, { desc = 'Close directory', buffer = bufnr })
  nmap('l', open_drop, { desc = 'Open', buffer = bufnr })
  nmap('T', open_tab_silent, { desc = 'Open in tab silent', buffer = bufnr })
  nmap('<CR>', open_drop, { desc = 'Open', buffer = bufnr })
end
