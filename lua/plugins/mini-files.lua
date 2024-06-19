local config = function()
  local nmap = require('utils').nmap

  require('mini.files').setup()

  nmap('-', '<cmd>lua MiniFiles.open()<CR>', { desc = 'Open mini.files' })
end

return {
  'echasnovski/mini.files',
  config = config,
  version = false,
}
