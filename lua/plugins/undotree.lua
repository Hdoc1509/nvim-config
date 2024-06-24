local config = function()
  local nmap = require('utils').nmap

  nmap('<leader>u', '<cmd>UndotreeToggle<cr>', { desc = 'Toggle undo tree' })
end

return {
  'mbbill/undotree',
  config = config,
}
