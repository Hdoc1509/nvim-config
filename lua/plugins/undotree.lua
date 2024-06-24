local config = function()
  local nmap = require('utils').nmap

  nmap('<Leader>u', '<cmd>UndotreeToggle<CR>', { desc = 'Toggle undo tree' })
end

return {
  'mbbill/undotree',
  config = config,
}
